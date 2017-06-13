using DataBase;
using Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class UserCarList : System.Web.UI.Page
    {
        public string pagenum = "";
        public string keyword = "";
        public static List<CarTypeInfo> catTypeList;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
         
        

            if(Request.QueryString["del"]!=null)
            {
                int proid;
                string delid = Request.QueryString["del"];
                if (int.TryParse(delid, out proid))
                {

                    if (Session["ShopNum"] != null)
                    {
                        string shopnum = Session["ShopNum"].ToString();
                        new InfoDb().Delinfo(shopnum, proid);
                        Response.Redirect("UserinfoList.aspx");
                    }

                }
                return;

            }
            DataBing();

            //

        }


        private void DataBing()
        {
            int currentPage = 0;
            string key = "";
            if (Request.QueryString["pageid"] != null)
            {
                int.TryParse(Request.QueryString["pageid"].ToString(), out currentPage);
            }
            string query = "";
            if (Request.QueryString["key"] != null)
            {
                key = HttpUtility.HtmlDecode(Request.QueryString["key"]);
                keyword = key;
                query = "&key=" + HttpUtility.UrlEncode(key);
            }

            string cartype = "";

            if (Request.QueryString["cartype"] != null)
            {
                cartype = Request.QueryString["cartype"];
                query = "&cartype=" + cartype;
            }

            if (currentPage <= 0)
                currentPage = 1;


            int totalCount = 0, totalpage;
            string shopid = Session["userid"].ToString();

            var shopinfo = new ShopInfoDb().getShopinfo(int.Parse(shopid));
           // IEnumerable<CarDetialInfo> querys = new CarDetialInfoDb().GetCarLIst(shopinfo.ShopNum);
            string where = " 1=1 and";
            if (!string.IsNullOrEmpty(key))
            {
                where = $" ProTitle like '%{key}%' and";
            }
            if (!string.IsNullOrEmpty(cartype))
            {
                where=$"CarType = '{cartype}' and";

            }
            var list =new CarDetialInfoDb().Exec($"where {where} SellerNumber='{shopinfo.ShopNum}'",currentPage,10,"id",1,out totalCount,out totalpage);//   t(shopinfo.ShopNum);

            
            int pagesize = 10;
            int index = (currentPage - 1) * pagesize;
            list = list.Skip(index).Take(pagesize).ToList();
            string url = "UserCarList.aspx";
            if (catTypeList == null)
            {
                catTypeList = new CarTypeInfoDb().GetAllCarType();
            }

          //  int totalpage = totalCount / pagesize;
            //if (totalCount % pagesize > 0)
            //    totalpage = totalpage + 1;
            string syyurl = url;
            string xyyurl = url;
            string wyurl= url + "?pageid=" + ((currentPage + 1) > totalpage ? totalpage:(currentPage + 1)) + query;
            if (currentPage>1)
            {
                syyurl = url + "?pageid=" + ((currentPage - 1)<1?1:(currentPage - 1))+ query;
                if (currentPage < totalpage)
                {
                    xyyurl = url + "?pageid=" + totalpage+ query;
                }
            }
            else
            {
                if (currentPage < totalpage)
                {
                    xyyurl = url + "?pageid=" + totalpage + query;
                }
            }

            pagenum = string.Format("共{0}条&nbsp;&nbsp;{1}/{5}页&nbsp;&nbsp;<a href=\"UserCarList.aspx?/" + url + "\">首页</a>&nbsp;&nbsp;<a href='{2}'>上一页</a>&nbsp;&nbsp;<a href='{3}'>下一页</a>&nbsp;&nbsp;<a href='{4}'>尾页</a>&nbsp;&nbsp; ", totalCount, currentPage,syyurl, xyyurl, wyurl, totalpage);

            repCarlist.DataSource = list;
            repCarlist.DataBind();
        }


        public string GetCatType(object key)
        {
            var item = catTypeList.FirstOrDefault(c => c.CarTypeKey == key.ToString());

            return item.DisplayName;
        }

    }
}