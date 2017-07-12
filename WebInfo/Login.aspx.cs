using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    
    public partial class Login : System.Web.UI.Page
    {
        public string msg = "";
        public string backurl = "";
        [WebMethod(EnableSession = true)]
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.Form["username"];
            string pwd = Request.Form["password"];

            Session["userid"] = null;
            Session["ShopNum"] = null;

            if (Request.QueryString["url"] != null)
            {
                backurl=Request.QueryString["url"];
            
            }


            if (string.IsNullOrEmpty(username) && string.IsNullOrEmpty(username))
                return;

            int number;
            if (!int.TryParse(username, out number))
            {
                msg = "您输入的编号有误";
                return;
            }

            var shopitem = new ShopInfoDb().Login(username, pwd);
            if (shopitem == null)
            {
                msg = "用户名或密码错误";
                return;
            }
            if (shopitem.start == 0)
            {
                msg = "帐号待审核请联系客服";
                return;
            }

            Session["userid"] = shopitem.Id;
            Session["ShopNum"] = shopitem.ShopNum;

            if (Request.Form["url"] != null && Request.Form["url"]!="")
            {
               
                Response.Redirect(Request.Form["url"]);
            }
            else
            {
                Response.Redirect("Searchs.aspx");

            }

        }
    }
}