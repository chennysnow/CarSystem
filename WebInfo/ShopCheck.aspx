<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="ShopCheck.aspx.cs" Inherits="WebInfo.ShopCheck" %>
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
    



           <div class="userright">

<div class="commonbox">
	<h3>编辑车源</h3>
	<div class="p10" style=" display:block;  margin-bottom :10px;  ">
        <script type="text/javascript">

</script>
        <table border="0" cellspacing="0" cellpadding="0" class="wordlist" align="center" data-lx="table">
				<tbody><tr>
                      <th align="left">序号</th>
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
                    
				<tr>
                     <td align="left"><%=v.Id %></td>
                    <td><%=v.ShopNum %></td>
                   
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



                <div class="listpage"><span id="page1"> 共<%=TotalRecord %>条&nbsp;&nbsp;<%=Npage %>/<%=TotalPage %>页&nbsp;&nbsp;</span>
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
  


</asp:Content>
