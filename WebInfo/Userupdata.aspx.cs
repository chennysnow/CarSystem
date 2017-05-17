using Commons;
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
    public partial class Userupdata : System.Web.UI.Page
    {
        public ShopInfo shop = null;
        public string ErrorMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = "0";
            if (Session["userid"]!=null)
             id = Session["userid"].ToString();
            int idd = 0;
            int.TryParse(id, out idd);
            var sdb = new ShopInfoDb();
            shop = sdb.getShopinfo(idd);
            if (shop == null)
                shop = new ShopInfo();
            if (!Page.IsPostBack)
            {
                if (idd == 0)
                {
                    ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>没有对应的数据,不能修改</td></tr>"; //"请刷新页面";
                    return;
                }
                if (Request.RequestType.ToUpper() == "POST")
                {
                    //var IdCart = Request.Form["userCompany"];
                    //if (!string.IsNullOrEmpty(IdCart))
                    //{
                    //    shop.IdCart = IdCart;
                    //}
                    shop.PhoneNumber = Request.Form["phoneNum"];
                    if (string.IsNullOrEmpty(shop.PhoneNumber))
                    {
                        ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>请输入手机号码</td></tr>"; //"请刷新页面";
                        return;
                    }
                    float phonenum = 0;
                    if (shop.PhoneNumber.Length != 11 || !float.TryParse(shop.PhoneNumber, out phonenum))
                    {
                        ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>您输入的手机号码有误</td></tr>"; //"请刷新页面";
                        return;
                    }

                    //var BusinessLicense = Request.Form["CompanyLisent"];
                    //if (!string.IsNullOrEmpty(BusinessLicense))
                    //{
                    //    shop.BusinessLicense = BusinessLicense;
                    //}

                    shop.CompanyName = Request.Form["companyName"];
                    if (string.IsNullOrEmpty(shop.CompanyName))
                    {
                        ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>请输入公司名称</td></tr>"; //"请刷新页面";
                        return;
                    }

                    shop.ShopNum = Request.Form["netNumber"];
                    if (string.IsNullOrEmpty(shop.ShopNum))
                    {
                        ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>请输入公司名称短号</td></tr>"; //"请刷新页面";
                        return;
                    }

                    shop.PhoneShopNum = Request.Form["phoneNumber"];

                    if (string.IsNullOrEmpty(shop.PhoneShopNum))
                    {
                        ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>请输入公司名称短码</td></tr>"; //"请刷新页面";
                        return;
                    }
                    //^[A-Za-z0-9]+$
                    new ShopInfoDb().UpdateData(shop);
                    ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>您的数据已提交成功</td></tr>"; //"请刷新页面";
                }
            }
        }
    }
}