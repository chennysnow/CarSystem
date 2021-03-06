﻿using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Net;

namespace Commons
{
    public class ImageServer
    {
        /// <summary> 
        /// 生成缩略图 (正式使用这个函数)
        /// </summary> 
        /// <param name="SourceFile">文件在服务器上的物理地址</param> 
        /// <param name="strSavePathFile">保存在服务器上的路径（物理地址）</param> 
        /// <param name="ThumbWidth">宽度</param> 
        /// <param name="ThumbHeight">高度</param> 
        /// <param name="BgColor">背景</param> 
        public void myGetThumbnailImage(string SourceFile, string strSavePathFile, int ThumbWidth, int ThumbHeight, string BgColor)
        {
            var oImg = System.Drawing.Image.FromFile(SourceFile);

      


            //小图 
            int intwidth, intheight;
            //当图片的宽度大于高度
            if (oImg.Width > oImg.Height)
            {
                if (ThumbWidth > 0)  //限制了宽度
                {
                    if (oImg.Width > ThumbWidth)
                    {
                        intwidth = ThumbWidth;
                        intheight = (oImg.Height * ThumbWidth) / oImg.Width;
                    }
                    else
                    {
                        intwidth = oImg.Width;
                        intheight = oImg.Height;
                    }
                }
                else//不限制宽度，那就意味着限制高度
                {
                    if (oImg.Height > ThumbHeight)
                    {
                        intwidth = (oImg.Width * ThumbHeight) / oImg.Height;
                        intheight = ThumbHeight;
                    }
                    else
                    {
                        intwidth = oImg.Width;
                        intheight = oImg.Height;
                    }
                }
            }
            else
            {
                if (ThumbHeight > 0)
                {
                    if (oImg.Height > ThumbHeight)
                    {
                        intwidth = (oImg.Width * ThumbHeight) / oImg.Height;
                        intheight = ThumbHeight;
                    }
                    else
                    {
                        intwidth = oImg.Width;
                        intheight = oImg.Height;
                    }
                }
                else
                {
                    if (oImg.Width > ThumbWidth)
                    {
                        intwidth = ThumbWidth;
                        intheight = (oImg.Height * ThumbWidth) / oImg.Width;
                    }
                    else
                    {
                        intwidth = oImg.Width;
                        intheight = oImg.Height;
                    }
                }
            }
            //构造一个指定宽高的Bitmap 
            Bitmap bitmay = new Bitmap(intwidth, intheight);
            Graphics g = Graphics.FromImage(bitmay);
            Color myColor;
            if (BgColor == null)
                myColor = Color.FromName("white");
            else
                myColor = Color.FromName(BgColor);
            //用指定的颜色填充Bitmap 
            g.Clear(myColor);
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.Low;// HighQualityBicubic;//最高质量的缩略
            //开始画图 
            g.DrawImage(oImg, new Rectangle(0, 0, intwidth, intheight), new Rectangle(0, 0, oImg.Width, oImg.Height), GraphicsUnit.Pixel);
            bitmay.Save(strSavePathFile, System.Drawing.Imaging.ImageFormat.Jpeg);
            g.Dispose();
            bitmay.Dispose();
            oImg.Dispose();
        }

