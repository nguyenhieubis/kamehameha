//using Microsoft.VisualBasic.FileIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using CsvHelper;
//using System.IO;
//using System.Globalization;
//using System.Data.Common;
//using ExcelDataReader;
using MongoDB.Driver;
using MongoDB.Bson;
//using kamehameha;
//using Oracle.ManagedDataAccess.Client;


namespace ConsoleApp_TEST_ETLMaster
{
    public static class DataReaderExtension
    {
        public static IEnumerable<T> Enumerate<T>(this T reader) where T : IDataReader
        {
            using (reader)
                while (reader.Read())
                    yield return reader;
        }
    }
    class Program
    {
        public static DataTable GetDataTable_DB_MongoDB(string server, string database, string user, string password, string driver, string port, string collection, string col_query,
            string watermark_column, DateTime watermark_value, DateTime new_watermark_value)
        {
            string conn_str = "mongodb://" + Uri.EscapeDataString(user) + ":" + Uri.EscapeDataString(password) + "@" + server;
            conn_str += port.Length > 0 ? (":" + port) : "";
            var myclient = new MongoClient(conn_str);
            var mydatabase = myclient.GetDatabase(database);
            var mycollection = mydatabase.GetCollection<BsonDocument>(collection);

            IFindFluent<BsonDocument, BsonDocument> result;
            if (watermark_column.Length > 0)
            {
                var builder = Builders<BsonDocument>.Filter;
                var query = builder.Gt(watermark_column, watermark_value) & builder.Lte(watermark_column, new_watermark_value);
                result = mycollection.Find(query);
            }
            else
            {
                result = mycollection.Find(new BsonDocument());
            }
            if (col_query.Replace("{", "").Replace("}", "").Length > 0)
            {
                ProjectionDefinition<BsonDocument> projection = col_query;
                result = result.Project(projection);
            }

            DataTable dt_data = new DataTable();
            foreach (var doc in result.ToList())
            {
                foreach (var elm in doc.Elements)
                {
                    string column_name = elm.Name.ToLower() == "_id" ? (elm.Name + "_mongodb") : elm.Name;
                    if (!dt_data.Columns.Contains(column_name))
                    {
                        dt_data.Columns.Add(new DataColumn(column_name));
                    }
                }
                DataRow dr = dt_data.NewRow();
                int i = 0;
                foreach (var elm in doc.Elements)
                {
                    dr[i] = elm.Value;
                    i++;
                }
                dt_data.Rows.Add(dr);
            }

            return dt_data;
        }
        static void Main(string[] args)
        {
            //string connection_string = ETLMaster.GetConnectionString("Oracle", "52.163.122.149", null, "hieudo", "123");
            //Console.WriteLine(connection_string);
            //OracleConnection conn = new OracleConnection(connection_string);
            //OracleCommand cmd = new OracleCommand();
            //cmd.Connection = conn;
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "get_products";
            //DataTable dt = new DataTable();
            //OracleParameter pmt = new OracleParameter("my_cursor", OracleDbType.RefCursor, dt, ParameterDirection.Output);
            //cmd.Parameters.Add(pmt);

            string connection_source_string = "Server=VMEzalor.mshome.net;Database=AdventureWorks2012;User Id=sa;Password=Hieu858406;";
            string connection_des_string = "Server=VMEzalor.mshome.net;Database=Dev_Staging;User Id=sa;Password=Hieu858406;";

            string csv_file_path = @"C:\Users\nguye\Downloads\AdventureWorks_SalesDetails.csv";

            DataTable dt = GetDataTable_DB_MongoDB("VMEzalor.mshome.net", "db_restaurants", "hieudo", "P@ssw0rd1", "", "", "restaurants", "{\"_id\": 1,\"address\": 1,\"borough\": 1,\"cuisine\": 1,\"grades\": 1,\"name\": 1,\"restaurant_id\": 1}", "", new DateTime(), new DateTime());
            Console.WriteLine(dt.Rows.Count);
            //var configuration = new CsvHelper.Configuration.CsvConfiguration(CultureInfo.InvariantCulture);
            //configuration.Delimiter = "|";
            //configuration.IgnoreBlankLines = true;
            //configuration.HasHeaderRecord = true;
            //using (var reader = new StreamReader(csv_file_path))
            //using (var csv = new CsvReader(reader, configuration))
            //{
            //    using (var dataReader = new CsvDataReader(csv))
            //    {

            //        using (SqlConnection conn_des = new SqlConnection(connection_des_string))
            //        {
            //            conn_des.Open();
            //            SqlCommand cmd_des = new SqlCommand("sp_upsert_Sales_SalesOrderDetail", conn_des);
            //            cmd_des.CommandType = CommandType.StoredProcedure;
            //            SqlParameter tvpParam = cmd_des.Parameters.AddWithValue("@tvp", DataReaderExtension.Enumerate(dataReader));
            //            tvpParam.SqlDbType = SqlDbType.Structured;
            //            cmd_des.CommandTimeout = 3600;
            //            cmd_des.ExecuteNonQuery();
            //        }
            //        //using (SqlBulkCopy bulkCopy = new SqlBulkCopy(connection_des_string))
            //        //{
            //        //    bulkCopy.BatchSize = 3000; //Data will be sent to SQL Server in batches of this size
            //        //    bulkCopy.EnableStreaming = true;
            //        //    bulkCopy.DestinationTableName = "Sales_SalesOrderDetail";
            //        //    bulkCopy.WriteToServer(dataReader);
            //        //}
            //    }
            //}

            //using (TextFieldParser csvReader = new TextFieldParser(csv_file_path))
            //{
            //    csvReader.SetDelimiters(new string[] { "|" });
            //    csvReader.HasFieldsEnclosedInQuotes = true;
            //    csvReader.TrimWhiteSpace = true;
            //    string[] colFields = csvReader.ReadFields();
            //    foreach (string column in colFields)
            //    {
            //        Console.WriteLine(column);
            //    }
            //    using (SqlBulkCopy bulkCopy = new SqlBulkCopy(connection_des_string))
            //    {
            //        bulkCopy.BatchSize = 3000; //Data will be sent to SQL Server in batches of this size
            //        bulkCopy.EnableStreaming = true;
            //        bulkCopy.DestinationTableName = "Sales_SalesOrderDetail";
            //        bulkCopy.WriteToServer();
            //    }
            //    //using (SqlConnection conn_des = new SqlConnection(connection_des_string))
            //    //{
            //    //    conn_des.Open();
            //    //    SqlCommand cmd_des = new SqlCommand("sp_upsert_Sales_SalesOrderDetail", conn_des);
            //    //    cmd_des.CommandType = CommandType.StoredProcedure;
            //    //    SqlParameter tvpParam = cmd_des.Parameters.AddWithValue("@tvp", csvReader);
            //    //    tvpParam.SqlDbType = SqlDbType.Structured;
            //    //    cmd_des.CommandTimeout = 3600;
            //    //    cmd_des.ExecuteNonQuery();
            //    //}
            //}

            //using (SqlConnection conn = new SqlConnection(connection_source_string))
            //{
            //    conn.Open();
            //    SqlCommand cmd = new SqlCommand("sp_select_Sales_SalesOrderDetail", conn);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddRange(new SqlParameter[] { new SqlParameter("@WatermarkValue", new DateTime(1900, 1, 1)), new SqlParameter("@NewWatermarkValue", new DateTime(2022, 1, 1)) });
            //    SqlDataReader reader = cmd.ExecuteReader();

            //    using (SqlConnection conn_des = new SqlConnection(connection_des_string))
            //    {
            //        conn_des.Open();
            //        SqlCommand cmd_des = new SqlCommand("sp_upsert_Sales_SalesOrderDetail", conn_des);
            //        cmd_des.CommandType = CommandType.StoredProcedure;
            //        SqlParameter tvpParam = cmd_des.Parameters.AddWithValue("@tvp", reader);
            //        tvpParam.SqlDbType = SqlDbType.Structured;
            //        cmd_des.CommandTimeout = 3600;
            //        cmd_des.ExecuteNonQuery();
            //    }

            //}


            //string connection_string_1 = ETLMaster.GetConnectionString("SQLServer", "datatyksql.database.windows.net", "easycredit", "Datatyk", "P@ssword123");
            //SqlConnection ETLMaster_ADONET = new SqlConnection(connection_string_1);
            //ETLMaster_ADONET.Open();

            //string batch_type = "Source2Staging";
            //string collection_types = "DB";
            //int load_type = 0;
            //DateTime manual_start_date = DateTime.Now;
            //bool is_parallel = true;
            //string decryption_key = "fb.com/dobuinguyenhieu";


            //string connection_string = ETLMaster.ETL_GetConnectionETLMaster(ETLMaster_ADONET, decryption_key);

            //DateTime new_watermark_value = DateTime.Now;
            //ETLMaster etl_master = new ETLMaster(connection_string, batch_type, collection_types, decryption_key, new_watermark_value, load_type, manual_start_date);


            //// Check if batch_type is running?
            //if (!etl_master.ETL_CheckBatchIsRunning())
            //{
            //    try
            //    {
            //        // Create BatchID
            //        etl_master.ETL_GetBatchID();
            //        etl_master.ETL_LoadDataSource2Destination(is_parallel);
            //    }
            //    finally
            //    {
            //        etl_master.ETL_UpdateBatchID();
            //        if (etl_master.ETL_CheckBatchIsFailed())
            //        {
            //            string error_description = etl_master.ETL_GetErrorDescription();
            //            Console.WriteLine(error_description);
            //        }
            //    }
            //}


            //ETLMaster_ADONET.Close();
            Console.WriteLine("DONE");
            Console.Read();
        }
    }
}
