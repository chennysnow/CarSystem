<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebTest.aspx.cs" Inherits="WebInfo.WebTest" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd class=">
<!-- saved from url=(0072)http://www.nb77.cn/dealer/index.php?mod=user&ac=carlist&s_type=1&logon=1 -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">

<title>会员中心</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link href="./会员中心_files/dealer_user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./会员中心_files/jquery-1.4.2.min.js.下载"></script>
<script type="text/javascript" src="./会员中心_files/jquery.skygqCheckAjaxform.1.5.js.下载"></script>
<link href="./会员中心_files/uploadify.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="./会员中心_files/swfobject.js.下载"></script>
<script type="text/javascript" src="./会员中心_files/jquery.uploadify.v2.1.4.min.js.下载"></script>
<script type="text/javascript" src="./会员中心_files/common.js.下载"></script>
<script type="text/javascript" src="./会员中心_files/ajax.js.下载"></script>

</head>
<body>
<!--头部--> 

<script language="JavaScript">
$(function(){
	//违章查询
	$(".wzcx").hover(
	  function () {
		$(".wzcxlist").show();
	  },
	  function () {
		$(".wzcxlist").hide();
	  }
	);
});
</script>
<div class="head">
	<div class="head_box" id="head_box"><center><p class="pt5">宁波优驰乐途汽车服务有限公司</p><p class="add"></p></center>	</div>
</div>
<div class="topmenu clearfix">
	<ul class="clearfix">
		<li><a href="http://www.nb77.cn/" class="here">首页</a></li>
		<li><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=index&amp;s_type=1">二手车信息</a></li>
		<li><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=about&amp;id=37">常用表格</a></li>
		<li><a href="http://www.nb2sc.org/news/news_57_01.html" target="_blank">服务信息</a></li>
		<li class="wzcx"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1#">违章查询</a><div class="wzcxlist hide" style="position:absolute;z-index:999999;background:#62ab00;top:38;width:100px;"><a href="http://ngb.122.gov.cn:9080/violation_query.html" target="_blank">宁波违章查询</a><a href="http://www.zjsgat.gov.cn:8087/was/portals/car_lllegal_query.jsp" target="_blank">浙江违章查询</a></div></li>
		<li style="border-right:1px solid green;"><a href="http://www.nb77.cn/dealer/index.php?mod=news&amp;ac=list&amp;id=83" style="color:#fff;background:#ff0000;">换届选举公告</a></li>
		<li><a href="http://www.nb77.cn/dealer/index.php?mod=news&amp;ac=list" style="color:#fff;background:#ff0000;">协会公告</a></li>
		<div class="toplogin" style="*width:300px;">
			<form name="loginform" id="loginform" method="post" action="http://www.nb77.cn/dealer/index.php?mod=userlogin">
			<span><input type="text" name="username" style="color:#ccc" value="输入账号" onfocus="if(this.value==&#39;输入账号&#39;){this.value=&#39;&#39;};this.style.color=&#39;black&#39;;" onblur="if(this.value==&#39;&#39;||this.value==&#39;输入账号&#39;){this.value=&#39;输入账号&#39;;this.style.color=&#39;#ccc&#39;;}" class="inp01"></span> 
			<span><input name="password_" type="text" id="showPwd_" class="inp02" value="输入密码" style="color:#ccc;display:none;"><input name="password" type="password" id="password" class="inp02" style="background:#fff url(/static/img/inputpass.gif) no-repeat left center;" onfocus="this.style.background=&#39;#fff&#39;;" onblur="if(this.value==&#39;&#39;){this.style.background=&#39;#fff url(/static/img/inputpass.gif) no-repeat left center&#39;;}" title="请输入密码"></span>
			<span><input type="image" src="./会员中心_files/login.gif"><input type="hidden" name="action" value="login"></span><span class="ml10 fr" style="*margin-top:-25px;*float:right;"><a href="http://www.nb77.cn/index.php?mod=logout" style="color:#fff;font-weight:bold;*padding:3px 3px;*line-height:18px;*height:18px;">退出</a></span>
			</form>
		</div>
	</ul>
</div><!--头部结束--> 
<!--主体-->

