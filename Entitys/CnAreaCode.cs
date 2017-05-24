using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ServiceStack.DataAnnotations;
namespace Entitys
{
   public class CnAreaCode
    {
        [AutoIncrement]
        public int Id { get; set; }
        public string AreaCode { get; set; }
        public string ProvinceName { get; set; }
        public string ProvincePy { get; set; }

        public string CityName { get; set; }
        public string CityPy { get; set; }
        public string CountyName { get; set; }
        public string CountyPy { get; set; }
        /// <summary>
        ///7大区 华东 华南
        /// </summary>
        public int Zone { get; set; }
        public bool Enable { get; set; }
    }
}
