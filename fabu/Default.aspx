<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebInfo.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>二手车会员资料提交</title>

    <link href="static/css/default.css" rel="stylesheet" />
     <script src="static/js/jquery-1.7.1.js"></script>
        <script src="static/js/ajaxfileupload.js"></script>
</head>
<script type="text/javascript">
    function check_add() {
      
        if (document.form_add.companyName.value == "") {
            alert("请输入公司名称!");
            document.form_add.companyName.focus();
            return false;
        }

        if (document.form_add.phoneNum.value == "") {
            alert("请输入手机号!");
            document.form_add.phoneNum.focus();
            return false;
        }

        if (document.form_add.code.value == "") {
            alert("请输入验证码!");
            document.form_add.code.focus();
            return false;
        }
   
        return true;


    }
  
 
    $('#pic1').live('change', function () {
     
        ajaxFileUpload("pic1");
    });
    $('#pic2').live('change', function () { ajaxFileUpload("pic2"); });
    //$("#pic2").change(function () {
    //    alert("ddd");
    //    debugger;
    //    ajaxFileUpload("pic1")
    //});

    //$("#pic1").change(function () {
    //    ajaxFileUpload("pic2")
    //});

    function ajaxFileUpload(itemid) {
        $.ajaxFileUpload
        (
            {
                url: '/WebApi.ashx?method=user', //用于文件上传的服务器端请求地址
                secureuri: false, //一般设置为false
                fileElementId: itemid, //文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'json', //返回值类型 一般设置为json
                success: function (data, status)  //服务器成功响应处理函数
                {
                    if (itemid == "pic1")
                    {
                        $("#userCompany").val(data["img"]);
                        $("#pic1").val(data["img"]);
                    }
                    if (itemid == "pic2") {
                        $("#CompanyLisent").val(data["img"]);
                        $("#pic2").val(data["img"]);
                    }

                    //var tempid = data.img.substring(data.img.lastIndexOf('/') + 1, data.img.indexOf('.'));
                    //var li = "<li id='" + tempid + "'><img src='" + data.img + "' /><p><a href=\"javascript:delimg('" + tempid + "')\" > 删除</a></p></li>";
                    //$("#piclist").append(li);

                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    alert(e);
                }
            }
        )
        return false;
    }
</script>
<body>

    <div id="con_r_title">宁波二手车联盟车源寄售平台会员注册审核页面 </div>
    <div style="padding: 0 10px; line-height: 28px;">
        <form action="Default.aspx" method="post" name="form_add" enctype="multipart/form-data" id="form_add" onsubmit="return check_add();">
            <input type="hidden" id="userCompany" name="userCompany" value="" />
            <input type="hidden" id="CompanyLisent" name="CompanyLisent" value="" />
            <table width="715" border="0" align="center" cellpadding="3" cellspacing="0">


                <tr>
                    <td width="160" height="40" align="right">法人身份证上传：</td>
                    <td align="left">
                        <input type="file" class="input" name="pic1" id="pic1" size="30" />
                        *
                                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="80" height="40" align="right">营业执照上传：</td>
                    <td align="left">
                        <input type="file" class="input" name="pic2" id="pic2" size="30" />

                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="80" height="40" align="right">公司名称：</td>
                    <td align="left">
                        <input name="companyName" id="companyName" size="30" />
                        *
                                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="80" height="40" align="right">手机号：</td>
                    <td align="left">
                        <input name="phoneNum" id="phoneNum" size="30" />
                        *
                                        <div></div>
                    </td>
                </tr>


                <tr>
                    <td width="80" height="40" align="right">验证码：</td>
                    <td align="left">
                        <input name="code" type="text" class="main_en" id="code" size="8" style="vertical-align: middle" />
                        <img src="ValidCode.aspx" id="imgcode" style="vertical-align: middle" border="0" /></td>

                </tr>
                <tr>
                    <td width="80" height="40" align="right"></td>
                    <td height="30" align="left">
                        <input type="submit" name="Submit" value="提　交" />
                        <input type="reset" name="Submit2" value="重　置" /></td>
                </tr>
                  <%=ErrorMsg %>
            </table>

          

        </form>

    </div>

</body>
</html>
