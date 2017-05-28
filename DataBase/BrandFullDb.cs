using System;
using System.Collections.Generic;
using System.Threading;
using Commons;
using Entitys;
using ServiceStack.OrmLite;

namespace DataBase
{
    public class BrandFullDb : OrmLiteFactory
    {
        private static OrmLiteConnectionFactory _dbFactory;
        public BrandFullDb()
        {
            _dbFactory = new OrmLiteConnectionFactory(ZnmDbConnectionString, SqlServerDialect.Provider);
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<BrandFull>();
            }
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<AutoHomeBrand>();
            }
        }

        public void AddBandInfo(List<BrandFull> list)
        {

            using (var db = _dbFactory.OpenDbConnection())
            {
                try
                {
                    db.InsertAll(list);
                }
                catch (Exception ex)
                {
                    LogServer.WriteLog(ex, "DBError");
                }
            }


        }


        public void AddBandInfo(List<AutoHomeBrand> list)
        {

            using (var db = _dbFactory.OpenDbConnection())
            {
                try
                {
                    db.InsertAll(list);
                }
                catch (Exception ex)
                {
                    LogServer.WriteLog(ex, "DBError");
                }
            }
        }

        public List<AutoHomeBrand> GetALlbrand()
        {
          
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return db.Select<AutoHomeBrand>();
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
