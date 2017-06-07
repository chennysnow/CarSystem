<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="Userupdata.aspx.cs" Inherits="WebInfo.Userupdata" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="/static/css/dealer_user.css" rel="stylesheet" />
<script src="static/js/common.js"></script>
<script src="static/js/ajax.js"></script>
<script src="static/js/ajaxfileupload.js"></script>
<script src="static/js/layer.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


	


		        			<script type="text/javascript">

function disppic(src) {
    layer.open({
        type: 1,
        skin: 'layui-layer-rim', //加上边框
        area: ['800px', '600px'], //宽高
        content: '<img src="' + src + '" border="0" />'
    });
}
</script>
<div class="commonbox">
	<h3>编辑车源</h3>
	<div class="p10" style=" display:block;  margin-bottom :10px;  ">
		<form name="form1" id="carform" enctype="multipart/form-data" method="post" action="userupdata.aspx"  >
            <input type="hidden" id="id" name="id" value="" />
			<table width="715" border="0" align="center" cellpadding="3" cellspacing="0">
                <!--<tr>
                    <td width="160" height="40" align="right">法人身份证：</td>
                    <td align="left">
                        <input type="file" class="input" name="pic1" id="pic1" size="30"  />
                        *<a href="javascript:void(0)" onclick="disppic('<%=shop.BusinessLicense %>')">图片</a>
                                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="80" height="40" align="right">营业执照：</td>
                    <td align="left">
                        <input type="file" class="input" name="pic2" id="pic2" size="30"   /><a href="javascript:void(0)" onclick="disppic('<%=shop.IdCart %>')">图片</a>
                        <div></div>
                    </td>
                </tr>-->
                          <tr>
            <td width="80" height="40" align="right">编号：</td>
            <td align="left"><input name="netNumber" id="netNumber" disabled="true" size="30" value="<%=shop.ShopNum %>" />
            
            <div></div></td>
            </tr>
            <tr>
            <td width="80" height="40" align="right">短号：</td>
            <td align="left"><input name="phoneNumber" id="phoneNumber" size="30" value="<%=shop.PhoneShopNum %>" />
            *  联盟手机短号可以多个，空格分割
            <div></div></td>
            </tr>
                <tr>
                    <td width="80" height="40" align="right">公司名称：</td>
                    <td align="left">
                        <input name="companyName" id="companyName" size="30" value="<%=shop.CompanyName %>" />
                        *
                                        <div></div>
                    </td>
                </tr>
            
                         <tr>
                    <td width="80" height="40" align="right">城市：</td>
                    <td align="left">
                        <select><option></option> </select>
                        <input name="CompanyAddress" id="CompanyAddress" size="30" value="<%=shop.CompanyAddress %>" />
                        *
                                        <div></div>
                    </td>
                </tr>
                         <tr>
                    <td width="80" height="40" align="right">公司地址：</td>
                    <td align="left">
                        <input name="CompanyAddress" id="CompanyAddress" size="30" value="<%=shop.CompanyAddress %>" />
                        *
                                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="80" height="40" align="right">手机号：</td>
                    <td align="left">
                        <input name="phoneNum" id="phoneNum" size="30" value="<%=shop.PhoneNumber %>" />
                        *
                                        <div></div>
                    </td>
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
