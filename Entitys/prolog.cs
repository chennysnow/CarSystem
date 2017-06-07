using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ServiceStack.DataAnnotations;

namespace Entitys
{
    public class prolog
    {
        // Properties
        [AutoIncrement]
        public int Id { get; set; }

        public string proid { get; set; }

        public string proName { get; set; }
        public string shopNumber { get; set; }
        
        public int state { get; set; }

    }
}
