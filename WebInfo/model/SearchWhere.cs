using DataBase;
using Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace WebInfo
{
    public class SearchWhere
    {        
        //public Dictionary<string, string> Dispname = new Dictionary<string, string> { { "价 格", "p" }, { "车龄", "a" } };
        public Dictionary<string, string> Dispname1=new Dictionary<string, string> { { "车型", "e" },{ "行驶里程", "g" },{ "变速箱", "f" },  { "排量", "h" }, { "排放标准", "i" }, { "燃油类型", "j" }, { "颜色", "k" } };

        public Dictionary<string, string> where = new Dictionary<string, string>();
        public Dictionary<string, Dictionary<string, string>> Carwhere=new Dictionary<string, Dictionary<string, string>>();
        //public string jgbegin = "";n
        //public string jgend = "";m
        public string ppname = "";
        public string ppvalue = "";
        //public string ppz = "";
        public SearchWhere(string id)
        {
            string key, value;
            Init();
            if (string.IsNullOrEmpty(id))
                id = "";
            //分解条件
            StringBuilder sb = new StringBuilder();
            Regex r = new Regex("\\d+\\.?\\d*");
            MatchCollection mc = r.Matches(id + "Z");
            for (int i = 0; i < mc.Count; i++)
            {
                if (mc[i].Index - 1 >= 0)
                {
                    key = id[mc[i].Index - 1].ToString();
                    value = mc[i].ToString();
                    if (value != "0" && string.IsNullOrEmpty(value) == false)
                        where.Add(key, value);
                }
            }

            string name = Getname("a");
            if (string.IsNullOrEmpty(name) && where.TryGetValue("a", out string num))
            {
                //var ls1 = new CarDetialInfoDb().Exec(sb.ToString(), 1, 25, order, orderby, out TotalRecord, out TotalPage);
                var band = new BandInfoDb().getBrandByKey(num);
                var dic = Carwhere["a"];
                dic.Add(band.BrandName, band.BrandNum);
            }

            //车系
            if (where.TryGetValue("a",out value) == true)
            {
                Dictionary<string, string> dic = Carwhere["b"];
                var ls = new BandInfoDb().GetAllBrandBuyParentId(value);               
                dic.Clear();
                dic.Add("不限", "0");
                foreach (var v in ls)
                    dic.Add(v.BrandName, v.BrandNum);
            }            
        }
        public void Init()
        {
            Dictionary<string, string> dic;
            // 品牌
            dic = new Dictionary<string, string> {{ "不限", "0" },{"大众","15"}, { "别克", "34" }, { "雪佛兰","501"}, { "福特", "53" },{ "丰田","64"}, { "比亚迪", "105" }, { "奔驰","99"}, { "现代", "47" }, { "宝马","5"}, { "吉利", "153" }, { "荣威","216"}, { "斯柯达", "217" },
            { "奥迪","1"}, {"众泰","327"}, { "本田","78"}, {"尼桑","85"}, { "起亚","131"}, {"标致","144"}};
            Carwhere.Add("a", dic);
            //车 系
            dic = new Dictionary<string, string> { { "不限", "0" }, { "凯越", "36" }, { "福克斯", "55" }, { "科鲁兹", "761" }, { "朗逸", "675" }, { "荣威", "216" }, { "明锐", "218" }, { "英朗xt", "875" }, { "君威", "38" }, { "POLO", "20" }, { "宝马3系", "19717" }, { "君越", "37" }, { "睿翼", "768" }, { "标致307", "145" }, { "别克GL8", "527" }, { "速腾", "16" }, { "世嘉", "130" }, { "宝马520", "7" }, { "天籁", "93" }, { "蒙迪欧", "54" } };
            Carwhere.Add("b", dic);
            //价 格
            dic = new Dictionary<string, string> { { "不限", "0" }, { "3万以下", "1" }, { "3-5万", "2" }, { " 5-7万", "3" }, { "7-9万", "4" }, { "9-12万", "5" }, { "12-16万", "6" }, { "16-20万", "7" }, { "20万以上", "8" } };
            Carwhere.Add("c", dic);
            // 车龄
            dic = new Dictionary<string, string> { { "不限", "0" }, { "1年以内", "1" }, { "3年内", "3" }, { "5年内", "5" }, { "5年以上", "6" } };
            Carwhere.Add("d", dic);
            //车型
            var chexing = new Dictionary<string, string>();
            chexing.Add("不限", "0");
            var ls =new CarTypeInfoDb().GetCarinfoList("0");
            foreach (var v in ls)
                chexing.Add(v.DisplayName, v.CarTypeKey);
            Carwhere.Add("e", chexing);
            var bsx = new Dictionary<string, string>();

            //变速箱
            bsx.Add("不限", "0");
            ls = new CarTypeInfoDb().GetCarinfoList("1");
            foreach (var v in ls)
                bsx.Add(v.DisplayName, v.CarTypeKey);
            Carwhere.Add("f", bsx);
            //行驶里程
            dic = new Dictionary<string, string> { { "不限", "0" }, { " 1万公里内 ", "1" }, { " 3万公里内 ", "3" }, { "5万公里内 ", "5" }, { "5万公里上 ", "6" } };
            Carwhere.Add("g", dic);
            //排量 
            dic = new Dictionary<string, string> { { "不限", "0" }, { "1.0L以下", "1" }, { "1.0-1.6L", "2" }, { "1.6-2.0L", "3" }, { "2.0-3.0L ", "4" }, { "3.0L以上", "5" } };
            Carwhere.Add("h", dic);
            //排放标准
            dic = new Dictionary<string, string> { { "不限", "0" }, { "国二及以上", "1" }, { "国三及以上", "2" }, { "国四及以上", "3" }, { "国五", "4" } };
            Carwhere.Add("i", dic);
            //燃油类型
            dic = new Dictionary<string, string> { { "不限", "0" }, { "汽油", "1" }, { "柴油", "2" }, { "电动", "3" }, { "油电混合", "4" }, { "其他", "5" } };
            Carwhere.Add("j", dic);
            //颜色
            dic = new Dictionary<string, string> { { "不限", "0" }, { "黑色", "03" },{ "白色", "04" },{ "银灰色", "10" },{ "深灰色", "15" },{ "红色", "09" },{ "橙色", "11" },{ "绿色", "02" },
     { "蓝色", "05" },{ "咖啡色", "06" },{ "紫色", "07" },{ "香槟色", "08" },{ "多彩色", "12" },{ "黄色", "13" },{ "其它", "14" } };
            Carwhere.Add("k", dic);
            //车牌所在地
            dic = new Dictionary<string, string> { { "不限", "0" }, { "本地", "1" }, { "外地", "2" } };
            Carwhere.Add("l", dic);
            dic = new Dictionary<string, string> { {  "-1", "价格{0}元起"}};
            Carwhere.Add("n", dic);
            dic = new Dictionary<string, string> { {  "-1", "价格{0}元止"  } };
            Carwhere.Add("m", dic);
        }
        public string Getname(string key)
        {
           var dic =Carwhere[key];
            if (where.TryGetValue(key, out string tj))
            {
                foreach (var k in dic)
                {
                    if(k.Key=="-1")
                        return string.Format(k.Value, tj);

                    if (k.Value == tj)
                    {
                        return k.Key;
                    }
                }

            }
            return "";
        }
      
        public string searchtxt(string b)
        {
            StringBuilder sb = new StringBuilder();
            foreach(var k in where)
            {
                if (k.Key == b) continue;
                if(k.Value!="0")
                    sb.Append($"{k.Key}{k.Value}");
            }
            return sb.ToString();
        }
        public string Getwhere()
        {
            string m = "", n = "";
            StringBuilder sb = new StringBuilder();
            string str ;
            if (where.TryGetValue("a", out str))
            {
                if (string.IsNullOrEmpty(str) == false && str != "0")
                    sb.Append($" BrandInfoKey='{str}' and");
            }
            if (where.TryGetValue("b", out str)) { 
                if (string.IsNullOrEmpty(str) == false && str != "0")
                    sb.Append($" BrandTypeKey='{str}' and");
            }

            #region  //价 格
            if (where.TryGetValue("c", out str))
            {
                switch (str)
                {
                    case "1":
                        m = "3";
                        break;
                    case "2":
                        n = "3";
                        m = "5";
                        break;
                    case "3":
                        n = "5";
                        m = "7";
                        break;
                    case "4":
                        n = "7";
                        m = "9";
                        break;
                    case "5":
                        n = "9";
                        m = "12";
                        break;
                    case "6":
                        n = "12";
                        m = "16";
                        break;
                    case "7":
                        n = "16";
                        m = "20";
                        break;
                    case "8":
                        n = "20";
                        break;
                }
            }
            if (where.TryGetValue("n", out str))
                n = str;
            if (where.TryGetValue("m", out str))
                m = str;
            if (decimal.TryParse(m, out decimal tmp) == false)
                m = "";
            if (decimal.TryParse(n, out decimal tmp1) == false)
                n = "";
            if (!string.IsNullOrEmpty(m))
                sb.Append($" baojia<{m} and");
            if (!string.IsNullOrEmpty(n))
                sb.Append($" baojia>={n} and");
            #endregion
            #region  //车龄

            if (where.TryGetValue("d", out str))
            {
                int i;
                int year = DateTime.Now.Year;
                int.TryParse(str, out i);
                if (i > 0)
                {
                    if (i == 6)
                        sb.Append($" ShangPaiYear <{year - 5} and");
                    else
                        sb.Append($" ShangPaiYear >={year - i} and");
                }
            }
            #endregion
            #region  //车系
            if (where.TryGetValue("e", out str))
            {             
                    sb.Append($" CarType='{str}' and");
            }
            #endregion

            #region  //变速箱
            if (where.TryGetValue("f", out str))
            {
                    var bsq = Carwhere["f"];
                    foreach (var k in bsq)
                        if (k.Value == str)
                            str = k.Key;
                    sb.Append($" BianShuQi ='{str}' and");              
            }
            #endregion


            #region  //行驶里程
            if (where.TryGetValue("g", out str))
            {
                if(str=="6")
                    sb.Append($" LiCheng >'5' and");
                else
                    sb.Append($" LiCheng <='5' and");
            }
            #endregion
            #region  //排量
            if (where.TryGetValue("h", out str))
            {
                switch (str)
                {
                    case "1":
                        m = "PaiLiang in ('0.8','0.8T','0.9','0.9T')";
                        break;
                    case "2":
                        m = "PaiLiang in ('1.0','1.0T','1.2','1.2T','1.3','1.3T','1.4','1.4T','1.5','1.5T')";
                        break;
                    case "3":
                        m = "PaiLiang in ('1.6','1.6T','1.7','1.8T','1.8','1.8T','1.9','1.9T')";
                        break;
                    case "4":
                        m = "PaiLiang in ('2.0','2.0T','2.4','2.4T','2.5','2.5T','2.8','2.8T')";
                        break;
                    case "5":
                        m = "PaiLiang  >= '3.0'";
                        break;
                }
                sb.Append($" {m} and");
            }
            #endregion
            #region  //排量 
            if (where.TryGetValue("i", out str))
            {
                switch (str)
                {
                    case "1":
                        m = "PaiFangBiaoZhun in ('国二','国三','国四','国五')";
                        break;
                    case "2":
                        m = "PaiFangBiaoZhun in ('国三','国四','国五')";
                        break;
                    case "3":
                        m = "PaiFangBiaoZhun in ('国四','国五')";
                        break;
                    case "4":
                        m = "PaiFangBiaoZhun ='国五'";
                        break;
                }
                 sb.Append($" ='{str}' and");
            }
            #endregion
            #region  //燃油类型
            if (where.TryGetValue("j", out str))
            {
                var bsq = Carwhere["j"];
                foreach (var k in bsq)
                    if (k.Value == str)
                        str = k.Key;

                sb.Append($" RanYou='{str}' and");
            }
            #endregion
            #region  //颜色
            if (where.TryGetValue("k", out str))
            {
                var bsq = Carwhere["h"];
                foreach (var k in bsq)
                    if (k.Value == str)
                        str = k.Key;
                sb.Append($" CarColor='{str}' and");
            }
            #endregion
            if (sb.Length > 4)
                sb.Remove(sb.Length - 3, 3);
            return sb.ToString();
        }
        public Dictionary<string,string> curwhere()
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            foreach(var k in where)
            {
               var  name = Getname(k.Key);
               var w = searchtxt(k.Key);
                if (string.IsNullOrEmpty(name) == false && string.IsNullOrEmpty(w) == false)
                    dic.Add(name, w);

            }            
            return dic;
        }
        public string Gettjvalue(string k)
        {
            string str;
            if (where.TryGetValue(k, out str))
            {
                return str;
            }
            return "0";
        }
        public Dictionary<string,string>[] Getcardic(int leng = 300)
        {
            var size = 0;
            Dictionary<string, string>[] dics = new Dictionary<string, string>[2];
            dics[0] = new Dictionary<string, string>();
            var s1 = "";
            foreach(var k in Carwhere["b"])
            {
                size += k.Key.Length + 5;
                if (size < leng)
                    dics[0].Add(k.Key, k.Value);
                else
                {
                    if (dics[1] == null)
                        dics[1] = new Dictionary<string, string>();
                    dics[1].Add(k.Key, k.Value);
                }
            }//
            if(where.TryGetValue("b",out string str))
            {
                if (dics[1] != null)
                {
                    foreach(var k in dics[1])
                        if (k.Value == str)
                        {
                            s1 = k.Key;
                        }
                    dics[1].Remove(s1);
                    dics[0].Add(s1, str);
                }
            }
            return dics;
        }
        public Dictionary<string, string> Getcarwheredic()
        {
            Dictionary<string, string> dics = new Dictionary<string, string>();
            StringBuilder sb = new StringBuilder();
            foreach(var k in where)
            {
                sb.Clear();
                foreach(var k1 in where)
                {
                    if (k.Key != k1.Key)
                    {
                        sb.Append($"{k1.Key}{k1.Value}");
                    }
                }
                var name = Getname(k.Key);
                dics.Add(name, sb.ToString());
            }            
            return dics;
        }

    }
}
