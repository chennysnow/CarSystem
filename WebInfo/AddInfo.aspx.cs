using DataBase;
using Entitys;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class AddInfo : System.Web.UI.Page
    {
        public Info info = null;
        public string act = "编辑信息";
        public string Imgli="";
        public bool ismanager = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            string mname = ConfigurationManager.AppSettings["manager"];
            if (mname == null)
                mname = "";
            var  strs = mname.Split(';').ToList();

            int userid = 0;
            if(Session["userid"]!=null)
                userid = (int)Session["userid"];
            string tempid = Request.QueryString["id"];
            string fid = Request.Form["id"];
            int proid = 0;
            if (!string.IsNullOrEmpty(tempid))
            {
                int.TryParse(tempid, out proid);
            }
            if (Session["ShopNum"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            var usname = Session["ShopNum"] as string;
            if (strs.IndexOf(usname) >= 0)
                ismanager = true;
           
            if (fid == null)
            {
                info = new InfoDb().Getinfo(proid);
                if (info == null)
                {
                    info = new Info();
                    info.username = Session["ShopNum"] as string;
                    info.type = 1;
                    act = "增加信息";
                }
                else
                {
                    var imgid = Regex.Match((info.image==null?"":info.image), "/\\w+/\\w+/\\d+/(?<x>\\d+)", RegexOptions.IgnoreCase).Groups["x"].Value;
                    Imgli = $"<li id='{imgid}'><img name='p_pics' src='{info.image}'><p><a href=\"javascript:delimg('{imgid}')\"> 删除</a></p></li>";
                }
            }
            else
            {
                int.TryParse(fid, out proid);
                if (proid == 0)
                    info = new Info();
                else
                    info = new InfoDb().Getinfo(proid);
                var pic = Request.Form["imgs"];
                if (string.IsNullOrEmpty(pic) == false)
                    info.image = $"/carimg/small/{userid}/{pic}.jpg";
                var tmp = Request.Form["type"] as string;
                int val;
                int.TryParse(tmp, out  val);
                info.type = val;
                tmp = Request.Form["topday"] as string;
                int.TryParse(tmp, out  val);
                info.topday = val;
                info.topdate = DateTime.Now.AddDays(val);
                tmp = Request.Form["title"] as string;
                info.title = string.IsNullOrEmpty(tmp) ? "" : tmp;
                tmp = Request.Form["context"] as string;
                info.context = string.IsNullOrEmpty(tmp) ? "" : tmp;
                tmp = Request.Form["contact"] as string;
                info.contact = string.IsNullOrEmpty(tmp) ? "" : tmp;
                info.username = Session["ShopNum"] as string;
                info.id = proid;
                new InfoDb().Addinfo(info);
            }

        }
    }
}