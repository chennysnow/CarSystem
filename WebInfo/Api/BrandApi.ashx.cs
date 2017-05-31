using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataBase;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace WebInfo.Api
{
    /// <summary>
    /// BrandApi 的摘要说明
    /// </summary>
    public class BrandApi : IHttpHandler
    {
        private class Tempbrand
        {
            public string FirstChart { get; set; }

            public string BrandName { get; set; }

            public string BrandNum { get; set; }
        }

        public void ProcessRequest(HttpContext context)
        {

            string origin = context.Request.Headers["Origin"];
            context.Response.AppendHeader("Access-Control-Allow-Origin", string.IsNullOrEmpty(origin) ? "*" : origin);
            string requestHeaders = context.Request.Headers["Access-Control-Request-Headers"];
            context.Response.AppendHeader("Access-Control-Allow-Headers", string.IsNullOrEmpty(requestHeaders) ? "*" : requestHeaders);
            context.Response.AppendHeader("Access-Control-Allow-Methods", "POST");
            context.Response.ContentType = "text/Json";
            int pid = 0;
            if (context.Request.Params["pid"] != null)
            {
                int.TryParse(context.Request.Params["pid"], out pid);
            }

            var list = new BandInfoDb().GetAllBrandBuyParentId(pid.ToString());

             List< Tempbrand> blist = new List<Tempbrand>();
            foreach (var bandInfo in list)
            {
                var item = new Tempbrand {FirstChart = bandInfo.FirstChart, BrandName = bandInfo.BrandName,BrandNum = bandInfo.BrandNum };
                blist.Add(item);
            }

            string result = JsonConvert.SerializeObject(blist);
            context.Response.Write(result);
            //context.Response.Write("Hello World");
        }

        public string getip()
        {
            string ip;
            if (HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null) //获取用户内部ip
            {
                ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] ??
                     HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            else
            {
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]; //发出请求的远程主机的IP地址
            }
            return ip;

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