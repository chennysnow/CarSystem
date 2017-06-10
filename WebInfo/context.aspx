<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.Master" AutoEventWireup="true" CodeBehind="context.aspx.cs" Inherits="WebInfo.context" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="static/css/base.css" rel="stylesheet" />

    <link href="static/css/dealer_common.css" rel="stylesheet" />
<link href="http://www.nb77.cn/static/css/medium/medium_page_cars.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="context" runat="server">


      <div class="main mt10" style="background:#fff;" id="TOP">
	<div class="carbox clearfix">
		<div class="shortno clearfix hide">
			<span class="no">A282685 A662685</span><span id="close" class="close"></span>
			</div>
		<div class="carboxleft">
			<div class="img">
				<!--车源图片-->
					<div class="bigimg">
								<!--		<div class="issell"><img src="/static/img/issell.gif"/></div>-->
						<%if (piclist.Count > 0)
                            {%>				<img id="BigImg" src='<%=piclist[0].Replace("small","load") %>' class="bigpic"/><%}
    else
    { %>
           <img id="BigImg" src='' class="bigpic"/>             <%} %>
											</div>
					<div class="samll_pic_list">
						<ul class="carpiclist clearfix" >
                            <%foreach (var s in piclist)
                                { %>
							<li><a onmousemove="javascript:document.getElementById('BigImg').src='<%=s.Replace("small","load") %>'"><img class="mt10" src="<%=s.Replace("small","load") %>"/></a></li>
					
																				<%} %></ul>
					</div>
	<div class="red">网站声明：本网站系宁波市二手车经纪行业内部网，仅供本行业经本网站注册登记并且确认的网站会员使用，不对外开放。本网所有二手车交易信息均由本网站会员自行发布，本网站无法对该信息真实性负责，一切以二手车交易现场的实际车况为准。特别提醒，表显里程数不等于实际里程。</div>
				<!--车源图片结束-->
			</div>
			<div class="info" style="    padding-left: 10px;">
				<div class="detailtitle cartitle mt20">车况信息</div>
				<!--车源详细说明-->
				<h2><asp:Literal ID="title" runat="server"></asp:Literal></h2>
                                    
				<div class="car_detail01 mt10">
					<p>售价：<span class="f16 orange01 fb"><asp:Literal ID="Literal1" runat="server"></asp:Literal></span> 万<span class="red"><asp:Literal ID="huanjia" runat="server"></asp:Literal></span></p>
				<%if (isnlogin == false)
                    { %>	<p><span  id="dno_">编号：<span class="black" style="padding-right:10px;"><asp:Literal ID="sellnumber" runat="server"></asp:Literal></span>短号： <asp:Literal ID="ProNum" runat="server"></asp:Literal></span></p><% } %>
				</div>
				<div class="car_detail02 mt10">
					<ul class="clearfix">
						<li><span>上牌日期：</span><asp:Literal ID="shangpaiym" runat="server"></asp:Literal></li>
						<li><span>车辆车型：</span><asp:Literal ID="cartype" runat="server"></asp:Literal></li>
						<li><span>车辆产地：</span><asp:Literal ID="country" runat="server"></asp:Literal></li>
						<li><span>车辆颜色：</span><asp:Literal ID="CarColor" runat="server"></asp:Literal></li>
						<li><span>排 气 量：</span><asp:Literal ID="PaiLiang" runat="server"></asp:Literal></li>
						<li><span>变 速 器：</span><asp:Literal ID="BianShuQi" runat="server"></asp:Literal></li>
						<li><span>表显里程：</span><asp:Literal ID="LiCheng" runat="server"></asp:Literal>万</li>
						<li><span>排放标准：</span><asp:Literal ID="PaiFangBiaoZhun" runat="server"></asp:Literal></li>
						<li><span>燃    料：</span><asp:Literal ID="RanYou" runat="server"></asp:Literal></li>
						<li><span>发布日期：</span><asp:Literal ID="cdate" runat="server"></asp:Literal></li>
					</ul>
				</div>
				<div class="mt10">
<p class="car_details">
	<span>车况说明：</span><asp:Literal ID="yangqing" runat="server"></asp:Literal>
</p>	</div>

				<div class="detailtitle contacttitle mt15">联系方式</div>
				<div class="car_detail02 mt10">
					<ul class="clearfix">
						<li style="width:300px;"><span>商户名称：</span> <asp:Literal ID="SellerName" runat="server"></asp:Literal></li>
						<li style="width:300px;"><span>看车地址：</span><asp:Literal ID="Address" runat="server"></asp:Literal></li><li style="width:300px;"> 
                            <span>联系电话：</span><asp:Literal ID="tel" runat="server"></asp:Literal></li>					</ul>
				</div>	
				<!--车源详细说明结束-->
			</div>
		</div>
	</div>
</div>


</asp:Content>
