﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebInfo.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>二手车会员资料提交</title>

    <link href="static/css/default.css" rel="stylesheet" />
            <link href="static/webuploader/webuploader.css" rel="stylesheet" />
     <script src="static/js/jquery-1.7.1.js"></script>
        <script src="static/js/ajaxfileupload.js"></script>
    <style>
        .webuploader-pick{padding:0 5px;}
    </style>
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
        ajaxFileUpload("pic1");
        ajaxFileUpload("pic2");
        return true;


    }


    $(function () {

        $("#companyName").focus(function () {
 
            if ($("#pic1").val() != '' && $("#userCompany").val() == '') {
                if ($("#userCompany").val()=='')
                ajaxFileUpload("pic1");
            }

        });
        $("#phoneNum").focus(function () {

            if ($("#pic2").val() != '' && $("#CompanyLisent").val() == '') {
                if ($("#CompanyLisent").val() == '')
                ajaxFileUpload("pic2");
            }

        });


        
    });
 
    //$('#pic1').live('change', function () {


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
                    if (itemid == "pic1") {
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
            
                        <div id="pic1" style="height:20px; float:left">选择图片</div> <label style=" padding-left:5px; " id="lblpic1">*</label>
                        
                                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="80" height="40" align="right">营业执照上传：</td>
                    <td align="left">
        
                          <div id="pic2" style="height:20px; float:left">选择图片</div>
                        <div> <label style=" padding-left:5px; " id="lblpic2">*</label></div>
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
            <td width="80" height="40" align="right">编号：</td>
            <td align="left"><input name="netNumber" id="netNumber" size="30"/>
            *  编号将在审核通过后作为内网帐号,限五位数字
            <div></div></td>
            </tr>
                <tr>
                        <td width="80" height="40" align="right">登录密码：</td>
            <td align="left"><input type="password" name="pwd" id="pwd" size="30"/>
            * 英文或数字，长度6-10 位
            <div></div></td>
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
                        <input type="reset" value="重　置" /></td>
                </tr>
                  <%=ErrorMsg %>
            </table>

          

        </form>
     

    </div>
       <script src="static/webuploader/webuploader.min.js"></script>
    <script>
        // 图片上传demo
        jQuery(function () {
            var $ = jQuery,
                //$list = $('#fileList'),
                //// 优化retina, 在retina下这个值是2
                //ratio = window.devicePixelRatio || 1,

                // 缩略图大小
                //thumbnailWidth = 100 * ratio,
                //thumbnailHeight = 100 * ratio,

                // Web Uploader实例


            // 初始化Web Uploader
            uploader = WebUploader.create({

                // 自动上传。
                auto: true,

                // swf文件路径
                swf: 'static/webuploader/Uploader.swf',

                server: 'WebApi.ashx?method=user',

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.

                pick: '#pic1',
                fileNumLimit: 15,

                // 只允许选择文件，可选。
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                }
            });
            uploader1 = WebUploader.create({
                auto: true,

                swf: 'static/webuploader/Uploader.swf',
                server: 'WebApi.ashx?method=user',
                pick: '#pic2',
                fileNumLimit: 15,

                // 只允许选择文件，可选。
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                }
            });
            uploader1.on('uploadSuccess', function (file, data) {
         
              
                if (data.Error != null) {
                    alert(data.Error);
                } else {
         
                    $("#CompanyLisent").val(data.img);
                    $("#lblpic2").text("营业执照上传成功");
                }

                //$( '#'+file.id ).addClass('upload-state-done');
            });

            uploader.on('uploadSuccess', function (file, data) {
  

                if (data.Error != null) {
                    alert(data.Error);
                } else {

                    $("#userCompany").val(data.img);
                    $("#lblpic1").text("身份证上传成功");
                }

                //$( '#'+file.id ).addClass('upload-state-done');
            });
            uploader;
            uploader1;
        });
    </script>
</body>
</html>
