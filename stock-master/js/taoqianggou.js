
// https://qiang.taobao.com spider

$(document).ready(function () {

    //var currentUrl = window.location.href;
    var catid = "";
    var catName = document.title.replace("- 淘抢购", "");
    var reg = /categoryId=[1-9]\d*/g;
    if (reg.test($.currentUrl)) {
        catid = $.currentUrl.match(reg)[0].replace("categoryId=", "");
        var oldcat = $.getCookie("categoryId");
        if (oldcat == "")
            $.setCookie('categoryId', catid, 1);
        else if (oldcat.indexOf(catid) == -1)
            $.setCookie('categoryId', oldcat + ',' + catid, 1);
    }

    var prolist = new Array();
    var result = "";
 
    $(".qg-item").each(function (i, b) {

        var stateinfo = $(b).find(".link-btn").text();
        if (stateinfo.indexOf('已抢光')!=-1)
            return true;
        var img = "https:" + $(b).find(".qg-img img").attr("data-ks-lazyload");
        var itemUrl = $(b).attr("href");
        var youHui = $(b).find(".percent").text() + " " + $(b).find(".num").text();

        var reg = /id=[1-9]\d*/g;
        var tempid = '';
        if (reg.test(itemUrl))
            tempid = itemUrl.match(reg)[0].replace("id=", "");
        var item = {
            
            caturl: $.currentUrl,
            pageindex: 1,
            index: i + 1,

            siteid: 278,
            city:"",
            catid: catid,
            catname: catName,
            itemid: tempid,
            url: "https:"+itemUrl,
            img: img,
            youhui: youHui,
            pingpai:"",
            commentcount: 0,
            shopid:"",
            name: $(b).find(".des").text() + " " + $(b).find(".subtitle").text(),
            remark: $(b).find(".percent").text().replace("已抢购", "").replace("%",""),
            price : $(b).find('em').text()
        };
        //console.log(item);
        prolist.push(item);
    });
    if (prolist.length > 0)
        $.postSpriderTask(prolist, "tqg");
    var catlist = new Array();
    var spiderUrl = "";
    var oldcat = $.getCookie("categoryId");
    $(".category a").each(function(a, b) {
        var reg = /categoryId=[1-9]\d*/g;
        var catUrl = $(b).attr("href");
        var reg = /categoryId=[1-9]\d*/g;
        var catid = catUrl.match(reg)[0].replace("categoryId=", "");
        if (spiderUrl == '' && oldcat.indexOf(catid) == -1) {
            spiderUrl = catUrl;
        }
        catlist.push(catid);
    });

    console.log(spiderUrl);
    if (spiderUrl != '') {
        setTimeout("window.location.href='" + spiderUrl + "'", 3000);
    }
    //8小时之后清空cookie 并刷新 做到重新抓取
    setTimeout("$.setCookie('categoryId', '', 1);window.location.reload();", 1000 * 3600 * 8);

});

