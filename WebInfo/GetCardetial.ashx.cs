using DataBase;
using Entitys;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace WebInfo
{
    /// <summary>
    /// GetCardetial 的摘要说明
    /// </summary>
    public class GetCardetial : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int TotalRecord; int TotalPage;
            JObject o;
            var ls = GetDbData(context.Request, out  TotalRecord,out TotalPage);
            var carlist = new CarTypeInfoDb().GetCarinfoList("0");
            StringBuilder sb = new StringBuilder();
            JArray ar = new JArray();
            foreach (var v in ls) {
                o = new JObject();
                var car = carlist.FirstOrDefault(x => x.CarTypeKey == v.CarType);
                o["ProTitle"] = v.ProTitle;//data.act.ToString();
                o["SellerName"] = v.SellerName;//data.act.ToString();
                o["Id"] = v.Id;
                o["Carname"] = car==null?"":car.DisplayName;
                o["ShangPaiTime"] = v.ShangPaiTime;
                o["CarColor"] = v.CarColor;
                o["baojia"] = v.baojia;
                o["BianShuQi"] = v.BianShuQi;
                o["CreateTime"] = v.CreateTime.ToShortDateString();
                o["ProNum"] = v.ProNum;
                o["SellerNumber"] = v.SellerNumber;
                var str = v.Images.Split(';');
                o["pic1"] = str.Length>0?str[0]:"";
                o["pic2"] = str.Length >1 ? str[1] : "";
                o["pic3"] = str.Length > 2 ? str[2] : "";
                o["r"] = TotalRecord.ToString();
                o["p"] = TotalPage.ToString();
                ar.Add(o);
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write(ar.ToString());
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        private List<CarDetialInfo> GetDbData(HttpRequest Request, out int TotalRecord,out int TotalPage)
        {           
            List<CarDetialInfo> ls = new List<CarDetialInfo>();
            StringBuilder sb = new StringBuilder();
            var str = Request["ac"];
            if (!string.IsNullOrEmpty(str))
            {

            }
            str = Request["mod"];
            if (!string.IsNullOrEmpty(str))
            {

            }
            str = Request["carsort"];
            if (!string.IsNullOrEmpty(str) && str != "0")
            {
                sb.Append(" CarType='" + str + "' and");
            }
            str = Request["p_no"];
            if (!string.IsNullOrEmpty(str))
            {
                // SellerName
                sb.Append(" SellerNumber='" + str + "' and");

            }
            str = Request["p_brand"];
            if (!string.IsNullOrEmpty(str))
            {
                sb.Append(" BrandInfo='" + str + "' and");
            }
            str = Request["p_subbrand"];
            if (!string.IsNullOrEmpty(str))
            {
                sb.Append(" BrandType='" + str + "' and");
            }
            str = Request["startprice"];
            if (!string.IsNullOrEmpty(str))
            {
                sb.Append(" baojia>=" + str + " and");
            }
            str = Request["endprice"];
            if (!string.IsNullOrEmpty(str))
            {
                sb.Append(" baojia<=" + str + " and");
            }
            str = Request["startage"];
            if (!string.IsNullOrEmpty(str))
            {
                sb.Append(" ShangPaiYear>=" + str + " and");
            }
            str = Request["endage"];
            if (!string.IsNullOrEmpty(str))
            {
                sb.Append(" ShangPaiYear<=" + str + " and");
            }


            str = Request["p_transmission"];
            if (!string.IsNullOrEmpty(str) && str != "0")
            {
                sb.Append(" BianShuQi ='" + str + "' and");
            }
            str = Request["keywords"];
            if (!string.IsNullOrEmpty(str))
            {
                sb.Append(" BrandType ='" + str + "' or   Brandinfo = '"+ str +"'  and");
            }
            str = Request["s_type"];

            if (!string.IsNullOrEmpty(str) && str != "1")
            {

            }
            var page = Request["page"];
            if (string.IsNullOrEmpty(page))
                page = "1";
            str = Request["order"];
            var order = "";
            var orderby = 0;
            switch (str)
            {
                case "1":
                    order = "CreateTime";
                    orderby = 1;
                    break;
                case "2":
                    order = "CreateTime";
                    orderby = 0;
                    break;

                case "3":
                    order = "baojia";
                    orderby = 1;
                    break;
                case "4":
                    order = "baojia";
                    orderby = 0;
                    break;

                case "5":
                    order = "ShangPaiTime";
                    orderby = 1;
                    break;
                case "6":
                    order = "ShangPaiTime";
                    orderby = 0;
                    break;
                case "7":
                    order = "BrandInfo";
                    orderby = 1;
                    break;
                case "8":
                    order = "BrandInfo";
                    orderby = 0;
                    break;

                default:
                    order = "id";
                    orderby = 1;
                    break;
            }
            str = Request["show"];
            if (!string.IsNullOrEmpty(str))
            {

            }
            if (sb.Length > 3)
                sb.Remove(sb.Length - 3, 3);
            if (sb.Length == 0)
                sb.Append("1=1");
            int pg;
            int.TryParse(page, out pg);
            var ls1= new CarDetialInfoDb().Exec(" where "+ sb.ToString(),pg,25,order, orderby ,out TotalRecord, out TotalPage);
            if(ls1!=null)
                foreach (var l in ls1)
                    ls.Add(l);
            else
            {

            }
            return ls;
        }
    }
}