<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.Master" AutoEventWireup="true" CodeBehind="index1.aspx.cs" Inherits="WebInfo.index1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/jscss/css/Style.css" rel="stylesheet" />
<script>

    $(function () {
        var ii = 0;
        $("#js-menu-hover>dl").hover(function () {
            $(".sider-menu-pop").addClass("fn-hide");
            $("#js-menu-hover>dl").removeClass("current");
            var index = $(this).attr("data-index");
            if (typeof index != "undefined") {
                $(this).addClass("current");
                var target = $("div.sider-menu-pop")[index];
                $(target).removeClass("fn-hide");
            } else
                $(this).addClass("current1");
        }, function (e) {
            var rect;
            var index
            var target;
            $(this).removeClass("current1");
            index = $(this).attr("data-index");
            if (typeof index != "undefined") {
                target = $("div.sider-menu-pop")[index];
                rect = target.getBoundingClientRect();
                if (rect.top > e.clientY || rect.bottom < e.clientY || rect.left > e.clientX || rect.right < e.clientX) {
                    $(".sider-menu-pop").addClass("fn-hide");
                    $("#js-menu-hover>dl").removeClass("current");
                }
            }
        });

        $("div.sider-menu-pop").hover(function () {
        }, function () {
            $(".sider-menu-pop").addClass("fn-hide");
            $("#js-menu-hover>dl").removeClass("current");

        });
    })
    function kanche(id) {
        $('#my-confirm').modal({
            relatedTarget: this,
            onConfirm: function (options) {
                var tel = $("#tel").val();
                var lxr = $("#lxr").val();
                $.get("infoapi.ashx", { id: id, tel: tel, lxr: lxr }, function (ret) {
                    if (ret == "ok") {
                        alert("预约完成");
                    }

                });
            },
            onCancel: function () {

            }
        });
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
    <div class="banner">
    <div class="am-g am-container">
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
            <div data-toggle="siderbar" class="left-sider-menu">

                <div id="js-menu-hover">
                    <dl class="menu-dl menu-hover" data-index="0">
                        <dt>品牌</dt>
                        <dd>
                            <i class="am-icon-caret-right"></i>
                            <a href="/searchs.aspx?s=a15" target="_blank" title="大众">大众</a>
                            <a href="/searchs.aspx?s=a1" target="_blank" title="奥迪">奥迪</a>
                            <a href="/searchs.aspx?s=a5" target="_blank" title="宝马">宝马</a>
                            <a href="/searchs.aspx?s=a64" target="_blank" title="丰田">丰田</a>
                            <a href="/searchs.aspx?s=a99" target="_blank" title="奔驰">奔驰</a>
                            <a href="/searchs.aspx?s=a78" target="_blank" title="本田">本田</a>
                        </dd>
                    </dl>
                    <dl class="menu-dl menu-hover" data-index="1">
                        <dt>价格</dt>
                        <dd style="width: 250px;">
                            <i class="am-icon-caret-right"></i>
                            <a target="_blank" href="/searchs.aspx?s=c1">3万以下</a>
                            <a target="_blank" href="/searchs.aspx?s=c3">5-7万</a>
                            <a target="_blank" href="/searchs.aspx?s=c4">7-9万</a>
                            <a target="_blank" href="/searchs.aspx?s=c5">9-12万</a>
                        </dd>

                    </dl>
                    <dl class="menu-dl menu-hover" data-index="2">
                        <dt>车龄</dt>
                        <dd>
                            <i class="am-icon-caret-right"></i>
                            <a target="_blank" href="/searchs.aspx?s=d1">1年内</a>
                            <a target="_blank" href="/searchs.aspx?s=d3">1-3年</a>
                            <a target="_blank" href="/searchs.aspx?s=d5">3-5年</a>
                            <a target="_blank" href="/searchs.aspx?s=d6">5年以上</a>
                        </dd>
                    </dl>
                    <dl class="menu-dl menu-hover" data-index="3">
                        <dt>级别</dt>
                        <dd>
                            <i class="am-icon-caret-right"></i>
                            <%for (var i = 0; i < 4 && i < Model.cartype.Count; i++)
                                { %>
                            <a target="_blank"  href="/searchs.aspx?s=e<%=Model.cartype[i].CarTypeKey %>"><%=Model.cartype[i].DisplayName %></a>
                            <%} %>
                        </dd>

                    </dl>
                    <dl class="menu-dl menu-dl-more menu-hover"><dt><i class="am-icon-caret-right"></i><a href="/searchs.aspx" target="_blank">更多筛选</a></dt></dl>
                </div>

                <!-- 品牌pop -->
                <div class="sider-menu-pop menu-brand-pop  fn-hide">
                    <div class="menu-pop-content">
                        <div class="brand-cont">
                            <div class="brand-dl">
                                <%for (var ch = 'A'; ch <= 'K'; ch++)
                                    {
                                        var ls = Model.bandinfo.Where(x => x.FirstChart == ch.ToString());
                                        if (ls.Count() == 0) { continue; } %>
                                <dl class="fn-clear">
                                    <dt><%=ch%></dt>
                                    <dd>
                                         <%foreach (var v in ls)
                                                    {   %>                                              
                                                <a  href="/searchs.aspx?s=<%=string.Format("a{0}", v.BrandNum) %>" title="<%=v.BrandName %>"  target="_blank" ><%=v.BrandName %></a>
                                                   <%} %> 
                                    </dd>
                                </dl>
                                <%} %>                                
                            </div>
                            <div class="brand-dl">
                                <%for (var ch = 'L'; ch <= 'Z'; ch++)
                                    {
                                        var ls = Model.bandinfo.Where(x => x.FirstChart == ch.ToString());
                                        if (ls.Count() == 0) { continue; } %>
                                <dl class="fn-clear">
                                    <dt><%=ch%></dt>
                                    <dd>
                                         <%foreach (var v in ls)
                                       {   %>                                              
                                           <a  href="/searchs.aspx?s=<%=string.Format("a{0}", v.BrandNum) %>" title="<%=v.BrandName %>"  target="_blank" ><%=v.BrandName %></a>
                                         <%} %> 
                                    </dd>
                                </dl>
                                <%} %>      
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 价格pop -->
                <div class="sider-menu-pop menu-rank-pop fn-hide">
                    <div class="menu-pop-content">
                        <div class="s-m-p-list">
                            <a target="_blank" href="/searchs.aspx?s=c1">3万以下</a>
                            <a target="_blank" href="/searchs.aspx?s=c2">3-5万</a>
                            <a target="_blank" href="/searchs.aspx?s=c3">5-7万</a>
                            <a target="_blank" href="/searchs.aspx?s=c4">7-9万</a>
                            <a target="_blank" href="/searchs.aspx?s=c5">9-12万</a>
                            <a target="_blank" href="/searchs.aspx?s=c6">12-16万</a>
                            <a target="_blank" href="/searchs.aspx?s=c7">16-20万</a>
                                <a target="_blank" href="/searchs.aspx?s=c8">20万以上</a>
                        </div>
                    </div>
                </div>
                <!-- 车龄pop -->
                <div class="sider-menu-pop menu-price-pop fn-hide">
                    <div class="menu-pop-content">
                        <div class="s-m-p-list">
                            <a target="_blank" href="/searchs.aspx?s=d1">1年内</a>
                            <a target="_blank" href="/searchs.aspx?s=d3">1-3年</a>
                            <a target="_blank" href="/searchs.aspx?s=d5">3-5年</a>
                            <a target="_blank" href="/searchs.aspx?s=d6">5年以上</a>
                        </div>
                    </div>
                </div>


                <!-- 级别pop -->
                <div class="sider-menu-pop menu-date-pop fn-hide">
                    <div class="menu-pop-content">
                        <div class="s-m-p-list">
                          <%for (var i = 0; i < Model.cartype.Count; i++)
                                { %>
                            <a target="_blank"  href="/searchs.aspx?s=e<%=Model.cartype[i].CarTypeKey %>"><%=Model.cartype[i].DisplayName %></a>
                            <%} %>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-6">
            <div data-am-widget="slider" class="am-slider am-slider-c1" data-am-slider='{"directionNav":false}'>
                <ul class="am-slides">
                    <%foreach (var v in Model.piclist)
                        { %>
                    <li>
                        <a href="javascript:void(0);"><img src="<%=v.image.Replace("small","load") %>"" style="height:340px"></a>
                        <div class="am-slider-desc"><%=v.title %></div>

                    </li>                   
                    <%} %>
                </ul>
            </div>
        </div>
        <div class="am-u-sm-0 am-u-md-0 am-u-lg-3 padding-none info">
            <div class="star am-container"><span>信息</span></div>
            <ul class="padding-none am-gallery am-avg-sm-1 am-avg-md-1 am-avg-lg-1 am-gallery-overlay" data-am-gallery="{ pureview: true }">
                   <%foreach (var v in Model.infolist)
                    { %>
                     <li>
                    <div class="am-gallery-item padding-none am-text-truncate">
                     <a href="listinfo.aspx?id=d<%=v.id %>" target="_blank"> <%=v.title %></a>
                    </div>
                </li>               
                    <%} %>                
            </ul>
            <a href="ListInfo.aspx"  class="infomore">more »</a>
        </div>
    </div>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="context" runat="server">
    <div class="am-g am-container newatype">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-9 oh mywidth">
        <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="border-bottom: 0px; margin-bottom: -10px">
            <h2 class="am-titlebar-title ">
                新增汽车
            </h2>
            <nav class="am-titlebar-nav">
                <a href="searchs.aspx">more &raquo;</a>
            </nav>
        </div>

        <div data-am-widget="list_news" class="am-list-news am-list-news-default news">
            <div class="am-list-news-bd">
                <ul class="am-list list-row">
                    <%
                    foreach(var v in Model.Cardetialinfo){
                            var i = 0;
                            int.TryParse(v.mianimg, out i);
                            var img = v.Images.Split(';');
                            var src = img.Length < i ? img[i] : img[0];
                         %>
                    <li class="am-list-item-desced am-list-item-thumbed am-list-item-thumb-left list-item car-item am-g " data-am-scrollspy="{animation:'fade'}">
                        <a href="context.aspx?id=<%=v.Id %>">


                          <!--<div class="discount">
                                <div class="dis-top"></div> <div class="dis-main">
                                    已降<br>
                                    3800元
                                </div> <div class="dis-bottom"></div>
                            </div>-->

                            <div class="img-backgound">
                                <img src="<%=string.Format("/carimage.aspx?p={0}_290x220.jpg",src) %>" alt="<%=v.ProTitle%>" title="<%=v.ProTitle%>">
                               <!-- <div class="position-bg">
                                    <span class="position-city">宁波</span>
                                </div> -->
                            </div>
                            <h3><%=v.ProTitle%></h3>
                            <div class="mileage">
                                <span class="basic"><%=string.Format("{0}年{1}月", v.ShangPaiYear, v.ShangPaiMonth)%><em class="separator">/</em><%=v.LiCheng%> 万公里</span>
                            </div>
                            <div class="tags-box">
                                <div class="price">
                                    <%=v.baojia.ToString("#0.00")%><span>万</span>
                                </div><!-- <div class="new-price">新车指导价：<span></span>万</div>-->
                            </div>
                        </a><div class="yykanche btn-base btn-wireframe">
                             <a href="javascript:void(0);" onclick="kanche('<%=v.Id %>')">  预约看车</a>
                            </div> <div class="schedule btn-base btn-wireframe"  data-title="<%=v.ProTitle%>">
                            <%=(isnlogin?"":v.ProNum)%>
                        </div>
                    </li>
                 <%  } %>  



                </ul>
            </div> 
        </div>
    </div>
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
        <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
            <h2 class="am-titlebar-title ">
                轿车
            </h2>
            <nav class="am-titlebar-nav">
                <a href="searchs.aspx?s=e4">more &raquo;</a>
            </nav>
        </div>
        <div data-am-widget="list_news" class="am-list-news am-list-news-default right-bg" data-am-scrollspy="{animation:'fade'}">
            <ul class="am-list">
                <% foreach(var v in Model.jiaochelist){
                    var i = 0;
                    int.TryParse(v.mianimg, out i);
                    var img = v.Images.Split(';');
                    var src = img.Length < i ? img[i] : img[0];
                    %>
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="context.aspx?id=<%=v.Id %>">
                            <img src="<%=src%>" style="width:60px" />
                        </a>
                    </div>
                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd am-text-truncate am-text-xs" ><a href="context.aspx?id=<%=v.Id %>"><%=v.ProTitle%></a></h3>
                        <div class="am-list-item-text  am-text-truncate"><%=string.Format("{0}-{1}/{2}万公里/{3:#0.00}万元", v.ShangPaiYear, v.ShangPaiMonth,v.LiCheng, v.baojia)%></div>
                        <div class="am-list-item-text  am-text-truncate"><%=isnlogin?"":v.ProNum%></div>
                    </div>
                </li>
                <hr data-am-widget="divider" style="margin: 0.1rem auto;" class="am-divider am-divider-default" />
               <% }%>
            </ul>
        </div>

        <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
            <h2 class="am-titlebar-title ">
                SUV
            </h2>
            <nav class="am-titlebar-nav">
                <a href="searchs.aspx?s=e29">more &raquo;</a>
            </nav>
        </div>

        <div data-am-widget="list_news" class="am-list-news am-list-news-default right-bg" data-am-scrollspy="{animation:'fade'}">
            <ul class="am-list">
                <%foreach (var v in Model.Suvlist)
                {
                    var i = 0;
                    int.TryParse(v.mianimg, out i);
                    var img = v.Images.Split(';');
                    var src = img.Length < i ? img[i] : img[0];
                    %>
                    <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                        <div class="am-u-sm-4 am-list-thumb">
                            <a href="context.aspx?id=<%=v.Id %>">
                                <img src="<%=src%>" style="width:60px" />
                            </a>
                        </div>
                        <div class=" am-u-sm-8 am-list-main">
                            <h3 class="am-list-item-hd am-text-truncate am-text-xs"><a href="context.aspx?id=<%=v.Id %>"><%=v.ProTitle%></a></h3>
                            <div class="am-list-item-text  am-text-truncate"><%=string.Format("{0}-{1}/{2}万公里/{3:#0.00}万元", v.ShangPaiYear, v.ShangPaiMonth, v.LiCheng, v.baojia)%></div>
                            <div class="am-list-item-text  am-text-truncate"><%=isnlogin?"":v.ProNum%></div>
                        </div>
                    </li>
                    <hr data-am-widget="divider" style="margin: 0.1rem auto;" class="am-divider am-divider-default" />
              <%  } %>
            </ul>
        </div>
        <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
            <h2 class="am-titlebar-title ">
                跑车
            </h2>
            <nav class="am-titlebar-nav">
                <a href="searchs.aspx?s=e28">more &raquo;</a>
            </nav>
        </div>

        <div data-am-widget="list_news" class="am-list-news am-list-news-default right-bg" data-am-scrollspy="{animation:'fade'}">
            <ul class="am-list">
                <%foreach (var v in Model.Paochelist)
                {
                    var i = 0;
                    int.TryParse(v.mianimg, out i);
                    var img = v.Images.Split(';');
                    var src = img.Length < i ? img[i] : img[0];
                    %>
                    <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                        <div class="am-u-sm-4 am-list-thumb">
                            <a href="context.aspx?id=<%=v.Id %>">
                                <img src="<%=src%>" style="width:60px" />
                            </a>
                        </div>
                        <div class=" am-u-sm-8 am-list-main">
                            <h3 class="am-list-item-hd am-text-truncate am-text-xs"><a href="context.aspx?id=<%=v.Id %>"><%=v.ProTitle%></a></h3>
                            <div class="am-list-item-text  am-text-truncate"><%=string.Format("{0}-{1}/{2}万公里/{3:#0.00}万元", v.ShangPaiYear, v.ShangPaiMonth, v.LiCheng, v.baojia)%></div>
                            <div class="am-list-item-text  am-text-truncate"><%=isnlogin?"":v.ProNum%></div>
                        </div>
                    </li>
                    <hr data-am-widget="divider" style="margin: 0.1rem auto;" class="am-divider am-divider-default" />
               <% } %>
            </ul>
        </div>
    </div>
</div>

    
    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm" style="top:40%">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">预约看车</div>
        <div class="am-g tpl-amazeui-form">
              <form class="am-form am-form-horizontal" action="listinfo.aspx" method="POST" >
                        <div class="am-u-sm-12 am-u-md-12"> 
                                <div class="am-form-group">
                                    <label for="tel" class="am-u-sm-2 am-form-label">电话</label>
                                    <div class="am-u-sm-10">
                                        <input type="text"  name="tel" id="tel" placeholder="输入你电话号码">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="lxr" class="am-u-sm-2 am-form-label">联系人</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" id="lxr" name="lxr" placeholder="输入你称呼 Twitter">
                                    </div>
                                </div>  
                        </div>
                  </form>
        </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>


</asp:Content>
