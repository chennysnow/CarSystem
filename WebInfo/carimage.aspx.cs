using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInfo
{
    public partial class carimage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            byte[] imagebyte;
            var id = Request["p"];
            if (id == null)
                return ;
            int towidth = 0, toheight = 0;
            var RequestPath = System.Web.HttpRuntime.AppDomainAppPath;
            var file = id.Replace("small", "disp").Replace("load", "disp");
            var path = Path.Combine(RequestPath, file);
            Response.ContentType = "image/jpeg";
            if (System.IO.File.Exists(path) == true)
            {//存在图片
             // return File(file, "image/jpeg");
                imagebyte = File.ReadAllBytes(path); //Get image data by image’s ID                
                Response.BinaryWrite(imagebyte);
                return;
            }
            else
            {
                var str = id.Replace("small", "load").Replace("disp", "load");
                var i = str.LastIndexOf(".");
                var strs = (i > 0 ? str.Substring(0, i) : str).Split('_');
                if (strs.Length > 0)
                { // 则缩放               
                    var stb = strs[0].TrimStart('/').TrimStart('\\');
                    var ste = strs[1].Replace("X", "x").Split('x');
                    int.TryParse(ste[0], out towidth);
                    if (ste.Length > 1)
                        int.TryParse(ste[1], out toheight);
                    //file= Path.Combine(RequestPath,string.Join("_",strs));
                    var path1 = Path.GetDirectoryName(path);
                    if (!Directory.Exists(path1))
                    {
                        Directory.CreateDirectory(path1);
                    }
                    var picpath = Path.Combine(RequestPath, stb);
                    if (System.IO.File.Exists(picpath) == false)
                    {
                        imagebyte = File.ReadAllBytes(Path.Combine(RequestPath, "jscss/images/wt1.jpg")); //Get image data by image’s ID                
                        Response.BinaryWrite(imagebyte);
                        return;
                    }

                    System.Drawing.Image originalImage = System.Drawing.Image.FromFile(picpath);
                    int ow = originalImage.Width;
                    int oh = originalImage.Height;
                    int x = 0;
                    int y = 0;
                    if (towidth > 0 && toheight > 0)
                    {
                        var h1 = (double)originalImage.Height / toheight;
                        var w1 = (double)originalImage.Width / towidth;
                        if (h1 > w1)
                            towidth = originalImage.Width * toheight / originalImage.Height;
                        else
                            toheight = originalImage.Height * towidth / originalImage.Width;
                    }
                    else if (towidth > 0 && toheight == 0)
                        toheight = originalImage.Height * towidth / originalImage.Width;
                    else if (towidth == 0 && toheight > 0)
                        towidth = originalImage.Width * toheight / originalImage.Height;
                    else
                    {
                        towidth = originalImage.Width;
                        toheight = originalImage.Height;
                    }
                    //新建一个bmp图片 
                    System.Drawing.Image bitmap = new Bitmap(towidth, toheight);

                    //新建一个画板 
                    Graphics g1 = System.Drawing.Graphics.FromImage(bitmap);

                    //设置高质量插值法 
                    g1.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

                    //设置高质量,低速度呈现平滑程度 
                    g1.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                    //清空画布并以透明背景色填充 
                    g1.Clear(Color.Transparent);
                    //在指定位置并且按指定大小绘制原图片的指定部分 
                    g1.DrawImage(originalImage, new Rectangle(0, 0, towidth, toheight),
                        new Rectangle(x, y, ow, oh),
                        GraphicsUnit.Pixel);
                    MemoryStream ms = new MemoryStream();
                    try
                    {
                        //以jpg格式保存缩略图 

                        bitmap.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                        bitmap.Save(path, System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                    catch (System.Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        originalImage.Dispose();
                        bitmap.Dispose();
                        g1.Dispose();
                    }

                    Response.BinaryWrite(ms.ToArray());
                    return ;
                }
            }
            imagebyte = File.ReadAllBytes(Path.Combine(RequestPath, "jscss/images/wt1.jpg"));
            Response.BinaryWrite(imagebyte);
        }
    }
}