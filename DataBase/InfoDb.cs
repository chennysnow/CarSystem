using Commons;
using Entitys;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Dapper;
using System;
using System.Collections.Generic;
using System.Data;
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
                        if (type == 2)
                        {
                            var date = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                            var query = db.From<Info>().Where(c => c.type == type && c.start == 1 && c.topdate>=date).OrderByDescending("id").Take(leng);
                            return db.Select(query);
                        }
                        else
                        {
                            var query = db.From<Info>().Where(c => c.type == type && c.start == 1).OrderByDescending("id").Take(leng);
                            return db.Select(query);
                        }
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
        public void Addinfo(Info item)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        if (item.id == 0)
                        {
                            item.cdate = DateTime.Now;
                            db.Insert(item);
                        }
                        else
                        {
                            var old = db.SingleById<Info>(item.id);
                           // item.cdate = old.cdate;
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
        public Info Getinfo(int id)
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
                        return db.SingleById<Info>(id);
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

        public void Delinfo(string shopnum, int id)
        {
            int error = 0;
            do
            {
                try
                {
                    using (var db = _dbFactory.OpenDbConnection())
                    {
                        var itempro = db.Single<Info>(c => c.id == id);
                        if (itempro == null)
                            return;

                        if (itempro.username != shopnum)
                            return;

                        db.DeleteById<Info>(id);

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

        public IEnumerable<Info> Exec(string where, int page, int pagecount, string order, int orderby, out int TotalRecord, out int TotalPage)
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
                        dynamicParameters.Add("@TableName", "info");
                        dynamicParameters.Add("@ReturnFields", "*");
                        dynamicParameters.Add("@PageSize", pagecount);
                        dynamicParameters.Add("@PageIndex", page);
                        dynamicParameters.Add("@Where", where);
                        dynamicParameters.Add("@Orderfld", order);
                        dynamicParameters.Add("@OrderType", orderby);
                        dynamicParameters.Add("@TotalRecord", dbType: DbType.Int32, direction: ParameterDirection.Output);
                        dynamicParameters.Add("@TotalPage", dbType: DbType.Int32, direction: ParameterDirection.Output);

                        var list2 = db.QueryMultiple("SupesoftPage", dynamicParameters, commandType: CommandType.StoredProcedure);

                        var firstSet = list2.Read<Info>();
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
