using Commons;
using Entitys;
using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace DataBase
{
    public class InfoDb : OrmLiteFactory
    {
        private static OrmLiteConnectionFactory _dbFactory;
        public InfoDb()
        {
            _dbFactory = new OrmLiteConnectionFactory(ZnmDbConnectionString, SqlServerDialect.Provider);
            // _dbFactory = new OrmLiteConnectionFactory(ConnectionString, SqliteDialect.Provider);
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<Info>();
            }



        }
        public List<Info> getAllInfo(int leng,int type)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        var query = db.From<Info>().Where(c => c.type==type).OrderByDescending("id").Take(leng);
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
