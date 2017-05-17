<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Userupdata.aspx.cs" Inherits="WebInfo.Userupdata" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="/static/css/dealer_user.css" rel="stylesheet" />
    <script src="static/js/common.js"></script>
    <script src="static/js/ajax.js"></script>
    <script src="static/js/ajaxfileupload.js"></script>
        <script src="static/js/layer.js"></script>
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
        
        <div  class="usermenu">
            <h3>帐号管理 &gt;</h3>
            <ul class="clearfix">
                 <li><a href="Userupdata.aspx">修改资料</a></li>
               <li><a href="UserUpdataPwd.aspx">修改密码</a></li>
          
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
function disppic(src) {
    layer.open({
        type: 1,
        skin: 'layui-layer-rim', //加上边框
        area: ['800px', '600px'], //宽高
        content: '<img src="' + src + '" border="0" />'
    });
}
</script>
<div class="commonbox">
	<h3>编辑车源</h3>
	<div class="p10" style=" display:block;  margin-bottom :10px;  ">
		<form name="form1" id="carform" enctype="multipart/form-data" method="post" action="userupdata.aspx"  >
            <input type="hidden" id="id" name="id" value="" />
			<table width="715" border="0" align="center" cellpadding="3" cellspacing="0">
                <!--<tr>
                    <td width="160" height="40" align="right">法人身份证：</td>
                    <td align="left">
                        <input type="file" class="input" name="pic1" id="pic1" size="30"  />
                        *<a href="javascript:void(0)" onclick="disppic('<%=shop.BusinessLicense %>')">图片</a>
                                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="80" height="40" align="right">营业执照：</td>
                    <td align="left">
                        <input type="file" class="input" name="pic2" id="pic2" size="30"   /><a href="javascript:void(0)" onclick="disppic('<%=shop.IdCart %>')">图片</a>
                        <div></div>
                    </td>
                </tr>-->
                          <tr>
            <td width="80" height="40" align="right">编号：</td>
            <td align="left"><input name="netNumber" id="netNumber" disabled="true" size="30" value="<%=shop.ShopNum %>" />
              编号作为内网帐号
            <div></div></td>
            </tr>
            <tr>
            <td width="80" height="40" align="right">编码：</td>
            <td align="left"><input name="phoneNumber" id="phoneNumber" size="30" value="<%=shop.PhoneShopNum %>" />
            *  联盟手机短号，可以多个空格分割
            <div></div></td>
            </tr>
                <tr>
                    <td width="80" height="40" align="right">公司名称：</td>
                    <td align="left">
                        <input name="companyName" id="companyName" size="30" value="<%=shop.CompanyName %>" />
                        *
                                        <div></div>
                    </td>
                </tr>
                         <tr>
                    <td width="80" height="40" align="right">公司地址：</td>
                    <td align="left">
                        <input name="CompanyAddress" id="CompanyAddress" size="30" value="<%=shop.CompanyAddress %>" />
                        *
                                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="80" height="40" align="right">手机号：</td>
                    <td align="left">
                        <input name="phoneNum" id="phoneNum" size="30" value="<%=shop.PhoneNumber %>" />
                        *
                                        <div></div>
                    </td>
                </tr>
  
                <tr>
                    <td width="80" height="40" align="right"></td>
                    <td height="30" align="left">
                        <input type="submit" name="Submit" value="提　交" />
                        <input type="reset" value="重　置" /></td>
                </tr>
                   <%=ErrorMsg %>
            </table>

			
		</form>
	</div>
</div>        				        														    </div>
</div>

</asp:Content>
