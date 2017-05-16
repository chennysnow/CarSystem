using DataBase;
using Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
        public string Imgli;
        public string p_mainpic;
        public string p_color;
        public string p_name;
        public string p_price;
        public string p_kilometre;
        public string p_gas;
        public string p_sort;
        public string subbrand;
        public string p_country;
        public string p_transmission;
        public string p_emissionstandards;
        public string p_fuel;
        public string p_details;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string tempid = Request.QueryString["id"];
                int proid = 0;
                if(!string.IsNullOrEmpty(tempid))
                {
                    int.TryParse(tempid, out proid);
                }
                if (Request.Form["method"] == "add")
                {
                    addCar();
                }
                if (Request.Form["method"] == "edit"&& proid > 0)
                {
                    addCar(proid);
                }
                dataBind(proid);
            }
      

            //var data = Encoding.GetEncoding("GBK").GetBytes(Request.Form["p_name"].ToString());
        }

        private void dataBind(int proid)
        {
            var proinfo = new CarDetialInfoDb().GetCarinfo(proid);

            Page.Title = "我的车源管理";
            var list = new BandInfoDb().GetBandInfoByParentNum("0");
            StringBuilder brands = new StringBuilder();
            brands.Append("<option value=''>请选择品牌</option>");
            string brandBind = "";
            int yearBind = 0;
            int monthBind = 0;
            p_country = "<input type='radio' name='p_country' value='国产' checked='checked'>国产 <input type='radio' name='p_country' value='进口' >进口";
            if (proinfo!=null)
            {
                brandBind = proinfo.BrandInfo;
                yearBind = proinfo.ShangPaiYear;
                monthBind = proinfo.ShangPaiMonth;
                p_mainpic = proinfo.mianimg;
                p_color = proinfo.CarColor;
                p_name = proinfo.OtherParam;
                p_price = proinfo.baojia.ToString("0.00");
                p_kilometre = proinfo.LiCheng;
                p_gas = proinfo.PaiLiang;
                p_details = proinfo.Remark.Replace("\n","");
                if (proinfo.country=="进口")
                {
                    p_country = "<input type='radio' name='p_country' value='国产' >国产 <input type='radio' name='p_country' checked='checked' value='进口' >进口";
                }
                var imgs = proinfo.Images.Split(';');
                foreach (var img in imgs)
                {
                    var imgid = Regex.Match(img, "/carimg/small/(?<x>\\d+).jpg", RegexOptions.IgnoreCase).Value;
                    if (string.IsNullOrEmpty(imgid))
                        imgid = "0";
                    Imgli += string.Format( "<li id='{0}'><img name='p_pics' src='{1}'><p><a href=\"javascript:delimg('{0}')\"> 删除</a></p></li>",imgid,img);
                }

                var secBrand=new BandInfoDb().GetBandInfoByParentNum(proinfo.BrandInfoKey);
                foreach (var item in secBrand)
                {
                    if (proinfo.BrandTypeKey == item.BrandNum)

                        subbrand += string.Format("<option  selected='selected' value='{0}'>{1}</option>", item.BrandNum, item.DisplayName);
                    else
                        subbrand += string.Format("<option value='{0}'>{1}</option>", item.BrandNum, item.DisplayName);
                }



            }

            string[] pfbz = { "国一","国二", "国三", "国三+OBD", "国四", "国五" };
            foreach (var item in pfbz)
            {
                if (proinfo!=null&&proinfo.PaiFangBiaoZhun == item)
                    p_emissionstandards += string.Format("<option selected='selected' value='{0}'>{0}</option>", item);
                else
                    p_emissionstandards += string.Format("<option value='{0}'>{0}</option>", item);
            }
            string[] p_fuellist = { "汽油", "柴油", "混动", "电动" };
            foreach (var item in p_fuellist)
            {
                if (proinfo != null && proinfo.RanYou == item)
                    p_fuel += string.Format("<option selected='selected' value='{0}'>{0}</option>", item);
                else
                    p_fuel += string.Format("<option value='{0}'>{0}</option>", item);
            }
            


            var typelist = new CarTypeInfoDb().GetAllCarType();

            foreach (var item in typelist)
            {
                if(item.ParentCarTypeKey=="0")
                {
                    if(proinfo!=null&&proinfo.BrandTypeKey== item.CarTypeKey)
                        p_sort += string.Format("<option  selected='selected' value='{0}'>{1}</option>", item.CarTypeKey,item.DisplayName);
                    else
                        p_sort += string.Format("<option value='{0}'>{1}</option>", item.CarTypeKey, item.DisplayName);
                }
                if(item.ParentCarTypeKey=="1")
                    if (proinfo != null && proinfo.BianShuQi == item.DisplayName)
                        p_transmission += string.Format("<input type='radio' name='p_transmission' checked='checked' value='{0}'>{0}", item.DisplayName);
                    else
                        p_transmission += string.Format("<input type='radio' name='p_transmission' value='{0}'>{0}", item.DisplayName);
                //
            }



            foreach (var item in list)
            {
                if(item.BrandName== brandBind)
                {
                    brands.AppendFormat("<option  selected='selected' value='{0}'>{1}</option>", item.BrandNum, item.DisplayName); 
                }
                else
                {
                    brands.AppendFormat("<option value='{0}'>{1}</option>", item.BrandNum, item.DisplayName);
                }
               
            }
            Brandinfo = brands.ToString();

            StringBuilder Buyyear = new StringBuilder();
            int currYear = DateTime.Now.Year;
            Buyyear.Append("<option value=''>请选择年份</option>");
            for (int i = 0; i < 20; i++)
            {
                if(yearBind== (currYear - i))
                {
                    Buyyear.AppendFormat("<option selected='selected' value='{0}'>{0}</option>", currYear - i);
                }
                else

                Buyyear.AppendFormat("<option value='{0}'>{0}</option>", currYear - i);
            }


            BuyCarYear = Buyyear.ToString();

            StringBuilder BuyMonth = new StringBuilder();

            BuyMonth.Append("<option value=''>请选择月份</option>");
            for (int i = 1; i < 13; i++)
            {
                if(monthBind==i)
                    BuyMonth.AppendFormat("<option selected='selected' value='{0}'>{0}</option>", i.ToString("00"));
                else
                BuyMonth.AppendFormat("<option value='{0}'>{0}</option>", i.ToString("00"));
            }
            BuyCarMonth = BuyMonth.ToString();

            var carType = new CarTypeInfoDb().GetAllCarType();
        }


        private void addCar(int id=0)
        {
            ///static/carImg/load
            var p_sort = Request.Form["p_sort"];
            var p_brand = Request.Form["p_brand"];
            var p_brandName = "";
            var probrand = new BandInfoDb().getBrandByKey(p_brand);
            if(probrand!=null)
            {
                p_brandName = probrand.BrandName;
            }

            var p_name = HttpUtility.UrlDecode(Request.Form["p_name"]);
            var uptype = Request.Form["uptype"];
            var pic = Request.Form["imgs"];
            var piclist = pic.Split(',');
            var priallimg = "";

            foreach (var tempimg in piclist)
            {
                priallimg = priallimg + string.Format("/carimg/small/{0}.jpg;", pic);
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
         
            var pstate = Request.Form["pstate"];
            var page = Request.Form["page"];
            var subbrand2 = Request.Form["p_subbrand"];
            string subbrandName="";
            var prosubbrand = new BandInfoDb().getBrandByKey(subbrand2);
            if (prosubbrand != null)
            {
                subbrandName = prosubbrand.BrandName;
            }


            CarDetialInfo pro = new CarDetialInfo();
            pro.Id = id;
            pro.CarType = p_sort;
            pro.BrandInfo = p_brandName;
            pro.BrandInfoKey = p_brand;
            pro.BrandType = subbrandName;
            pro.BrandTypeKey= subbrand2;
            pro.OtherParam = p_name;
            pro.ShangPaiTime = p_year + "-" + p_month;
            pro.ShangPaiYear = int.Parse(p_year);
            pro.ShangPaiMonth = int.Parse(p_month);
            pro.Images = priallimg;
            pro.mianimg = mainpic;
            pro.baojia = decimal.Parse(p_price);
            pro.CarColor = p_color;
            pro.LiCheng = p_kilometre;
            pro.PaiLiang = p_gas;
            pro.country = p_country;
            pro.BianShuQi = p_transmission;
            pro.RanYou = p_fuel;
            pro.Remark = p_details;
            pro.ProTitle = pro.BrandInfo + " " + pro.BrandType + " " + pro.OtherParam;
            pro.PaiFangBiaoZhun = p_emissionstandards;
            new CarDetialInfoDb().AddCarinfo(pro);
            Response.Redirect("UserCarList.aspx");
        }
    }


}