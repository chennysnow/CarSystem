using DataBase;
using Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebInfo
{
    /// <summary>
    /// InfoApi 的摘要说明
    /// </summary>
    public class InfoApi : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int id = 0;
            Info info;
            var ids = context.Request["id"];
            var tel = context.Request["tel"];
            var lxr = context.Request["lxr"];
            int.TryParse(ids, out id);
            string txt = "no";
            if (id > 0 && !string.IsNullOrEmpty(tel) && !string.IsNullOrEmpty(lxr))
            {
                var c= new CarDetialInfoDb().GetCarinfo(id);
                info = new Info();
                info.title = lxr+"预约看车";
                info.context = $"{c.ProTitle},联系人：{lxr}，电话:{tel}";
                info.contact = lxr;
                info.contact = tel;
                info.type = 5;
                info.username = c.SellerNumber;
                txt = "ok";
                new InfoDb().Addinfo(info);
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write(txt);
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