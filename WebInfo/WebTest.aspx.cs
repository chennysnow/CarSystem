using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase;
using Entitys;
using Commons;
using Newtonsoft.Json.Linq;

namespace WebInfo
{
    public partial class WebTest : System.Web.UI.Page
    {
        private string brandReg="";
        private List<BandInfo> brandList;
        protected void Page_Load(object sender, EventArgs e)
        {

            //var Item = new CarDetialInfo();
            //Item.BianShuQi = "ddd";
            //Item.CreateTime = DateTime.Now;
            //Item.ShangPaiTime = DateTime.Now;
            //new CarDetialInfoDb().AddCarinfo(Item);
            //var old = new CarDetialInfoDb().GetCarinfo(1);
            //var db = new CarTypeInfoDb();

            //CarTypeInfo type = new CarTypeInfo {
            //    DisplayName= "手自一体",
            //    CarTypeKey= "12",
            //    ParentDisplayName= "变速器",
            //    ParentCarTypeKey= "1"
            //};
            //db.AddCarinfo(type);

            //var brands = new BandInfoDb().GetBandInfoByParentNum("0");
            //foreach (var item in brands)
            //{
            //    //var secbrands = new BandInfoDb().GetBandInfoByParentNum(item.BrandNum);
            //    //foreach (var secitem in secbrands)
            //    //{
            //    //    addbrand(secitem.BrandNum);
            //    //}
            //    addbrand(item.BrandNum);
            //}



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
           
            string detial = item.proName.TrimStart('[').TrimEnd(']').Replace("\"","");

            
            var prolist = detial.Split(',');

            var spri = prolist[2].Substring(prolist[2].IndexOf("：")+1).Replace("年","-").Replace("月","");
            var Cartype = prolist[3].Substring(prolist[3].IndexOf("：") + 1);
            var typeitem = new CarTypeInfoDb().GetCarinfo(new CarTypeInfo { DisplayName = Cartype});
            var p_sort = typeitem.CarTypeKey; //Request.Form["p_sort"];
            var title = prolist[23];
            title = title.Substring(title.IndexOf("：")+1);
            
            var bramdName = Regex.Match(title, brandReg, RegexOptions.IgnoreCase).Value;

            var brand = brandList.FirstOrDefault(c => c.BrandName == bramdName);



            var catxinghao = new BandInfoDb().GetBandInfoByParentNum(brand.BrandNum);

            string xhReg = "";
            foreach (var xh in catxinghao)
            {
                xhReg += xh.BrandName + "|";
            }
            xhReg = xhReg.TrimEnd('|');
            

            var tempxinghao= Regex.Match(title, xhReg, RegexOptions.IgnoreCase).Value;
            var tempbrandtype = catxinghao.FirstOrDefault(c => c.DisplayName == tempxinghao);
            var temppic= "";
            foreach (var propic in prolist)
            {
                if (propic.Contains(".jpg"))
                {
                    temppic += propic.Trim(' ')+";";
                }

            }

            var p_price = Regex.Match(prolist[0], "：(?<x>.*?)万元", RegexOptions.IgnoreCase).Groups["x"].Value;
            var p_color = prolist[5].Substring(prolist[5].IndexOf("：") + 1);
            var p_kilometre = prolist[8].Substring(prolist[8].IndexOf("：") + 1).Replace("万","");
            var p_gas = prolist[6].Substring(prolist[6].IndexOf("：") + 1);
            var p_country = prolist[4].Substring(prolist[4].IndexOf("：") + 1);
            var p_transmission = prolist[7].Substring(prolist[7].IndexOf("：") + 1);
            var p_fuel = prolist[10].Substring(prolist[10].IndexOf("：") + 1);
            var p_emissionstandards = prolist[9].Substring(prolist[9].IndexOf("：") + 1);
            var p_details = Regex.Match(detial, "车况说明：(?<x>.*?)$", RegexOptions.IgnoreCase).Groups["x"].Value;

            var seller= prolist[12].Substring(prolist[12].IndexOf("：") + 1);
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
            if(brand.BrandNum != null)
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
        }


