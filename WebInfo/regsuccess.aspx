<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="regsuccess.aspx.cs" Inherits="WebInfo.regsuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="static/css/base.css" rel="stylesheet" />
    <script src="static/js/jquery-1.7.1.js"></script>

<script>
        var id, inc = 5;
        $(function () {
            id = setInterval(function () {
                inc--;
                $("#times").text(inc);
                if (inc <= 0)
                   window.location.href = "/login.aspx";

            }, 1000);
        });
   </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="f20" style="
    text-align: center;
    padding-top: 100px;
    color: red;
">注册成功，在<span id="times" style="color:blue; font-style: italic;    padding-right: 7px;">5</span>秒后返回登陆页<br>
            审核通过后即可登陆。

        </div>
    </form>
</body>
</html>
