using System;
using System.Threading;
using Commons;
using Entitys;
using ServiceStack.OrmLite;
using System.Collections.Generic;

namespace DataBase
{
    public class CarTypeInfoDb : OrmLiteFactory
    {
        private static OrmLiteConnectionFactory _dbFactory;
        public CarTypeInfoDb()
        {
            _dbFactory = new OrmLiteConnectionFactory(ZnmDbConnectionString, SqlServerDialect.Provider);
            // _dbFactory = new OrmLiteConnectionFactory(ConnectionString, SqliteDialect.Provider);
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<CarTypeInfo>();
            }
        }
        public void AddCarinfo(CarTypeInfo item)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
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

        public List<CarTypeInfo> GetAllCarType()
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return db.Select<CarTypeInfo>();
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
            return null;
        }

        public CarTypeInfo GetCarinfo(CarTypeInfo item)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return db.Single<CarTypeInfo>(c => c.DisplayName == item.DisplayName);
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

            return null;

        }
    }
}
