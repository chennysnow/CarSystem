<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AddCar.aspx.cs" Inherits="WebInfo.AddCar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/static/css/dealer_user.css" rel="stylesheet" />
    <script src="static/js/common.js"></script>
    <script src="static/js/ajax.js"></script>
    <script src="static/js/ajaxfileupload.js"></script>
<style type="text/css" media="screen">#file_uploadUploader {visibility:hidden}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main clearfix" style="padding-top:10px ;padding-bottom:10px ">
    <div class="userleft">
		        <div class="usermenu">
            <h3>我的车源管理 &gt;</h3>
                   
            <ul class="clearfix">
                <li><a href="/AddCar.aspx?carid=addcar" class="orange01 f14">添加车源</a></li>
                <li><a href="UserCarList.aspx" class="orange01">管理车源</a></li>
            </ul>
        </div>
		        <div style="display:none" class="usermenu">
            <h3>车商资料查询 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=dealerlist" class="orange01 f12">车商列表</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=about&amp;id=36" target="_blank" class="blue f12">联系卡下载</a></li>
               
            </ul>
        </div>

		<div class="leftsearch" style="display:none">
			<form method="get" action="http://www.nb77.cn/dealer/index.php">
			<input type="hidden" name="mod" value="user">
			<input type="hidden" name="ac" value="dealerlist">	<select name="searchsort">
				<option value="">请选择</option><option value="1">车商</option><option value="2">编号</option><option value="3">虚拟号</option>
				</select>
			<input type="text" name="keywords" class="input01"> <input type="image" src="static/img/search05.gif">
			</form>
		</div>
        
        <div style="display:none" class="usermenu">
            <h3>帐号管理 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=upinfo">修改资料</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=uppwd">修改密码</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcertimg" class="red">认证资料上传</a></li>
            </ul>
        </div>
		
    </div>
    <div class="userright">
	


		        			<script type="text/javascript">

		        			    $(function () {
		        			        $("#upimgfile").click(function () {
		        			            var imgcount = parseInt($("#imgcount").val());
		        			            if (imgcount >7)
		        			            {
		        			                alert("最多只能上传8张图片");
		        			                return;
		        			            }
		        			            $("#imgcount").val(imgcount + 1);
		        			            ajaxFileUpload();
		        			            $("#piclist").show();
		        			        })
		        			    });
		        			    function ajaxFileUpload() {
		        			        $.ajaxFileUpload
                                    (
                                        {
                                            url: '/WebApi.ashx', //用于文件上传的服务器端请求地址
                                            secureuri: false, //一般设置为false
                                            fileElementId: 'file1', //文件上传空间的id属性  <input type="file" id="file" name="file" />
                                            dataType: 'json', //返回值类型 一般设置为json
                                            success: function (data, status)  //服务器成功响应处理函数
                                            {
                                                if (data["Error"] != null)
                                                {
                                                    alert(data["Error"]);
                                                    return;
                                                }
                                                var tempid = data.img.substring(data.img.lastIndexOf('/')+1, data.img.indexOf('.'));
                                                var li = "<li id='" + tempid + "'><img name='p_pics' src='" + data.img + "' /><p><a href=\"javascript:delimg('" + tempid + "')\" > 删除</a></p></li>";
                                                $("#piclist").append(li);
                                           
                                            },
                                            error: function (data, status, e)//服务器响应失败处理函数
                                            {
                                                alert(e);
                                            }
                                        }
                                    )
		        			        return false;
		        			    }

		        			    function delimg(tempid) {
		        			        $.post("/WebApi.ashx", { id: tempid, method: 'delimg' });
		        			        $("#" + tempid).hide();
		        			    }




function checknull()
{
	if(document.form1.p_sort.value=='0')
		{
		alert("请选择 车型");
		document.form1.p_sort.focus();
		return false;
		}
	else if(document.form1.p_brand.value=='' && document.form1.p_name.value=='')
		{
		alert("请选择或填写 品牌型号");
		document.form1.p_name.focus();
		return false;
		}
	else if(document.form1.p_price.value=='')
		{
		alert("请填写 车主报价");
		document.form1.p_price.focus();
		return false;
		}
	else if(document.form1.p_year.value=='')
		{
		alert("请选择 年份");
		document.form1.p_year.focus();
		return false;
		}
	else if(document.form1.p_month.value=='')
		{
		alert("请选择 月份");
		document.form1.p_month.focus();
		return false;
		}
	else if(document.form1.p_details.value=='')
		{
		alert("请填写 说明");
		document.form1.p_details.focus();
		return false;
		}
	else {
	    var imgid = "";
	    $("#piclist li").each(function (a, b) {

	        imgid += $(b).attr("id")+",";
	    })
	    $("#imgs").val(imgid);
	    $("#ac").val("1");
		window.document.form1.submit();
		document.getElementById("submittingb").style.display = '';
		document.getElementById("submitb").style.display = 'none';
		}

}
function onkeypressed()
{
	if(event.keyCode==13) 
	{
		checknull();
	}
}

