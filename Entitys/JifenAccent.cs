using System;
using ServiceStack.DataAnnotations;


namespace Entitys
{
    public class JifenAccent
    {
        [AutoIncrement]
        public int Id { get; set; }
        public int Shopid { get; set; }
        public int jiFen { get; set; }
        public int ditial { get; set; }
        public int lessJifen { get; set; }

        public string fromType { get; set; }

        public DateTime CreateDate { get; set; }

    }
}
