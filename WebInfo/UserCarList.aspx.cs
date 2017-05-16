using DataBase;
using Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class UserCarList : System.Web.UI.Page
    {
        public static List<CarTypeInfo> catTypeList;
        protected void Page_Load(object sender, EventArgs e)
        {
            var list = new CarDetialInfoDb().GetCarLIst("90002");
            if (catTypeList == null)
            {
                catTypeList = new CarTypeInfoDb().GetAllCarType();
            }
     
            repCarlist.DataSource = list;
            repCarlist.DataBind();
        }


        public string GetCatType(object key)
        {
            var item = catTypeList.FirstOrDefault(c => c.CarTypeKey == key.ToString());

            return item.DisplayName;
        }

    }
}