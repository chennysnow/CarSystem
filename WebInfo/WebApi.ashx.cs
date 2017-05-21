using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Commons;
using System.IO;
using DataBase;
using System.Text;
using System.Web.SessionState;

namespace WebInfo
{
    /// <summary>
    /// WebApi 的摘要说明
    /// </summary>
    public class WebApi : IHttpHandler, IRequiresSessionState
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
            if (method != "user")
            {
                if (context.Session["userid"] == null)
                {
                    context.Response.Redirect("Login.aspx");
                }
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
            var id = context.Request.Form["id"];
            if (string.IsNullOrEmpty(id))
                return;
            if (context.Session["carimgs"] == null|| context.Session["userid"] == null)
            {
                return;
            }

            if (!context.Session["carimgs"].ToString().Contains(id))
            {
                return;
            }

            var userid = context.Session["userid"].ToString();
            string filepath = context.Server.MapPath("/") + "carimg\\load\\" + userid + "\\" + id + ".jpg";
            string filepath2 = context.Server.MapPath("/") + "carimg\\small\\" + userid + "\\" + id + ".jpg";
            string oldfilepath = context.Server.MapPath("/") + "carimg\\load\\" + id + ".jpg";
            string oldfilepath2 = context.Server.MapPath("/") + "carimg\\small\\" + id + ".jpg";
            if (File.Exists(filepath))
            {
                File.Delete(filepath);
            }
            else if (File.Exists(oldfilepath))
            {
                File.Delete(oldfilepath);
            }
            if (File.Exists(filepath2))
            {
                File.Delete(filepath2);
            }
            else if (File.Exists(oldfilepath2))
            {
                File.Delete(oldfilepath2);
            }
        }

        private void AddImg(HttpContext context)
        {
            var files = context.Request.Files;//这里只能用<input type="file" />才能有效果,因为服务器控件是HttpInputFile类型
            
            if (files.Count == 0|| context.Session["userid"] == null)
                return;

            var userid = context.Session["userid"].ToString();
            string filepath = context.Server.MapPath("/") + "carimg\\load\\"+ userid +"\\";
            string filepath2 = context.Server.MapPath("/") + "carimg\\small\\" + userid + "\\";
            string shuiyinpath= context.Server.MapPath("/") + "static\\img\\" ;

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
            if (sourImg.Width < 400 || sourImg.Height < 400)
            {
                context.Response.Write("{\"Error\":\"图片太小了，最小宽度400px 最小高度 400px\"}");
                sourImg.Dispose();
                if (File.Exists(sourfilepath))
                {
                    File.Delete(sourfilepath);
                }

                return;
            }

            //ImageServer.ImageWaterMarkPic(sourImg, "shuiyin.png", shuiyinpath + "shuiyin.png", 9, 50,3);


            sourImg.Dispose();



            //files[0].SaveAs(Server.MapPath("/") + System.IO.Path.GetFileName(files[0].FileName));
            //msg = " 成功! 文件大小为:" + files[0].ContentLength;
            if (files[0].ContentLength > 1024 * 1024 * 5)
            {
                context.Response.Write("{\"Error\":\"上传文件最大为5m\"}");
                File.Delete(sourfilepath);
                return;
            }

            if (context.Session["carimgs"] == null)
            {
                context.Session["carimgs"] = fileName;
            }
            else
            {
                context.Session["carimgs"] = context.Session["carimgs"] + ";" + fileName;
            }
            var imgserver = new ImageServer();
            imgserver.MakeThumbnail(sourfilepath, filepath2 + fileName, 94, 75, null);

            context.Response.Write("{\"img\":\"/carimg/small/" + userid+"/" + fileName + "\"}");
        }

        private void AddUserImg(HttpContext context)
        {
            HttpFileCollection files = context.Request.Files;
            if (files.Count == 0)
            {
                return;
            }
            string filepath = context.Server.MapPath("/") + "carimg\\user\\";
            string fileName = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            fileName += new Random().Next(99).ToString("00") + ".jpg";

            if (!Directory.Exists(filepath))
            {
                Directory.CreateDirectory(filepath);
            }

            string sourfilepath = filepath + fileName;
            files[0].SaveAs(sourfilepath);
            context.Response.Write("{\"img\":\"/carimg/user/" + fileName + "\"}");
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