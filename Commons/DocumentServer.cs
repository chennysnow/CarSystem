using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Commons
{
    public class DocumentServer
    {
        public static void SetJsonConfig(string json, string fileName)
        {

            string strFilePath = AppDomain.CurrentDomain.SetupInformation.ApplicationBase.Replace("\\", "/") + "/Config/";
            if (!Directory.Exists(strFilePath))
            {
                Directory.CreateDirectory(strFilePath);
            }
            if (fileName.IndexOf('.') == -1)
                fileName += ".json";
            string FileName = strFilePath + fileName;
            FileInfo file = new FileInfo(FileName);
            if (file.Exists)
            { file.Delete(); }
            FileStream stream = file.Open(FileMode.OpenOrCreate, FileAccess.Write, FileShare.ReadWrite);
            stream.Seek(0, SeekOrigin.End);
            byte[] buffer1 = Encoding.UTF8.GetBytes(json);
            stream.Write(buffer1, 0, buffer1.Length);
            //byte[] buffer2 = new byte[] { Convert.ToByte('\r'), Convert.ToByte('\n') };
            //stream.Write(buffer2, 0, 2);
            stream.Flush();
            stream.Close();

        }

        public static string GetJsonConfig(string fileName)
        {
            string strFilePath = AppDomain.CurrentDomain.SetupInformation.ApplicationBase.Replace("\\", "/") + "/Config/";
            if (!Directory.Exists(strFilePath))
                return "";
            if (fileName.IndexOf('.') == -1)
                fileName += ".json";
            string filefullName = strFilePath + fileName;
            FileInfo file = new FileInfo(filefullName);
            if (file.Exists)
            {
                var fileinfo = file.OpenText();
                string content = fileinfo.ReadToEnd();
                fileinfo.Close();
                fileinfo.Dispose();
                return content;
            }
            return "";

        }
    }
}
