<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebInfo.Login" %>


 <!DOCTYPE html PUBLIC "-//W3C//Dtd class="td1" XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/Dtd class="td1"/xhtml1-strict.dtd class="td1"">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>91二手车登录</title>
<meta name="keywords" content="91二手车 二手车商内部信息平台 二手车交易信息网 ">
<meta name="description" content="91二手车 二手车交易信息网">

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
        .username{width: 126px; height:26px;position:relative;left: 190px;top: -140px;border: 0px; float: left;z-index: 3;line-height: 26px;}
        .password{width: 126px; height:26px;position:relative;left: 65px;top: -81px;border: 0px;float: left;z-index: 3;line-height: 26px; }
       .error{position:relative;left: -145px;top: -42px;border: 0px;float: left;z-index: 3;color:#e6e61c;}
          #loginform{ width: 480px;height: 217px; position: absolute;top:25%; left: 25%; right: auto;  bottom: auto;}
    </style>
<script src="static/js/jquery-1.7.1.js"></script>
<script language="JavaScript">

function set_favorite(title, url) {
	try {
		window.external.AddFavorite(url, title);
	} catch (e) {
		if (window.sidebar) {
			window.sidebar.addPanel(title, url, '');
		} else {
			alert('请用ctrl+d收藏网址');
			return false;
		}
	}
}
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
                <div class="error"><%=msg %></div>
                <input type="hidden" id="url" name="url" value="<%=backurl %>"/>
               </form>
    <div class="d1" ><img src="\static\img\loginbj.jpg" style="z-index: 1;" width="100%" height="100%"/></div>
    <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?fa019c75e209624ca7c5b230a84e25d6";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</body>
</html>