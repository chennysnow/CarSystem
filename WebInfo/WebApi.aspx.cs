using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase;
using Entitys;
using Newtonsoft.Json.Linq;

namespace WebInfo
{
    public partial class WebApi1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["userid"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}

            if (Request.Form["method"] == "gettask")
            {
                var id = Request.Form["id"];
                var item = new prologDb().GetNextlog(id);
                if (item == null)
                {
                    Response.Write("error obj is null");
                }
                else
                {
                    Response.Write(item.proid);
                }
                return;
            }

            if (Request.Form["method"] == "proadd")
            {
                string json = base.Request.Form["json"];
                JToken token = JToken.Parse(json);
                if (json.Contains("proid"))
                {
                    List<prolog> item = new List<prolog>();
                    foreach (JToken token2 in token)
                    {
                        prolog prolog = new prolog
                        {
                            proid = token2["proid"].Value<string>(),
                            proName = token2["proname"].Value<string>(),
                            shopNumber = token2["shopid"].Value<string>().Trim(),
                            state =0
                        };
                        item.Add(prolog);
                    }
                    new prologDb().Addprolog(item);
                }
                else
                {
                    var proid = token["id"].Value<string>();
                    var content = token["content"].ToString().Replace("\r","").Replace("\n", "");

                    new prologDb().Updateprolog(new prolog {proid =proid,proName = content,state = 1});
                }
           
            }
        }
    }
}