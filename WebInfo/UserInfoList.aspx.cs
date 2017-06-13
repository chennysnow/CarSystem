using DataBase;
using Entitys;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class UserInfoList : System.Web.UI.Page
    {
        public string pagenum = "";
        public string keyword = "";
        public List<Info> list = null;
        public int currentPage = 1;
        public bool ismanager = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            string mname = ConfigurationManager.AppSettings["manager"];
            if (mname == null)
                mname = "";
            var strs = mname.Split(';').ToList();
         

            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            string sname = Session["ShopNum"] as string;
            if (strs.IndexOf(sname) >= 0)
                ismanager = true;
            if (Request.QueryString["del"] != null)
            {
                int proid;
                string delid = Request.QueryString["del"];
                if (int.TryParse(delid, out proid))
                {

                    if (Session["ShopNum"] != null)
                    {
                        string shopnum = Session["ShopNum"].ToString();
                        new InfoDb().Delinfo(shopnum, proid);
                        Response.Redirect("UserInfoList.aspx");
                    }

                }
                return;
            }
            if (Request.QueryString["act"]!= null && Request.QueryString["id"] != null && ismanager)
            {
                var id = Request.QueryString["id"];
                var act = Request.QueryString["act"];
                var s = act == "0" ? "1" : "0";
                var r = new InfoDb().ExecSql($"update info set start={s} where id={id}");
            }
            DataBing();
        }

        private void DataBing()
        {
           
            string key = "";
            if (Request.QueryString["pageid"] != null)
            {
                int.TryParse(Request.QueryString["pageid"].ToString(), out currentPage);
            }
            string sname = Session["ShopNum"] as string;
            if (string.IsNullOrEmpty(sname))
                sname = "";
            string url = "UserInfoList.aspx";
            int totalCount = 0, totalpage = 0, pagesize=15;
            var where = ismanager?"": $"where username='{sname}'";
            list = new InfoDb().Exec(where, currentPage, 15, "id", 1, out totalCount, out totalpage).ToList();//   t(shopinfo.ShopNum);

            //foreach (var v in list)
            //{
            //    if (sname == "123456")
            //        v.image = (v.type == 0 ? "信息" : "图片") + $"<a href =\"javascript:void(0);\" onclick='checkinfo(this)'  id=\"i{v.id}\" data-start=\"{v.start}\">{(v.start==0?"审核":"取消")}</a>";
            //    else
            //        v.image = v.type == 0 ? "信息" : "图片";
            //}
            string syyurl = url;
            string xyyurl = url;
            string wyurl = url + "?pageid=" + (currentPage + 1) ;
            if (currentPage > 1)
            {
                syyurl = url + "?pageid=" + (currentPage - 1) ;
                if (currentPage < totalpage)
                {
                    xyyurl = url + "?pageid=" + totalpage ;
                }
            }
            else
            {
                if (currentPage < totalpage)
                {
                    xyyurl = url + "?pageid=" + totalpage ;
                }
            }
            pagenum = string.Format("共{0}条&nbsp;&nbsp;{1}/{5}页&nbsp;&nbsp;<a href=\"UserInfoList.aspx?/" + url + "\">首页</a>&nbsp;&nbsp;<a href='{2}'>上一页</a>&nbsp;&nbsp;<a href='{3}'>下一页</a>&nbsp;&nbsp;<a href='{4}'>尾页</a>&nbsp;&nbsp; ", totalCount, currentPage, syyurl, xyyurl, wyurl, totalpage);

           // repCarlist.DataSource = list;
           // repCarlist.DataBind();
        }

    }
}