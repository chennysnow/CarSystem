
using Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebInfo
{
    public class Valuecs
    {
        public string title = "";
        public List<CarTypeInfo> cartype = new List<CarTypeInfo>();
        public List<CarTypeInfo> bsqtype = new List<CarTypeInfo>();
        public List<BandInfo>  bandinfo = new List<BandInfo>();
        public List<List<CarDetialInfo>> Cardetialinfo = new List<List<CarDetialInfo>>();
        public string dicval ="";
        public string order = "";
        public string displist = "0";
    }
    public class Jsonvlaue
    {
        public string Name = "";
        public string Value = "";
    }
    public class Vindexdata
    {
        public string title = "";
        public List<CarTypeInfo> cartype = new List<CarTypeInfo>();
        public List<CarTypeInfo> bsqtype = new List<CarTypeInfo>();
        public List<BandInfo> bandinfo = new List<BandInfo>();
        public List<CarDetialInfo> Cardetialinfo = new List<CarDetialInfo>();
        public List<CarDetialInfo> jiaochelist = new List<CarDetialInfo>();
        public List<CarDetialInfo> Suvlist = new List<CarDetialInfo>();
        public List<CarDetialInfo> Paochelist = new List<CarDetialInfo>();
        public List<Info> piclist = null;
        public List<Info> infolist = null;
        public SearchWhere swhere = null;
        public string dicval = "";
        public string order = "";
        public string displist = "0";
        public int TotalRecord = 1;
        public int TotalPage = 1;
        public void clearlianxi(bool bl)
        {
            Cardetialinfo.ForEach(x =>{ if (bl) { x.ProNum = ""; x.SellerNumber = ""; } });
            jiaochelist.ForEach(x => { if (bl) { x.ProNum = ""; x.SellerNumber = ""; } });
            Suvlist.ForEach(x => { if (bl) { x.ProNum = ""; x.SellerNumber = ""; } });
            Paochelist.ForEach(x => { if (bl) { x.ProNum = ""; x.SellerNumber = ""; } });
        }
    }
}
