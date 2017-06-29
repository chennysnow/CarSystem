using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using Commons;
using DataBase;
using Entitys;
using Newtonsoft.Json;

namespace WebInfo.Api
{
    /// <summary>
    /// SearchApi 的摘要说明
    /// </summary>
    public class SearchApi : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string origin = context.Request.Headers["Origin"];
            context.Response.AppendHeader("Access-Control-Allow-Origin", string.IsNullOrEmpty(origin) ? "*" : origin);
            string requestHeaders = context.Request.Headers["Access-Control-Request-Headers"];
            context.Response.AppendHeader("Access-Control-Allow-Headers", string.IsNullOrEmpty(requestHeaders) ? "*" : requestHeaders);
            context.Response.AppendHeader("Access-Control-Allow-Methods", "POST");
            context.Response.ContentType = "text/Json";
            context.Response.HeaderEncoding=Encoding.UTF8;
            string CarType = context.Request.Params["CarType"];
            StringBuilder logParams = new StringBuilder();

            foreach (var item in context.Request.Params.AllKeys)
            {
                logParams.AppendFormat("{0}:{1},", item, context.Request[item]);
            }

            if (string.IsNullOrEmpty(CarType))
            {
                CarType = "";
            }
            string brandNum = context.Request.Params["brandNum"];
            int tempid = 0;
            if (string.IsNullOrEmpty(brandNum)||!int.TryParse(brandNum.ToLower().Replace("n",""),out tempid))
            {
                brandNum = "";
            }
            string BrandType = context.Request.Params["BrandType"];
            if (string.IsNullOrEmpty(BrandType) || !int.TryParse(BrandType.ToLower().Replace("n", ""), out tempid))
            {
                BrandType = "";
            }
            string CarColor = context.Request.Params["CarColor"];
            if (string.IsNullOrEmpty(CarColor) )
            {
                CarColor = "";
            }
            string BianShuQi = context.Request.Params["BianShuQi"];
            if (string.IsNullOrEmpty(BianShuQi))
            {
                BianShuQi = "";
            }
            string baojia = context.Request.Params["MinBaojia"];
            decimal minBaojia = 0;
            if (!string.IsNullOrEmpty(baojia))
            {
                decimal.TryParse(baojia, out minBaojia);
                if (minBaojia <= 0)
                    minBaojia = 0;
            }

            baojia = context.Request.Params["MaxBaojia"];
            decimal maxBaojia = 0;
            if (!string.IsNullOrEmpty(baojia))
            {
                decimal.TryParse(baojia, out maxBaojia);
                if (maxBaojia <= minBaojia)
                    maxBaojia = minBaojia;
            }
            int pageid = 1;

            string temppageid = context.Request.Params["pageid"];

            if (!string.IsNullOrEmpty(temppageid))
            {
                int.TryParse(temppageid, out pageid);
                if (pageid <= 1)
                    pageid = 1;
            }

            int pageCount = 20;

             temppageid = context.Request.Params["pageCount"];

            if (!string.IsNullOrEmpty(temppageid))
            {
                int.TryParse(temppageid, out pageCount);
                if (pageCount <= 5)
                    pageCount = 5;
            }

            string sort = context.Request.Params["sort"];
            if (string.IsNullOrEmpty(sort))
            {
                sort = "";
            }
            string sortKey = "";
            switch (sort.ToLower())
            {
                case "time":
                    sortKey = "ShangPaiYear";
                    break;
                case "brand":
                    sortKey = "BrandInfoKey";
                    break;
                case "price":
                    sortKey = "baojia";
                    break;
                default:
                    sortKey = "id";
                    break;

            }
            string sortType = context.Request.Params["sortType"];
            sortType = string.IsNullOrEmpty(sortType) ? "desc" : sortType.Trim().ToLower();
            if (sortType != "desc")
            {
                sortType = "asc";
            }



            var list = new CarDetialInfoDb().GetCarList(CarType, brandNum, BrandType, CarColor, BianShuQi, minBaojia, maxBaojia,
                pageid, pageCount, sortKey, sortType);
            int total = 0;
            if (list != null)
                total = list.Count;
            ApiLogInfo log = new ApiLogInfo
            {
                LogType = "SearchApi",
                UserAgent = context.Request.UserAgent,
                Referer = context.Request.UrlReferrer == null ? "" : context.Request.UrlReferrer.ToString(),
                UserIp = Gsetip(),
                Remark ="param:"+ logParams +" result count" + total

            };
            new ApiLogInfoDb().AddApiLogo(log);
            string filepath = context.Server.MapPath("/");
            //picchange(list, filepath);
            foreach (var car in list)
            {
                string[] pic = car.Images.Split(';');
                foreach (var img in pic)
                {
                    picchange(filepath + img.Replace("/","\\").TrimStart('\\'));
                }
              
            }
            if (list != null && list.Count > 0)
            {
                string result = JsonConvert.SerializeObject(list);

                var tempitem = "{ret:1, data:" + result + ",msg: 'sucessed'}";
                context.Response.Write(tempitem);
            }
            else
            {
                var tempitem = "{ret:0, data[],msg: 'empty'}";
                context.Response.Write(tempitem);
            }


        }

        private void picchange( string file)
        {
           // file = @"D:\github\CarSystem\WebInfo\carImg\small\131\2017052406381964996.jpg";
            if(!file.Contains("small"))
                return;
            file = file.Replace("small", "load");

            if(!File.Exists(file))
                return;

            var fileName = file.Replace("load", "px640");
            var fileName1 = file.Replace("load", "px270");

            var imgserver = new ImageServer();
            if (!File.Exists(fileName))
            {
                imgserver.MakeThumbnail(file, fileName, 640, 640, "W");
            }

            if (!File.Exists(fileName1))
            {
                imgserver.MakeThumbnail(file, fileName1, 270, 200, null);
            }

 


        }

        public string Gsetip()
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