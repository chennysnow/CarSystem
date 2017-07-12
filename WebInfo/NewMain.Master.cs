using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class NewMain : System.Web.UI.MasterPage
    {       
        public bool isnlogin = false;
        public string username = "";
        public string path = "";
        public string[] css = new string[4];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
                isnlogin = true;
            else
                username= Session["ShopNum"] as string;
            path = Request.Url.AbsolutePath;
        }
        public void Setmenu(int ii)
        {
            for (var i = 0; i < css.Length; i++)
                css[i] = "";

            if (ii >= 0 && ii < css.Length)
                css[ii] = "am-active";            
        }
    }
}