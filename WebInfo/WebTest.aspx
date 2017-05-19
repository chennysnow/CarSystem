<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebTest.aspx.cs" Inherits="WebInfo.WebTest" %>
<!DOCTYPE HTML>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

<link href="static/uploadify/uploadify.css" rel="stylesheet" />
    <script src="static/js/jquery-1.7.1.js"></script>
    <script src="static/uploadify/jquery.uploadify.min.js"></script>
    <style type="text/css">
body{
 margin:0px;
 padding:0px;
}
.d1{
position:absolute; 
 left:0px;
 top:0px; 
 width:100%; 
 height:100%;
 z-index:-1;
}
</style>

    <script type="text/javascript">
        $(document).ready(function () {
       
            $(function () {
                $("#uploadify").uploadify({
                    buttonText: '上传文件',
             
                    auto: true,
                    multi: true,
                    fileDesc: '支持格式:jpg,gif,jpeg,png,bmp',
                    fileExt: '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.JPG;*.GIF;*.JPEG;*.PNG;*.BMP;',
                    height: 30,
                    width: 120,
                    swf: 'static/uploadify/uploadify.swf',
                    uploader: 'WebApi.ashx',
                    uploadLimit: 8,
                    onUploadSuccess: function (file, data, response) {
                        debugger;
                        data = JSON.parse(data);
                        if (data.Error!=null) {
                            alert('The file ' + file.name + ' ' + response + ':' + data.Error);
                        } else {
                            var tempid = data.img.substring(data.img.lastIndexOf('/') + 1, data.img.indexOf('.'));
                            var li = "<li id='" + tempid + "'><img name='p_pics' src='" + data.img + "' /><p><a href=\"javascript:delimg('" + tempid + "')\" > 删除</a></p></li>";
                            $("#piclist").append(li);
                        }

 
                    }
                });
            });
        });
    </script>
</head>
<body  >
    
    <div class="d1" ><img src="\static\img\loginbj.jpg" width="100%" height="100%"/>
  
        </div>
</body>
</html>


