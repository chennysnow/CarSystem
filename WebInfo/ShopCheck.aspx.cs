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
    public partial class ShopCheck : System.Web.UI.Page
    {
        public List<ShopInfo> Shoplist =null;
        public int TotalRecord=0;
        public int TotalPage=0;
        public int Ppage = 0;
        public int Npage = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] == null || Session["userid"].ToString()!= "23")
            {
                string url = HttpContext.Current.Request.Url.PathAndQuery;
                Response.Redirect("Login.aspx?url="+url);
            }

        }
    }
}