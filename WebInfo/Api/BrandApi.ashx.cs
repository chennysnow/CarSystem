using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using DataBase;
using Entitys;
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

            public string LogoImg { get; set; }
        }

        public void ProcessRequest(HttpContext context)
        {

            string origin = context.Request.Headers["Origin"];
            context.Response.AppendHeader("Access-Control-Allow-Origin", string.IsNullOrEmpty(origin) ? "*" : origin);
            string requestHeaders = context.Request.Headers["Access-Control-Request-Headers"];
            context.Response.AppendHeader("Access-Control-Allow-Headers", string.IsNullOrEmpty(requestHeaders) ? "*" : requestHeaders);
            context.Response.AppendHeader("Access-Control-Allow-Methods", "POST");
            context.Response.ContentType = "text/Json";
            context.Response.HeaderEncoding = Encoding.UTF8;
            StringBuilder logParams = new StringBuilder();

            foreach (var item in context.Request.Params.AllKeys)
            {
                logParams.AppendFormat("{0}:{1},", item, context.Request[item]);
            }
            int pid = 0;
            if (context.Request.Params["pid"] != null)
            {
                int.TryParse(context.Request.Params["pid"], out pid);
            }
            int total = 0;
            var list = new BandInfoDb().GetAllBrandBuyParentId(pid.ToString());
            if (list != null)
                total = list.Count;
            ApiLogInfo log = new ApiLogInfo
            {
                LogType = "BrandApi",
                UserAgent = context.Request.UserAgent,
                Referer = context.Request.UrlReferrer == null ? "" : context.Request.UrlReferrer.ToString(),
                UserIp = getip(),
                Remark = "param:" + logParams + " result count" + total

            };
            new ApiLogInfoDb().AddApiLogo(log);
            if (total == 0)
            {
                context.Response.Write("{ret:0, data:[],msg: 'empty'}");
                return;
            }

            var blist = list.OrderBy(c => c.FirstChart).Select(bandInfo => new Tempbrand {FirstChart = bandInfo.FirstChart, BrandName = bandInfo.BrandName, BrandNum = bandInfo.BrandNum, LogoImg = bandInfo.LogoImg}).ToList();
           
            string result = JsonConvert.SerializeObject(blist);

            var tempitem = "{ret:1, data:"+ result + ",msg: 'sucessed'}";
            context.Response.Write(tempitem);
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