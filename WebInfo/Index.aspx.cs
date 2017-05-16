using Entitys;
using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase;

namespace WebInfo
{
    public partial class Index : System.Web.UI.Page
    {
        public string winfo = "";
        public string rd = "";
        public string pg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            var str = Request["ac"];
            sb.Append("ac=");
            if (!string.IsNullOrEmpty(str))
                sb.Append(str);

            str = Request["keywords"];

            //str= HttpUtility.UrlDecode(str,Encoding.Default);
            string tmp1 = System.Web.HttpUtility.UrlDecode(str, Encoding.GetEncoding("gb2312"));
            sb.Append("&keywords=");
            if (!string.IsNullOrEmpty(str))
                sb.Append(str);
            winfo = sb.ToString();
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");
        }
        private List<CarDetialInfo> GetDbData(out int TotalRecord, out int TotalPage)
        {
            List<CarDetialInfo> ls = null;
            StringBuilder sb = new StringBuilder();
            var str = Request["ac"];
            if (!string.IsNullOrEmpty(str))
            {

            }
            str = Request["keywords"];
            if (!string.IsNullOrEmpty(str))
            {

            }
            str = Request["carsort"];
            if (!string.IsNullOrEmpty(str) && str != "0")
            {
                sb.Append(" randInfoKey='" + str + "' and");
            }
            str = Request["p_no"];
            if (!string.IsNullOrEmpty(str))
            {
                // SellerName
                sb.Append(" SellerName='" + str + "' and");

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
                sb.Append(" BianShuQi ='" + str + "' and");
            }
            str = Request["s_type"];
            if (!string.IsNullOrEmpty(str) && str != "1")
            {

            }
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
            }
            str = Request["show"];
            if (!string.IsNullOrEmpty(str))
            {

            }
            if (sb.Length > 3)
                sb.Remove(sb.Length - 3, 3);
            var ls1 = new CarDetialInfoDb().Exec(sb.ToString(), 1, 25, order, orderby, out TotalRecord, out TotalPage);
            foreach (var l in ls1)
                ls.Add(l);
            return ls;

        }
    }
}