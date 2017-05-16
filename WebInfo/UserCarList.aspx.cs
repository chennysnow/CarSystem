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
        public static List<CarTypeInfo> catTypeList;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            string shopid = Session["userid"].ToString();

            var shopinfo = new ShopInfoDb().getShopinfo(int.Parse(shopid));
            if (shopinfo.ShopNum == "123456")
            {
                shopinfo.ShopNum = "90002";
            }
            //
            var list = new CarDetialInfoDb().GetCarLIst(shopinfo.ShopNum);
            if (catTypeList == null)
            {
                catTypeList = new CarTypeInfoDb().GetAllCarType();
            }
     
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