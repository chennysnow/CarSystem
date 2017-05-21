using DataBase;
using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebInfo
{
    /// <summary>
    /// GetCarinfo 的摘要说明
    /// </summary>
    public class GetCarinfo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string id = context.Request["id"];
            int id1 = 0;
            StringBuilder sb = new StringBuilder();
            if (id == null)
            {//找最新的id 
                var ls1 = new CarDetialInfoDb().GetDBSql("select top 1 * from CarDetialInfo order by id desc");
                if(ls1.Count>0)
                    sb.Append("\"id\":"+ ls1[0].Id );
            }
            else
            {
                int.TryParse(id, out id1);               
                var ls1 = new CarDetialInfoDb().GetDBSql("select top 1 * from CarDetialInfo where id>"+id1.ToString());
                if (ls1 != null && ls1.Count > 0)
                {
                    int i;
                    int.TryParse(ls1[0].mianimg,out i);
                    var strs = ls1[0].Images.Split(';');

                    sb.Append($"\"ProTitle\":\""+ls1[0].ProTitle+ "\",\"Baishuqi\":\"" + ls1[0].BianShuQi + "\",\"baojia\":\"" + ls1[0].baojia + "\",\"id\":\"" + ls1[0].Id + "\",\"img\":\"" + (strs.Length>i?strs[i]:"") + "\",\"pronum\":\"" + ls1[0].ProNum + "\",\"sellernumber\":\"" + ls1[0].SellerNumber + "\",\"shangpaitime\":\"" + ls1[0].ShangPaiTime + "\"");
                }
                
            }
            context.Response.Write("{"+sb+"}");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}