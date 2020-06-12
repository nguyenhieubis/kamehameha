using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_TEST_ETLMaster
{
    class Program
    {
        static void Main(string[] args)
        {
            string connection_string_1 = "Server=192.168.1.243;Database=ETLMaster;User Id=sa;Password=P@ssw0rd1;";
            string batch_type = "Source2Staging";
            string collection_types = "DB";
            int load_type = 0;
            DateTime new_watermark_value = DateTime.Now;
            DateTime manual_start_date = DateTime.Now;
            int batch_id = -9;
            bool is_parallel = true;
            string decryption_key = "fb.com/dobuinguyenhieu";

            SqlConnection Connection_Master_ADONET = new SqlConnection(connection_string_1);
            Connection_Master_ADONET.Open();

            string connection_string = ETLMaster.ETLMaster.ETL_GetConnectionETLMaster(Connection_Master_ADONET, decryption_key);

            ETLMaster.ETLMaster etl_master = new ETLMaster.ETLMaster(connection_string, batch_id, batch_type, collection_types, decryption_key, new_watermark_value,
                load_type, manual_start_date);
            etl_master.ETL_LoadDataSource2Destination(is_parallel);
            etl_master.ETL_UpdateBatchID();


            Connection_Master_ADONET.Close();
            Console.WriteLine("DONE");
            Console.Read();
        }
    }
}
