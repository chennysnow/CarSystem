<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ShopCheck.aspx.cs" Inherits="WebInfo.ShopCheck" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="/static/css/dealer_user.css" rel="stylesheet" />
<link href="static/js/skin/default/layer.css" rel="stylesheet" />
    <script src="static/js/common.js"></script>
    <script src="static/js/ajax.js"></script>
    <script src="static/js/ajaxfileupload.js"></script>
    <script src="static/js/layer.js"></script>

<style type="text/css" media="screen">#file_uploadUploader {visibility:hidden}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<script type="text/javascript">
            function disppic(th) {
                var src = $("img", th).attr("src");
                layer.open({
                  type: 1,
                  skin: 'layui-layer-rim', //加上边框
                  area: ['420px', '240px'], //宽高
                  content: '<img src="'+src+'" border="0" />'
            });
            }
            function checkuser(id) {
                layer.confirm('是否对客户进行验证通过？', {
                  btn: ['是的', '不需要'] //按钮
                }, function () {
                    layer.msg('验证通过', { icon: 1 });

                },function () {
                  layer.msg('不进行验证', {
                    time: 20000, //20s后自动关闭
                    btn: [ '退出']
                  });
                
            });
            }

            function deluser(id) {
                layer.confirm('是否删除客户', {
                  btn: ['是的', '不要'] //按钮
                }, function () {
                    layer.msg('已删除客户', { icon: 1 });

                },function () {
                  layer.msg('不删除', {
                    time: 20000, //20s后自动关闭
                    btn: [ '退出']
                  });
                
            });
            }

        </script>
    <div class="main clearfix" style="padding-top:10px ;padding-bottom:10px ">
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
			<input type="text" name="keywords" class="input01"> <input type="image" src="static/img/search05.gif">
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
		
    </div>



           <div class="userright">

<div class="commonbox">
	<h3>编辑车源</h3>
	<div class="p10" style=" display:block;  margin-bottom :10px;  ">
        <script type="text/javascript">

</script>
        <table border="0" cellspacing="0" cellpadding="0" class="wordlist" align="center" data-lx="table">
				<tbody><tr>
					<th>编码</th>
					<th align="left">公司名称</th>
					<th align="center">营业执照</th>
					<th align="center">身份证</th>
					<th align="center">电话</th>
					<th align="center">公司地址</th>
					<th align="center">创建日期</th>
					<th align="center">状态</th>
					<th align="center">审核删除</th>
				</tr>
                    <%foreach (var v in Shoplist)
                        { %>
				<tr><td><%=v.ShopNum %></td>

					<td align="left"><%=v.CompanyName %></td>
					<td align="center"><a href="javascript:void(0);" onclick="disppic(this)" class="big-link" data-reveal-id="myModal"><img src="<%=v.BusinessLicense %>" width="20" /></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="disppic(this)" class="big-link" data-reveal-id="myModal"><img src="<%=v.IdCart %>" width="20" /></a></td>	
					<td align="center"><%=v.PhoneNumber %></td>
					<td align="center"><%=v.CompanyAddress %></td>
                    <td align="center"><%=v.CreateTime %></td>
                   <td align="center">已验证</td>
					<td align="center"><a href="javascript:void(0);" onclick="checkuser(<%=v.Id %>)">审核</a><a href="javascript:void(0);" onclick="delckuser(<%=v.Id %>)">删除</a></td>
				</tr>
                    <%} %>
                </tbody></table>



                <div class="listpage"><span id="page1"> 共15793条&nbsp;&nbsp;1/632页&nbsp;&nbsp;</span>
                 <%if (Ppage > 1) {%>
                <a href="/search.aspx?page=1">首页</a>
                <%} else { %>首页 <%} %>&nbsp;&nbsp;

                <%if (Ppage > 1) {%>
                <a href="/search.aspx?page=<%=Ppage %>">上一页</a>
                    <%} else { %>
                    上一页
                    <%} %>&nbsp;&nbsp;
                    <%if (Ppage <TotalPage) {%>
                <a href="/search.aspx?page=<%=Npage %>">下一页</a>
                    <%} else { %>
                    下一页
                    <%} %>&nbsp;&nbsp;              
                     <%if (Ppage <TotalPage) {%>
                <a href="/search.aspx?page=<%=TotalPage %>" >尾页</a>
                    <%} else { %>尾页 <%} %>&nbsp;&nbsp;
                <select onchange="location.href='shopcheck.aspx?page='+this.value">
                    <%for (var i = 0; i < TotalPage; i++)
                        { %>
                    <option value="<%=i %>"><%=i %></option>
                    <%} %>
                </select> </div>


       </div>
    </div>
</div>    


</asp:Content>
