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
        public string indexcss = "am-active";
        public string searchcss = "";
        public string usercss = "";
        public bool isnlogin = false;
        public string username = "";
        public string path = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
                isnlogin = true;
            else
                username= Session["ShopNum"] as string;
            path = Request.Url.AbsolutePath;
        }
        public void Setmenu(int i)
        {
            switch (i)
            {
                case 2:
                    indexcss = "";
                    searchcss = "am-active";
                    usercss = "";
                    break;
                case 3:
                    indexcss = "";
                    searchcss = "";
                    usercss = "am-active";
                    break;
                case 4:
                    indexcss = "";
                    searchcss = "";
                    usercss = "";
                    break;
                default:
                    indexcss = "am-active";
                    searchcss = "";
                    usercss = "";
                    break;
            }
        }
    }
}