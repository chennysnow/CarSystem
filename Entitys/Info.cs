using ServiceStack.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entitys
{
   public  class Info
    {
        [AutoIncrement]
        public int id { get; set; }
        /// <summary>
        /// 首字母
        /// </summary>
        public string title { get; set; }

        public string context { get; set; }

        public string image { get; set; }

        public DateTime cdate  { get; set; }
        public int type { get; set; }

        public string username { get; set; }

        public string contact { get; set; }
    }
}
