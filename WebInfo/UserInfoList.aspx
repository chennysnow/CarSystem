<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="UserInfoList.aspx.cs" Inherits="WebInfo.UserInfoList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
           <link href="/static/css/dealer_user.css" rel="stylesheet" />
    <script src="static/js/common.js"></script>
    <script src="static/js/ajax.js"></script>
    <script src="static/js/ajaxfileupload.js"></script>
    <script>
        function checkinfo(id, st) {
            $.get("checkinfo.ashx?id=" + id + "&act=" + st, function (r) {
                if (r == "ok") {

                } else {
                    alert("处理错误");
                }
            })
        }
        function delpro(proid)
        {
            if(confirm("确定要删除这条记录吗？"))
            {
                document.location.href = "UserCarList.aspx?del=" + proid;
            }
        }

        $(document).ready(function () { 
        $("#btnsearch").click(function () {
            debugger;
            var query = "";
            var carsort = $("#carsort").val();
            if (carsort != "")
                query = "?cartype=" + carsort;

            var keywords = $("#searchkey").val();

            if (keywords != "") {
                if (query != "")
                    query += "&key=" + encodeURIComponent(keywords);
                else
                    query = "?key=" + encodeURIComponent(keywords);


            }
            if (query == "")
                location.href = "UserCarList.aspx";
            else
            location.href = query;
                //encodeURIs
        })
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    				
<div class="commonbox">
	
	<h3>信息列表</h3>
	<div class="usersearch clearfix">
		<div class="usersearchleft">
			<a href="#" class="selected">我的信息</a><!-- |
			<a href="#" >今日新增车源</a> |
			<a href="#" >昨日新增车源</a>-->
		</div>

	</div>
	<div class="p10">
		<form action="index.php?mod=user" method="post" name="form">


	<table cellspacing="0" cellpadding="0" width="100%" class="listtable">
			<tbody><tr>
	
                <th>标题</th>
                <th>联系</th>
                <th>类型</th>   
                <th>日期</th>                   
                <th>操作</th>
			</tr>
            <%foreach (var v in list)
                { %>                
                <tr bgcolor="#ffffff" onmouseover="style.backgroundColor='#f5f5f5'" onmouseout="style.backgroundColor='#ffffff'" style="background-color: rgb(255, 255, 255);">
				
                <td align="center"><%=v.title%></td>
                <td align="center"><%=v.contact %></td>
                <td align="center"><%switch (v.type) {
        case 0:
 %>              图片展示
                    <%
        break;
    case 1:
 %>              信息
                    <%
        break;
    case 2:
                    %>
                    信息致顶
                    <% break;
    } %></td>
                <td align="center"><%=string.Format("{0:yyyy-MM-dd}", v.cdate)%></td>
                                 
                <td align="center" class="opmenu"><%if (ismanager) { %><a href="UserInfoList.aspx?act=<%=v.start%>&id=<%=v.id %>&pageid=<%=currentPage %>"><%=(v.start == 0 ? "审核" : "取消") %></a>|<%} %><a href="AddInfo.aspx?method=edit&id=<%=v.id %>">编辑</a>|<a href="javascript:delpro(<%=v.id %>);" title="如果该车已卖出，从列表中移除">删除</a><span ></span>
            </td></tr>
                <%} %>
     </tbody></table>

            
                <asp:Repeater ID="repCarlist" runat="server">
                    <HeaderTemplate>
                        
                    </HeaderTemplate>
                    <ItemTemplate>

                    </ItemTemplate>

                    <FooterTemplate>
                     
                    </FooterTemplate>
                </asp:Repeater>

	
                  
      
		</form>
		<div class="listpage">
			<%=pagenum %>
		</div>
	</div>
</div>     
</asp:Content>
