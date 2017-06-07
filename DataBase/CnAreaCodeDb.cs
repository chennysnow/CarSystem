using System;
using System.Threading;
using Commons;
using Entitys;
using ServiceStack.OrmLite;
using System.Collections.Generic;

namespace DataBase
{

    public class CnAreaCodeDb : OrmLiteFactory
    {
        private static OrmLiteConnectionFactory _dbFactory;
        public CnAreaCodeDb()
        {
            _dbFactory = new OrmLiteConnectionFactory(ZnmDbConnectionString, SqlServerDialect.Provider);
            // _dbFactory = new OrmLiteConnectionFactory(ConnectionString, SqliteDialect.Provider);
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<CnAreaCode>();
            }
        }

        public List<CnAreaCode> getAllProvince()
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        var query = db.From<CnAreaCode>().Where(c => c.AreaCode.Contains("0000"));
                        return db.Select(query);
                    }
                }
                catch (Exception ex1)
                {
                    error++;
                    Thread.Sleep(10000);
                    LogServer.WriteLog(ex1.Message, "DBError");
                }
            } while (error < 4);
            return null;
        }
    }
}
