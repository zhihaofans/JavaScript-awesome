// ==UserScript==
// @name         Vol.moe新标签页打开链接
// @namespace    zhihaofans
// @version      0.0.1
// @description  Vol.moe打开漫画页面链接时用新标签形式打开
// @author       zhihaofans
// @match        http://vol.moe/
// @match        http://vol.moe/list/*
// @require      https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js
// @grant        Apache-2.0
// @note         开源地址:https://github.com/zhihaofans/Some-JavaScript/
// @note         Greasyfork地址:https://greasyfork.org/zh-CN/scripts/39773
// ==/UserScript==
String.prototype.startWith = function (str) {
    var reg = new RegExp("^" + str);
    return reg.test(this);
};
String.prototype.endWith = function (str) {
    var reg = new RegExp(str + "$");
    return reg.test(this);
};
(function () {
    jQuery.noConflict();
    jQuery(document).ready(function () {
        var links = jQuery("a");
        for (var a = 0; a < links.length; a++) {
            var thisLink = jQuery(links[a]);
            if (thisLink.attr("href").startWith("/comic/") || (thisLink.attr("href").startWith("http://vol.moe/comic/")) && thisLink.attr("href").endWith(".htm")) {
                thisLink.attr("target", "_black");
            }
        }
    });
})();
