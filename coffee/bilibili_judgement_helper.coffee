# ==UserScript==
# @name         哔哩哔哩风纪委员会助手
# @namespace    zhihaofans
# @version      0.0.1
# @description  哔哩哔哩风纪委员会助手0.0.1
# @author       zhihaofans
# @match        https://www.bilibili.com/judgement/
# @require      https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js
# @note         Greasyfork地址:https://greasyfork.org/zh-CN/users/49955
# @note         Github地址:https://github.com/zhihaofans/JavaScript-awesome/bilibili_judgement_helper.js
# @license      Apache License 2.0
# ==/UserScript==
scriptInstallUrl="https://greasyfork.org/zh-CN/users/49955https://greasyfork.org/zh-CN/users/49955"
$(document).ready ->
  letsStart()
  return
$('.voted-tips').change ->
  console.log $('.voted-tips').text()
  return
window.onhashchange = ->
  letsStart()
  return

letsStart = ->
  console.log "start"
  if location.hash.startsWith("#/case/")
    hashGroup=location.hash.split("/")
    caseFun(hashGroup[2])

caseFun = (id) ->
  console.log id
  if id.length > 0
    console.log $('.voted-tips').text()
    console.log "投票未结束，执行脚本"
    #投票未完成
    $.ajax
      url: "https://api.bilibili.com/x/credit/jury/juryCase?jsonp=jsonp&cid=#{id}"
      type: 'GET'
      dataType: 'jsonp'
      success: (data) ->
        voteAll="0"
        voteBan="0"
        voteDel="0"
        voteGiveup="0"
        voteNo="0"
        if data.code is 0
          voteAll=data.data.putTotal.toString()
          voteBan=data.data.voteBreak.toString()
          voteDel=data.data.voteDelete.toString()
          voteNo=data.data.voteRule.toString()
          voteGiveup=(voteAll-voteBan-voteDel-voteNo).toString()
        addHtml="<div class=\"what-ban\"><div class=\"text-con\"><p class=\"title\"><i></i>投票结果</p><ul class=\"txt\"><li>• 预定结果：</li><li>• #{voteAll}人投票。</li><li>• #{voteBan}人投封禁。</li><li>• #{voteDel}人投删除。</li><li>• #{voteNo}人投否。</li><li>• #{voteGiveup}人弃权。</li><li>•<a href=\"#{scriptInstallUrl}\" target=\"_blank\">脚本安装地址</a></li></ul></div></div>"
        $(".rightModWrap").prepend addHtml
    return
