﻿using DataBase;
using Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class Item : System.Web.UI.Page
    {
        public CarDetialInfo cinfo = null;
        public List<string> piclist =null;
        protected void Page_Load(object sender, EventArgs e)
        {
            var id=Request["id"];
            var ids = 0;
            int.TryParse(id, out ids);
           cinfo = new CarDetialInfoDb().GetCarinfo(ids);
            if (cinfo != null)
            {
                piclist = cinfo.Images.Split(new char[] { ';' } ,StringSplitOptions.RemoveEmptyEntries).ToList();

            }
            else
            {
                cinfo = new CarDetialInfo();
                piclist = new List<string>();
            }
            disp(cinfo);
        }
        private void disp(CarDetialInfo c)
        {
            var carlist = new CarTypeInfoDb().GetCarinfoList("0");
            title.Text = c.ProTitle;
            Literal1.Text = c.baojia.ToString("#0.00");
            huanjia.Text = "（还价不多）";
            sellnumber.Text = c.SellerNumber;
            ProNum.Text = c.ProNum?.Replace(c.SellerNumber, "")??"";
            shangpaiym.Text = c.ShangPaiYear + "年" + c.ShangPaiMonth + "月";
            var ct = carlist.FirstOrDefault(x => x.CarTypeKey == c.CarType);
            cartype.Text = ct.DisplayName;
            country.Text = c.country;
            CarColor.Text = c.CarColor;
            PaiLiang.Text = c.PaiLiang;
            BianShuQi.Text = c.BianShuQi;
            LiCheng.Text = c.LiCheng;
            PaiFangBiaoZhun.Text = c.PaiFangBiaoZhun;
            RanYou.Text = c.RanYou;
            cdate.Text = c.CreateTime.ToShortDateString();
            yangqing.Text = c.Remark.Replace("\\n","");
            SellerName.Text = c.SellerName;
            tel.Text = c.SellerPhone;
            Address.Text = c.CarSellAddress;
        }
    }
}