using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using kamehameha;

namespace ConsoleApp_TEST_ETLMaster
{
    class Program
    {
        static void Main(string[] args)
        {
            string connection_string_1 = "Data Source=localhost;Initial Catalog=ETLMaster;Integrated Security=True;";
            SqlConnection ETLMaster_ADONET = new SqlConnection(connection_string_1);
            ETLMaster_ADONET.Open();

            string batch_type = "Source2Staging";
            string collection_types = "DB,File";
            int load_type = 0;
            DateTime manual_start_date = DateTime.Now;
            bool is_parallel = true;
            string decryption_key = "fb.com/dobuinguyenhieu";


            string connection_string = ETLMaster.ETL_GetConnectionETLMaster(ETLMaster_ADONET, decryption_key);
            
            DateTime new_watermark_value = DateTime.Now;
            ETLMaster etl_master = new ETLMaster(connection_string, batch_type, collection_types, decryption_key, new_watermark_value, load_type, manual_start_date);
            

            // Check if batch_type is running?
            //if (!etl_master.ETL_CheckBatchIsRunning())
            //{
            //    try
            //    {
            //        // Create BatchID
            //        etl_master.BatchID = etl_master.ETL_GetBatchID();
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


            ETLMaster_ADONET.Close();
            Console.WriteLine("DONE");
            Console.Read();
        }
    }
}
