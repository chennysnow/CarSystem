<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebTest.aspx.cs" Inherits="WebInfo.WebTest" %>
<!DOCTYPE HTML>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

<link href="static/uploadify/uploadify.css" rel="stylesheet" />
    <script src="static/js/jquery-1.7.1.js"></script>
    <script src="static/uploadify/jquery.uploadify.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {
       
            $(function () {
                $("#uploadify").uploadify({
                    height: 30,
                    swf: 'static/uploadify/uploadify.swf',
                    uploader: 'WebApi.ashx',
                    width: 120
                });
            });
        });
    </script>
</head>
<body>
  
    <input type="file" name="uploadify" id="uploadify" />
   
</body>
</html>


