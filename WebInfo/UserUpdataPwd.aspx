<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="UserUpdataPwd.aspx.cs" Inherits="WebInfo.UserUpdataPwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

            <link href="/static/css/dealer_user.css" rel="stylesheet" />
    <script src="static/js/common.js"></script>
    <script src="static/js/ajax.js"></script>
    <script src="static/js/ajaxfileupload.js"></script>
        <script src="static/js/layer.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
  
	
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
</div>        				        														    

</asp:Content>
