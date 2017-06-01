using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using Commons;
using Entitys;
using ServiceStack.OrmLite;

namespace DataBase
{
    public class ApiLogInfoDb : OrmLiteFactory
    {
        private static OrmLiteConnectionFactory _dbFactory;
        public ApiLogInfoDb()
        {
            _dbFactory = new OrmLiteConnectionFactory(ZnmDbConnectionString, SqlServerDialect.Provider);
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<ApiLogInfo>();
            }
        }
        public void AddApiLogo(ApiLogInfo item)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        item.CreateDate = DateTime.Now;

                        db.Insert(item);
                    }
                    break;
                }
                catch (Exception ex1)
                {
                    error++;
                    Thread.Sleep(10000);
                    LogServer.WriteLog(ex1.Message, "DBError");
                }
            } while (error < 4);

        }
    }
}
