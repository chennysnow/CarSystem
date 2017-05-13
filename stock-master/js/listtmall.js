$(document).ready(function () {

    if ($.currentUrl.indexOf("https://login.tmall.com") > -1 || $.currentUrl.indexOf("https://www.tmall.com") > -1 || $.currentUrl.indexOf("https://sec.taobao.com/") > -1) {
        localStorage.clear();
        $.clearSiteCookie();
        var errCount = 0;
        var errcount = $.getCookie("errcount");
        if (errcount != "")
            errCount = parseInt(errcount);
        $.setCookie("errcount", (errCount + 1), 1000);
        console.log($.currentUrl);
        if ($.currentUrl.indexOf("https://www.tmall.com") > -1) {
            $.setCookie("renwu","", 100);
            $.getSpriderTask();
            return;

        } else if ($.currentUrl.indexOf("https://login.tmall.com") > -1 && $.currentUrl.indexOf('smReturn%3D') > -1) {
            smReturn = $.currentUrl.substring($.currentUrl.indexOf('smReturn%3D') + 11);
            smReturn = decodeURIComponent(decodeURIComponent(smReturn))
            if (smReturn.indexOf("&smSign") > -1) {
                smReturn = smReturn.substring(0, smReturn.indexOf("&smSign"))
                setTimeout("window.location.href='" + smReturn + "'", 60000);
            }
        } else {
            $.getSpriderTask();
        }
    }
    else {
        $.setCookie('oldurl', $.currentUrl, 100);
        var totalpage = parseInt($("input[name='totalPage']").val());
        $.setCookie('oldtotalpage', totalpage, 100);
    }

    getProducts();

   // getCatInfo();

    $.getSpriderTask();

    function getCatInfo() {
        var catlist = new Array();
        var catconten = '';
        $("#J_NavAttrsForm a").each(function (i, b) {

            var caturl = $(b).attr("href");
 
            if (caturl == null || caturl == "" || caturl.indexOf("cat") == -1 || caturl.indexOf("industryCatId") == -1) {
                console.log($(b).html());
                return true;
            }
            if (caturl.indexOf('?') == 0) {
                caturl = "https://list.tmall.com/search_product.htm" + caturl;
            }

            var catreg = /cat=\d*/g;
            var catid = '';
  
            if (catreg.test(caturl))
                catid = caturl.match(catreg)[0].replace("cat=", "");
          
            //var icatreg = /industryCatId=\d*/g;
            //var icatid = '';
            //if (icatreg.test(caturl))
            //    icatid = caturl.match(icatreg)[0].replace("industryCatId=", "");

            if (catid == '' ) {
                console.log(caturl);
            }
        
            if (catconten.indexOf(catid) == -1) {
                var catitem = { Catid: catid, Url: caturl, catName: $(b).attr("title") };
                catconten += '[' + catid + '],';
                catlist.push(catitem);
            }
            //var catitem = { Catid: catid, Url: caturl, catName: $(b).attr("title") };

            //catlist.push(catitem);
        
     
        });
        console.log(catlist);
        console.log(catconten);
        
    }

    function getProducts() {

        if (document.getElementById("J_ItemList") == null)
            return;

        var pagecur = parseInt($(".ui-page-cur").text());
        var renwucookie = $.getCookie("renwu");
        var siteclassid = "";
        var classid = "";
        var chkid = "";
        var siteid = "";
        if (renwucookie != "") {

            var renwu = JSON.parse(renwucookie);
            classid = renwu[0].classid;
            chkid = renwu[0].id;
            siteclassid = renwu[0].siteclass;
            siteid = renwu[0].siteid;
        }
        var prolist = new Array();
        $(".product").each(function (i, b) {
            var title = $(b).find(".productTitle a").text().replace(/[\r\n]/g, ""); //$(b).find(".productTitle a").attr("title");
        
            var itemUrl = $(b).find(".productTitle a").attr("href");
            if (itemUrl == "" || itemUrl == null || itemUrl.length > 500) {
                console.log("error" + itemUrl);
                return true;
            }

            if (itemUrl.indexOf('https:') == -1 && itemUrl.length > 0)
                itemUrl = "https:" + itemUrl.replace("&amp;", "&");
            var idreg = /id=\d*/g;
            var tempid = '';
            if (idreg.test(itemUrl))
                tempid = itemUrl.match(idreg)[0].replace("id=", "");
            if (tempid == "" || tempid == null) {
                console.log("error" + tempid);
                return true;
            }
            var skureg = /skuId=\d*/g;
            var skuId = '';
            if (skureg.test(itemUrl))
                skuId = itemUrl.match(skureg)[0].replace("skuId=", "");

            var price = $(b).find(".productPrice em").attr("title");
            if (typeof (price) == "undefined") {
                price = $(b).find(".productPrice em").text().replace("¥", "");
            }

            var productImg = $(b).find(".productImg img").attr("src");
            if (productImg == null) {
                productImg = $(b).find(".productImg img").attr("data-ks-lazyload");
            }

            if (productImg == "" || productImg == null || productImg.length > 500) {
                console.log("error" + productImg);
                return true;
            }
            if (productImg.indexOf('http:') == -1 && productImg.length > 0)
                productImg = "http:" + productImg.replace("&amp;", "&");

            var comment = $(b).find(".productStatus a").text();
            if (comment == "")
                comment = 0;
            else {
                comment = parseInt(comment);
            }
            var catid = $("#J_CrumbSearchForm input[name='cat']").val();
            var shopid = $(b).find(".J_WangWang").attr("data-nick");
            var catName = document.title.substring(0, document.title.indexOf('-'));
            var youHui = "";
            var item = {
                caturl: $.currentUrl,
                pageindex: pagecur,
                index: i + 1,
                siteid: siteid,
                city: "",
                catid: catid,
                catname: catName,
                itemid: tempid,
                url: itemUrl,
                img: productImg,
                youhui: youHui,
                pingpai: "",
                commentcount: comment,
                shopid: shopid,
                name: title,
                remark: "list_" + $.appKeyGuid(),
                price: price,
                classid: classid,
                siteclassid: siteclassid,
                chkid: chkid
            };
            debugger;
            prolist.push(item);
        });



        $.postSpriderTask(prolist);
    }

});
