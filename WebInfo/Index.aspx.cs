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
    public partial class Index : System.Web.UI.Page
    {
        public Dictionary<CarTypeInfo, List<CarDetialInfo>> cardic = new Dictionary<CarTypeInfo, List<CarDetialInfo>>();
        public List<CarTypeInfo> carlist = new List<CarTypeInfo>();
        public string sssss = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
            //int  TotalRecord, TotalPage;
            //List<CarDetialInfo> cdlist;
            //   carlist = new CarTypeInfoDb().GetCarinfoList("0");
            //var cdi = new CarDetialInfoDb();
            //foreach (var v in carlist)
            //{
            //   cdlist= cdi.Exec(" where cartype='"+v.CarTypeKey+"'" , 1, 10,"Id", 1, out TotalRecord, out TotalPage).ToList();
            //    if (cdlist.Count > 0)
            //    {
            //        cardic.Add(v, cdlist);
            //    }
            //}
        }
    }
}