<div class="main clearfix">
    <div class="userleft">
		        <div class="usermenu">
            <h3>我的车源管理 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=addcar" class="orange01 f14">添加车源</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1" class="orange01">管理车源</a></li>
            </ul>
        </div>
		        <div class="usermenu">
            <h3>车商资料查询 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=dealerlist" class="orange01 f12">车商列表</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=about&amp;id=36" target="_blank" class="blue f12">联系卡下载</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=about&amp;id=42" target="_blank" class="red f12">网费付款方式</a></li>
            </ul>
        </div>

		<div class="leftsearch">
			<form method="get" action="http://www.nb77.cn/dealer/index.php">
			<input type="hidden" name="mod" value="user">
			<input type="hidden" name="ac" value="dealerlist">	<select name="searchsort">
				<option value="">请选择</option><option value="1">车商</option><option value="2">编号</option><option value="3">虚拟号</option>
				</select>
			<input type="text" name="keywords" class="input01"> <input type="image" src="./会员中心_files/search05.gif">
			</form>
		</div>
        <div class="usermenu">
            <h3>帖子管理 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=messagealllist">帖子信息</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=addmessage">发布帖子</a></li>
            </ul>
        </div>
        <div class="usermenu">
            <h3>帐号管理 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=upinfo">修改资料</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=uppwd">修改密码</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcertimg" class="red">认证资料上传</a></li>
            </ul>
        </div>
		<div class="commonbox">
																<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1" title="" target="_blank"><img src="./会员中心_files/1480584499.gif" alt="" class="vt mt10"></a>
													<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1" title="" target="_blank"><img src="./会员中心_files/1467176270.gif" alt="" class="vt mt10"></a>
													<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1" title="" target="_blank"><img src="./会员中心_files/1472202017.jpg" alt="" class="vt mt10"></a>
													<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1" title="" target="_blank"><img src="./会员中心_files/1440731403.gif" alt="" class="vt mt10"></a>
													<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1" title="" target="_blank"><img src="./会员中心_files/1469497177.jpg" alt="" class="vt mt10"></a>
													<a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=about&amp;id=101" title="" target="_blank"><img src="./会员中心_files/1462940742.jpg" alt="" class="vt mt10"></a>
													<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1" title="" target="_blank"><img src="./会员中心_files/1458793154.gif" alt="" class="vt mt10"></a>
													<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1" title="" target="_blank"><img src="./会员中心_files/1472805772.jpg" alt="" class="vt mt10"></a>
													<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1" title="" target="_blank"><img src="./会员中心_files/1486438547.gif" alt="" class="vt mt10"></a>
																									<a href="http://www.nb77.cn/dealer/index.php?mod=news&amp;ac=view&amp;id=98" title="" target="_blank"><img src="./会员中心_files/1418227995.jpg" alt="" class="vt mt10"></a>
																																																		</div>
    </div>
    <div class="userright">
	
					<script type="text/javascript">
function strtotime(datetime){  
    var _ = datetime.split(' ');  
    var ymd = _[0];  
    var his = _[1];  
    var str = ymd.split('-');  
    var fix = his.split(':');  
    var year  = str[0] - 0;   
    var month = str[1] - 0 - 1;   
    var day   = str[2] - 0;   
    var hour   = fix[0] - 0;   
    var minute = fix[1] - 0;   
    var second = fix[2] - 0;  
    //兼容无"时:分:秒"模式  
    if(fix[0]=='undefined' || isNaN(hour)){  
      hour=00;  
    }  
    if(fix[1]=='undefined' || isNaN(minute)){  
      minute=00;  
    }  
    if(fix[2]=='undefined' || isNaN(second)){  
      second=00;  
    }  
    time = (new Date(year, month, day, hour, minute, second)).getTime();  
    //alert(time);  
    return parseInt( time / 1000 );  
}

var ystr = '2017';
var strlen = ystr.length;
if (strlen < 4) {
	ystr = '20' + ystr;
} else {
	ystr = ystr;
}
var str = ystr + '-11-17 23:59:59';
var expdate = strtotime(str)-15*24*60*60;
var nowtime = 1493796310;
if (expdate < nowtime) {
　　function myfun() {
	alert("您的中介网编号 90009 已于 2017年11月17日 到期，请及时续费。联系协会任文萍6669，秘书处小华短号667667，网管小沈888833.");
	}
	window.onload = myfun;
}
</script>

<div class="commonbox">
	<div class="p10" style="background:url(/static/img/bgt.gif) repeat-y left top;height:130px;display:block;overflow:hidden;">
	<!--	<MARQUEE onmouseover=this.stop() onmouseout=this.start() scrollAmount=1 scrollDelay=0 direction=up height="70">-->
