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
using ServiceStack.Text.Pools;

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
                        return connection.Single<prolog>(c => c.Id > currobj.Id && c.state==0);
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

        public void Updateprolog(prolog item)
        {
            int num = 0;
            do
            {
                try
                {
                    using (IDbConnection connection = _dbFactory.OpenDbConnection())
                    {
                        connection.Update<prolog>(new { item.proName,item.state }, p => p.proid == item.proid);
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
            if(item==null||item.Count==0)
                return;
            
            do
            {
                try
                {
                    StringBuilder proids = new StringBuilder();
                    foreach (var prolog in item)
                    {
                        proids.Append(prolog.proid);
                        proids.Append(",");
                    }

                    using (IDbConnection connection = _dbFactory.OpenDbConnection())
                    {
                        var oldlist = connection.Select<prolog>("select * from prolog where proid in ("+proids.ToString().TrimEnd(',')+")");
                        if (oldlist.Count > 0)
                        {
                            foreach (var olditem in oldlist)
                            {
                                var tempitem = item.FirstOrDefault(c => c.proid == olditem.proid);
                                item.Remove(tempitem);
                            }
                        }
                        if(item.Count>0)
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
