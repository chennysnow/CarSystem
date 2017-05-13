using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ServiceStack.DataAnnotations;
namespace Entitys
{
    public class BandInfo
    {
        [AutoIncrement]
        public int Id { get; set; }
        /// <summary>
        /// 首字母
        /// </summary>
        public string FirstChart { get; set; }

        public string BrandName { get; set; }

        public string BrandNum { get; set; }

        public string ParentBrandNum { get; set; }

        public string DisplayName { get; set; }
        public DateTime CreateTime { get; set; }
    }
}
