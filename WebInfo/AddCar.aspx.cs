using DataBase;
using Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class AddCar : System.Web.UI.Page
    {
        public string Brandinfo;
        public string BuyCarYear;
        public string BuyCarMonth;
        public string BuyCarType;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                dataBind();
            }
            if (Request.Form["method"] == "add")
            {
                addCar();
            }

            //var data = Encoding.GetEncoding("GBK").GetBytes(Request.Form["p_name"].ToString());
        }

        private void dataBind()
        {
            Page.Title = "我的车源管理";
            var list = new BandInfoDb().GetBandInfoByParentNum("0");
            StringBuilder brands = new StringBuilder();
            brands.Append("<option value=''>请选择品牌</option>");
            foreach (var item in list)
            {
                brands.AppendFormat("<option value='{0}'>{1}</option>", item.BrandNum, item.DisplayName);
            }
            Brandinfo = brands.ToString();

            StringBuilder Buyyear = new StringBuilder();
            int currYear = DateTime.Now.Year;
            Buyyear.Append("<option value=''>请选择年份</option>");
            for (int i = 0; i < 20; i++)
            {
                Buyyear.AppendFormat("<option value='{0}'>{0}</option>", currYear - i);
            }
            BuyCarYear = Buyyear.ToString();

            StringBuilder BuyMonth = new StringBuilder();

            BuyMonth.Append("<option value=''>请选择月份</option>");
            for (int i = 1; i < 13; i++)
            {
                BuyMonth.AppendFormat("<option value='{0}'>{0}</option>",  i.ToString("00"));
            }
            BuyCarMonth = BuyMonth.ToString();

            var carType = new CarTypeInfoDb().GetAllCarType();
        }


        private void addCar()
        {
            ///static/carImg/load
            var p_sort = Request.Form["p_sort"];
            var p_brand = Request.Form["p_brand"];
            var p_name = HttpUtility.UrlDecode(Request.Form["p_name"]);
            var uptype = Request.Form["uptype"];
            var pic = Request.Form["imgs"];
            var piclist = pic.Split(',');
            var priallimg = "";

            foreach (var tempimg in piclist)
            {
                priallimg = priallimg + string.Format("/carimg/small/{1}.jpg;", pic);
            }

            var mainpic = Request.Form["p_mainpic"];
            var p_color = Request.Form["p_color"];
            var p_price = Request.Form["p_price"];
            var isfixprice = Request.Form["isfixprice"];
            var p_year = Request.Form["p_year"];
            var p_month = Request.Form["p_month"];
            var p_kilometre = Request.Form["p_kilometre"];
            var p_gas = Request.Form["p_gas"];
            var p_country = Request.Form["p_country"];
            var p_transmission = Request.Form["p_transmission"];
            var p_emissionstandards = Request.Form["p_emissionstandards"];
            var p_fuel = Request.Form["p_fuel"];
            var p_details = Request.Form["p_details"];
            var p_img = Request.Form[""];
            var ac = Request.Form["ac"];
            var id = Request.Form["id"];
            var pstate = Request.Form["pstate"];
            var page = Request.Form["page"];
            var subbrand2= Request.Form["p_subbrand"];
            CarDetialInfo pro = new CarDetialInfo();
            pro.CarType = p_sort;
            pro.BrandInfo = p_brand;
            pro.BrandType = subbrand2;
            pro.OtherParam = p_name;
            pro.ShangPaiTime = p_year + "-" + p_month;
            pro.Images = priallimg;
            pro.mianimg = mainpic;
            pro.baojia =decimal.Parse(p_price);
            pro.CarColor = p_color;
            pro.LiCheng = p_kilometre;
            pro.PaiLiang = p_gas;
            pro.country = p_country;
            pro.BianShuQi = p_transmission;
            pro.RanYou = p_fuel;
            pro.Remark = p_details;
            pro.PaiFangBiaoZhun = p_emissionstandards;
            new CarDetialInfoDb().AddCarinfo(pro);
        }
    }

    
}