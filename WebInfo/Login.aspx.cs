﻿using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    
    public partial class Login : System.Web.UI.Page
    {
        public string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.Form["username"];
            string pwd = Request.Form["password"];
            int number;

            if (!int.TryParse(username, out number))
            {
                msg = "您输入的编号有误";
                return;
            }

            var shopitem = new ShopInfoDb().Login(username, pwd);
            if (shopitem == null)
            {
                msg = "用户名出存在";
                return;
            }

            Session["userid"] = shopitem.Id;

            Response.Redirect("Search.aspx");

        }
    }
}