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
   public class CarDetialInfoDb : OrmLiteFactory
    {
        private static OrmLiteConnectionFactory _dbFactory;
        public CarDetialInfoDb()
        {
            _dbFactory = new OrmLiteConnectionFactory(ZnmDbConnectionString, SqlServerDialect.Provider);
            // _dbFactory = new OrmLiteConnectionFactory(ConnectionString, SqliteDialect.Provider);
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<CarDetialInfo>();
            }
        }
        /// <summary>
        /// 修改商户防部的信息的短号
        /// </summary>
        /// <param name="shortNum"></param>
        /// <param name="shopnum"></param>
        public void UpdateCarinfoByShopnum(string shortNum,string shopnum)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        db.Update<CarDetialInfo>(new { proNum = shortNum }, p => p.SellerNumber == shopnum);
                        return;
                    }
                }
                catch (Exception ex1)
                {
                    error++;
                    Thread.Sleep(10000);
                    LogServer.WriteLog(ex1.Message, "DBError");
                }
            } while (error < 4);
           
        }

        public void AddCarinfo(CarDetialInfo item)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        if (item.Id == 0)
                        {
                            item.CreateTime = DateTime.Now;

                            db.Insert(item);
                        }
                        else
                        {
                            var old = db.SingleById<CarDetialInfo>(item.Id);
                            item.CreateTime = old.CreateTime;
                            db.Update(item);
                        }
              
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
        public CarDetialInfo GetCarinfo(int id)
        {
            if (id == 0)
                return null;
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                      return  db.SingleById<CarDetialInfo>(id);
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

        public void DelCarinfo(string shopnum, int id)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        var itempro= db.Single<CarDetialInfo>(c => c.Id == id);
                        if (itempro == null)
                            return;

                        if (itempro.SellerNumber != shopnum)
                            return;

                        db.DeleteById<CarDetialInfo>(id);

                    }
                }
                catch (Exception ex1)
                {
                    error++;
                    Thread.Sleep(10000);
                    LogServer.WriteLog(ex1.Message, "DBError");
                }
            } while (error < 4);
        }

        public List<CarDetialInfo> GetCarLIst(string Num)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        var query= db.From<CarDetialInfo>().Where(c => c.SellerNumber == Num).OrderByDescending(c => c.Id);
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
        public int ExecSql(string sql)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return db.ExecuteNonQuery(sql);
                    }
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
        public List<CarDetialInfo> GetDBSql(string sql)
        {
            List<CarDetialInfo> ls = new List<CarDetialInfo>();
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        var list2 = db.QueryMultiple(sql, commandType: CommandType.Text);
                        IEnumerable<CarDetialInfo> firstSet = list2.Read<CarDetialInfo>();
                        ls.AddRange(firstSet);
                        return ls;
                    }
                }
                catch (Exception ex1)
                {
                    error++;
                    Thread.Sleep(10000);
                    LogServer.WriteLog(ex1.Message, "DBError");
                }
            } while (error < 4);
            return ls;
        }

        public IEnumerable<CarDetialInfo> Exec(string where, int page, int pagecount, string order, int orderby, out int TotalRecord, out int TotalPage)
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
                        dynamicParameters.Add("@TableName", "CarDetialInfo");
                        dynamicParameters.Add("@ReturnFields", "*");
                        dynamicParameters.Add("@PageSize", pagecount);
                        dynamicParameters.Add("@PageIndex", page);
                        dynamicParameters.Add("@Where", where);
                        dynamicParameters.Add("@Orderfld", order);
                        dynamicParameters.Add("@OrderType", orderby);
                        dynamicParameters.Add("@TotalRecord", dbType: DbType.Int32, direction: ParameterDirection.Output);
                        dynamicParameters.Add("@TotalPage", dbType: DbType.Int32, direction: ParameterDirection.Output);

                        var list2 = db.QueryMultiple("SupesoftPage", dynamicParameters, commandType: CommandType.StoredProcedure);

                        var firstSet = list2.Read<CarDetialInfo>();
                        TotalPage = dynamicParameters.Get<int>("@TotalPage");
                        TotalRecord = dynamicParameters.Get<int>("@TotalRecord");
                        //var s = "exec SupesoftPage 'CarDetialInfo','*'," + pagecount + "," + page + ",'" + where + "' ,'" + order + "'," + orderby;


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
