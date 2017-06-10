<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.Master" AutoEventWireup="true" CodeBehind="Searchs.aspx.cs" Inherits="WebInfo.Searchs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/jscss/css/sStyle.css" rel="stylesheet" />
<script>

	  $(function(){
		var ii=0;
	   $("dd.hoverWidget").hover(function (){
		   $(this).addClass("active");
			$(".moreitem-box",this).show();
        },function (e){
			$(".moreitem-box",this).hide();
		   $(this).removeClass("active");
        });

	    $("span.brand-all").click(function(){
			var role=$(this).attr("data-role");
			if(role==="hide"){
				$("div[data-role='foldItem']").hide();
				$("span[data-role='show']").show();
			}else{
				$("div[data-role='foldItem']").show();
				$("span[data-role='show']").hide();
			}
		});
	   $("span.z30").hover(function (){
			$("div.otherbrand",this).show();
        },function (e){
			$("div.otherbrand",this).hide();

        });
    })
    function pricebd(u) {
        var n="", m="";
        n = $("#my_price_n").val();
        m = $("#my_price_m").val();
        if(n!="")
            n = "n" + $("#my_price_n").val();
        if (m != "")
          m = "m" + $("#my_price_m").val();
        window.location.href = "/searchs.aspx?s=" + u + n + m;
    }
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
    <div class="banner">
    <div class="am-g am-container">
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
            <div class="comfilter-bd">
                <div class="filterBox">
                    <dl class="fliter-bd clearfix">
                        <dt>品牌：</dt>
                        <dd class="clickBrandWidget">
                            <% var dic = Model.swhere.Carwhere["a"];
                                var tj = Model.swhere.Gettjvalue("a");
                                var ss = "";
                                var where = Model.swhere.searchtxt("a");
                                foreach (var k in dic)
                                {
                                    ss = tj == k.Value ? "on" : "";
                                 %>
                                    <a class="<%=ss %>" href="/searchs.aspx?s=<%=string.Format("a{0}{1}", k.Value, where) %>"><%=k.Key%></a>
                                <% }
                                %>                        
                            <!--品牌全部-->
                            <span class="brand-all z30">
                                <em data-role="show">全部<i></i></em>
                                <div data-role="otherBrand" class="otherbrand" style="display: none;">
                                    <div class="o-b-box">
                                        <span class="arrow"><s></s></span>
                                        <ul data-role="letterNav" class="o-b-list">
                                          
                                            <%for (var ch = 'A'; ch <= 'Z'; ch++)
                                            {
                                                var ls = Model.bandinfo.Where(x => x.FirstChart == ch.ToString());
                                                if (ls.Count() == 0) { continue; } %>
                                            <li class="clearfix">
                                                <span><%=ch %></span>
                                                <div>
                                                    <%foreach (var v in ls)
                                                    {   %>                                              
                                                <a  href="/searchs.aspx?s=<%=string.Format("a{0}{1}", v.BrandNum, where) %>"><%=v.BrandName %></a>
                                                   <%} %> 
                                                </div>
                                            </li>                                                    
                                          <% }%> 
                                        </ul>
                                    </div>
                                </div>
                            </span>
                            <!--品牌全部-->
                        </dd>
                    </dl>
                    <dl class="fliter-bd clearfix">
                        <dt>车系：</dt>
                        <dd class="clickTagWidget">
                            <%   
                                var dics = Model.swhere.Getcardic(200);
                                tj = Model.swhere.Gettjvalue("b");
                                where = Model.swhere.searchtxt("b");
                                foreach (var k in dics[0])
                                {
                                    ss = tj == k.Value ? "on" : "";%> 
                                    <a class="<%=ss %>" href="/searchs.aspx?s=<%=string.Format("{1}b{0}", k.Value, where) %>"><%=k.Key %></a>
                               <%  }
                            
                             if (dics[1] != null)
                            { %>
                            <span data-role="show" class="brand-all" style="display: none;"><em>更多<i class="down"></i></em></span>
                            <div data-role="foldItem" style="">
                               <% foreach (var k in dics[1])
                               { %>
                                <a  href="/searchs.aspx?s=<%=string.Format("{1}b{0}", k.Value, where) %>"><%=k.Key %></a>
                              <%  } %>
                                <span data-role="hide" class="brand-all"><em>收起<i class="up"></i></em></span>
                            </div>
                        <% }  %> 
                        </dd>
                    </dl>
                    <dl class="fliter-bd clearfix">
                        <dt>价格：</dt>
                        <dd>
                            <%   dic = Model.swhere.Carwhere["c"];
                                tj = Model.swhere.Gettjvalue("c");
                                where = Model.swhere.searchtxt("c");
                                foreach (var k in dic)
                                {
                                    ss = tj == k.Value ? "on" : ""; %>
                                    <a class="<%=ss %>" href="/searchs.aspx?s=<%=string.Format("{1}c{0}", k.Value, where) %>"><%=k.Key %></a>
                                <%}%>
                            
                            <span class="input-box clearfix rangeFilter">
                                <label> <% string m = "", n = "";
                                    if(Model.swhere.where.TryGetValue("n",out tj)==false)
                                    {
                                        n = "";
                                    }
                                    if (Model.swhere.where.TryGetValue("m", out tj) == false)
                                    {
                                       m= "";
                                    }
                                %>
                                    <input type="text" value="<%=n %>" size="4" class="js-begin" maxlength="3" id="my_price_n" name="n">
                                </label>
                                <label><i class="input-line">-</i></label>
                                <label>
                                    <input type="text" value="<%=m %>"  size="4" class="js-end" maxlength="3" id="my_price_m" name="m">
                                </label>
                                <label class="input-unit">万</label>
                                <label><a  href="javascript:void(0);" class="input-btn js-btn" onclick="pricebd('<%=where%>')">筛选</a></label>
                            </span>
                        </dd>
                    </dl>
                    <dl class="fliter-bd clearfix">
                        <dt>车龄：</dt>
                        <dd>
                            <%  dic = Model.swhere.Carwhere["d"];
                                tj = Model.swhere.Gettjvalue("d");
                                where = Model.swhere.searchtxt("d");
                                foreach (var k in dic)
                                {
                                    ss = tj == k.Value ? "on" : ""; %>
                                    <a class="<%=ss %>" href="/searchs.aspx?s=<%=string.Format("{1}d{0}", k.Value, where) %>"><%=k.Key %></a>
                               <% }
                             %>
                            
                        </dd>
                    </dl>
                    <dl class="moreitem clearfix">
                        <dt>更多：</dt>
                       
                            <% foreach (var k in Model.swhere.Dispname1)
                            {
                                var s2 = k.Key == "颜色" ? " moreitem-color" : "";
                                dic = Model.swhere.Carwhere[k.Value];
                                tj = Model.swhere.Gettjvalue(k.Value);
                                where = Model.swhere.searchtxt(k.Value);
                                var name=Model.swhere.Getname(k.Value);
                                ss = tj != "0" ? "active" : "";
                                var dispname = name == "" ? k.Key : name; %>
                                <dd class="hoverWidget">
                                    <div class="moreitem-btn">
                                        <a href="#" class="<%=ss %>"><%=dispname %></a>
                                    </div>
                                    <div class="moreitem-box">
                                        <div class="m-i-w1 <%=s2 %>">
                                            <div class="moreitem-opts">
                                                <%
                                                    foreach (var k1 in dic)
                                                    {
                                                        ss = tj == k1.Value ? "on" : "";
                                                        if (k.Key == "颜色")
                                                        {%>
 
                                                            <a class="<%=ss %>" href="/searchs.aspx?s=<%=string.Format("{1}{0}{2}", k.Value, where,k1.Value) %>"><i class="<%=string.Format("c-lump{0}",k1.Value) %>"></i><%=k1.Key %></a>
                                                       <% }
                                                        else
                                                        {%>
                                                            <a class="<%=ss %>" href="/searchs.aspx?s=<%=string.Format("{1}{0}{2}", k.Value, where,k1.Value) %>"><%=k1.Key %></a>
                                                       <% } 
                                                    }
                                                 %>
                                            </div>
                                        </div>
                                    </div>
                                </dd>
                          <% } %> 
                    </dl>
                </div>
                <div class="sel-menu clearfix">
                    <p class="sel-p">当前筛选&gt;</p>
                    <%var dics1 = Model.swhere.Getcarwheredic();
                   if (dics1.Count > 0)
                   { 
                    foreach (var k in dics1)
                    {
                            %>
                    <a  href="searchs.aspx?s=<%=k.Value%>&p=<%=page %>&d=<%=orderfd%>" data-role="key_word_one" class="sel-a"><%=k.Key %></a>
                    <%} %>
                    <a  href="searchs.aspx" class="sel-reset">重置</a>
                  <% } %>
                </div>

            </div>
        </div>
    </div>
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="context" runat="server">
    <div class="am-g am-container newatype">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12 oh" >
        <div   class="am-titlebar " style=" margin-top: 0px;    height: 22px;    font-size: 100%;">
            <div class="seqBox clearfix">
          <p class="fr seqtype">共找到<b><%=Model.TotalRecord %></b>辆</p>
                <% var where1 = Model.swhere.searchtxt("z"); %>
    <ul class="sequen">
      
     <% 
         var s1 = "";
         var s2 = "";
         var strs =new string[]{"默认排序","价格","车龄","里程" };
         var dispd = 0;
         for(var i = 0; i < 4; i++) {
             s1 = (disp[i] / 100) > 0 ? "first" : "";
             var ij = disp[i] / 10 % 10;
             
             dispd = disp[i] % 10;
             if (ij == 2)
                 s2 = "<i class=\"up\"></i>";
             else if (ij ==1)
                 s2 = "<i class=\"down\"></i>";
             else s2 = "";
             %>
         <li class="<%=s1 %>"><a href="/searchs.aspx?s=<%=where1%>&p=<%=page%>&d=<%=dispd %>" ><%=strs[i] %><%=s2 %></a></li>       
        <%
         }
      %>
    </ul>
