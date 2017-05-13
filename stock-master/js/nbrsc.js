$(document).ready(function () {

    var maxpage = $.getCookie("maxpage");
    if (maxpage == "") {
        var maxhref = $(".listpage a:last").attr("href");
        var pageidreg = /page=\d*/g;
        if (pageidreg.test(maxhref)) {
            maxpage = maxhref.match(pageidreg)[0].replace("page=", "");
            $.setCookie('maxpage', maxpage, 100);
        }
    }

    getProducts();
    redirect();
  
    function getProducts() {

        if ($(".wordlist").length == 0)
            return;
        var pageidreg = /page=\d*/g;
        var prolist = new Array();
        $(".carbox2 tr").each(function(i, b) {
            if (i == 0)
                return true;
            var tdlist = $(b).find("td");
            var prohref = $(tdlist[1]).find("a").attr("href")
            var proid = prohref.substring(prohref.indexOf("id=")+3);
            var proname = $(tdlist[1]).text();
            var item = {
                caturl: $.currentUrl,
                pageindex: 1,
                proid: proid,
                proname: proname
            };
            prolist.push(item);
        });
        $.postLocalTask(prolist);
    }

    function redirect() {
     
        var pageidreg = /page=\d*/g;
        var pagecur = "1";
        if (pageidreg.test($.currentUrl))
            pagecur = $.currentUrl.match(pageidreg)[0].replace("page=", "");
        var pagecur = parseInt(pagecur);
        var spiderUrl = $.currentUrl.replace("page=" + pagecur, "page=" + (pagecur + 1));
        setTimeout("window.location.href='" + spiderUrl + "'", 11000);
    }

  

});
