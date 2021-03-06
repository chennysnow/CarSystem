﻿using System;
using ServiceStack.DataAnnotations;
namespace Entitys
{
    public class CarDetialInfo
    {
       

        [AutoIncrement]
        public int Id { get; set; }
        public string ProTitle { get; set; }

        public string ProNum { get; set; }
        public decimal baojia { get; set; }
        public string CarType { get; set; }

        public string BrandInfo { get; set; }
        public string BrandInfoKey { get; set; }
        public string BrandType { get; set; }
        public string BrandTypeKey { get; set; }
        public string OtherParam { get; set; }
        public string CarColor { get; set; }
        public string PaiLiang { get; set; }
        public string country { get; set; }
        
        public string BianShuQi { get; set; }
        public decimal LiCheng { get; set; }
        public string PaiFangBiaoZhun { get; set; }
        public string RanYou { get; set; }
        public string Remark { get; set; }
        public string Images { get; set; }
        public string mianimg { get; set; }
        public string ShangPaiTime { get; set; }
        public int ShangPaiYear { get; set; }
        public int ShangPaiMonth{ get; set; }
        public DateTime CreateTime { get; set; }
        public string SellerName { get; set; }
        public string SellerNumber { get; set; }
        public string SellerPhone { get; set; }
        public string CarSellAddress { get; set; }
    }
}