function isSubmit()
{
	if(document.getElementById("submittingb").checked==true) //正在提交
	{
		document.getElementById("submitb").style.display = 'block';
		document.getElementById("submitb").type = 'image';
		document.getElementById("unreg").style.display = 'none';
	}else{
		document.getElementById("submitb").style.display = 'none';
		document.getElementById("submitb").type = 'image';
		document.getElementById("unreg").style.display = 'block';
	}
	return true;
}
</script>
<div class="commonbox">
	<h3>编辑车源</h3>
	<div class="p10" style=" display:block;  margin-bottom :10px;  ">
		<form name="form1" id="carform" enctype="multipart/form-data" method="post" action="AddCar.aspx"  >
			<table cellspacing="0" cellpadding="0" width="100%" class="maintable">
				<tbody><tr>
					<th>车型选择：</th>
					<td>
						<select name="p_sort">
							<%=p_sort %>
						</select>
					</td>
				</tr>
				<tr>
					<th>品牌型号：<span class="red">*</span></th>
					<td>
						<p><select name="p_brand" id="brand">
							<%=Brandinfo %>
						</select>
						<select id="subbrand" name="p_subbrand">
							<%=subbrand %>
						</select>
						<!-- <span id="models">
																							</span> -->
						<input type="text" name="p_name" size="25" value="<%=p_name %>"> <span class="gray">其他参数</span></p>
					</td>
				</tr>
				<tr>
					<th>车源图例：</th>
					<td>
						<div class="uploadbox">
				
                            
                           
				
						<ul id="piclist" class="clearfix" >	<%=Imgli %></ul>
                            	
					
                            
						</div>
                     
                        	<div  style=" height:20px; clear:both">
                        
                  <input type="file" id="file1" name="file" />                
    <input type="button" id="upimgfile" value="上传图片" />
                                <input type="hidden" value="0" id="imgcount" />
                       </div>


					</td>
				</tr>
				<tr>
					<th>设置主图：</th>
					<td>
						<div class="td03">第 <input type="text" name="p_mainpic" size="2" value="<%=p_mainpic %>"> 张 <span class="gray01">默认第一张为主图，可换数字选择主图。</span></div>
					</td>
				</tr>
				<tr>
					<th>车体颜色：</th>
					<td>
						<div class="td03">
							<input type="text" name="p_color" value="<%=p_color %>" size="8">
							<span class="gray01">如：黑色、白色、香槟色</span>
						</div>	
					</td>
				</tr>
				<tr>
					<th>车主报价：<span class="red">*</span></th>
					<td>
						<div class="td03"><input type="text" name="p_price" size="5" value="<%=p_price %>">（万元）</div>
						<div class="td01" style="display:none">还价不多：</div><div class="td02" style="display:none"><input type="radio" name="isfixprice" value="1" checked=""> 是 <input type="radio" name="isfixprice" value="0"> 否
						</div>
					</td>
				</tr>
				<tr>
					<th>上牌日期：<span class="red">*</span></th>
					<td>
						<select name="p_year" id="p_year"><%=BuyCarYear %></select>(年) <select name="p_month" id="p_month"><%=BuyCarMonth %></select>(月) 
					</td>
				</tr>
				<tr>
					<th>表显里程：</th>
					<td>
						<div class="td02"><input name="p_kilometre" type="text" id="p_kilometre" size="5" value="<%=p_kilometre %>">&nbsp;(万公里)</div>
					</td>
				</tr>
				<tr>
					<th>排 气 量：</th>
					<td>
						<div class="td02"><input name="p_gas" type="text" id="p_gas" size="5" value="<%=p_gas %>">
						&nbsp;(升)</div>
					</td>
				</tr>
				<tr>
					<th>国产进口：</th>
					<td>
						<input type="radio" name="p_country" value="国产" checked="">国产 <input type="radio" name="p_country" value="进口" >进口
					</td>
				</tr>
				<tr>
					<th>变 速 器：</th>
					<td>
						<%=p_transmission %>
					</td>
				</tr>
				<tr>
					<th>排放标准：</th>
					<td>
						<select name="p_emissionstandards" id="p_emissionstandards"><%=p_emissionstandards %></select>
					</td>
				</tr>
				<tr>
					<th>燃料：</th>
					<td>
						<select name="p_fuel" id="p_fuel"><%=p_fuel %></select>
					</td>
				</tr>
				<tr>
					<th>具体说明：<span class="red">*</span></th>
					<td>
						<textarea name="p_details" rows="3" cols="60" class="textarea01" ><%=p_details %></textarea>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<div class="gray01 lh150"><span class="red fb">注意：</span>发布的车源须做到图片无水印、无车商名，说明中无店铺名、网址、电话。<span style="display:none;"><a href="/dealer/index.php?mod=news&amp;ac=view&amp;id=1" class="orange01 unl" target="_blank">发布规范 &gt;&gt;</a></span></div><div class="ml30 pl10">打<span class="red">*</span>号的为必填。</div>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<div class="buttons"><input type="button" name="Submit" id="submitb" value="编辑车源" class="submit" onclick="checknull()"><div class="submit" id="submittingb" style="display:none;padding:3px 10px;background:#ccc;color:#666;width:100px;">正在提交。。。</div>
							<input type="hidden" name="ac" id="ac" value="0">
						<input type="hidden" name="method" value="<%=method %>">
                            	<input type="hidden" name="id" value="<%=tempproid %>">
                         
							<input type="hidden" name="pstate" value="">
                            <input type="hidden" name="imgs" id="imgs" value="">
							<input type="hidden" name="page" value="1">
						</div>
					</td>
				</tr>
			</tbody></table>
			
		</form>
	</div>
</div>        				        														    </div>
</div>
    </asp:Content>