        /// <summary> 
        /// 生成缩略图 
        /// </summary> 
        /// <param name="originalImagePath">源图路径（物理路径）</param> 
        /// <param name="thumbnailPath">缩略图路径（物理路径）</param> 
        /// <param name="width">缩略图宽度</param> 
        /// <param name="height">缩略图高度</param> 
        /// <param name="mode">生成缩略图的方式</param>   
        public  void MakeThumbnail(string originalImagePath, string thumbnailPath, int width, int height, string mode)
        {
            Image originalImage = Image.FromFile(originalImagePath);
            string sourpath = thumbnailPath.Substring(0, thumbnailPath.LastIndexOf("\\"));

            if (!Directory.Exists(sourpath))
            {
                Directory.CreateDirectory(sourpath);
            }


            int towidth = width;
            int toheight = height;

            int x = 0;
            int y = 0;
            int ow = originalImage.Width;
            int oh = originalImage.Height;

            switch (mode)
            {
                case "HW"://指定高宽缩放（可能变形）                 
                    break;
                case "W"://指定宽，高按比例                     
                    toheight = originalImage.Height * width / originalImage.Width;
                    break;
                case "H"://指定高，宽按比例 
                    towidth = originalImage.Width * height / originalImage.Height;
                    break;
                case "Cut"://指定高宽裁减（不变形）                 
                    if ((double)originalImage.Width / (double)originalImage.Height > (double)towidth / (double)toheight)
                    {
                        oh = originalImage.Height;
                        ow = originalImage.Height * towidth / toheight;
                        y = 0;
                        x = (originalImage.Width - ow) / 2;
                    }
                    else
                    {
                        ow = originalImage.Width;
                        oh = originalImage.Width * height / towidth;
                        x = 0;
                        y = (originalImage.Height - oh) / 2;
                    }
                    break;
                default:
                    break;
            }

            //新建一个bmp图片 
            Image bitmap = new System.Drawing.Bitmap(towidth, toheight);

            //新建一个画板 
            Graphics g = System.Drawing.Graphics.FromImage(bitmap);

            //设置高质量插值法 
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

            //设置高质量,低速度呈现平滑程度 
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

            //清空画布并以透明背景色填充 
            g.Clear(Color.Transparent);

            //在指定位置并且按指定大小绘制原图片的指定部分 
            g.DrawImage(originalImage, new Rectangle(0, 0, towidth, toheight),
                new Rectangle(x, y, ow, oh),
                GraphicsUnit.Pixel);

            try
            {
                //以jpg格式保存缩略图 
                bitmap.Save(thumbnailPath, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            catch (System.Exception e)
            {
                throw e;
            }
            finally
            {
                originalImage.Dispose();
                bitmap.Dispose();
                g.Dispose();
            }
        }


        public string DownloadImg(string surl, string picurlDir)
        {

            string wlDir = picurlDir;
            //String wlDir2 = picurlDir + "/Thumb";

            if (!Directory.Exists(wlDir))
            {
                Directory.CreateDirectory(wlDir);
            }
            //if (!Directory.Exists(wlDir2))
            //{
            //    Directory.CreateDirectory(wlDir2);
            //}

            string filePath = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            filePath += new Random().Next(99).ToString("00");


            try
            {
                var sfile = filePath + ".jpg";
                var wlfile = wlDir + "\\" + sfile;
                WebClient myWebClient = new WebClient();
                myWebClient.DownloadFile(surl, wlfile);

                //int[] list = { 32, 60, 80, 100, 160, 220, 360 };
                //foreach (var type in list)
                //{
                //    String wlfile2 = wlDir2 + "\\" + type + sfile;
                //    myGetThumbnailImage(wlfile, wlfile2, type, type, null);
                //}

                return sfile;
            }
            catch
            {
                return "";
            }


        }


        public string DownloadSouceImg(string surl, string picurlDir)
        {

            string wlDir = picurlDir;
            //String wlDir2 = picurlDir + "/Thumb";

            if (!Directory.Exists(wlDir))
            {
                Directory.CreateDirectory(wlDir);
            }
            //if (!Directory.Exists(wlDir2))
            //{
            //    Directory.CreateDirectory(wlDir2);
            //}

            string filePath = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            filePath += new Random().Next(99).ToString("00");


            try
            {
                var sfile = filePath + ".jpg";
                var wlfile = wlDir + "\\" + sfile;
                WebClient myWebClient = new WebClient();
                myWebClient.DownloadFile(surl, wlfile);

                //int[] list = { 32, 60, 80, 100, 160, 220, 360 };
                //foreach (var type in list)
                //{
                //    String wlfile2 = wlDir2 + "\\" + type + sfile;
                //    myGetThumbnailImage(wlfile, wlfile2, type, type, null);
                //}

                return sfile;
            }
            catch
            {
                return "";
            }


        }

        public static string DoloadImg(byte[] data, string picurlDir)
        {

            String wlDir = picurlDir;//HttpContext.Current.Server.MapPath(picurlDir);
            String wlDir2 = picurlDir + "/Thumb";

            if (!Directory.Exists(wlDir))
            {
                Directory.CreateDirectory(wlDir);
            }
            if (!Directory.Exists(wlDir2))
            {
                Directory.CreateDirectory(wlDir2);
            }

            string filePath = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            filePath += new Random().Next(99).ToString("00");


            try
            {
                MemoryStream ms = new MemoryStream(data);
                Image image = System.Drawing.Image.FromStream(ms);

                String wlfile = wlDir + "\\" + filePath + ".jpg";

                image.Save(wlfile);
                ms.Close();
                return wlfile;
            }
            catch (Exception ex)
            {
                LogServer.WriteLog(ex);
                return "";
            }


        }

        public byte[] GetPictureData(string imagepath)
        {
            try
            {
                string imgPath = imagepath; //HttpContext.Current.Server.MapPath(imagepath);
                if (!File.Exists(imgPath))
                    return null;
                /**/
                ////根据图片文件的路径使用文件流打开，并保存为byte[] 
                FileStream fs = new FileStream(imgPath, FileMode.Open); //可以是其他重载方法 
                byte[] byData = new byte[fs.Length];
                fs.Read(byData, 0, byData.Length);
                fs.Close();
                return byData;
            }
            catch (Exception)
            {
                return null;
            }
        }

        private static Random randNum = new Random();
        //将文件名转化为时间方式
        private string CreateFilePath(string fext)
        {
            string filePath = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            filePath += new Random().Next(99).ToString("00");
            filePath += "." + fext;
            return filePath;
        }

        public static string CreateImageFromBytes(string fileName, byte[] buffer)
        {
            string file = fileName;
            Image image = BytesToImage(buffer);
            ImageFormat format = image.RawFormat;
            if (format.Equals(ImageFormat.Jpeg))
            {
                file += ".jpeg";
            }
            else if (format.Equals(ImageFormat.Png))
            {
                file += ".png";
            }
            else if (format.Equals(ImageFormat.Bmp))
            {
                file += ".bmp";
            }
            else if (format.Equals(ImageFormat.Gif))
            {
                file += ".gif";
            }
            else if (format.Equals(ImageFormat.Icon))
            {
                file += ".icon";
            }
            System.IO.FileInfo info = new System.IO.FileInfo(file);
            System.IO.Directory.CreateDirectory(info.Directory.FullName);
            File.WriteAllBytes(file, buffer);
            return file;
        }

        /// <summary>
        /// Convert Byte[] to Image
        /// </summary>
        /// <param name="buffer"></param>
        /// <returns></returns>
        public static Image BytesToImage(byte[] buffer)
        {
            MemoryStream ms = new MemoryStream(buffer);
            Image image = System.Drawing.Image.FromStream(ms);

            return image;
        }


        /// <summary>
        /// 加图片水印
        /// </summary>
        /// <param name="img">要加水印的原图﻿(System.Drawing)</param>
        /// <param name="filename">文件名</param>
        /// <param name="watermarkFilename">水印文件名</param>
        /// <param name="watermarkStatus">图片水印位置1=左上 2=中上 3=右上 4=左中  5=中中 6=右中 7=左下 8=右中 9=右下</param>
        /// <param name="quality">加水印后的质量0~100,数字越大质量越高</param>
        /// <param name="watermarkTransparency">水印图片的透明度1~10,数字越小越透明,10为不透明</param>
        public static void ImageWaterMarkPic(Image img, string filename, string watermarkFilename, int watermarkStatus, int quality, int watermarkTransparency)
        {
            Graphics g = Graphics.FromImage(img);
            //设置高质量插值法
            //g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
            //设置高质量,低速度呈现平滑程度
            //g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
            Image watermark = new Bitmap(watermarkFilename);

            if (watermark.Height >= img.Height || watermark.Width >= img.Width)
                return;

            ImageAttributes imageAttributes = new ImageAttributes();
            ColorMap colorMap = new ColorMap();

            colorMap.OldColor = Color.FromArgb(255, 0, 255, 0);
            colorMap.NewColor = Color.FromArgb(0, 0, 0, 0);
            ColorMap[] remapTable = { colorMap };

            imageAttributes.SetRemapTable(remapTable, ColorAdjustType.Bitmap);

            float transparency = 0.5F;
            if (watermarkTransparency >= 1 && watermarkTransparency <= 10)
                transparency = (watermarkTransparency / 10.0F);


            float[][] colorMatrixElements = {
                                                new float[] {1.0f,  0.0f,  0.0f,  0.0f, 0.0f},
                                                new float[] {0.0f,  1.0f,  0.0f,  0.0f, 0.0f},
                                                new float[] {0.0f,  0.0f,  1.0f,  0.0f, 0.0f},
                                                new float[] {0.0f,  0.0f,  0.0f,  transparency, 0.0f},
                                                new float[] {0.0f,  0.0f,  0.0f,  0.0f, 1.0f}
                                            };

            ColorMatrix colorMatrix = new ColorMatrix(colorMatrixElements);

            imageAttributes.SetColorMatrix(colorMatrix, ColorMatrixFlag.Default, ColorAdjustType.Bitmap);

            int xpos = 0;
            int ypos = 0;

            switch (watermarkStatus)
            {
                case 1:
                    xpos = (int)(img.Width * (float).01);
                    ypos = (int)(img.Height * (float).01);
                    break;
                case 2:
                    xpos = (int)((img.Width * (float).50) - (watermark.Width / 2));
                    ypos = (int)(img.Height * (float).01);
                    break;
                case 3:
                    xpos = (int)((img.Width * (float).99) - (watermark.Width));
                    ypos = (int)(img.Height * (float).01);
                    break;
                case 4:
                    xpos = (int)(img.Width * (float).01);
                    ypos = (int)((img.Height * (float).50) - (watermark.Height / 2));
                    break;
                case 5:
                    xpos = (int)((img.Width * (float).50) - (watermark.Width / 2));
                    ypos = (int)((img.Height * (float).50) - (watermark.Height / 2));
                    break;
                case 6:
                    xpos = (int)((img.Width * (float).99) - (watermark.Width));
                    ypos = (int)((img.Height * (float).50) - (watermark.Height / 2));
                    break;
                case 7:
                    xpos = (int)(img.Width * (float).01);
                    ypos = (int)((img.Height * (float).99) - watermark.Height);
                    break;
                case 8:
                    xpos = (int)((img.Width * (float).50) - (watermark.Width / 2));
                    ypos = (int)((img.Height * (float).99) - watermark.Height);
                    break;
                case 9:
                    xpos = (int)((img.Width * (float).99) - (watermark.Width));
                    ypos = (int)((img.Height * (float).99) - watermark.Height);
                    break;
            }

            g.DrawImage(watermark, new Rectangle(xpos, ypos, watermark.Width, watermark.Height), 0, 0, watermark.Width, watermark.Height, GraphicsUnit.Pixel, imageAttributes);

            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
            ImageCodecInfo ici = null;
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.MimeType.IndexOf("jpeg") > -1)
                    ici = codec;
            }
            EncoderParameters encoderParams = new EncoderParameters();
            long[] qualityParam = new long[1];
            if (quality < 0 || quality > 100)
                quality = 80;

            qualityParam[0] = quality;

            EncoderParameter encoderParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, qualityParam);
            encoderParams.Param[0] = encoderParam;

