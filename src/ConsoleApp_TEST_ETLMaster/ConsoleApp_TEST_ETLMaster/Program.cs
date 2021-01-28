using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using kamehameha;
using Oracle.ManagedDataAccess.Client;


namespace ConsoleApp_TEST_ETLMaster
{
    class Program
    {
        static void Main(string[] args)
        {
            string connection_string = ETLMaster.GetConnectionString("Oracle", "52.163.122.149", null, "hieudo", "123");
            Console.WriteLine(connection_string);
            OracleConnection conn = new OracleConnection(connection_string);
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "get_products";
            DataTable dt = new DataTable();
            OracleParameter pmt = new OracleParameter("my_cursor", OracleDbType.RefCursor, dt, ParameterDirection.Output);
            cmd.Parameters.Add(pmt);

            conn.Open();
            cmd.ExecuteNonQuery();
            Console.WriteLine(dt.Rows.Count);
            conn.Close();

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
