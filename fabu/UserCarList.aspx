<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="UserCarList.aspx.cs" Inherits="WebInfo.UserCarList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="/static/css/dealer_user.css" rel="stylesheet" />
    <script src="static/js/common.js"></script>
    <script src="static/js/ajax.js"></script>
    <script src="static/js/ajaxfileupload.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="main clearfix" style="padding-top:10px ;padding-bottom:10px ">
    <div class="userleft">
		        <div class="usermenu">
            <h3>我的车源管理 &gt;</h3>
            <ul class="clearfix">
                <li><a href="/AddCar.aspx?method=add" class="orange01 f14">添加车源</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1" class="orange01">管理车源</a></li>
            </ul>
        </div>
		        <div class="usermenu">
            <h3>车商资料查询 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=dealerlist" class="orange01 f12">车商列表</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=about&amp;id=36" target="_blank" class="blue f12">联系卡下载</a></li>
               
            </ul>
        </div>

		<div class="leftsearch">
			<form method="get" action="http://www.nb77.cn/dealer/index.php">
			<input type="hidden" name="mod" value="user">
			<input type="hidden" name="ac" value="dealerlist">	<select name="searchsort">
				<option value="">请选择</option><option value="1">车商</option><option value="2">编号</option><option value="3">虚拟号</option>
				</select>
			<input type="text" name="keywords" class="input01"> <input type="image" src="static/img/search05.gif">
			</form>
		</div>
        
        <div class="usermenu">
            <h3>帐号管理 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=upinfo">修改资料</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=uppwd">修改密码</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcertimg" class="red">认证资料上传</a></li>
            </ul>
        </div>
		
    </div>
    <div class="userright">
	
					
<div class="commonbox">
	
	<h3>车源列表</h3>
	<div class="usersearch clearfix">
		<div class="usersearchleft">
			<a href="index.php?mod=user&amp;ac=carlist&amp;pub=1&amp;s_type=1" class="selected">我的车源</a><!-- |
			<a href="#" >今日新增车源</a> |
			<a href="#" >昨日新增车源</a>-->
		</div>
		<div class="usersearchright">
			<form action="index.php" method="get" name="form2">
				<input type="hidden" name="mod" value="user">
				<input type="hidden" name="ac" value="carlist">
				编号：<input type="text" name="pno" id="searchkey" value="" size="10" style="width:50px;" class="inp01">
				<select name="carsort">
				<option value="">请选择车型</option><option value="4">轿车</option><option value="28">跑车</option><option value="29">越野车</option><option value="31">商务车</option><option value="32">皮卡</option><option value="33">面包车</option><option value="34">客车</option><option value="37">货车</option><option value="36">其他</option>
				</select>
				<input type="text" name="keywords" id="searchkey" value="" size="16" class="inp01">
				<span class="buttons"><input type="submit" name="filtersubmit" value="查询"></span>
			</form>
		</div>
	</div>
	<div class="p10">
		<form action="index.php?mod=user" method="post" name="form">

            
                <asp:Repeater ID="repCarlist" runat="server">
                    <HeaderTemplate>
                        	<table cellspacing="0" cellpadding="0" width="100%" class="listtable">
			<tbody><tr>
	
                <th>编号</th>
                <th>车型</th>
                <th>品牌</th>
                <th>报价</th>
                <th>上牌日期</th>
                <th>发布时间</th>
              
                <th>操作</th>
			</tr>

                    </HeaderTemplate>
                    <ItemTemplate>

                              <tr bgcolor="#ffffff" onmouseover="style.backgroundColor='#f5f5f5'" onmouseout="style.backgroundColor='#ffffff'" style="background-color: rgb(255, 255, 255);">
				
                <td align="center"><%# Eval("SellerNumber")%></td>
                <td align="center"><%# GetCatType(Eval("CarType")) %></td>
                <td align="center"><a href="#" target="_blank"><%# Eval("ProTitle") %></a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center"><%# Eval("baojia","{0:0.00}") %>万 </td>
                <td align="center"><%# Eval("SHANGPAIyEAR")%>年<%# Eval("ShangpaiMonth")%>月</td>
                <td align="center"><%#Eval("CreateTime", "{0:yyyy-MM-dd}")%></td>
                                 
                <td align="center" class="opmenu"><a href="AddCar.aspx?method=edit&id=<%# Eval("id")%>">编辑</a>|<a href="AddCar.aspx?method=edit&id=<%# Eval("id")%>" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm('确实要删除吗?'))location='method=del&id='<%# Eval("id")%>"></a></span>
            </td></tr>
                       
        

                    </ItemTemplate>

                    <FooterTemplate>
                          </tbody></table>
                    </FooterTemplate>
                </asp:Repeater>

	
                  
      
		</form>
		<div class="listpage">
			共26条&nbsp;&nbsp;1/2页&nbsp;&nbsp;<a href="/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;page=1">首页</a>&nbsp;&nbsp;上一页&nbsp;&nbsp;<a href="/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;page=2">下一页</a>&nbsp;&nbsp;<a href="/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;page=2">尾页</a>&nbsp;&nbsp; <select onchange="location.href='/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;page='+this.value"><option value="1" selected="">1</option><option value="2">2</option></select>
		</div>
	</div>
</div>                				        														    </div>
</div>
</asp:Content>
