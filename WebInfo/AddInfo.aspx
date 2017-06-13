<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="AddInfo.aspx.cs" Inherits="WebInfo.AddInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="/static/css/dealer_user.css" rel="stylesheet" />

        <link href="static/webuploader/webuploader.css" rel="stylesheet" />
     <script src="static/js/common.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		        			<script type="text/javascript">
                                function delimg(tempid) {
                                    $.post("/WebApi.ashx", { id: tempid, method: 'delimg' });
                                    $("#" + tempid).remove();
                                }
                                function checknull() {
                                    var imgid = "";
                                    var title = $("#title").val();
                                    var context = $("#context").val();
                                    var contact = $("#contact").val();
                                    $("#piclist li").each(function (a, b) {
                                        if(imgid=="")
                                        imgid += $(b).attr("id");
                                    });
                                    $("#imgs").val(imgid);
                                    if (title != "" && context != "" && context != "") {
                                        window.document.form1.submit();
                                        document.getElementById("submittingb").style.display = '';
                                        document.getElementById("submitb").style.display = 'none';
                                        return true;
                                    }
                                    else {
                                        alert("数据不完整！");
                                        return false;
                                    }
                                }
                                function changtop(_this)
                                {

                                }
</script>
<div class="commonbox">
	<h3><%=act %></h3>
	<div class="p10" style=" display:block;  margin-bottom :10px;  ">
		<form name="form1" id="infoform" enctype="multipart/form-data" method="post" action="Addinfo.aspx"  >
			<table cellspacing="0" cellpadding="0" width="100%" class="maintable">
				<tbody>			
				<tr>
					<th>标题：</th>
					<td>
						<div class="td03">
							<input type="text" name="title" id="title" value="<%=info.title %>" style="margin: 0px; width: 30rem;">
							<span class="gray01"></span>
						</div>	
					</td>
				</tr>
				<tr>
					<th>内容：</th>
					<td>
						<div class="td03"><textarea name="context" rows="5" style="margin: 0px; width: 30rem;"><%=info.context %></textarea> </div>						

					</td>
				</tr>				
				<tr>
					<th>联系：</th>
					<td>
						<div class="td02"><input name="contact" type="text" id="contact" style="margin: 0px; width: 30rem;" value="<%=info.contact %>"></div>
					</td>
                    <%if (ismanager)
                        { %>
				</tr>
                    <tr>
					<th>图例：</th>
					<td>
						<div class="uploadbox">	
						<ul id="piclist" class="clearfix" >	<%=Imgli %></ul>
						</div>                     
                        	<div  style=" height:40px; clear:both">
                                 <div id="upimgfile" style="height:20px;">选择图片</div>
                                <input type="hidden" value="0" id="imgcount" />
                       </div>


					</td>
				</tr>
                <%} %>
				<tr>
					<th>日期：</th>
					<td>
							<input name="cdate" type="text" id="cdate" style="margin: 0px; width: 30rem;" value="<%=info.cdate %>" readonly>
					</td>
				</tr>

                    <%if (ismanager)
                        { %>
				<tr>
					<th>类型</th>
					<td>
							<select name="type" id="type" onchange="changtop(this)">
							<option value="0">图片展示</option>
							<option value="1" selected>信息</option>
							<option value="2">信息致顶</option>
						</select>
					</td>
				</tr>
				<tr id="topdays">
					<th>致顶天数</th>
					<td>
							<input name="topday" type="text" id="topday" style="margin: 0px; width: 30rem;" value="<%=info.cdate %>" size="3" >
					</td>
				</tr>
                     <%} %>


				<tr>
					<th></th>
					<td>
						<div class="buttons"><input type="button" name="Submit" id="submitb" value="<%=act %>" class="submit" onclick="checknull()"><div class="submit" id="submittingb" style="display:none;padding:3px 10px;background:#ccc;color:#666;width:100px;">正在提交。。。</div>
                            <input type="hidden" name="id" value="<%=info.id %>">
                              <input type="hidden" name="imgs" id="imgs" value="">
						</div>
					</td>
				</tr>
			</tbody></table>			
		</form>
	</div>
</div>
          <script src="static/js/jquery-1.7.1.js"></script>
    <script src="static/webuploader/webuploader.min.js"></script>
    <script src="static/webuploader/getting-started.js"></script>
        				        		
</asp:Content>
