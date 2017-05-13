using System;
using ServiceStack.DataAnnotations;

namespace Entitys
{
    public class CarTypeInfo
    {
        [AutoIncrement]
        public int Id { get; set; }
        public string DisplayName { get; set; }
        public string CarTypeKey { get; set; }
        public string ParentDisplayName { get; set; }
        public string ParentCarTypeKey { get; set; }
    }
}
