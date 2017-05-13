using Commons;
using Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase;
namespace WebInfo
{
    public partial class Default : System.Web.UI.Page
    {
        public string ErrorMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Form["companyName"] == null)
                return;

            string validCode = Request.Form["code"];
            if (Session["validCode"] == null)
            {
                ErrorMsg = string.Format("<tr><td width='80' height='40' align='right'></td><td style='color:red;'>验证码已过期,请刷新页面重试</td></tr>"); //"请刷新页面";
                return;
            }
            if (Session["validCode"].ToString() != validCode)
            {
                ErrorMsg = string.Format("<tr><td width='80' height='40' align='right'></td><td style='color:red;'>您输入的验证码有误，请重试</td></tr>"); //"请刷新页面";
                return;
            }

            ShopInfo shop = new ShopInfo();
            shop.IdCart = Request.Form["userCompany"];
            if (string.IsNullOrEmpty(shop.IdCart))
            {
                ErrorMsg = string.Format("<tr><td width='80' height='40' align='right'></td><td style='color:red;'>请上传身份证</td></tr>"); //"请刷新页面";
                return;
            }
            shop.PhoneNumber = Request.Form["phoneNum"];
            if (string.IsNullOrEmpty(shop.PhoneNumber))
            {
                ErrorMsg = string.Format("<tr><td width='80' height='40' align='right'></td><td style='color:red;'>请输入手机号码</td></tr>"); //"请刷新页面";
                return;
            }
            float phonenum = 0;
            if (shop.PhoneNumber.Length!=11||!float.TryParse(shop.PhoneNumber,out phonenum))
            {
                ErrorMsg = string.Format("<tr><td width='80' height='40' align='right'></td><td style='color:red;'>您输入的手机号码有误</td></tr>"); //"请刷新页面";
                return;
            }

            shop.BusinessLicense = Request.Form["CompanyLisent"];
            if (string.IsNullOrEmpty(shop.BusinessLicense))
            {
                ErrorMsg = string.Format("<tr><td width='80' height='40' align='right'></td><td style='color:red;'>请上传营业执照</td></tr>"); //"请刷新页面";
                return;
            }

            shop.CompanyName = Request.Form["companyName"];
            if (string.IsNullOrEmpty(shop.CompanyName))
            {
                ErrorMsg = string.Format("<tr><td width='80' height='40' align='right'></td><td style='color:red;'>请输入公司名称</td></tr>"); //"请刷新页面";
                return;
            }

            new ShopInfoDb().AddShopInfo(shop);

            ErrorMsg = string.Format("<tr><td width='80' height='40' align='right'></td><td style='color:red;'>您的数据已提交成功</td></tr>"); //"请刷新页面";
            return;

        }



    }
}