        private void addbrand(string pid)
        {
            string tempurl = string.Format("http://www.nb77.cn/index.php?mod=user&ajax=1&bid={0}", pid);
            string page = HtmlAnalysis.Gethtmlcode("http://www.nb77.cn/static/css/dealer/dealer_user.css");
           // var str1 = "<option value='1' >A-奥迪</option><option value='19777' >A-奥驰</option><option value='19780' >A-奥玲</option><option value='957' >A-阿斯顿·马丁</option><option value='771' >B-奔驰Smart</option><option value='190' >B-保时捷</option><option value='469' >B-宾利</option><option value='144' >B-标致</option><option value='302' >B-宝骏</option><option value='462' >B-北汽</option><option value='105' >B-比亚迪</option><option value='99' >B-奔驰</option><option value='773' >B-奔腾</option><option value='78' >B-本田</option><option value='5' >B-宝马</option><option value='779' >B-宝马MINI</option><option value='34' >B-别克</option><option value='186' >C-长安</option><option value='258' >C-昌河</option><option value='254' >C-长丰</option><option value='116' >C-长城</option><option value='310' >D-大迪</option><option value='424' >D-道奇</option><option value='19782' >D-大运</option><option value='658' >D-大发</option><option value='669' >D-东南</option><option value='224' >D-东风</option><option value='192' >D-大宇</option><option value='15' >D-大众</option><option value='53' >F-福特</option><option value='64' >F-丰田</option><option value='360' >F-福迪</option><option value='484' >F-法拉利</option><option value='244' >F-福田</option><option value='160' >F-菲亚特</option><option value='769' >G-GMC</option><option value='329' >G-广汽</option><option value='170' >H-华普</option><option value='443' >H-汇众</option><option value='485' >H-悍马</option><option value='363' >H-海马</option><option value='147' >H-哈飞</option><option value='685' >H-华泰</option><option value='385' >H-黑豹</option><option value='645' >H-红旗</option><option value='691' >J-金龙</option><option value='153' >J-吉利</option><option value='19769' >J-解放</option><option value='289' >J-江淮</option><option value='194' >J-吉普</option><option value='535' >J-捷豹</option><option value='841' >J-吉利帝豪</option><option value='723' >J-吉利上海英伦</option><option value='654' >J-金杯</option><option value='233' >J-江铃</option><option value='393' >J-吉奥</option><option value='175' >J-吉利全球鹰</option><option value='774' >K-开瑞</option><option value='632' >K-凯迪拉克</option><option value='196' >K-克莱斯勒</option><option value='19778' >K-凯马</option><option value='547' >L-路虎</option><option value='543' >L-林肯</option><option value='554' >L-兰博基尼</option><option value='405' >L-力帆</option><option value='724' >L-铃木</option><option value='648' >L-陆风</option><option value='374' >L-莲花</option><option value='770' >L-劳斯莱斯</option><option value='213' >L-雷诺</option><option value='198' >L-雷克萨斯</option><option value='776' >M-迈巴赫</option><option value='572' >M-玛莎拉蒂</option><option value='355' >M-名爵</option><option value='57' >M-马自达</option><option value='85' >N-尼桑</option><option value='111' >N-南汽</option><option value='408' >N-纳智捷</option><option value='576' >O-讴歌</option><option value='580' >O-欧宝</option><option value='165' >Q-奇瑞</option><option value='131' >Q-起亚</option><option value='978' >Q-启辰</option><option value='216' >R-荣威</option><option value='863' >R-瑞麒</option><option value='206' >S-斯巴鲁</option><option value='203' >S-萨博</option><option value='19771' >S-时代</option><option value='217' >S-斯柯达</option><option value='19754' >S-上汽大通</option><option value='376' >S-曙光</option><option value='597' >S-双龙</option><option value='665' >S-双环</option><option value='138' >S-三菱</option><option value='19781' >T-唐骏</option><option value='19731' >T-特斯拉</option><option value='209' >W-沃尔沃</option><option value='615' >W-五十铃</option><option value='370' >W-威麟</option><option value='182' >W-五菱</option><option value='341' >W-万丰</option><option value='454' >X-夏利</option><option value='47' >X-现代</option><option value='123' >X-雪铁龙</option><option value='501' >X-雪佛兰</option><option value='389' >y-依维柯</option><option value='346' >y-一汽</option><option value='19773' >Y-跃进</option><option value='452' >y-永源</option><option value='19779' >Y-跃进</option><option value='607' >y-英菲尼迪</option><option value='325' >Z-中顺</option><option value='327' >Z-众泰</option><option value='19776' >Z-重汽</option><option value='331' >Z-中兴</option><option value='226' >Z-中华</option>";
            List<BandInfo> bandlist = new List<BandInfo>();
            var list = RegexServer.RegGroupCollection(page, "<option value=(?<x>\\d+)>(?<y>.*?)</option>");
            if (list == null)
                return;
            for (int i = 0; i < list.Count; i++)
            {
                var key = list[i].Groups["x"].Value;
                var bname = list[i].Groups["y"].Value;
                BandInfo brand = new BandInfo
                {
                    FirstChart ="",
                    BrandName = bname,
                    ParentBrandNum ="bid_"+pid,
                    BrandNum = key,
                    DisplayName = bname,
                    CreateTime = DateTime.Now
                };
                bandlist.Add(brand);
            }

            new BandInfoDb().AddBandInfo(bandlist);
        }
    }
}