            if (ici != null)
                img.Save(filename, ici, encoderParams);
            else
                img.Save(filename);

            g.Dispose();
            img.Dispose();
            watermark.Dispose();
            imageAttributes.Dispose();
        }

        /// <summary>
        /// 增加图片文字水印
        /// </summary>
        /// <param name="img">要加水印的原图﻿(﻿System.Drawing)</param>
        /// <param name="filename">文件名</param>
        /// <param name="watermarkText">水印文字</param>
        /// <param name="watermarkStatus">图片水印位置1=左上 2=中上 3=右上 4=左中  5=中中 6=右中 7=左下 8=右中 9=右下</param>
        /// <param name="quality">加水印后的质量0~100,数字越大质量越高</param>
        /// <param name="fontname">水印的字体</param>
        /// <param name="fontsize">水印的字号</param>
        public static void ImageWaterMarkText(Image img, string filename, string watermarkText, int watermarkStatus, int quality, string fontname, int fontsize)
        {
            Graphics g = Graphics.FromImage(img);
            Font drawFont = new Font(fontname, fontsize, FontStyle.Regular, GraphicsUnit.Pixel);
            SizeF crSize;
            crSize = g.MeasureString(watermarkText, drawFont);

            float xpos = 0;
            float ypos = 0;

            switch (watermarkStatus)
            {
                case 1:
                    xpos = (float)img.Width * (float).01;
                    ypos = (float)img.Height * (float).01;
                    break;
                case 2:
                    xpos = ((float)img.Width * (float).50) - (crSize.Width / 2);
                    ypos = (float)img.Height * (float).01;
                    break;
                case 3:
                    xpos = ((float)img.Width * (float).99) - crSize.Width;
                    ypos = (float)img.Height * (float).01;
                    break;
                case 4:
                    xpos = (float)img.Width * (float).01;
                    ypos = ((float)img.Height * (float).50) - (crSize.Height / 2);
                    break;
                case 5:
                    xpos = ((float)img.Width * (float).50) - (crSize.Width / 2);
                    ypos = ((float)img.Height * (float).50) - (crSize.Height / 2);
                    break;
                case 6:
                    xpos = ((float)img.Width * (float).99) - crSize.Width;
                    ypos = ((float)img.Height * (float).50) - (crSize.Height / 2);
                    break;
                case 7:
                    xpos = (float)img.Width * (float).01;
                    ypos = ((float)img.Height * (float).99) - crSize.Height;
                    break;
                case 8:
                    xpos = ((float)img.Width * (float).50) - (crSize.Width / 2);
                    ypos = ((float)img.Height * (float).99) - crSize.Height;
                    break;
                case 9:
                    xpos = ((float)img.Width * (float).99) - crSize.Width;
                    ypos = ((float)img.Height * (float).99) - crSize.Height;
                    break;
            }

            //g.DrawString(watermarkText, drawFont, new SolidBrush(Color.White), xpos + 1, ypos + 1);文字阴影
            g.DrawString(watermarkText, drawFont, new SolidBrush(Color.Black), xpos, ypos);

            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
            ImageCodecInfo ici = null;
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.MimeType.IndexOf("jpeg") > -1)
                    ici = codec;
            }
            EncoderParameters encoderParams = new EncoderParameters();
            long[] qualityParam = new long[1];
            if (quality < 0 || quality > 100)
                quality = 80;

            qualityParam[0] = quality;

            EncoderParameter encoderParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, qualityParam);
            encoderParams.Param[0] = encoderParam;

            if (ici != null)
                img.Save(filename, ici, encoderParams);
            else
                img.Save(filename);

            g.Dispose();
            img.Dispose();
        }



        /// 无损压缩图片    
        /// <param name="sFile">原图片</param>    
        /// <param name="dFile">压缩后保存位置</param>    
        /// <param name="dHeight">高度</param>    
        /// <param name="dWidth"></param>    
        /// <param name="flag">压缩质量(数字越小压缩率越高) 1-100</param>    
        /// <returns></returns>    

        public static bool GetPicThumbnail(string sFile, string dFile, int dHeight, int dWidth, int flag)
        {
            System.Drawing.Image iSource = System.Drawing.Image.FromFile(sFile);
            ImageFormat tFormat = iSource.RawFormat;
            int sW = 0, sH = 0;

            //按比例缩放  
            Size tem_size = new Size(iSource.Width, iSource.Height);

            if (tem_size.Width > dHeight || tem_size.Width > dWidth)
            {
                if ((tem_size.Width * dHeight) > (tem_size.Width * dWidth))
                {
                    sW = dWidth;
                    sH = (dWidth * tem_size.Height) / tem_size.Width;
                }
                else
                {
                    sH = dHeight;
                    sW = (tem_size.Width * dHeight) / tem_size.Height;
                }
            }
            else
            {
                sW = tem_size.Width;
                sH = tem_size.Height;
            }

            Bitmap ob = new Bitmap(dWidth, dHeight);
            Graphics g = Graphics.FromImage(ob);

            g.Clear(Color.WhiteSmoke);
            g.CompositingQuality = CompositingQuality.HighQuality;
            g.SmoothingMode = SmoothingMode.HighQuality;
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;

            g.DrawImage(iSource, new Rectangle((dWidth - sW) / 2, (dHeight - sH) / 2, sW, sH), 0, 0, iSource.Width, iSource.Height, GraphicsUnit.Pixel);

            g.Dispose();
            //以下代码为保存图片时，设置压缩质量    
            EncoderParameters ep = new EncoderParameters();
            long[] qy = new long[1];
            qy[0] = flag;//设置压缩的比例1-100    
            EncoderParameter eParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, qy);
            ep.Param[0] = eParam;
            try
            {
                ImageCodecInfo[] arrayICI = ImageCodecInfo.GetImageEncoders();
                ImageCodecInfo jpegICIinfo = null;
                for (int x = 0; x < arrayICI.Length; x++)
                {
                    if (arrayICI[x].FormatDescription.Equals("JPEG"))
                    {
                        jpegICIinfo = arrayICI[x];
                        break;
                    }
                }
                if (jpegICIinfo != null)
                {
                    ob.Save(dFile, jpegICIinfo, ep);//dFile是压缩后的新路径    
                }
                else
                {
                    ob.Save(dFile, tFormat);
                }
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                iSource.Dispose();
                ob.Dispose();
            }
        }
    }
}