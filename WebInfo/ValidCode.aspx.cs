using Commons;
using System;
namespace WebInfo
{
    public partial class ValidCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var valid = new ValidateCodeHelper();
                string code = valid.CreateValidateCode(5);
                Session["validCode"] = code;
                var ImgCode = valid.CreateValidateGraphic(code);
                Response.ClearContent();
                Response.ContentType = "image/gif";
                Response.BinaryWrite(ImgCode);
            }
        }
    }
}