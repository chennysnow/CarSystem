using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class Searchs : System.Web.UI.Page
    {
        public Vindexdata Model=null;
        public int TotalRecord=1;
        public int TotalPage=1;
        public int page=1;
        public string orderfd ="1";
        public int[] disp = new int[4];
        public bool isnlogin = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.Master as NewMain).Setmenu(2);
            isnlogin = Session["userid"] == null ? true : false;
            var id = Request["s"];
            var mpage = Request["p"];
            orderfd = Request["d"];
            if (string.IsNullOrEmpty(orderfd))
                orderfd = "1";
            int.TryParse(mpage, out page);
            if (page == 0)
                page = 1;
            int.TryParse(orderfd, out int dd);
            dd = dd % 2;
            if (string.IsNullOrEmpty(id))
                id = "";
            Vindexdata vdata = new Vindexdata();
            vdata.bandinfo = new BandInfoDb().GetBandInfoByParentNum("0");
            vdata.swhere = new SearchWhere(id);
            var ss = vdata.swhere.Getwhere();
            if (string.IsNullOrWhiteSpace(ss) == false)
                ss = " where " + ss;
            var order= setlist(orderfd);
            vdata.Cardetialinfo = new CarDetialInfoDb().Exec(ss, page, 24, order, dd, out TotalRecord, out TotalPage).ToList();
            vdata.TotalPage = TotalPage;
            vdata.TotalRecord = TotalRecord;
            
            Model = vdata;
           

        }
        private string setlist(string d)
        {
            string ss = "id";
            switch (d)
            {//100 活动,十 0无,1up,2down,个 order,0无连接
                case "2":
                    disp[0] = 001;
                    disp[1] = 123;
                    disp[2] = 004;
                    disp[3] = 006;
                    ss = "baojia";
                    break;
                case "3":
                    disp[0] = 001;
                    disp[1] = 112;
                    disp[2] = 004;
                    disp[3] = 006;
                    ss = "baojia";
                    break;
                case "4":
                    disp[0] = 001;
                    disp[1] = 002;
                    disp[2] = 125;
                    disp[3] = 006;
                    ss = "ShangPaiYear";
                    break;
                case "5":
                    disp[0] = 001;
                    disp[1] = 002;
                    disp[2] = 114;
                    disp[3] = 006;
                    ss = "ShangPaiYear";
                    break;

                case "6":
                    disp[0] = 001;
                    disp[1] = 002;
                    disp[2] = 004;
                    disp[3] = 117;
                    ss = "LiCheng";
                    break;
                case "7":
                    disp[0] = 001;
                    disp[1] = 002;
                    disp[2] = 004;
                    disp[3] = 126;
                    ss = "LiCheng";
                    break;

                default:
                    disp[0] = 101;
                    disp[1] = 002;
                    disp[2] = 004;
                    disp[3] = 006;
                    ss = "id";
                    break;
            }
            return ss;
        }
    }
}