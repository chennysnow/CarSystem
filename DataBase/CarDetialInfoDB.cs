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
                            //db.SingleById<CarDetialInfo>(item.Id);
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

        public List<CarDetialInfo> GetCarLIst(string Num)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        return db.Select<CarDetialInfo>(c=>c.SellerNumber==Num);
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
