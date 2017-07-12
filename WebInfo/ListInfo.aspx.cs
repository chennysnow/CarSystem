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
        public bool islogin = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            var usname = "";
           string where = "";
            (this.Master as NewMain).Setmenu(3);
            int userid = 0;
            if (Session["userid"] != null)
                userid = (int)Session["userid"];
            if (Session["ShopNum"] != null)
            {
                islogin = true;
                where = " where type!=2 and type!=5 and start>0";
                usname = Session["ShopNum"] as string;
            }
            else
                where = " where (type=3 or type=4 ) and start>0";

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
            var infodb = new InfoDb();
            //////post
            if (Request.Form["title"] != null)
            {
                Info info = new Info();
                info.title = Request.Form["title"];
                info.context= Request.Form["context"];
                info.contact = Request.Form["contact"];
                var type= Request.Form["type"];
                int t;
                int.TryParse(type, out t);
                info.type = t;
                info.username= Request.Form["username"];
                info.start = 0;
                if(!(string.IsNullOrEmpty(info.title) && string.IsNullOrEmpty(info.context)))
                {
                    infodb.Addinfo(info);
                }
            }
            
            List<Info> topinfolist = infodb.getAllInfo(10, 2);
            int ii = topinfolist == null ? 0 : topinfolist.Count;
            var ls = infodb.Exec(where, page, 25, "id", 1, out totalrecord, out totalpage);
            listinfo = new List<Info>();
            if(topinfolist!=null)
                listinfo.AddRange(topinfolist);
            if (ls != null)
                listinfo.AddRange(ls);
        }
    }
}