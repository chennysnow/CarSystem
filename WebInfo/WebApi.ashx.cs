using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Commons;
using System.IO;
using DataBase;
using System.Text;

namespace WebInfo
{
    /// <summary>
    /// WebApi 的摘要说明
    /// </summary>
    public class WebApi : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            var method = "";
            if (context.Request.Form["method"] == null)
            {
                if (string.IsNullOrEmpty(method))
                {
                    method = context.Request.QueryString["method"];
                }
            }
            else
            {
                method = context.Request.Form["method"].ToString();
            }



            if (string.IsNullOrEmpty(method))
            {
                try
                {
                    AddImg(context);
                }
                catch (Exception ex)
                {
                    context.Response.Write("{\"Error\":\"图片上传失败 " + ex.Message + "\"}");
                    LogServer.WriteLog(ex);
                }

                return;
            }
            switch (method)
            {
                case "delimg":
                    delImg(context);
                    break;
                case "user":
                    AddUserImg(context);
                    break;
                case "brandType":
                    brandType(context);
                    break;
                default:
                    break;
            }
            return;



        }

        private void brandType(HttpContext context)
        {
            var id = context.Request.QueryString["brandid"].ToString();
            if (string.IsNullOrEmpty(id))
                return;
            var list = new BandInfoDb().GetBandInfoByParentNum(id);
            StringBuilder brands = new StringBuilder();
            brands.Append("<option value=''>请选择型号</option>");
            foreach (var item in list)
            {
                brands.AppendFormat("<option value='{0}'>{1}</option>", item.BrandNum, item.DisplayName);
            }
            context.Response.Write(brands.ToString());

        }

        private void delImg(HttpContext context)
        {


            var id = context.Request.Form["id"].ToString();
            if (string.IsNullOrEmpty(id))
                return;

            string filepath = context.Server.MapPath("/") + "carimg\\load\\" + id + "jpg";
            string filepath2 = context.Server.MapPath("/") + "carimg\\small\\" + id + "jpg";

            if (File.Exists(filepath))
            {
                File.Delete(filepath);
            }
            if (File.Exists(filepath2))
            {
                File.Delete(filepath2);
            }
        }

        private void AddImg(HttpContext context)
        {

            HttpFileCollection files = context.Request.Files;//这里只能用<input type="file" />才能有效果,因为服务器控件是HttpInputFile类型
            string msg = string.Empty;
            string error = string.Empty;

            if (files.Count == 0)
            {
                return;
            }
            string filename = System.IO.Path.GetFileName(files[0].FileName);
            string filepath = context.Server.MapPath("/") + "carimg\\load\\";
            string filepath2 = context.Server.MapPath("/") + "carimg\\small\\";
            string fileName = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            fileName += new Random().Next(99).ToString("00") + ".jpg";

            if (!Directory.Exists(filepath))
            {
                Directory.CreateDirectory(filepath);
            }


            string sourfilepath = filepath + fileName;
            files[0].SaveAs(sourfilepath);


            var sourImg = System.Drawing.Image.FromFile(sourfilepath);

            if (sourImg.Width > 2000 || sourImg.Height > 2000)
            {
                context.Response.Write("{\"Error\":\"图片太大，超过了 2000*2000\"}");
                sourImg.Dispose();
                File.Delete(sourfilepath);
                return;
            }
            if (sourImg.Width < 600 || sourImg.Height < 450)
            {
                context.Response.Write("{\"Error\":\"图片太小了，最小宽度600px 最小高度 450px\"}");

                if (File.Exists(sourfilepath))
                {
                    sourImg.Dispose();
                    File.Delete(sourfilepath);
                }

                return;
            }


            //files[0].SaveAs(Server.MapPath("/") + System.IO.Path.GetFileName(files[0].FileName));
            msg = " 成功! 文件大小为:" + files[0].ContentLength;
            if (files[0].ContentLength > 1024 * 1024 * 5)
            {
                context.Response.Write("{\"Error\":\"上传文件最大为5m\"}");
                File.Delete(sourfilepath);
                return;
            }


            var imgserver = new ImageServer();
            //imgserver.myGetThumbnailImage(sourfilepath, filepath1+ fileName, 700, 700, null);
            imgserver.MakeThumbnail(sourfilepath, filepath2 + fileName, 94, 75, null);

            context.Response.Write("{\"img\":\"/carimg/small/" + fileName + "\"}");
            return;



        }

        private void AddUserImg(HttpContext context)
        {

            HttpFileCollection files = context.Request.Files;
            string msg = string.Empty;
            string error = string.Empty;

            if (files.Count == 0)
            {
                return;
            }
            string filename = System.IO.Path.GetFileName(files[0].FileName);
            string filepath = context.Server.MapPath("/") + "carimg\\user\\";
            string fileName = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            fileName += new Random().Next(99).ToString("00") + ".jpg";

            if (!Directory.Exists(filepath))
            {
                Directory.CreateDirectory(filepath);
            }


            string sourfilepath = filepath + fileName;
            files[0].SaveAs(sourfilepath);
       
            //var sourImg = System.Drawing.Image.FromFile(sourfilepath);

            //if (sourImg.Width > 2000 || sourImg.Height > 2000)
            //{
            //    context.Response.Write("{\"Error\":\"图片太大，超过了 2000*2000\"}");
            //    File.Delete(sourfilepath);
            //    return;
            //}

            context.Response.Write("{\"img\":\"/carimg/user/" + fileName + "\"}");
            return;



        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}