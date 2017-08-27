# ==UserScript==
# @name         v2ex.link2img
# @namespace    zhihaofans
# @version      0.0.1
# @description  V2EX链接转图片
# @author       zhihaofans
# @match        https://www.v2ex.com/t/*
# @require      https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js
# @note         Greasyfork地址:https://greasyfork.org/zh-CN/users/49955
# @note         Github地址:https://github.com/zhihaofans/JavaScript/v2ex/v2ex_signin.js
# @license      Apache License 2.0
# ==/UserScript==
$(document).ready ->
    console.log "v2ex.link2img", link2img(), "个"
    return

link2img = ->
    a = $ 'div.reply_content > a'
    a_img = a.filter '[href$=".jpg"],[href$=".JPG"],[href$=".png"],[href$=".PNG"],[href$=".gif"],[href$=".GIF"],[href$=".webp"],[href$=".WEBP"]'
    b = 0
    skip=0
    while(b<a_img.length)
        this_img = a_img.eq(b)
        has_img = this_img.find("img").length
        if has_img is 0
            img_link = this_img.attr "href"
            img_html = "<img src=\"" + img_link + "\">"
            a_img.html img_html
            a_img.attr "target", "_blank"
        else
            skip++
        b++
    console.log "跳过", skip.toString(), "个图片"
    return b.toString()
