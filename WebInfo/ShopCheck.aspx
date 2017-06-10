<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="ShopCheck.aspx.cs" Inherits="WebInfo.ShopCheck" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="/static/css/dealer_user.css" rel="stylesheet" />
<script src="static/js/common.js"></script>
<script src="static/js/ajax.js"></script>

<script src="static/js/layer.js"></script>
   
    <script type="text/javascript">

        function search() {
            $("#method").val("2");

            $("#form1").submit();

        }
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="commonbox" style="padding:15px;">
    	<h3>导入车源</h3>

        <form method="post" name="form1" id="form1" style="padding-top:25px;padding-left:5px;">
            77网编号 <input type="text" id="oldnumber" name="oldnumber" /><br />
            91网编号 <input type="text" id="newnumber" name="newnumber" /><br /><br />
            <input type="hidden" id="method" name="method" value="1"/>
         <input type="button" id="searchCar" onclick="search()" value=" 查 询 " style="margin-left:60px" />     <input type="submit" value=" 导 入 " style="margin-left:60px" />
        </form>
        
        <span ><%=msg %></span>
        </div>
    



  


</asp:Content>
