using System;
using System.Threading;
using Commons;
using Entitys;
using ServiceStack.OrmLite;

namespace DataBase
{
    public class ShopInfoDb : OrmLiteFactory
    {
        private static OrmLiteConnectionFactory _dbFactory;
        public ShopInfoDb()
        {
            _dbFactory = new OrmLiteConnectionFactory(ZnmDbConnectionString, SqlServerDialect.Provider);
            // _dbFactory = new OrmLiteConnectionFactory(ConnectionString, SqliteDialect.Provider);
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<ShopInfo>();
            }
        }

        public void AddShopInfo(ShopInfo item)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        item.CreateTime = DateTime.Now;

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


        public ShopInfo Login(string number, string pwd)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {

                        return db.Single<ShopInfo>(c => c.ShopNum == number && c.ShopPwd == pwd);
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

        public ShopInfo GetShopinfo(string number)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {

                        return db.Single<ShopInfo>(c => c.ShopNum == number);
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


        public ShopInfo getShopinfo(int id)
        {

            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return db.SingleById<ShopInfo>(id);
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
