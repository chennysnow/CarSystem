<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebInfo.Login" %>


 <!DOCTYPE html PUBLIC "-//W3C//Dtd class="td1" XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/Dtd class="td1"/xhtml1-strict.dtd class="td1"">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>91二手车登录</title>
<meta name="keywords" content="91二手车 二手车交易信息网">
<meta name="description" content="91二手车 二手车交易信息网">

    <link href="static/css/login.css" rel="stylesheet" />
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
<body style="background-color:#f4f4f4">
<!--主体-->
<div class="loginmain clearfix">
	<div class="main">
		<div class="homelogo"><a href="http://www.nb2sc.org" target="_blank">&nbsp;</a></div>
	
		<div class="loginw">
			<div class="login">
				<div class="title">
                
				<a href="Default.aspx" target="_blank" class="blue f12 fn mr20">注册</a>
				</div>
				<div class="loginbox">
					<div>
						<form name="loginform" id="loginform" method="post" >
						<div class="login-form">
							<ul>
							
								<li class="field ml20 mt10">
									<div class="word">帐&nbsp;&nbsp;&nbsp;号：
									</div>
									<div class="input">
										<input type="text" name="username" style="color:#ccc" value="" onfocus="if(this.value==''){this.value=''};this.style.color='black';" onblur="if(this.value==''||this.value==''){this.value='';this.style.color='#ccc';}"/>
									</div>
								</li>
								<li class="field ml20">
                                    
									<div class="word">密&nbsp;&nbsp;&nbsp;码：
									</div>
									<div class="input">
										<input type="password" id="password" name="password"/> <input type="image" src="/static/img/login.gif" style="width:auto;height:auto;border:0px;padding:0px;margin-left:23px;*margin-left:20px;" />
									</div>
                                    <div style=" color:red" ><%=msg %></div>
								</li>

							
							</ul>
						</div>
						</form>
					</div>
				</div>
                 <div style="
    text-align: right;
    padding-right: 40px;
"> <a href="Default.aspx"> <img src="static/img/reg.jpg" style="width:auto;height:auto;border:0px;padding:0px;margin-left:23px;*margin-left:20px;"> </a></div>
			</div>
		</div>
	</div>
<!--主体结束--> 
</div>

	
</body>
</html>