<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="ShopCheck.aspx.cs" Inherits="WebInfo.ShopCheck" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="/static/css/dealer_user.css" rel="stylesheet" />
<script src="static/js/common.js"></script>
<script src="static/js/ajax.js"></script>
<script src="static/js/ajaxfileupload.js"></script>
<script src="static/js/layer.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="commonbox" style="padding:15px;">
    	<h3>导入车源</h3>

        <form method="post" name="form1" style="padding-top:25px;padding-left:5px;">
            77网编号 <input type="text" id="oldnumber" name="oldnumber" /><br />
            91网编号 <input type="text" id="newnumber" name="newnumber" /><br /><br />
            <input type="submit" value=" 导 入 " style="margin-left:60px" />
        </form>
        </div>
    



  


</asp:Content>
