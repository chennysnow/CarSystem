﻿using System;
using System;
using ServiceStack.DataAnnotations;

namespace Entitys
{
    public class ShopInfo
    {
        [AutoIncrement]
        public int Id { get; set; }
        public string CompanyName { get; set; }
        public string PhoneNumber { get; set; }
        public string IdCart { get; set; }
        public string BusinessLicense { get; set; }
        public DateTime CreateTime { get; set; }
    }
}
