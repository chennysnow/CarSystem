using System;
using System.Threading;
using Commons;
using Entitys;
using ServiceStack.OrmLite;
using System.Collections.Generic;

namespace DataBase
{
    public class BandInfoDb : OrmLiteFactory
    {
        private static OrmLiteConnectionFactory _dbFactory;
        public BandInfoDb()
        {
            _dbFactory = new OrmLiteConnectionFactory(ZnmDbConnectionString, SqlServerDialect.Provider);
            // _dbFactory = new OrmLiteConnectionFactory(ConnectionString, SqliteDialect.Provider);
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<BandInfo>();
            }
        }

        public void AddBandInfo(BandInfo item)
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

        public void AddBandInfo(List<BandInfo> list)
        {

            using (var db = _dbFactory.OpenDbConnection())
            {
                try
                {
                    db.InsertAll(list);
                }
                catch (Exception ex)
                {

                    foreach (BandInfo info in list)
                    {
                        try
                        {
                            using (var db1 = _dbFactory.OpenDbConnection())
                            {
                                db1.Insert(info);
                            }
                        }
                        catch (Exception ex1)
                        {

                            LogServer.WriteLog(ex1.Message, "DBError");
                        }

                    }

                    LogServer.WriteLog(ex, "DBError");

                }
            }


        }

        public List<BandInfo> GetBandInfoByParentNum(string parentId)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return db.Select<BandInfo>(p => p.ParentBrandNum == parentId);
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

        public BandInfo getBrandByKey(string key)
        {

            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return db.Single<BandInfo>(p => p.BrandNum == key);
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
