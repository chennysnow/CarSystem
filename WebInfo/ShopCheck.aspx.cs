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
    public partial class ShopCheck : System.Web.UI.Page
    {
        public List<ShopInfo> Shoplist =null;
        public int TotalRecord=0;
        public int TotalPage=0;
        public int Ppage = 0;
        public int Npage = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            var pages = Request["page"];
            int page;
            int.TryParse(pages, out page);
            Ppage = page > 1 ? page-- : 1;
            Npage = page >= TotalPage ? TotalPage : page++;
            Shoplist =new ShopInfoDb().ExecDB("",page, 15, "id", 1, out TotalRecord, out TotalPage).ToList();
            if (Shoplist == null)
                Shoplist = new List<ShopInfo>();
            var del = Request["del"];
            var chk= Request["chk"];
            if (string.IsNullOrEmpty(del) == false)
            {

            }
            else if (string.IsNullOrEmpty(chk) == false)
            {

            }

            
        }
    }
}