<table cellspacing="0" cellpadding="0" width="620" align="center" border="0">
<tbody>
<tr>
<td valign="top" height="120">
	<div style="display:block;height:130px;width:430px;overflow-y:auto; overflow-x:hidden;table-layout: fixed;word-wrap:break-word;word-break:break-all;"><span style="color:red" class="f14"></span>
			<div>
				<ul>
          		  				</ul>
			</div></div>
</td></tr></tbody></table><!--</MARQUEE>-->
	
	<div style="position:relative;top:-120px;width:220px;float:right;display:block;">
		<p style="width:220px;display:block;float:left;"><span class="fr"><a target="blank" href="tencent://message/?uin=2998473843&amp;Site=http://www.nb77.cn&amp;Menu=yes"><img border="0" align="absmiddle" src="./会员中心_files/pa" alt="有需求请与我联系"></a></span>网站管理：888833 小沈</p>
		<p style="width:220px;display:block;float:left;"><span class="fr"><a target="blank" href="tencent://message/?uin=535499223&amp;Site=http://www.nb77.cn&amp;Menu=yes"><img border="0" align="absmiddle" src="./会员中心_files/pa(1)" alt="有需求请与我联系"></a></span><span class="white">网站管理：</span>6669&nbsp;&nbsp;&nbsp;&nbsp; 阿萍</p>
		<p style="width:220px;display:block;float:left;"><span class="fr"><a target="blank" href="tencent://message/?uin=2448994049&amp;Site=http://www.nb77.cn&amp;Menu=yes"><img border="0" align="absmiddle" src="./会员中心_files/pa(2)" alt="有需求请与我联系"></a></span><span class="white">网站管理：</span>666670 老陈</p>
		<p style="width:220px;display:block;float:left;"><span class="fr"><a target="blank" href="tencent://message/?uin=2987449690&amp;Site=http://www.nb77.cn&amp;Menu=yes"><img border="0" align="absmiddle" src="./会员中心_files/pa(3)" alt="有需求请与我联系"></a></span>违规举报：667667 小华</p>
		<p style="width:220px;display:block;float:left;"><span class="fr"><a target="blank" href="tencent://message/?uin=19985824&amp;Site=http://www.nb77.cn&amp;Menu=yes"><img border="0" align="absmiddle" src="./会员中心_files/pa(4)" alt="有需求请与我联系"></a></span>技术问题：通过在线咨询</p>
	</div>
	</div>
	<h3><span class="fr mr10 black fn">会员到期日期：2017年11月17日 </span> 车源列表 <a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=addcar" class="f12 fn unl ml10">添加车源</a></h3>
	<div class="usersearch clearfix">
		<div class="usersearchleft">
			<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;pub=1&amp;s_type=1" class="selected">我的车源</a><!-- |
			<a href="#" >今日新增车源</a> |
			<a href="#" >昨日新增车源</a>-->
		</div>
		<div class="usersearchright">
			<form action="http://www.nb77.cn/dealer/index.php" method="get" name="form2">
				<input type="hidden" name="mod" value="user">
				<input type="hidden" name="ac" value="carlist">
				编号：<input type="text" name="pno" id="searchkey" value="" size="10" style="width:50px;" class="inp01">
				<select name="carsort">
				<option value="">请选择车型</option><option value="4">轿车</option><option value="28">跑车</option><option value="29">越野车</option><option value="31">商务车</option><option value="32">皮卡</option><option value="33">面包车</option><option value="34">客车</option><option value="37">货车</option><option value="36">其他</option>
				</select>
				<input type="text" name="keywords" id="searchkey" value="" size="16" class="inp01">
				<span class="buttons"><input type="submit" name="filtersubmit" value="查询"></span>
			</form>
		</div>
	</div>
	<div class="p10">
		<form action="http://www.nb77.cn/dealer/index.php?mod=user" method="post" name="form">
		<table cellspacing="0" cellpadding="0" width="100%" class="listtable">
			<tbody><tr>
				<th>全选</th>
                <th>编号</th>
                <th>车型</th>
                <th>品牌</th>
                <th>报价</th>
                <th>上牌日期</th>
                <th>发布时间</th>
                <th>备注</th>
                <th>操作</th>
			</tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="415104"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">商务车</td>
                <td align="center"><!--/cars/197001/415104.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=415104" target="_blank">GMC商务之星蓝牌 C1可.</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">45.80万</td>
                <td align="center">2011年5月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=415104&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=415104&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=415104&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=415104&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=415104&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="462180"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/462180.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=462180" target="_blank">奥迪A3</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">12.68万</td>
                <td align="center">2011年7月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=462180&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=462180&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=462180&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=462180&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=462180&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;" style="background-color: rgb(255, 255, 255);">
				<td align="center"><input type="checkbox" name="bulkid[]" value="528888"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/528888.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=528888" target="_blank">奥迪A6L2.0t</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">32.68万</td>
                <td align="center">2015年6月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=528888&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=528888&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=528888&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=528888&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=528888&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="544254"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/544254.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=544254" target="_blank">奥迪A6L高配大天窗</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">32.58万</td>
                <td align="center">2015年1月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=544254&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=544254&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=544254&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=544254&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=544254&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="502872"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">越野车</td>
                <td align="center"><!--/cars/197001/502872.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=502872" target="_blank">奥迪Q3四驱</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">22.28万</td>
                <td align="center">2014年4月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=502872&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=502872&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=502872&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=502872&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=502872&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;" style="background-color: rgb(255, 255, 255);">
				<td align="center"><input type="checkbox" name="bulkid[]" value="515939"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/515939.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=515939" target="_blank">宝马525Li国五</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">39.50万</td>
                <td align="center">2016年6月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=515939&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=515939&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=515939&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=515939&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=515939&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="540794"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/540794.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=540794" target="_blank">宝马730Li新款</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">52.98万</td>
                <td align="center">2014年2月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=540794&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=540794&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=540794&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=540794&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=540794&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="437732"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/437732.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=437732" target="_blank">宝马MINI</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">10.99万</td>
                <td align="center">2010年5月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=437732&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=437732&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=437732&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=437732&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=437732&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="407347"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/407347.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=407347" target="_blank">奔驰E200 轿跑进口</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">29.99万</td>
                <td align="center">2013年5月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=407347&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=407347&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=407347&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=407347&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=407347&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="538153"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">越野车</td>
                <td align="center"><!--/cars/197001/538153.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=538153" target="_blank">奔驰ML400豪华型</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">72.98万</td>
                <td align="center">2015年3月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=538153&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=538153&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=538153&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=538153&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=538153&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="540365"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/540365.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=540365" target="_blank">本田雅阁豪华</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">12.38万</td>
                <td align="center">2012年3月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=540365&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=540365&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=540365&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=540365&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=540365&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="512573"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/512573.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=512573" target="_blank">别克英朗GT</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">9.98万</td>
                <td align="center">2016年2月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=512573&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=512573&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=512573&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=512573&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=512573&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="540153"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/540153.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=540153" target="_blank">别克英朗XT</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">8.28万</td>
                <td align="center">2013年5月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=540153&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=540153&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=540153&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=540153&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=540153&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="542848"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">越野车</td>
                <td align="center"><!--/cars/197001/542848.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=542848" target="_blank">长城哈弗H3 手动2.0L .</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">5.28万</td>
                <td align="center">2012年10月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=542848&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=542848&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=542848&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=542848&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=542848&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="536656"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/536656.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=536656" target="_blank">大众速腾大众速腾1.6L.</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">10.68万</td>
                <td align="center">2013年4月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=536656&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=536656&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=536656&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=536656&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=536656&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="542547"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/542547.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=542547" target="_blank">福特蒙迪欧致胜2.3高.</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">11.08万</td>
                <td align="center">2013年11月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=542547&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=542547&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=542547&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=542547&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=542547&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="458613"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">越野车</td>
                <td align="center"><!--/cars/197001/458613.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=458613" target="_blank">江淮瑞风S5黑色</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">7.68万</td>
                <td align="center">2014年1月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=458613&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=458613&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=458613&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=458613&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=458613&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="518642"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/518642.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=518642" target="_blank">雷克萨斯NX200</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">31.98万</td>
                <td align="center">2015年6月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=518642&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=518642&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=518642&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=518642&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=518642&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="486829"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">越野车</td>
                <td align="center"><!--/cars/197001/486829.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=486829" target="_blank">铃木天语SX4</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">7.68万</td>
                <td align="center">2013年4月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=486829&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=486829&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=486829&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=486829&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=486829&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="543330"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">越野车</td>
                <td align="center"><!--/cars/197001/543330.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=543330" target="_blank">路虎发现发现4    黑.</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">68.98万</td>
                <td align="center">2014年5月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=543330&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=543330&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=543330&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=543330&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=543330&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="516257"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">商务车</td>
                <td align="center"><!--/cars/197001/516257.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=516257" target="_blank">马自达M5进口7座gl8奥.</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">9.68万</td>
                <td align="center">2011年3月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=516257&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=516257&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=516257&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=516257&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=516257&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="535807"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/535807.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=535807" target="_blank">欧宝安德拉</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">16.78万</td>
                <td align="center">2014年5月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=535807&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=535807&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=535807&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=535807&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=535807&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="544643"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">越野车</td>
                <td align="center"><!--/cars/197001/544643.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=544643" target="_blank">起亚智跑2.0豪华</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">10.98万</td>
                <td align="center">2012年9月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=544643&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=544643&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=544643&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=544643&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=544643&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="515521"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/515521.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=515521" target="_blank">雪佛兰科鲁兹</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">8.90万</td>
                <td align="center">2015年11月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=515521&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=515521&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=515521&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=515521&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=515521&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
                        <tr bgcolor="#ffffff" onmouseover="style.backgroundColor=&#39;#f5f5f5&#39;" onmouseout="style.backgroundColor=&#39;#ffffff&#39;">
				<td align="center"><input type="checkbox" name="bulkid[]" value="528096"></td>
                <td align="center">90009&nbsp;</td>
                <td align="center">轿车</td>
                <td align="center"><!--/cars/197001/528096.html--><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=cars&amp;id=528096" target="_blank">跃进蓝色</a><span class="red">(图)</span><span class="red"></span></td>
                <td align="center">3.10万</td>
                <td align="center">2012年4月</td>
                <td align="center">2017-05-03</td>
                <td align="center"></td>
                <td align="center" class="opmenu"><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=528096&amp;page=1">编辑</a>|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id=528096&amp;page=1">置顶</a><!--|<a href="index.php?mod=user&ac=carrecom&id=528096&ptype=&page=1">推荐</a>-->|<a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=sell&amp;id=528096&amp;sell=&amp;page=1" title="如果该车已卖出，从列表中移除">删除</a><span style="display:none;">| <a href="javascript:if(confirm(&#39;确实要删除吗?&#39;))location=&#39;index.php?mod=user&amp;ac=sell&amp;id=528096&amp;sell=&amp;page=1&#39;"></a></span>
            </td></tr>
            			<tr>
				<td align="center">
					<input type="checkbox" onclick="javascript:selectAll();" id="select_all">
				</td>
				<td colspan="9" class="buttontd"><label for="select_all"> 全选</label> 
					<a href="javascript:submitForm(&#39;index.php?mod=user&amp;ac=sellall&#39;,&#39;改变买卖状态&#39;);" title="请选择后操作" style="display:none;">删除</a>
<!--	<a href="javascript:submitForm('index.php?mod=user&ac=bulkcarrecom','改变推荐状态');" title="请选择后操作">推荐</a> -->	<a href="javascript:submitForm(&#39;index.php?mod=user&amp;ac=bulkrefresh&#39;,&#39;改变置顶状态&#39;);" title="请选择后操作">置顶</a>
				</td>
			</tr>
        </tbody></table>
		</form>
		<div class="listpage">
			共25条&nbsp;&nbsp;1/1页&nbsp;&nbsp;<a>首页</a>&nbsp;&nbsp;上一页&nbsp;&nbsp;下一页&nbsp;&nbsp;尾页&nbsp;&nbsp; <select onchange="location.href=&#39;/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1&amp;logon=1&amp;page=&#39;+this.value"><option value="1" selected="">1</option></select>
		</div>
	</div>
</div>                				        														    </div>
</div>
<!--主体结束-->
<!--底部-->
<div class="footmain">
	<div class="footer">
<p><a href="http://www.nb2sc.org/" target="_blank"><img src="./会员中心_files/foot_banner.jpg" width="970" height="150" style="border:1px solid #eee;"></a></p>
		<p>CopyRight @ All Rights Reserved 宁波市二手车经纪行业协会版权所有 <a href="http://www.miitbeian.gov.cn/" target="_blank">浙ICP备14038839号</a><br>
由宁波市江东柒车商务信息服务有限公司承办  电话（传真）：0574-55845611 公众平台微信号：nb2sc77 <br>
秘书处地址：宁波市江东区东方商务中心4号楼1119室（火车东站附近）<script src="./会员中心_files/stat.php" language="JavaScript"></script><script src="./会员中心_files/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1258744815" target="_blank" title="站长统计">站长统计</a></p>
	</div>
</div><!--底部结束-->

</body></html>