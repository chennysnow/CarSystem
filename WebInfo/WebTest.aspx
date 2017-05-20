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
       html,body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,p,blockquote,th,td,img {margin:0;padding:0;}
   body{ overflow-x: visible; overflow-y: visible;}
        .d1{
           overflow-x: visible; overflow-y: visible;
            position:absolute; 
            left:0px;
            top:0px; 
            width:100%; 
            height:100%;
            z-index:-1;
        }
        .username{width: 126px; height:26px;position:relative;left: 190px;top: -143px;border: 0px; float: left;z-index: 3;line-height: 26px;}
        .password{width: 126px; height:26px;position:relative;left: 65px;top: -85px;border: 0px;float: left;z-index: 3;line-height: 26px; }
       .error{position:relative;left: -145px;top: -42px;border: 0px;float: left;z-index: 3;color:#e6e61c;}
          #loginform{ width: 480px;height: 217px; position: absolute;top:25%; left: 25%; right: auto;  bottom: auto;}
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
			<form name="loginform" id="loginform" method="post" action="Login.aspx" >
			    <img  src="static/img/loginform.png"style="z-index: 2; width: 480px; height: 217px; " usemap="#phly"/> <input type="text"  name="username"  class="username"/> 
         	<input type="password" id="password" name="password" class="password"/>
      <map name="phly" id="phly">
          <area shape="rect" coords="360,77,437,113" onclick="javasript:window.document.loginform.submit();" style="z-index: 4;cursor:hand"/>
  <area shape="rect" coords="360,140,437,175" href ="Default.aspx"  style="z-index: 4;"/>
    </map>  
                <div class="error"> 您输入的编号有误</div>
               </form>
    <div class="d1" ><img src="\static\img\loginbj.jpg" style="z-index: 1;" width="100%" height="100%"/></div>
</body>
</html>


