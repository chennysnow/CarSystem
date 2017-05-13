$.extend({
    currentUrl: window.location.href,
    setCookie: function(c_name, value, expiredays) {
        var exdate = new Date()
        exdate.setDate(exdate.getDate() + expiredays)
        document.cookie = c_name + "_mmb=" + escape(value) +
        ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
    },
    getCookie: function(c_name) {
        if (document.cookie.length > 0) {
           
            c_start = document.cookie.indexOf(c_name + "_mmb=")
            if (c_start != -1) {
                c_start = c_start + (c_name + "_mmb=").length 
                c_end = document.cookie.indexOf(";", c_start)
                if (c_end == -1) c_end = document.cookie.length
                return unescape(document.cookie.substring(c_start, c_end))
            }
        }
        return "";
    },
    clearCookie: function() {
        var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
        if (keys) {
            for (var i = keys.length; i--;)
                document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
        }
    },
    clearSiteCookie: function() {
        var keys = document.cookie.match(/[^ =;]+(?=\=)/g);

        if (keys) {
            for (var i = keys.length; i--;) {
                if (keys[i].indexOf('_mmb') != -1)
                    continue;
                document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
            }

        }
    },
    appKeyGuid: function () {
        appkey = $.getCookie("appkey");
        if (appkey != '')
            return appkey;
        var guid = "";
        for (var i = 1; i <= 32; i++) {
            var n = Math.floor(Math.random() * 16.0).toString(16);
            guid += n;
            if ((i == 8) || (i == 12) || (i == 16) || (i == 20))
                guid += "-";
        }
        console.log(guid);
        $.setCookie("appkey", guid, 1000);
        return guid;
    },
    postSpriderTask: function (resultdata, type) {
        if (resultdata == null || resultdata.length == 0)
            return;
        $.setCookie("oldpageid", resultdata[0].pageindex, 100);
        $.setCookie("oldchkid", resultdata[0].chkid, 100);
        $.setCookie("oldcaturl", resultdata[0].caturl, 100);
        console.log(JSON.stringify(resultdata));
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "https://service.manmanbuy.com/i.ashx",
            data: { method: "mmb.service.mmb.tools.chajianspider", Type: type, json: JSON.stringify(resultdata) },
            success: function (data) {
                console.log(data);
                console.log("success");
            }
        });
    },
    postLocalTask: function (resultdata) {
        if (resultdata == null || resultdata.length == 0)
            return;
     
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "http://test.ljsprayer.com/WebApi.aspx",
            data: { method: "proadd", json: JSON.stringify(resultdata) },
            success: function (data) {
                console.log(data);
                console.log("success");
            }
        });
    }
    ,
    getSpriderTaskrsc: function (proid) {

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "http://test.ljsprayer.com/WebApi.aspx",
            data: { method: "gettask", id: proid },
            success: function (data) {
                debugger;
                var pageidreg = /id=\d*/g;
                var pagecur = "1";
                if (pageidreg.test($.currentUrl))
                    pagecur = $.currentUrl.match(pageidreg)[0].replace("id=", "");
                var pagecur = parseInt(pagecur);
                var spiderUrl = $.currentUrl.replace("id=" + pagecur, "id=" + data);
                setTimeout("window.location.href='" + spiderUrl + "'", 11000);
            }
        });

    },
    getSpriderTask: function (option) {

        var defaultoption = { spiderdomain: "list.tmall.com", siteid: 10, sleep: 30000, renwuUrl: 'https://service.manmanbuy.com/i.ashx?method=mmb.service.mmb.tools.getchajianrenwu' }
        var setting = $.extend(defaultoption, option);
        var renwucookie = $.getCookie("renwu");
        var spiderurl = ""
        var oldCatid = "";
        if (renwucookie != "") {
            var renwu = JSON.parse(renwucookie);
             spiderurl = decodeURIComponent(renwu[0].url).replace("$page", "0");
            var catreg = /cat=\d*/g;
            if (catreg.test(spiderurl))
                oldCatid = spiderurl.match(catreg)[0].replace("cat=", "");
          
            if ($.currentUrl.indexOf(oldCatid) == -1) {

                var errCount = 0;
                var errcount = $.getCookie("errcount");
                if (errcount != "")
                    errCount = parseInt(errcount);
                $.setCookie("errcount", (errCount + 1), 1000);
                if (errCount > 5) {
                    $.setCookie("errcount", 0, 1000);
                } else {
               
                    var tempurl = $.getCookie("spiderurl");
                    if (tempurl.indexOf("http") > -1)
                        spiderurl = tempurl;
                    setTimeout("window.location.href='" + spiderurl + "'", setting.sleep);
                    console.log("spiderurl111" + spiderurl);
                    return;
                }

            } else {

                var totalpage = parseInt($("input[name='totalPage']").val());
                var pagecur = parseInt($(".ui-page-cur").text());

                var par = $(".nrt p").text();
                if (par.indexOf('没有找到指定条件下相关的商品哦')>-1) {
                    totalpage = 1;
                    pagecur = 2;
                }

                if (pagecur < totalpage) {
                    if (pagecur == 30 || pagecur == 60 || pagecur == 90) {
                        $.clearSiteCookie();
                    }
                    var nextUrl = $(".ui-page-next").attr("href");
                    if (nextUrl) {
                        nextUrl = $.currentUrl.substring(0, $.currentUrl.indexOf('?') ) + nextUrl;

                        $.setCookie("spiderurl", nextUrl, 100);
                        setTimeout("window.location.href='" + nextUrl + "'", setting.sleep);
                        console.log("spiderurl222" + nextUrl);
                    }
                    return;
                }
                $.setCookie("errcount", 0, 1000);
                
            }
        }
   
     
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    if (xhr.responseText.indexOf("error") > -1) {
                        setTimeout("$.getSpriderTask(" + setting + ");", 1000);
                        return;
                    }
                    console.log(xhr.responseText);
                    var renwu = JSON.parse(xhr.responseText);
                    var spiderurl = decodeURIComponent(renwu[0].url).replace("$page", "0");
                    if (spiderurl.indexOf('https') == -1)
                        spiderurl.replace('http:', 'https:');
                    if (spiderurl.indexOf(setting.spiderdomain) == -1) {
                        setTimeout("$.getSpriderTask(" + setting + ");", 1000);
                        return;
                    }
                    $.setCookie("spiderurl", spiderurl, 100);
                    $.setCookie("renwu", xhr.responseText, 100);
                    setTimeout("window.location.href='" + spiderurl + "'", setting.sleep);
                    console.log("spiderurl333" + spiderurl);
                    xhr = null;
                } else {
                    setTimeout("$.getSpriderTask(" + setting + ");", 60000);
                }
            }
        };

        xhr.open("get", setting.renwuUrl + "&siteid=" + setting.siteid);
        xhr.send(null);

    }

});
