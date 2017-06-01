using System;
using ServiceStack.DataAnnotations;

namespace Entitys
{
    public class ApiLogInfo
    {
        [AutoIncrement]
        public int Id { get; set; }
        public string LogType { get; set; }

        public string UserIp { get; set; }
        public string Referer { get; set; }

        public string UserAgent { get; set; }

        public string Remark { get; set; }

        public DateTime CreateDate { get; set; }
    }
}
