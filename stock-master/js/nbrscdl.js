$(document).ready(function () {

    getProducts();
   
  
    function getProducts() {

        if ($(".info").length == 0)
            return;
        var content = $(".car_detail01 p");
        var content1 = $(".car_detail02 li");
        var remark = $(".car_details").text();

        var imglist = $(".samll_pic_list img");
        var title = $(".info h2").text();
        var pageidreg = /id=\d*/g;
        var proid = "1";
        if (pageidreg.test($.currentUrl))
            proid = $.currentUrl.match(pageidreg)[0].replace("id=", "");

        var prolist = new Array();

        $(content).each(function (i, b) {
            var str = $(b).text();
            prolist.push(str);
        });
        $(content1).each(function(i, b) {
            var str = $(b).text();
            prolist.push(str);
        });

        $(imglist).each(function (i, b) {
            var str = $(b).attr("src");
            prolist.push(str);
        });
        prolist.push("标题：" + title);
        prolist.push("remark：" + remark);

        var item = { id: proid, content: prolist };

        //http://www.nb77.cn/dealer/index.php?mod=index&ac=cars&id=538912
        $.postLocalTask(item);
        $.getSpriderTaskrsc(proid);
    }

});
