using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ServiceStack.DataAnnotations;
namespace Entitys
{
    public class BrandFull
    {
        [AutoIncrement]
        public int Id { get; set; }
        public int Pid { get; set; }
        public int Level { get; set; }
        public string Title { get; set; }
        public string Letter { get; set; }
        public string CountryCode { get; set; }
        public string LevelCode { get; set; }
        public string Logo { get; set; }
        public int Flag { get; set; }
        public int Hot { get; set; }
        public string MoblieLogo { get; set; }
        public string BrandList { get; set; }
        public string Fcid { get; set; }
        public string Pinyin { get; set; }
    }

    public class AutoHomeBrand
    {
        [AutoIncrement]
        public int Id { get; set; }
        public int Pid { get; set; }
        public int Level { get; set; }
        public string Title { get; set; }
        public string Letter { get; set; }
        public string CountryCode { get; set; }
        public string CarType { get; set; }
        public string Logo { get; set; }
        public int Hot { get; set; }
        public string MoblieLogo { get; set; }
        public string Pinyin { get; set; }
    }
}
