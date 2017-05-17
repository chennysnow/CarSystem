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
    public partial class UserUpdataPwd : System.Web.UI.Page
    {
        public ShopInfo shop = null;
        public string ErrorMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = "0";
            if (Session["userid"] != null)
                id = Session["userid"].ToString();
            int idd = 0;
            int.TryParse(id, out idd);
            var sdb = new ShopInfoDb();
            shop = sdb.getShopinfo(idd);
            if (shop == null)
                shop = new ShopInfo();
            if (!Page.IsPostBack)
            {
                string username = "",opwd="",pwd,pwd1;
                if (Request.RequestType.ToUpper() == "POST")
                {
                    opwd = Request["oldpwd"];
                    pwd = Request["pwd"];
                    pwd1 = Request["pwd1"];
                    if (pwd != pwd1)
                    {
                        ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>输入密码错误!</td></tr>"; //"请刷新页面";
                        return;
                    }
                    if (!RegexServer.regIsMatch(pwd, "^[A-Za-z0-9]+${6,10}"))
                    {
                        ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>登录密码必须是6-10位</td></tr>"; //"请刷新页面";
                        return;
                    }
                    if (shop.ShopPwd == opwd)
                    {
                        shop.ShopPwd = pwd;
                        sdb.UpdateData(shop);
                        ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>密码个性成功</td></tr>"; //"请刷新页面";
                    }
                    else
                    {
                        ErrorMsg = "<tr><td width=\'80\' height=\'40\' align=\'right\'></td><td style=\'color:red;\'>请输入登录密码</td></tr>"; //"请刷新页面";
                    }
                }

            }
        }
    }
}