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
        public int id { get; set; } = 0;
        /// <summary>
        /// 首字母
        /// </summary>
        public string title { get; set; } = "";

        public string context { get; set; } = "";

        public string image { get; set; } = "";

        public DateTime cdate { get; set; } = DateTime.Now;
        public int type { get; set; } = 1;

        public string username { get; set; } = "";
        public string contact { get; set; } = "";
        public int start { get; set; } = 0;
        public int topday { get; set; } = 0;
        public DateTime topdate { get; set; } = DateTime.Now;
    }
}
