using System;
using System.Threading;
using Commons;
using Entitys;
using ServiceStack.OrmLite;
using System.Collections.Generic;
using ServiceStack.OrmLite.Dapper;
using System.Data;

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

        public List<ShopInfo> GetAllShopinfo()
        {
            using (var db = _dbFactory.OpenDbConnection())
            {
                return db.Select<ShopInfo>();
            }
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
        public bool DeleteData(int id)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        error=db.DeleteById<ShopInfo>(id);
                        return true;
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
            return false;
        }
        public int UpdateData(ShopInfo data)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return db.Update(data);
                                              
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
            return 0;
        }

        public ShopInfo GetShopinfo(string shopNum)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {

                        return db.Single<ShopInfo>(c => c.ShopNum == shopNum);
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

        public int ExecSql(string sql)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return  db.ExecuteNonQuery(sql);
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
            return 0;

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
        public IEnumerable<ShopInfo> ExecDB(string where, int page, int pagecount, string order, int orderby, out int TotalRecord, out int TotalPage)
        {
            TotalRecord = 0;
            TotalPage = 0;
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        var dynamicParameters = new DynamicParameters();
                        dynamicParameters.Add("@TableName", "ShopInfo");
                        dynamicParameters.Add("@ReturnFields", "*");
                        dynamicParameters.Add("@PageSize", pagecount);
                        dynamicParameters.Add("@PageIndex", page);
                        dynamicParameters.Add("@Where", where);
                        dynamicParameters.Add("@Orderfld", order);
                        dynamicParameters.Add("@OrderType", orderby);
                        dynamicParameters.Add("@TotalRecord", dbType: DbType.Int32, direction: ParameterDirection.Output);
                        dynamicParameters.Add("@TotalPage", dbType: DbType.Int32, direction: ParameterDirection.Output);

                        var list2 = db.QueryMultiple("SupesoftPage", dynamicParameters, commandType: CommandType.StoredProcedure);

                        var firstSet = list2.Read<ShopInfo>();
                        TotalPage = dynamicParameters.Get<int>("@TotalPage");
                        TotalRecord = dynamicParameters.Get<int>("@TotalRecord");
                        return firstSet;
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