using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console_DimDate
{
    class Program
    {
        static void Main(string[] args)
        {
            // Server=myServerAddress;Database=myDataBase;Trusted_Connection=True;
            // Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;
            string Connection_String = "Server=datatyksql.database.windows.net;Database=AdventureWorksDW;User Id=Datatyk;Password=P@ssword123;";

            SqlConnection conn = new SqlConnection(Connection_String);
            conn.Open();

            // Create data DimDate
            int start_year = 2010;
            int end_year = 2049;
            for (int i = start_year; i <= end_year; i++)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PopulateDateDimensionForYear";
                cmd.CommandTimeout = 300;
                SqlParameter para = new SqlParameter("@YearNumber", i);
                cmd.Parameters.Add(para);

                cmd.ExecuteNonQuery();
            }

            string query = "SELECT * FROM d_date WHERE LunarDate IS NULL";
            SqlCommand cmd_DimDate = new SqlCommand(query, conn);

            DataTable dt_DimDate = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd_DimDate);
            sda.Fill(dt_DimDate);

            foreach (DataRow dr in dt_DimDate.Rows)
            {
                ChineseLunisolarCalendar lunar = new ChineseLunisolarCalendar();
                DateTime date = (DateTime)dr["Date"];
                int lunar_year = lunar.GetYear(date);
                int lunar_month = lunar.GetMonth(date);
                int lunar_day = lunar.GetDayOfMonth(date);
                bool lunar_is_leap_year = lunar.IsLeapYear(lunar_year);

                dr["LunarIsLeapYear"] = lunar_is_leap_year;
                dr["LunarYear"] = lunar_year;
                dr["LunarMonth"] = lunar_month;
                dr["LunarDay"] = lunar_day;
                dr["LunarIsLeapMonth"] = false;
                if (lunar_is_leap_year == true && lunar_month >= lunar.GetLeapMonth(lunar_year))
                {
                    if (lunar_month == lunar.GetLeapMonth(lunar_year))
                        dr["LunarIsLeapMonth"] = true;
                    lunar_month--;
                }
                dr["LunarDate"] = dr["LunarYear"].ToString() + "-" + ConvertDate2String(lunar_month) + "-" + ConvertDate2String(lunar_day);
            }

            SqlCommand cmd_upsert = new SqlCommand();
            cmd_upsert.Connection = conn;
            cmd_upsert.CommandType = CommandType.StoredProcedure;
            cmd_upsert.CommandText = "usp_upsert_lunar_d_date";
            cmd_upsert.CommandTimeout = 300;
            cmd_upsert.Parameters.Add(new SqlParameter("@tvp", dt_DimDate));

            cmd_upsert.ExecuteNonQuery();

            conn.Close();
            Console.WriteLine("--------------DONE--------------");
            Console.Read();
        }

        public static string ConvertDate2String(int k)
        {
            if (k < 10)
            {
                return "0" + k.ToString();
            }
            return k.ToString();
        }
    }
}
