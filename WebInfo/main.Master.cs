using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["userid"] == null&& HttpContext.Current.Request.FilePath!= "/context.aspx")
            {
                string url = HttpContext.Current.Request.Url.PathAndQuery;
                Response.Redirect("Login.aspx?url=" + url);
            }
        }
    }
}