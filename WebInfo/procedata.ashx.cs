using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebInfo
{
    /// <summary>
    /// procedata 的摘要说明
    /// </summary>
    public class procedata : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var type = context.Request["type"];
            var dbid = context.Request["id"];
            var retstr = "";
            int id,ii;
            int.TryParse(dbid, out id);
            context.Response.ContentType = "text/plain";
            switch (type)
            {
                case "chkuser":
                    if (id <= 0) break;
                    var sdb = new ShopInfoDb().getShopinfo(id);
                    ii = new ShopInfoDb().ExecSql("update ShopInfo set start=1");
                    retstr = ii>0 ? "{\"ret\":\"OK\" }" : "{\"ret\":\"NO\" }";
                    break;
                case "deluser":
                    var op = new ShopInfoDb().DeleteData(id);
                    retstr = op == true ? "{\"ret\":\"OK\" }": "{\"ret\":\"NO\" }";
                    break;
            }
            context.Response.Write(retstr);
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