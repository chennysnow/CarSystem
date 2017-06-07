using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using Commons;
using Entitys;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Dapper;

namespace DataBase
{
    public class prologDb : OrmLiteFactory
    {
        // Fields
        private static OrmLiteConnectionFactory _dbFactory =
            new OrmLiteConnectionFactory(OrmLiteFactory.ZnmDbConnectionString, SqlServerDialect.Provider);

        // Methods
        public prologDb()
        {
            using (IDbConnection connection = _dbFactory.OpenDbConnection())
            {
                connection.CreateTable<prolog>(false);
            }
        }

        public void Addprolog(prolog item)
        {
            int num = 0;
            do
            {
                try
                {
                    using (IDbConnection connection = _dbFactory.OpenDbConnection())
                    {
                        connection.Insert<prolog>(item, false);
                    }
                    break;
                }
                catch (Exception exception)
                {
                    num++;
                    Thread.Sleep(0x2710);
                    LogServer.WriteLog(exception.Message, "DBError");
                }
            } while (num < 4);
        }

        public prolog GetNextlog(string proid)
        {
            int num = 0;
            do
            {
                try
                {
                    using (IDbConnection connection = _dbFactory.OpenDbConnection())
                    {
                       var currobj= connection.Single<prolog>(c => c.proid == proid);
                        if (currobj == null)
                            return null;
                        return connection.Single<prolog>(c => c.Id > currobj.Id);
                    }
                    break;
                }
                catch (Exception exception)
                {
                    num++;
                    Thread.Sleep(0x2710);
                    LogServer.WriteLog(exception.Message, "DBError");
                }
            } while (num < 4);
            return null;
        }

        public void Updateprolog(prolog item)
        {
            int num = 0;
            do
            {
                try
                {
                    using (IDbConnection connection = _dbFactory.OpenDbConnection())
                    {
                        connection.Update<prolog>(new { item.proName }, p => p.proid == item.proid);
                    }
                    break;
                }
                catch (Exception exception)
                {
                    num++;
                    Thread.Sleep(0x2710);
                    LogServer.WriteLog(exception.Message, "DBError");
                }
            } while (num < 4);
        }

        public void Addprolog(List<prolog> item)
        {
            int num = 0;
            do
            {
                try
                {
                    using (IDbConnection connection = _dbFactory.OpenDbConnection())
                    {
                        connection.InsertAll<prolog>(item);
                    }
                    break;
                }
                catch (Exception exception)
                {
                    num++;
                    Thread.Sleep(0x2710);
                    LogServer.WriteLog(exception.Message, "DBError");
                }
            } while (num < 4);
        }

        public List<prolog> GetproLogById(string shopnum)
        {
            int num = 0;
            do
            {
                try
                {
                    using (IDbConnection connection = _dbFactory.OpenDbConnection())
                    {
                        var q =connection.From<prolog>().Where(c => c.shopNumber == shopnum);
                      
                        var list= connection.Select(q);
                        
                        return list;

                    }
                }
                catch (Exception exception)
                {
                    num++;
                    Thread.Sleep(0x2710);
                    LogServer.WriteLog(exception.Message, "DBError");
                }
            } while (num < 4);
            return null;

        }
    }




}