</div>
        </div>
        <div data-am-widget="list_news" class="am-list-news am-list-news-default news"  style="margin: 0px;">
            <div class="am-list-news-bd">
                <ul class="am-list list-row">
                    <% foreach(var v in Model.Cardetialinfo){
                            var i = 0;
                            int.TryParse(v.mianimg, out i);
                            var img = v.Images.Split(';');
                            var src = img.Length < i ? img[i] : img[0]; %>
                        <li class="am-list-item-desced am-list-item-thumbed am-list-item-thumb-left list-item car-item am-g " data-am-scrollspy="{animation:'fade'}">
                            <a href="context.aspx?id=<%=v.Id %>">
                                <!--<div class="discount">
                                  <div class="dis-top"></div> <div class="dis-main">
                                      已降<br>
                                      3800元
                                  </div> <div class="dis-bottom"></div>
                              </div>-->
                                <div class="img-backgound">
                                    <img src="<%=string.Format("/carimage.aspx?p={0}_290x220.jpg",src) %>" alt="<%=v.ProTitle %>" title="<%=v.ProTitle %>">
                                    <div class="position-bg">
                                        <span class="position-city">宁波</span>
                                    </div>
                                </div>
                                <h3><%=v.ProTitle %></h3>
                                <div class="mileage">
                                    <span class="basic"><%=string.Format("{0}年{1}月", v.ShangPaiYear, v.ShangPaiMonth) %><em class="separator">/</em><%=v.LiCheng %> 万公里</span>
                                </div>
                                <div class="tags-box">
                                    <div class="price">
                                       <%=v.baojia.ToString("#0.00") %><span>万</span>
                                    </div><!-- <div class="new-price">新车指导价：<span></span>万</div>-->
                                </div>
                            </a> <div class="schedule btn-base btn-wireframe">
                                 <%=(isnlogin?"":v.ProNum)%>
                            </div>
                        </li>
                  <% }  %>  
                </ul>
            </div>
        </div>
    </div>
 
