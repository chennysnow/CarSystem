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
    public partial class ListInfo : System.Web.UI.Page
    {
        public List<Info> listinfo = new List<Info>();
        public int totalrecord = 0;
        public int  totalpage=1;
        public int page = 1;
        public string dispid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.Master as NewMain).Setmenu(4);
            int userid = 0;
            if (Session["userid"] != null)
                userid = (int)Session["userid"];
            string tempid = Request.QueryString["page"];
            dispid = Request.QueryString["id"];
            if (dispid == null)
                dispid = "";
            if (!string.IsNullOrEmpty(tempid))
            {
                int.TryParse(tempid, out page);
                if (page == 0)
                    page = 1;
            }
            if (Session["ShopNum"] == null)
            {
                Response.Redirect("Login.aspx?url=listinfo.aspx");
            }
            var usname = Session["ShopNum"] as string;
           
            var infodb = new InfoDb();
            List<Info> topinfolist = infodb.getAllInfo(10, 2);
            int ii = topinfolist == null ? 0 : topinfolist.Count;
            var ls = infodb.Exec(" where type!=2 and start>0", page, 25, "id", 1, out totalrecord, out totalpage);
            listinfo = new List<Info>();
            if(topinfolist!=null)
                listinfo.AddRange(topinfolist);
            if (ls != null)
                listinfo.AddRange(ls);
        }
    }
}