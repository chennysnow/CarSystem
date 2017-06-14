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
using Commons;

namespace WebInfo
{
    public partial class ShopCheck : System.Web.UI.Page
    {
        private string brandReg = "";
        private List<BandInfo> brandList;
        public string msg = "";
        public string list = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] == null || Session["userid"].ToString()!= "23")
            {
                string url = HttpContext.Current.Request.Url.PathAndQuery;
                Response.Redirect("Login.aspx?url="+url);
            }

            var oldnum = Request.Form["oldnumber"];
            var newnum = Request.Form["newnumber"];
            var method = Request.Form["method"];

            if (method == "2"&& !string.IsNullOrEmpty(oldnum)) 
            {
                // 查询
                StringBuilder items = new StringBuilder();
                var list = new prologDb().GetproLogById(oldnum.Trim());
                string head= " <table cellspacing ='0' cellpadding = '0' width = '100%' class='listtable'><tbody><tr><th>编号</th><th>名称</th></tr>";

                items.Append(head);
                foreach (var car in list)
                {
                    items.AppendFormat("<tr><td>{0}</td><td><a target='_blank' href='http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=refresh&amp;id={2}&page=1'>{1}</a></td></tr>", car.shopNumber, car.proName, car.proid);
                    
                }
                items.Append("</table>");

                return;
            }
            if (!string.IsNullOrEmpty(oldnum) && !string.IsNullOrEmpty(newnum))
            {
            
                var list = new prologDb().GetproLogById(oldnum.Trim());
                if (list.Count == 0)
                {
                    msg = "没有找到任何车辆信息";
                    return;
                }
                brandList = new BandInfoDb().GetBandInfoByParentNum("0");

                foreach (var bandInfo in brandList)
                {
                    brandReg += bandInfo.BrandName + "|";
                }
                brandReg = brandReg.TrimEnd('|');

                foreach (var item in list)
                {
                    try
                    {
                        addCar(item);
                    }
                    catch (Exception ex)
                    {
                        LogServer.WriteLog("proid:" + item.proid + "error" + ex.Message, "jiexi");
                    }

                }
                msg = "导入完毕共导入"+Items.Count+"条信息";

            }


            //brandList = new BandInfoDb().GetBandInfoByParentNum("0");

            //foreach (var bandInfo in brandList)
            //{
            //    brandReg += bandInfo.BrandName + "|";
            //}
            //brandReg = brandReg.TrimEnd('|');

            //var list = new prologDb().GetproLogById(0, 100);
            //foreach (var item in list)
            //{
            //    try
            //    {
            //        addCar(item);
            //    }
            //    catch (Exception ex)
            //    {
            //        LogServer.WriteLog("proid:" + item.proid + "error" + ex.Message, "jiexi");
            //    }

            //}

        }


        private void addCar(prolog item)
        {

            string detial = item.proName.TrimStart('[').TrimEnd(']').Replace("\"", "");


            var prolist = detial.Split(',');

            var spri = prolist[2].Substring(prolist[2].IndexOf("：") + 1).Replace("年", "-").Replace("月", "");
            var Cartype = prolist[3].Substring(prolist[3].IndexOf("：") + 1);
            var typeitem = new CarTypeInfoDb().GetCarinfo(new CarTypeInfo { DisplayName = Cartype });
            var p_sort = typeitem.CarTypeKey; //Request.Form["p_sort"];
            var title = prolist[23];
            title = title.Substring(title.IndexOf("：") + 1);

            var bramdName = Regex.Match(title, brandReg, RegexOptions.IgnoreCase).Value;

            var brand = brandList.FirstOrDefault(c => c.BrandName == bramdName);



            var catxinghao = new BandInfoDb().GetBandInfoByParentNum(brand.BrandNum);

            string xhReg = "";
            foreach (var xh in catxinghao)
            {
                xhReg += xh.BrandName + "|";
            }
            xhReg = xhReg.TrimEnd('|');


            var tempxinghao = Regex.Match(title, xhReg, RegexOptions.IgnoreCase).Value;
            var tempbrandtype = catxinghao.FirstOrDefault(c => c.DisplayName == tempxinghao);
            var temppic = "";
            foreach (var propic in prolist)
            {
                if (propic.Contains(".jpg"))
                {
                    temppic += propic.Trim(' ') + ";";
                }

            }

            var p_price = Regex.Match(prolist[0], "：(?<x>.*?)万元", RegexOptions.IgnoreCase).Groups["x"].Value;
            var p_color = prolist[5].Substring(prolist[5].IndexOf("：") + 1);
            var p_kilometre = prolist[8].Substring(prolist[8].IndexOf("：") + 1).Replace("万", "");
            var p_gas = prolist[6].Substring(prolist[6].IndexOf("：") + 1);
            var p_country = prolist[4].Substring(prolist[4].IndexOf("：") + 1);
            var p_transmission = prolist[7].Substring(prolist[7].IndexOf("：") + 1);
            var p_fuel = prolist[10].Substring(prolist[10].IndexOf("：") + 1);
            var p_emissionstandards = prolist[9].Substring(prolist[9].IndexOf("：") + 1);
            var p_details = Regex.Match(detial, "车况说明：(?<x>.*?)$", RegexOptions.IgnoreCase).Groups["x"].Value;

            var seller = prolist[12].Substring(prolist[12].IndexOf("：") + 1);
            var sellerphone = prolist[14].Substring(prolist[14].IndexOf("：") + 1);
            var selleradress = prolist[13].Substring(prolist[13].IndexOf("：") + 1);
            var proNum = prolist[1].Substring(prolist[1].IndexOf("：") + 1);


            CarDetialInfo pro = new CarDetialInfo();
            pro.ProTitle = title;
            pro.CarType = p_sort;
            pro.BrandInfo = bramdName;
            pro.BrandType = tempxinghao;
            pro.ProNum = proNum;
            pro.OtherParam = "";
            pro.ShangPaiTime = spri; //p_year + "-" + p_month;
            if (brand.BrandNum != null)
                pro.BrandInfoKey = brand.BrandNum;
            if (tempbrandtype != null)
                pro.BrandTypeKey = tempbrandtype.BrandNum;
            pro.ShangPaiMonth = int.Parse(spri.Split('-')[1]);
            pro.ShangPaiYear = int.Parse(spri.Split('-')[0]);
            pro.Images = temppic;
            pro.mianimg = "1";
            pro.baojia = decimal.Parse(p_price);
            pro.CarColor = p_color;
            pro.LiCheng = p_kilometre;
            pro.PaiLiang = p_gas;
            pro.country = p_country;
            pro.BianShuQi = p_transmission;
            pro.RanYou = p_fuel;
            pro.Remark = p_details;
            pro.PaiFangBiaoZhun = p_emissionstandards;
            pro.SellerName = seller;
            pro.SellerPhone = sellerphone;
            pro.SellerName = proNum.Split(' ')[0];
            pro.CarSellAddress = selleradress;
            new CarDetialInfoDb().AddCarinfo(pro);
            item.state = 2;
            new prologDb().Updateprolog(item);
        }
    }
}