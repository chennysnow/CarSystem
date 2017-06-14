using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["userid"] = null;
            Session["ShopNum"] = null;
            if (Request["url"] != null)
            {
                Response.Redirect(Request["url"]);
            }
            else
            {
                Response.Redirect("Search.aspx");

            }
        }
    }
}