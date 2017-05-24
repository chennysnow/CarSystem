using System;
using System.Threading;
using Commons;
using Entitys;
using ServiceStack.OrmLite;
using System.Collections.Generic;

namespace DataBase
{

    public class CnAreaCodeDb : OrmLiteFactory
    {
        private static OrmLiteConnectionFactory _dbFactory;
        public CnAreaCodeDb()
        {
            _dbFactory = new OrmLiteConnectionFactory(ZnmDbConnectionString, SqlServerDialect.Provider);
            // _dbFactory = new OrmLiteConnectionFactory(ConnectionString, SqliteDialect.Provider);
            using (var db = _dbFactory.OpenDbConnection())
            {
                db.CreateTable<CnAreaCode>();
            }
        }
        public void AddCnAreaCode()
        {
            var mmbdb= new OrmLiteConnectionFactory("Data Source=115.238.147.232,7188;Initial Catalog=mmb;Persist Security Info=True;User ID=mmbtools;Password=mmb189p@ssw0rd.188", SqlServerDialect.Provider);
            var list = new List<CnAreaCode>();
            using (var db = mmbdb.OpenDbConnection())
            {
                list = db.SqlList<CnAreaCode>("select AreaCode ,Province as ProvinceName,City as CityName,County as CountyName,Zone,[Enable] from ST_AreaCode");
            }
            using (var db = _dbFactory.OpenDbConnection())
            {
                WordCenter server =new WordCenter();

                foreach (var areaCode in list)
                {
                    areaCode.CityPy = server.GetPyString(areaCode.CityName);
                    areaCode.ProvincePy = server.GetPyString(areaCode.ProvinceName);
                    areaCode.CountyPy = server.GetPyString(areaCode.CountyName);
                }

                  db.InsertAll(list);
            }


        }


    }
}
