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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["method"] == "add")
            {
                addCar();
            }

            //var data = Encoding.GetEncoding("GBK").GetBytes(Request.Form["p_name"].ToString());
        }


        private void addCar()
        {
            var p_sort = Request.Form["p_sort"];
            var p_brand = Request.Form["p_brand"];
            var p_name = HttpUtility.UrlDecode(Request.Form["p_name"]);
            var uptype = Request.Form["uptype"];
            var pic = Request.Form["p_pics[]"];
            var mainpic = Request.Form["p_mainpic"];
            var p_color = Request.Form["p_color"];
            var p_price = Request.Form["p_price"];
            var isfixprice = Request.Form["isfixprice"];
            var p_year = Request.Form["p_year"];
            var p_month = Request.Form["p_month"];
            var p_kilometre = Request.Form["p_kilometre"];
            var p_gas = Request.Form["p_kilometre"];
            var p_country = Request.Form["p_kilometre"];
            var p_transmission = Request.Form["p_transmission"];
            var p_emissionstandards = Request.Form["p_emissionstandards"];
            var p_fuel = Request.Form["p_fuel"];
            var p_details = Request.Form["p_details"];
            var ac = Request.Form["ac"];
            var id = Request.Form["id"];
            var pstate = Request.Form["pstate"];
            var page = Request.Form["page"];
            var subbrand2= Request.Form["p_subbrand"];
            CarDetialInfo pro = new CarDetialInfo();
            pro.CarType = p_sort;
            pro.BrandInfo = p_brand;
            pro.BrandType = subbrand2;
            pro.OtherParam = subbrand2;
            pro.ShangPaiTime = p_year + "-" + p_month;
            pro.Images = pic;
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