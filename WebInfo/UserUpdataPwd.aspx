<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="UserUpdataPwd.aspx.cs" Inherits="WebInfo.UserUpdataPwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

            <link href="/static/css/dealer_user.css" rel="stylesheet" />
    <script src="static/js/common.js"></script>
    <script src="static/js/ajax.js"></script>
    <script src="static/js/ajaxfileupload.js"></script>
        <script src="static/js/layer.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
     <div class="main clearfix" style="padding-top:10px ;padding-bottom:10px ">
    <div class="userleft">
		        <div class="usermenu">
            <h3>我的车源管理 &gt;</h3>
                   
            <ul class="clearfix">
                <li><a href="/AddCar.aspx?carid=addcar" class="orange01 f14">添加车源</a></li>
                <li><a href="UserCarList.aspx" class="orange01">管理车源</a></li>
            </ul>
        </div>
		        <div style="display:none" class="usermenu">
            <h3>车商资料查询 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=dealerlist" class="orange01 f12">车商列表</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=about&amp;id=36" target="_blank" class="blue f12">联系卡下载</a></li>
               
            </ul>
        </div>

		<div class="leftsearch" style="display:none">
			<form method="get" action="http://www.nb77.cn/dealer/index.php">
			<input type="hidden" name="mod" value="user">
			<input type="hidden" name="ac" value="dealerlist">	<select name="searchsort">
				<option value="">请选择</option><option value="1">车商</option><option value="2">编号</option><option value="3">虚拟号</option>
				</select>
			<input type="text" name="keywords" class="input01"> <input type="image" src="static/img/search05.gif">
			</form>
		</div>
        
        <div  class="usermenu">
            <h3>帐号管理 &gt;</h3>
         
            <ul class="clearfix">
                 <li><a href="Userupdata.aspx">修改资料</a></li>
                <li><a href="UserUpdataPwd.aspx">修改密码</a></li>
              
            </ul>
        </div>
		
    </div>
    <div class="userright">
	
<div class="commonbox">
	<h3>修改<%=shop.CompanyName %>登陆密码</h3>
	<div class="p10" style=" display:block;  margin-bottom :10px;  ">
		<form name="form1" id="carform" enctype="multipart/form-data" method="post" action="UserUpdataPwd.aspx"  >
            <input type="hidden" id="id" name="id" value="" />
			<table width="715" border="0" align="center" cellpadding="3" cellspacing="0">
              <tr>
                        <td width="80" height="40" align="right"> 原密码：</td>
            <td align="left"><input type="password" name="oldpwd" id="oldpwd" size="30"/>
            * 英文或数字，长度6-10 位
            <div></div></td>
            </tr>
              <tr>
                        <td width="80" height="40" align="right">登录密码：</td>
            <td align="left"><input type="password" name="pwd" id="pwd" size="30"/>
            * 英文或数字，长度6-10 位
            <div></div></td>
            </tr>


                <tr>
                    <td width="80" height="40" align="right">验证密码：</td>
                    <td align="left">
                       <input type="password" name="pwd1" id="pwd1" size="30"/>
                        * 英文或数字，长度6-10 位</td>

                </tr>
                <tr>
                    <td width="80" height="40" align="right"></td>
                    <td height="30" align="left">
                        <input type="submit" name="Submit" value="提　交" />
                        <input type="reset" value="重　置" /></td>
                </tr>
                   <%=ErrorMsg %>
            </table>

			
		</form>
	</div>
</div>        				        														    </div>
</div>


</asp:Content>
