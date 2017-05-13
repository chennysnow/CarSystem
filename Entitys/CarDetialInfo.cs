using System;
using ServiceStack.DataAnnotations;
namespace Entitys
{
    public class CarDetialInfo
    {
       

        [AutoIncrement]
        public int Id { get; set; }

        public decimal baojia { get; set; }
        public string CarType { get; set; }

        public string BrandInfo { get; set; }
        public string BrandType { get; set; }

        public string OtherParam { get; set; }
        public string CarColor { get; set; }
        public string PaiLiang { get; set; }
        public string country { get; set; }
        
        public string BianShuQi { get; set; }
        public string LiCheng { get; set; }
        public string PaiFangBiaoZhun { get; set; }
        public string RanYou { get; set; }
        public string Remark { get; set; }
        public string Images { get; set; }
        public string mianimg { get; set; }
        public string ShangPaiTime { get; set; }
        public DateTime CreateTime { get; set; }
        public string SellerName { get; set; }
        public string SellerPhone { get; set; }
        public string CarSellAddress { get; set; }
    }
}