</div>
    <div class="am-g am-container">
        <div class="am-u-sm-10 am-u-md-10 am-u-lg-9">
            </div>
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
            <% 
                var p1 = page - 1;
                var p2 = page + 1;
                var sel = "";
                %>

          <ul data-am-widget="pagination" class="am-pagination am-pagination-select"  >
      <li class="am-pagination-prev "> 
          <%if (p1 > 0)
              { %>
          <a href="/searchs.aspx?s=<%= where1%>&p=<%=p1%>" class="">上一页</a>
          <% }
    else
    { %>上一页
          <% } %>
      </li>
        <li class="am-pagination-select">
          <select onchange="window.location.href=this.value">
              <%for (var i = 1; i <= Model.TotalPage; i++)
                  {
                      sel = i == page ? "selected" : "";
                 %>
              <option value="/searchs.aspx?s=<%= where1%>&p=<%=i%>" class="" <%=sel %> ><%=i %> / <%=Model.TotalPage %> </option>
              <%} %>
          </select>
        </li>
      <li class="am-pagination-next ">
           <%if (p2 < Model.TotalPage)
              { %> 
           <a href="/searchs.aspx?s=<%= where1%>&p=<%=p2%>" class="">下一页</a>
           <% }
    else
    { %>下一页
          <% } %>
       
      </li>

  </ul>
         </div>
         </div>
</asp:Content>
