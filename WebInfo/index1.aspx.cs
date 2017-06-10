using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class index1 : System.Web.UI.Page
    {
        public Vindexdata Model;
        public bool isnlogin = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            var order = "id";
            int TotalRecord;
            int TotalPage;
            int TotalRecord1;
            int TotalPage1;
            var orderby = 1;
            isnlogin = Session["userid"] == null?true:false;
            (this.Master as NewMain).Setmenu(1);
            Vindexdata vdata = new Vindexdata();
            vdata.swhere = new SearchWhere("");
            vdata.bandinfo = new BandInfoDb().GetBandInfoByParentNum("0");
            vdata.cartype = new CarTypeInfoDb().GetCarinfoList("0");
            vdata.Cardetialinfo = new CarDetialInfoDb().Exec("", 1, 24, order, orderby, out TotalRecord1, out TotalPage1).ToList();// mdb.Queryable<CarDetialInfo>().OrderBy(x => x.Id, OrderByType.desc).Take(18).ToList();
            vdata.jiaochelist = new CarDetialInfoDb().Exec(" where CarType = '4'", 1, 8, order, orderby, out TotalRecord, out TotalPage).ToList(); 
            vdata.Suvlist = new CarDetialInfoDb().Exec(" where CarType = '29'", 1, 8, order, orderby, out TotalRecord, out TotalPage).ToList();
            vdata.Paochelist = new CarDetialInfoDb().Exec(" where CarType = '28'", 1, 8, order, orderby, out TotalRecord, out TotalPage).ToList();
            vdata.piclist = new InfoDb().getAllInfo(4, 0);
            vdata.infolist = new InfoDb().getAllInfo(10, 1);
            Model = vdata;
          //  Model.clearlianxi((this.Master as NewMain).isnlogin);
        }
    }
}