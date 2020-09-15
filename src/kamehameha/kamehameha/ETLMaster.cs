//using MongoDB.Bson;
//using MongoDB.Driver;
//using MySql.Data.MySqlClient;
//using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace kamehameha
{
    public class ETLMaster
    {
        #region Properties & Constructor
        // Private variable
        private string ConnectionString = "Server= localhost; Database= ETLMaster; Integrated Security=True;";
        private int BatchID = -9;
        private string BatchType = "Source2Staging";
        private string CollectionTypes = "File,DB";
        private int LoadType = 0;
        private DateTime? ManualStartDateTime = new DateTime(2020, 01, 01);
        private DateTime NewWatermarkValue = DateTime.Now;
        private string DecryptionKey = "fb.com/dobuinguyenhieu";
        private int CommandTimeoutSource = 3000;
        private int CommandTimeoutDestination = 4000;
        private int ParallelOption_MaxDegreeOfParallelism = Environment.ProcessorCount / 2;
        // Public property
        public int Batch_ID { get { return BatchID; } }
        public string Batch_Type { get { return BatchType; } }
        public string Collection_Types { get { return CollectionTypes; } }
        public int Load_Type { get { return LoadType; } }
        public DateTime Manual_Start_DateTime { get { return Convert.ToDateTime(ManualStartDateTime); } }
        public DateTime New_Watermark_Value { get { return NewWatermarkValue; } }
        public int Command_Timeout_Source { get { return CommandTimeoutSource; } set { CommandTimeoutSource = value; } }
        public int Command_Timeout_Destination { get { return CommandTimeoutDestination; } set { CommandTimeoutDestination = value; } }
        public int Parallel_Option_MaxDegreeOfParallelism { get { return ParallelOption_MaxDegreeOfParallelism; } set { ParallelOption_MaxDegreeOfParallelism = value; } }
        public ETLMaster() { }
        public ETLMaster(string sql_connection_string, string batch_type, string collection_types, string decryption_key,
            DateTime new_watermark_value, int load_type = 0, DateTime? manual_start_datetime = null)
        {
            ConnectionString = sql_connection_string;
            BatchType = batch_type;
            CollectionTypes = collection_types;
            LoadType = load_type;
            NewWatermarkValue = new_watermark_value;
            ManualStartDateTime = manual_start_datetime;
            //BatchID = -9;
            DecryptionKey = decryption_key;
        }

        /*
        public ETLMaster(string sql_connection_string, int batch_id, string batch_type, string collection_types, string decryption_key,
            DateTime new_watermark_value, int load_type = 0, DateTime? manual_start_datetime = null)
        {
            ConnectionString = sql_connection_string;
            BatchType = batch_type;
            CollectionTypes = collection_types;
            LoadType = load_type;
            NewWatermarkValue = new_watermark_value;
            ManualStartDateTime = manual_start_datetime;
            BatchID = batch_id;
            DecryptionKey = decryption_key;
        }
        */
        #endregion

        #region Interact with ETLMaster database
        public bool ETL_CheckBatchIsRunning()
        {
            string batch_type = BatchType;
            string connection_string = ConnectionString;

            SqlConnection sc = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_check_batch_is_running";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@batch_type", batch_type)
            });

            var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Bit);
            returnParameter.Direction = ParameterDirection.ReturnValue;

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();

            bool is_running = Convert.ToBoolean(returnParameter.Value);
            return is_running;
        }
        public bool ETL_CheckBatchIsFailed()
        {
            string connection_string = ConnectionString;
            int batch_id = BatchID;

            SqlConnection sc = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_check_batch_is_failed";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@batch_id", batch_id)
            });

            var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Bit);
            returnParameter.Direction = ParameterDirection.ReturnValue;

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();

            bool is_failed = Convert.ToBoolean(returnParameter.Value);
            return is_failed;

        }
        private void ETL_ChangeWatermarkValueByLoadType(string a_collection_type)
        {
            string connection_string = ConnectionString;
            string batch_type = BatchType;
            int load_type = LoadType;
            DateTime? manual_start_date = ManualStartDateTime;

            SqlConnection sc = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_change_watermark_value_by_load_type";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@batch_type", batch_type)
                ,new SqlParameter("@collection_type", a_collection_type)
                ,new SqlParameter("@load_type", load_type)
                ,new SqlParameter("@manual_start_date", manual_start_date)
            });

            var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnParameter.Direction = ParameterDirection.ReturnValue;

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();
        }
        private DataTable ETL_GetListDataPipelines(string a_collection_type)
        {
            string batch_type = BatchType;
            string decryption_key = DecryptionKey;

            SqlConnection sc = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_get_list_data_pipelines";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@batch_type", batch_type)
                ,new SqlParameter("@collection_type", a_collection_type)
                ,new SqlParameter("@decryption_key", decryption_key)
            });
            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sc.Open();
            sda.Fill(dt);
            sc.Close();

            return dt;
        }
        public void ETL_GetBatchID()
        {
            if (BatchID <= 0)
            {
                string batch_type = BatchType;
                string collection_types = CollectionTypes;
                int load_type = LoadType;
                DateTime? manual_start_datetime = ManualStartDateTime;
                DateTime new_watermark_value = NewWatermarkValue;
                string machine_name = Environment.MachineName;
                string user_name = Environment.UserName;
                string batch_name = batch_type + " " + new_watermark_value.ToShortDateString() + " " + new_watermark_value.ToLongTimeString();

                SqlConnection sc = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sc;
                cmd.CommandText = "dbo.etl_get_batch_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(new SqlParameter[]
                {
                new SqlParameter("@batch_type", batch_type)
                ,new SqlParameter("@batch_name", batch_name)
                ,new SqlParameter("@collection_types", collection_types)
                ,new SqlParameter("@new_watermark_value", new_watermark_value)
                ,new SqlParameter("@load_type", load_type)
                ,new SqlParameter("@manual_start_datetime", manual_start_datetime)
                ,new SqlParameter("@machine_name", machine_name)
                ,new SqlParameter("@user_name", user_name)
                });

                var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;

                sc.Open();
                cmd.ExecuteNonQuery();
                sc.Close();

                int batch_id = Convert.ToInt32(returnParameter.Value);
                BatchID = batch_id;
            }
        }
        private int ETL_GetLogID(int watermark_id, DateTime watermark_value)
        {
            int batch_id = BatchID;
            DateTime new_watermark_value = NewWatermarkValue;

            SqlConnection sc = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_get_log_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@batch_id", batch_id)
                ,new SqlParameter("@watermark_id", watermark_id)
                ,new SqlParameter("@watermark_value", watermark_value)
                ,new SqlParameter("@new_watermark_value", new_watermark_value)
            });

            var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnParameter.Direction = ParameterDirection.ReturnValue;

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();

            int log_id = Convert.ToInt32(returnParameter.Value);
            return log_id;
        }
        private int ETL_GetFileLogID(int log_id, string file_name, string full_path_input)
        {
            SqlConnection sc = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_get_filelog_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@log_id", log_id)
                ,new SqlParameter("@file_name", file_name)
                ,new SqlParameter("@full_path_input", full_path_input)
            });

            var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnParameter.Direction = ParameterDirection.ReturnValue;

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();

            int filelog_id = Convert.ToInt32(returnParameter.Value);
            return filelog_id;
        }
        private void ETL_InsertLogDetail(int connection_id, string connection_type, int watermark_id, int log_id, int? filelog_id, string object_log,
            TimeSpan time_span, int? extract_rows = null, int? before_import_rows = null, int? import_rows = null, int? after_import_rows = null)
        {
            int batch_id = BatchID;

            SqlConnection sc = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_insert_logdetail";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@connection_id", connection_id)
                ,new SqlParameter("@connection_type", connection_type)
                ,new SqlParameter("@watermark_id", watermark_id)
                ,new SqlParameter("@batch_id", batch_id)
                ,new SqlParameter("@log_id", log_id)
                ,new SqlParameter("@filelog_id", filelog_id)
                ,new SqlParameter("@object_log", object_log)
                ,new SqlParameter("@time_span", time_span)
                ,new SqlParameter("@extract_rows", extract_rows)
                ,new SqlParameter("@before_import_rows", before_import_rows)
                ,new SqlParameter("@import_rows", import_rows)
                ,new SqlParameter("@after_import_rows", after_import_rows)
            });

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();
        }
        private void ETL_InsertError(int log_id, string code, string description, int? filelog_id = null, string pipeline = null, string task = null)
        {
            int batch_id = BatchID;

            SqlConnection sc = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_insert_error";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@batch_id", batch_id)
                ,new SqlParameter("@log_id", log_id)
                ,new SqlParameter("@code", code)
                ,new SqlParameter("@description", description)
                ,new SqlParameter("@filelog_id", filelog_id)
                ,new SqlParameter("@pipeline", pipeline)
                ,new SqlParameter("@task", task)
            });

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();
        }
        private void ETL_UpdateFileLogID(int filelog_id, bool is_succeeded, string full_path_archive = null, int? extract_rows_file = null,
            int? before_import_rows_file = null, int? import_rows_file = null, int? after_import_rows_file = null)
        {
            SqlConnection sc = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_update_filelog_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@filelog_id", filelog_id)
                ,new SqlParameter("@is_succeeded", is_succeeded)
                ,new SqlParameter("@full_path_archive", full_path_archive)
                ,new SqlParameter("@extract_rows_file", extract_rows_file)
                ,new SqlParameter("@before_import_rows_file", before_import_rows_file)
                ,new SqlParameter("@import_rows_file", import_rows_file)
                ,new SqlParameter("@after_import_rows_file", after_import_rows_file)
            });

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();
        }
        private void ETL_UpdateLogID(int log_id, bool is_succeeded, int? extract_rows = null, int? before_import_rows = null,
            int? import_rows = null, int? after_import_rows = null)
        {
            SqlConnection sc = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_update_log_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@log_id", log_id)
                ,new SqlParameter("@is_succeeded", is_succeeded)
                ,new SqlParameter("@extract_rows", extract_rows)
                ,new SqlParameter("@before_import_rows", before_import_rows)
                ,new SqlParameter("@import_rows", import_rows)
                ,new SqlParameter("@after_import_rows", after_import_rows)
            });

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();
        }
        private void ETL_UpdateWatermarkID(int watermark_id, DateTime new_watermark_value)
        {
            SqlConnection sc = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_update_watermark_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@watermark_id", watermark_id)
                ,new SqlParameter("@new_watermark_value", new_watermark_value)
            });

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();
        }
        public void ETL_UpdateBatchID()
        {
            int batch_id = BatchID;

            SqlConnection sc = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_update_batch_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@batch_id", batch_id)
            });

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();
        }
        public string ETL_GetErrorDescription()
        {
            int batch_id = BatchID;
            string connection_string = ConnectionString;
            string decryption_key = DecryptionKey;

            SqlConnection sc = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sc;
            cmd.CommandText = "dbo.etl_get_error_description";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@batch_id", batch_id)
                ,new SqlParameter("@decryption_key", decryption_key)
            });

            var returnParameter = cmd.Parameters.Add("@error_description", SqlDbType.NVarChar, int.MaxValue);
            returnParameter.Direction = ParameterDirection.Output;

            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();

            string error_description = returnParameter.Value.ToString();
            return error_description;
        }
        #endregion

        #region Static Functions
        public static string ETL_GetConnectionETLMaster(SqlConnection conn, string decryption_key = "fb.com/dobuinguyenhieu")
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "dbo.etl_get_connection_etl_master";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new SqlParameter[]
            {
                new SqlParameter("@decryption_key", decryption_key)
            });

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            string connection_type = "";
            string database_type = "";
            string driver = "";
            string server = "";
            string database = "";
            string port = "";
            string user = "";
            string password = "";
            foreach (DataRow row in dt.Rows)
            {
                connection_type = row["connection_type"].ToString();
                database_type = row["database_type"].ToString();
                driver = row["driver"].ToString();
                server = row["server"].ToString();
                database = row["database"].ToString();
                port = row["port"].ToString();
                user = row["user"].ToString();
                password = row["password"].ToString();
            }

            string connection_string = GetConnectionString(database_type, server, database, user, password, driver, port);
            return connection_string;
        }
        public static void SendMailWhenFailed(string EmailFrom, string EmailFromPassword, string SMTPAddress, int PortNumber, string EmailTo, string SendMailSubject, string SendMailBody)
        {
            string[] emails = EmailTo.Split(',');

            MailMessage mail = new MailMessage(EmailFrom, emails[0].Trim(), SendMailSubject, SendMailBody);
            if (emails.Length > 1)
            {
                for (int i = 1; i < emails.Length; i++)
                {
                    mail.To.Add(emails[i].Trim());
                }
            }

            SmtpClient client = new SmtpClient(SMTPAddress, PortNumber);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential(EmailFrom, EmailFromPassword);
            client.Send(mail);
        }
        public static string GetConnectionString(string database_type, string server, string database, string user, string password, string driver = "", string port = "")
        {
            string connectionstring = "";

            // ODBC Connection
            if (driver.Length > 0)
            {
                if (driver[0] != '{')
                    driver = "{" + driver;
                if (driver[driver.Length - 1] != '}')
                    driver += "}";
                // Common ODBC Connection
                connectionstring = "Driver=" + driver + ";Server=" + server + ";Database=" + database + ";UID=" + user + ";PWD=" + password + ";";
                connectionstring += port.Length > 0 ? ("Port=" + port + ";") : "";
                // ODBC Connection of SQL Server
                if (database_type.ToLower() == "sqlserver" || database_type.ToLower() == "sql server")
                {
                    connectionstring = "Driver=" + driver + ";Server=" + server + ";Database=" + database + ";";
                    connectionstring += port.Length > 0 ? ("Port=" + port + ";") : "";
                    connectionstring += user.Length > 0 ? ("UID=" + user + ";PWD=" + password + ";") : "Trusted_Connection=yes;";
                }
            }
            // Other Connection
            else
            {
                if (database_type.ToLower() == "sqlserver" || database_type.ToLower() == "sql server")
                {
                    connectionstring = "Data Source=" + server;
                    connectionstring += port.Length > 0 ? "," + port : "";
                    connectionstring += ";Initial Catalog=" + database + ";";
                    connectionstring += user.Length > 0 ? ("User Id=" + user + ";Password=" + password + ";") : "Integrated Security=True;";
                }
                else if (database_type.ToLower() == "mysql")
                {
                    connectionstring = "Server=" + server + ";Database=" + database + ";Uid=" + user + ";Pwd=" + password + ";";
                    connectionstring += port.Length > 0 ? ("Port=" + port + ";") : "";
                }
                else if (database_type.ToLower() == "postgresql" || database_type.ToLower() == "postgres")
                {
                    connectionstring = "Server=" + server + ";Database=" + database + ";";
                    connectionstring += port.Length > 0 ? ("Port=" + port + ";") : "";
                    connectionstring += user.Length > 0 ? ("User Id=" + user + ";Password=" + password + ";") : "Integrated Security=True;";
                }
            }

            return connectionstring;
        }
        public static List<string> StringSplit_Custom(string text, char delimited = ',')
        {
            string[] rowValues = text.Split(delimited);

            List<string> rows = new List<string>();
            List<char> s_rows = new List<char>();
            string item_temp = "";
            foreach (string item in rowValues)
            {
                if (item.Length > 0)
                {
                    if (item[0] == '"')
                    {
                        s_rows.Add('"');
                    }
                    if (item[item.Length - 1] == '"')
                    {
                        s_rows.Add('"');
                    }
                }
                item_temp += delimited + item.Replace("\"", "");
                if (s_rows.Count() % 2 == 0)
                {
                    rows.Add(item_temp.Substring(1));
                    s_rows.Clear();
                    item_temp = "";
                }
            }

            return rows;
        }
        #endregion

        #region Object Functions
        private int SQL_GetNumberRows(string connection_string, string table)
        {
            SqlConnection cnn = new SqlConnection(connection_string);

            string query = "SELECT COUNT(1) FROM " + table + " (NOLOCK);";

            SqlCommand command = new SqlCommand();
            command.Connection = cnn;
            command.CommandText = query;
            command.CommandType = CommandType.Text;

            cnn.Open();
            int number = (int)command.ExecuteScalar();
            cnn.Close();

            return number;
        }
        private int SQL_GetNumberRows(string connection_string, string table, int log_id)
        {
            SqlConnection cnn = new SqlConnection(connection_string);

            string query = "SELECT COUNT(1) FROM " + table + " (NOLOCK)";

            if (log_id.ToString().Length > 0)
            {
                query += " WHERE _LogID = @log_id;";

            }
            else query += ";";

            SqlCommand command = new SqlCommand();
            command.Connection = cnn;
            command.CommandText = query;
            command.CommandType = CommandType.Text;

            if (log_id.ToString().Length > 0)
            {
                command.Parameters.Add(new SqlParameter("@log_id", log_id));
            }

            cnn.Open();
            int number = (int)command.ExecuteScalar();
            cnn.Close();

            return number;
        }
        private int SQL_GetNumberRows(string connection_string, string table, int log_id, int filelog_id)
        {
            SqlConnection cnn = new SqlConnection(connection_string);

            string query = "SELECT COUNT(1) FROM " + table + " (NOLOCK)";
            query += " WHERE _LogID = @log_id";

            if (filelog_id.ToString().Length > 0)
            {
                query += " AND _FileLogID = @filelog_id;";

            }
            else query += ";";

            SqlCommand command = new SqlCommand();
            command.Connection = cnn;
            command.CommandText = query;
            command.CommandType = CommandType.Text;

            command.Parameters.Add(new SqlParameter("@log_id", log_id));
            if (filelog_id.ToString().Length > 0)
            {
                command.Parameters.Add(new SqlParameter("@filelog_id", filelog_id));
            }

            cnn.Open();
            int number = (int)command.ExecuteScalar();
            cnn.Close();

            return number;
        }
        private string GetErrorDescription(Exception e, int flag)
        {
            string flag_name, description;
            switch (flag)
            {
                case 0:
                    flag_name = "ETLMaster";
                    break;
                case 1:
                    flag_name = "Source";
                    break;
                case 2:
                    flag_name = "Destination";
                    break;
                case 3:
                    flag_name = "MoveFile";
                    break;
                default:
                    flag_name = "Unknown";
                    break;
            }
            description = flag_name + " - TargetSite.Name:" + e.TargetSite.Name + ". Message: " + e.Message.ToString() + e.HelpLink;

            return description;
        }
        // Move file and return archive full path file
        private string Move_File(string input_directory, string archive_directory, string full_path_file, bool is_succeeded = true)
        {
            string archive_directory_extend = "\\";
            if (!is_succeeded) { archive_directory_extend = "_ERRORS\\"; }
            string file_name = Path.GetFileName(full_path_file);

            string input_directory_extend = Path.GetDirectoryName(full_path_file).Length > input_directory.Length ? Path.GetDirectoryName(full_path_file).Substring(input_directory.Length) : "";
            archive_directory += input_directory_extend;
            string archive_full_path_file = archive_directory + archive_directory_extend + file_name;

            if (File.Exists(archive_full_path_file))
            {
                int indexpath = file_name.LastIndexOf('.');
                string timelog = (DateTime.Now.Year * 10000 + DateTime.Now.Month * 100 + DateTime.Now.Day).ToString();
                string timelog_2 = (DateTime.Now.Hour * 100 + DateTime.Now.Minute).ToString();
                timelog_2 = timelog_2.Length == 4 ? timelog_2 : "0" + timelog_2;
                timelog += "_" + timelog_2;
                archive_full_path_file = archive_full_path_file.Replace(file_name,"") + file_name.Substring(0, indexpath) + "¬" + timelog + file_name.Substring(indexpath);
            }
            // Check Directory and create if not exists
            if (!Directory.Exists(Path.GetDirectoryName(archive_full_path_file)))
            {
                Directory.CreateDirectory(Path.GetDirectoryName(archive_full_path_file));
            }

            // Move file
            File.Move(full_path_file, archive_full_path_file);

            return archive_full_path_file;
        }
        private DataTable GetDataTable_File(string database_type, string file_full_path, string part_sheet_name_or_delimited, int skip_line_number = 0)
        {
            DataTable dt = new DataTable();

            if (File.Exists(file_full_path))
            {
                if (database_type.ToLower() == "excel")
                {
                    dt = ConvertExcel2DataTable(file_full_path, part_sheet_name_or_delimited);
                }
                else if (database_type.ToLower() == "csv" || database_type.ToLower() == "txt" || database_type.ToLower() == "text")
                {
                    char[] delimiteds = part_sheet_name_or_delimited.ToArray<char>();

                    char delimited = delimiteds.Length > 0 ? delimiteds[0] : ',';

                    dt = ConvertCSV2DataTable(file_full_path, delimited, skip_line_number);
                }
            }

            return dt;
        }
        private DataTable ConvertCSV2DataTable(string file_full_path, char delimited = ',', int skip_line_number = 0)
        {
            char special_char = '"';
            DataTable dtCsv = new DataTable();
            using (StreamReader sr = new StreamReader(file_full_path))
            {
                int column_number = 0;
                long i = 0;

                List<string> rowValues = new List<string>();
                List<char> s_rows = new List<char>();
                string item_temp = "";
                // begin while
                while (!sr.EndOfStream)
                {
                    string line_text = sr.ReadLine();
                    if (line_text.Length <= 0) { i++; continue; }

                    string[] values = line_text.Split(delimited);

                    int flag = 0;
                    foreach (string item in values)
                    {
                        string item_trim = item.Trim();
                        if (item_trim.Length > 0)
                        {
                            if (item_trim[0] == special_char)
                            {
                                s_rows.Add(special_char);
                            }
                            if (item_trim[item_trim.Length - 1] == special_char && item_trim.Length > 1)
                            {
                                s_rows.Add(special_char);
                            }
                        }
                        item_temp += item_trim.Replace(special_char.ToString(), "");
                        item_temp += s_rows.Count() % 2 != 0 ? (flag == values.Count() - 1 ? "\n" : delimited.ToString()) : "";
                        if (s_rows.Count() % 2 == 0)
                        {
                            rowValues.Add(item_temp);
                            s_rows.Clear();
                            item_temp = "";
                        }
                        flag++;
                    }

                    if (flag == values.Count() && s_rows.Count() % 2 != 0) continue;

                    if (i >= skip_line_number)
                    {
                        if (i == skip_line_number)
                        {
                            for (int j = 0; j < rowValues.Count(); j++)
                            {
                                string header = rowValues[j].ToString().Length > 0 ? rowValues[j].ToString() : ("Unnamed: " + j.ToString());
                                dtCsv.Columns.Add(header); //add headers
                            }
                            column_number = rowValues.Count();
                        }
                        else
                        {
                            DataRow dr = dtCsv.NewRow();
                            int column_count = rowValues.Count();
                            int column_number_temp = column_number >= column_count ? column_count : column_number;
                            for (int k = 0; k < column_number_temp; k++)
                            {
                                string row_value = "";
                                if (k == column_number_temp - 1)
                                {
                                    for (int l = k; l < column_count; l++)
                                    {
                                        row_value += rowValues[l].ToString();
                                        row_value += l < (column_count - 1) ? delimited.ToString() : "";
                                    }
                                }
                                else
                                {
                                    row_value = rowValues[k].ToString();
                                }
                                dr[k] = row_value.Trim();
                            }
                            dtCsv.Rows.Add(dr); //add other rows
                        }
                    }
                    i++;
                    rowValues.Clear();
                }
                // end while
            }
            return dtCsv;
        }
        private DataTable ConvertExcel2DataTable(string file_full_path, string part_sheet_name)
        {
            DataTable dt = new DataTable();

            string HDR = "YES";
            string ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + file_full_path + ";Extended Properties=\"Excel 12.0;HDR=" + HDR + ";IMEX=0\"";

            OleDbConnection cnn = new OleDbConnection(ConStr);
            //Get Sheet Name
            cnn.Open();
            DataTable dtSheet = cnn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            List<string> sheetnames = new List<string>();

            if (part_sheet_name.Length > 0)
            {
                foreach (DataRow drSheet in dtSheet.Rows)
                {
                    if (
                        drSheet["TABLE_NAME"].ToString().Contains("$")
                        && !drSheet["TABLE_NAME"].ToString().Contains("FilterDatabase")
                        && drSheet["TABLE_NAME"].ToString().ToLower().Contains(part_sheet_name.ToLower())
                        )
                    {
                        sheetnames.Add(drSheet["TABLE_NAME"].ToString());
                    }
                }
            }
            else
            {
                foreach (DataRow drSheet in dtSheet.Rows)
                {
                    if (
                        drSheet["TABLE_NAME"].ToString().Contains("$")
                        && !drSheet["TABLE_NAME"].ToString().Contains("FilterDatabase")
                        )
                    {
                        sheetnames.Add(drSheet["TABLE_NAME"].ToString());
                    }
                }
            }

            foreach (string sheetname in sheetnames)
            {
                string query = "select * from [" + sheetname + "]";
                OleDbCommand oconn = new OleDbCommand(query, cnn);
                OleDbDataAdapter adp = new OleDbDataAdapter(oconn);
                adp.Fill(dt);
            }
            cnn.Close();

            return dt;
        }
        private DataTable GetDataTable_DB(string database_type, string server, string database, string user, string password,
            string driver, string port, string source_object, string source_query, string watermark_column, DateTime watermark_value, DateTime new_watermark_value)
        {
            string connection_string = GetConnectionString(database_type, server, database, user, password, driver, port);
            DataTable dt_data = new DataTable();
            if (database_type.ToLower() == "sqlserver" || database_type.ToLower() == "sql server")
            {
                if (driver.Length > 0)
                {
                    dt_data = GetDataTable_DB_ODBC(connection_string, source_object, source_query, watermark_column, watermark_value, new_watermark_value);
                }
                else
                {
                    dt_data = GetDataTable_DB_SQLServer(connection_string, source_object, source_query, watermark_column, watermark_value, new_watermark_value);
                }
            }
            else if (database_type.ToLower() == "postgresql" || database_type.ToLower() == "postgres")
            {
                if (driver.Length > 0)
                {
                    dt_data = GetDataTable_DB_ODBC(connection_string, source_object, source_query, watermark_column, watermark_value, new_watermark_value);
                }
                else
                {
                    //dt_data = GetDataTable_DB_PostgreSQL(connection_string, source_object, source_query, watermark_column, watermark_value, new_watermark_value);
                }
            }
            else if (database_type.ToLower() == "mysql")
            {
                if (driver.Length > 0)
                {
                    dt_data = GetDataTable_DB_ODBC(connection_string, source_object, source_query, watermark_column, watermark_value, new_watermark_value);
                }
                else
                {
                    //dt_data = GetDataTable_DB_MySQL(connection_string, source_object, source_query, watermark_column, watermark_value, new_watermark_value);
                }
            }
            else if (database_type.ToLower() == "mongodb")
            {
                //dt_data = GetDataTable_DB_MongoDB(server, database, user, password, driver, port, source_object, source_query, watermark_column, watermark_value, new_watermark_value);
            }

            return dt_data;
        }
        private DataTable GetDataTable_DB_ODBC(string connection_string, string source_object, string source_query,
            string watermark_column, DateTime watermark_value, DateTime new_watermark_value)
        {
            DataTable dt_data = new DataTable();
            OdbcConnection conn = new OdbcConnection(connection_string);

            string query = "";
            if (source_object.Length > 0)
            {
                query = "{CALL " + source_object + " ";
                query += watermark_column.Length > 0 ? "(?,?)" : "";
                query += "}";
            }
            else
            {
                query = source_query;
            }

            OdbcCommand cmd = new OdbcCommand();
            cmd.Connection = conn;
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            cmd.CommandTimeout = CommandTimeoutSource;

            if (watermark_column.Length > 0)
            {
                OdbcParameter spmt1 = new OdbcParameter("@WatermarkValue", watermark_value);
                OdbcParameter spmt2 = new OdbcParameter("@NewWatermarkValue", new_watermark_value);
                cmd.Parameters.AddRange(new OdbcParameter[] { spmt1, spmt2 });
            }

            OdbcDataAdapter adp = new OdbcDataAdapter(cmd);
            // Get data each pipeline
            conn.Open();
            adp.Fill(dt_data);
            conn.Close();

            return dt_data;
        }
        private DataTable GetDataTable_DB_SQLServer(string connection_string, string source_object, string source_query,
            string watermark_column, DateTime watermark_value, DateTime new_watermark_value)
        {
            DataTable dt_data = new DataTable();
            SqlConnection conn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = source_object.Length > 0 ? source_object : source_query;
            cmd.CommandType = source_object.Length > 0 ? CommandType.StoredProcedure : CommandType.Text;
            cmd.CommandTimeout = CommandTimeoutSource;

            if (watermark_column.Length > 0)
            {
                SqlParameter spmt1 = new SqlParameter("@WatermarkValue", watermark_value);
                SqlParameter spmt2 = new SqlParameter("@NewWatermarkValue", new_watermark_value);
                cmd.Parameters.AddRange(new SqlParameter[] { spmt1, spmt2 });
            }

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            // Get data each pipeline
            conn.Open();
            adp.Fill(dt_data);
            conn.Close();

            return dt_data;
        }

        /*
        private DataTable GetDataTable_DB_MongoDB(string server, string database, string user, string password, string driver, string port, string collection, string col_query,
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
        private DataTable GetDataTable_DB_MySQL(string connection_string, string source_object, string source_query,
            string watermark_column, DateTime watermark_value, DateTime new_watermark_value)
        {
            DataTable dt_data = new DataTable();
            MySqlConnection conn = new MySqlConnection(connection_string);
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = source_object.Length > 0 ? source_object : source_query;
            cmd.CommandType = source_object.Length > 0 ? CommandType.StoredProcedure : CommandType.Text;
            cmd.CommandTimeout = CommandTimeoutSource;

            if (watermark_column.Length > 0)
            {
                MySqlParameter spmt1 = new MySqlParameter("@WatermarkValue", watermark_value);
                MySqlParameter spmt2 = new MySqlParameter("@NewWatermarkValue", new_watermark_value);
                cmd.Parameters.AddRange(new MySqlParameter[] { spmt1, spmt2 });
            }

            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
            // Get data each pipeline
            conn.Open();
            adp.Fill(dt_data);
            conn.Close();

            return dt_data;
        }
        private DataTable GetDataTable_DB_PostgreSQL(string connection_string, string source_object, string source_query,
            string watermark_column, DateTime watermark_value, DateTime new_watermark_value)
        {
            DataTable dt_data = new DataTable();
            NpgsqlConnection conn = new NpgsqlConnection(connection_string);
            NpgsqlCommand cmd = new NpgsqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = source_object.Length > 0 ? source_object : source_query;
            cmd.CommandType = source_object.Length > 0 ? CommandType.StoredProcedure : CommandType.Text;
            cmd.CommandTimeout = CommandTimeoutSource;

            if (watermark_column.Length > 0)
            {
                NpgsqlParameter spmt1 = new NpgsqlParameter("@WatermarkValue", watermark_value);
                NpgsqlParameter spmt2 = new NpgsqlParameter("@NewWatermarkValue", new_watermark_value);
                cmd.Parameters.AddRange(new NpgsqlParameter[] { spmt1, spmt2 });
            }

            NpgsqlDataAdapter adp = new NpgsqlDataAdapter(cmd);
            // Get data each pipeline
            conn.Open();
            adp.Fill(dt_data);
            conn.Close();

            return dt_data;
        }
        */
        #endregion

        #region Execution Functions
        private void ETL_LoadDataViaSPUpsert(string connection_string, DataTable dt_data, string sp_upsert, string table_type, int log_id, 
            int? filelog_id = null, DateTime? new_watermark_value = null)
        {
            // Import data into destination
            if (dt_data.Rows.Count > 0)
            {
                SqlConnection cnn_des = new SqlConnection(connection_string);
                SqlCommand command_sp_upsert = new SqlCommand();
                command_sp_upsert.Connection = cnn_des;
                command_sp_upsert.CommandText = sp_upsert;
                command_sp_upsert.CommandType = CommandType.StoredProcedure;
                command_sp_upsert.CommandTimeout = Command_Timeout_Destination;

                SqlParameter parameter_sp_upsert = new SqlParameter();
                parameter_sp_upsert.ParameterName = "@tvp";
                parameter_sp_upsert.SqlDbType = SqlDbType.Structured;
                parameter_sp_upsert.Direction = ParameterDirection.Input;
                parameter_sp_upsert.Value = dt_data;
                parameter_sp_upsert.TypeName = table_type;

                command_sp_upsert.Parameters.Add(parameter_sp_upsert);
                command_sp_upsert.Parameters.AddRange(new SqlParameter[] {
                    new SqlParameter("@etl_logid", log_id)
                    ,new SqlParameter("@etl_filelogid", filelog_id)
                    ,new SqlParameter("@new_watermark_value", new_watermark_value)
                });

                cnn_des.Open();
                command_sp_upsert.ExecuteNonQuery();
                cnn_des.Close();
            }
        }
        private void ETL_ExecutionDataPipeline_DB(int watermark_id, string source_object, string source_query, int source_connection_id,
            string source_connection_type, string source_database_type, string source_driver, string source_server, string source_database, string source_port,
            string source_user, string source_password, string watermark_column, DateTime watermark_value, DateTime new_watermark_value,
            string destination_table, string destination_sp_upsert, string destination_table_type, int destination_connection_id,
            string destination_connection_type, string destination_database_type, string destination_driver, string destination_server,
            string destination_database, string destination_port, string destination_user, string destination_password)
        {
            // Create variable local
            int log_id = -99;
            int extract_rows = -1;
            int before_import_rows = -1;
            int import_rows = -1;
            int after_import_rows = -1;
            int flag = 0;
            DateTime start_datetime;
            string object_log;

            try
            {
                // Get log_id
                log_id = ETL_GetLogID(watermark_id, watermark_value);

                // Get data source
                flag = 1;
                start_datetime = DateTime.Now;
                DataTable dt_source = GetDataTable_DB(source_database_type, source_server, source_database, source_user, source_password, source_driver,
                    source_port, source_object, source_query, watermark_column, watermark_value, new_watermark_value);
                extract_rows = dt_source.Rows.Count;
                object_log = source_object.Length > 0 ? source_object : "query_select_" + destination_table;
                ETL_InsertLogDetail(source_connection_id, source_connection_type, watermark_id, log_id, null, object_log, DateTime.Now - start_datetime, extract_rows);

                // Load data to destination
                flag = 2;
                start_datetime = DateTime.Now;
                string destination_connection_string = GetConnectionString(destination_database_type, destination_server, destination_database,
                    destination_user, destination_password, destination_driver, destination_port);
                before_import_rows = SQL_GetNumberRows(destination_connection_string, destination_table);
                ETL_LoadDataViaSPUpsert(destination_connection_string, dt_source, destination_sp_upsert, destination_table_type, log_id, null, new_watermark_value);
                import_rows = SQL_GetNumberRows(destination_connection_string, destination_table, log_id);
                after_import_rows = SQL_GetNumberRows(destination_connection_string, destination_table);
                object_log = destination_sp_upsert;
                ETL_InsertLogDetail(destination_connection_id, destination_connection_type, watermark_id, log_id, null, object_log, DateTime.Now - start_datetime,
                    extract_rows, before_import_rows, import_rows, after_import_rows);

                flag = 0;
                // Update watermark_id
                ETL_UpdateWatermarkID(watermark_id, new_watermark_value);

                // Update log_id succeeded
                ETL_UpdateLogID(log_id, true, extract_rows, before_import_rows, import_rows, after_import_rows);
            }
            catch (Exception e)
            {
                // Insert error
                string description = GetErrorDescription(e, flag);
                string code = e.HResult.ToString();
                ETL_InsertError(log_id, code, description);

                // Update log_id failed
                ETL_UpdateLogID(log_id, false, extract_rows, before_import_rows, import_rows, after_import_rows);
            }

        }
        private void ETL_ExecutionDataPipeline_File(int watermark_id, string source_object, int source_connection_id,
            string source_connection_type, string source_database_type, string source_input_directory, string source_archive_directory, string source_part_sheet_name_or_delimited,
            int source_skip_line_number, DateTime watermark_value, DateTime new_watermark_value,
            string destination_table, string destination_sp_upsert, string destination_table_type, int destination_connection_id,
            string destination_connection_type, string destination_database_type, string destination_driver, string destination_server,
            string destination_database, string destination_port, string destination_user, string destination_password)
        {
            // Create variable local
            int log_id = -99;
            int extract_rows = 0;
            int before_import_rows = -1;
            int import_rows = -1;
            int after_import_rows = -1;
            int flag = 0;
            DateTime start_datetime;
            string object_log;
            bool is_succeeded = true;

            // Create variable local using filelog
            int filelog_id = -999;
            int extract_rows_file = -11;
            int before_import_rows_file = -11;
            int import_rows_file = -11;
            int after_import_rows_file = -11;
            string full_path_archive = null;

            try
            {
                // Get log_id
                log_id = ETL_GetLogID(watermark_id, watermark_value);

                // Get destination_connection_string
                string destination_connection_string = GetConnectionString(destination_database_type, destination_server, destination_database,
                    destination_user, destination_password, destination_driver, destination_port);

                // Get count row before import
                flag = 2;
                before_import_rows = SQL_GetNumberRows(destination_connection_string, destination_table);
                flag = 0;

                // Set directory
                string end_charator;
                end_charator = source_input_directory.Substring(source_input_directory.Length - 1);
                source_input_directory = end_charator == "\\" ? source_input_directory.Substring(0, source_input_directory.Length - 1) : source_input_directory;
                end_charator = source_archive_directory.Substring(source_archive_directory.Length - 1);
                source_archive_directory = end_charator == "\\" ? source_archive_directory.Substring(0, source_archive_directory.Length - 1) : source_archive_directory;

                // Condition directory
                if (Directory.Exists(source_input_directory))
                {
                    // Determine the search_option
                    var search_option = SearchOption.AllDirectories;
                    if (source_archive_directory.Contains(source_input_directory))
                    {
                        search_option = SearchOption.TopDirectoryOnly;
                    }
                    var full_path_files = Directory.GetFiles(source_input_directory, source_object, search_option);
                    // Read sequential list files
                    foreach (var full_path_file in full_path_files)
                    {
                        // Reset variable filelog
                        filelog_id = -999;
                        extract_rows_file = -11;
                        before_import_rows_file = -11;
                        import_rows_file = -11;
                        after_import_rows_file = -11;
                        flag = 0;

                        // Create variable local
                        string file_name = Path.GetFileName(full_path_file);

                        try
                        {
                            // Get filelog_id
                            filelog_id = ETL_GetFileLogID(log_id, file_name, full_path_file);

                            // Get data source from a file
                            flag = 1;
                            start_datetime = DateTime.Now;
                            DataTable dt_source = GetDataTable_File(source_database_type, full_path_file, source_part_sheet_name_or_delimited, source_skip_line_number);
                            flag = 0;
                            extract_rows_file = dt_source.Rows.Count;
                            object_log = source_object.Length > 0 ? source_object : "query_select_" + destination_table;
                            ETL_InsertLogDetail(source_connection_id, source_connection_type, watermark_id, log_id, filelog_id, object_log, DateTime.Now - start_datetime, extract_rows_file);

                            // Set extract_rows of log_id
                            if (extract_rows < 0) { extract_rows = dt_source.Rows.Count; }
                            else { extract_rows += extract_rows_file; }

                            // Load data to destination
                            flag = 2;
                            start_datetime = DateTime.Now;
                            before_import_rows_file = SQL_GetNumberRows(destination_connection_string, destination_table);
                            ETL_LoadDataViaSPUpsert(destination_connection_string, dt_source, destination_sp_upsert, destination_table_type, log_id, filelog_id, new_watermark_value);
                            import_rows_file = SQL_GetNumberRows(destination_connection_string, destination_table, log_id, filelog_id);
                            after_import_rows_file = SQL_GetNumberRows(destination_connection_string, destination_table);
                            flag = 0;
                            object_log = destination_sp_upsert;
                            ETL_InsertLogDetail(destination_connection_id, destination_connection_type, watermark_id, log_id, filelog_id, object_log, DateTime.Now - start_datetime,
                                extract_rows_file, before_import_rows_file, import_rows_file, after_import_rows_file);

                            // Move file
                            flag = 3;
                            full_path_archive = Move_File(source_input_directory, source_archive_directory, full_path_file);
                            flag = 0;
                            // Update filelog_id  succeeded
                            ETL_UpdateFileLogID(filelog_id, true, full_path_archive, extract_rows_file, before_import_rows_file, import_rows_file, after_import_rows_file);
                        }
                        catch (Exception e)
                        {
                            is_succeeded = false;
                            // Insert error
                            string description = GetErrorDescription(e, flag);
                            string code = e.HResult.ToString();
                            ETL_InsertError(log_id, code, description, filelog_id);

                            // Move file in folder errors
                            full_path_archive = Move_File(source_input_directory, source_archive_directory, full_path_file, false);

                            // Update filelog_id failed
                            ETL_UpdateFileLogID(filelog_id, false, full_path_archive, extract_rows_file, before_import_rows_file, import_rows_file, after_import_rows_file);
                        }
                    }
                }

                // Get count rows after import
                flag = 2;
                import_rows = SQL_GetNumberRows(destination_connection_string, destination_table, log_id);
                after_import_rows = SQL_GetNumberRows(destination_connection_string, destination_table);

                flag = 0;
                // Update watermark_id
                ETL_UpdateWatermarkID(watermark_id, new_watermark_value);

                // Update log_id
                if (is_succeeded)
                    ETL_UpdateLogID(log_id, true, extract_rows, before_import_rows, import_rows, after_import_rows);
                else
                    ETL_UpdateLogID(log_id, false, extract_rows, before_import_rows, import_rows, after_import_rows);
            }
            catch (Exception e)
            {
                // Insert error
                string description = GetErrorDescription(e, flag);
                string code = e.HResult.ToString();
                ETL_InsertError(log_id, code, description);

                // Update log_id failed
                ETL_UpdateLogID(log_id, false, extract_rows, before_import_rows, import_rows, after_import_rows);
            }

        }
        // Execution a data pipeline | Can edit
        private void ETL_ExecutionDataPipeline(int watermark_id, string a_collection_type, string source_object, string source_query, int source_connection_id,
            string source_connection_type, string source_database_type, string source_driver, string source_server, string source_database, string source_port,
            string source_user, string source_password, string source_input_directory, string source_archive_directory, string source_part_sheet_name_or_delimited,
            int source_skip_line_number, string watermark_column, DateTime watermark_value, string destination_table, string destination_sp_upsert,
            string destination_table_type, int destination_connection_id, string destination_connection_type, string destination_database_type,
            string destination_driver, string destination_server, string destination_database, string destination_port, string destination_user,
            string destination_password, string destination_input_directory = null, string destination_archive_directory = null,
            string destination_part_sheet_name_or_delimited = null, int destination_skip_line_number = 0)
        {
            DateTime new_watermark_value = NewWatermarkValue;

            if (a_collection_type.ToUpper().Contains("DB"))
            {
                ETL_ExecutionDataPipeline_DB(watermark_id, source_object, source_query, source_connection_id, source_connection_type, source_database_type,
                    source_driver, source_server, source_database, source_port, source_user, source_password, watermark_column, watermark_value, new_watermark_value,
                    destination_table, destination_sp_upsert, destination_table_type, destination_connection_id, destination_connection_type, destination_database_type,
                    destination_driver, destination_server, destination_database, destination_port, destination_user, destination_password);
            }
            else if (a_collection_type.ToUpper().Contains("FILE"))
            {
                ETL_ExecutionDataPipeline_File(watermark_id, source_object, source_connection_id, source_connection_type, source_database_type, source_input_directory,
                    source_archive_directory, source_part_sheet_name_or_delimited, source_skip_line_number, watermark_value, new_watermark_value,
                    destination_table, destination_sp_upsert, destination_table_type, destination_connection_id, destination_connection_type, destination_database_type,
                    destination_driver, destination_server, destination_database, destination_port, destination_user, destination_password);
            }
        }
        // Execution the data pipelines | Can edit
        public void ETL_LoadDataSource2Destination(bool is_parallel = true)
        {
            string[] collection_types = CollectionTypes.Split(',');

            Parallel.ForEach(collection_types, a_collection_type =>
            {
                a_collection_type = a_collection_type.Trim();

                // Change watermark_value by load_type with a collection type
                ETL_ChangeWatermarkValueByLoadType(a_collection_type);

                if (is_parallel)
                {
                    ETL_ExecutionDataPipelines_Parallel(a_collection_type);
                }
                else
                {
                    ETL_ExecutionDataPipelines_Sequence(a_collection_type);
                }
            });
            
            
        }
        private void ETL_ExecutionDataPipelines_Parallel(string a_collection_type)
        {
            // Get list data pipelines
            DataTable dt_list_data_pipelines = ETL_GetListDataPipelines(a_collection_type);
            // Convert DataTable to List<DataRow>
            List<DataRow> rows = new List<DataRow>();
            foreach (DataRow item in dt_list_data_pipelines.Rows) { rows.Add(item); }

            var options = new ParallelOptions() { MaxDegreeOfParallelism = ParallelOption_MaxDegreeOfParallelism };

            Parallel.ForEach(rows, options, row =>
            {
                // Create variable about information data pipelines
                int watermark_id, source_connection_id, source_skip_line_number, destination_connection_id, destination_skip_line_number;
                string collection_type, source_object,
                source_query, source_connection_type, source_database_type, source_driver, source_server, source_database, source_port,
                source_user, source_password, source_input_directory, source_archive_directory, source_part_sheet_name_or_delimited, watermark_column,
                destination_table, destination_sp_upsert, destination_table_type, destination_connection_type, destination_database_type,
                destination_driver, destination_server, destination_database, destination_port, destination_user, destination_password,
                destination_input_directory, destination_archive_directory, destination_part_sheet_name_or_delimited;
                DateTime watermark_value;

                watermark_id = (int)row["watermark_id"];
                collection_type = row["collection_type"].ToString().Trim();
                source_object = row["source_object"].ToString().Trim();
                source_query = row["source_query"].ToString().Trim();
                source_connection_id = (int)row["source_connection_id"];
                source_connection_type = row["source_connection_type"].ToString().Trim();
                source_database_type = row["source_database_type"].ToString().Trim();
                source_driver = row["source_driver"].ToString().Trim();
                source_server = row["source_server"].ToString().Trim();
                source_database = row["source_database"].ToString().Trim();
                source_port = row["source_port"].ToString().Trim();
                source_user = row["source_user"].ToString().Trim();
                source_password = row["source_password"].ToString().Trim();
                source_input_directory = row["source_input_directory"].ToString().Trim();
                source_archive_directory = row["source_archive_directory"].ToString().Trim();
                source_part_sheet_name_or_delimited = row["source_part_sheet_name_or_delimited"].ToString().Trim();
                source_skip_line_number = (int)row["source_skip_line_number"];
                watermark_column = row["watermark_column"].ToString().Trim();
                watermark_value = (DateTime)row["watermark_value"];
                destination_table = row["destination_table"].ToString().Trim();
                destination_sp_upsert = row["destination_sp_upsert"].ToString().Trim();
                destination_table_type = row["destination_table_type"].ToString().Trim();
                destination_connection_id = (int)row["destination_connection_id"];
                destination_connection_type = row["destination_connection_type"].ToString().Trim();
                destination_database_type = row["destination_database_type"].ToString().Trim();
                destination_driver = row["destination_driver"].ToString().Trim();
                destination_server = row["destination_server"].ToString().Trim();
                destination_database = row["destination_database"].ToString().Trim();
                destination_port = row["destination_port"].ToString().Trim();
                destination_user = row["destination_user"].ToString().Trim();
                destination_password = row["destination_password"].ToString().Trim();
                destination_input_directory = row["destination_input_directory"].ToString().Trim();
                destination_archive_directory = row["destination_archive_directory"].ToString().Trim();
                destination_part_sheet_name_or_delimited = row["destination_part_sheet_name_or_delimited"].ToString().Trim();
                destination_skip_line_number = (int)row["destination_skip_line_number"];

                ETL_ExecutionDataPipeline(watermark_id, collection_type, source_object, source_query, source_connection_id, source_connection_type,
                    source_database_type, source_driver, source_server, source_database, source_port, source_user, source_password, source_input_directory,
                    source_archive_directory, source_part_sheet_name_or_delimited, source_skip_line_number, watermark_column, watermark_value,
                    destination_table, destination_sp_upsert, destination_table_type, destination_connection_id, destination_connection_type, destination_database_type,
                    destination_driver, destination_server, destination_database, destination_port, destination_user, destination_password);
            });
        }
        private void ETL_ExecutionDataPipelines_Sequence(string a_collection_type)
        {
            // Get list data pipelines
            DataTable dt_list_data_pipelines = ETL_GetListDataPipelines(a_collection_type);
            // Convert DataTable to List<DataRow>
            List<DataRow> rows = new List<DataRow>();
            foreach (DataRow item in dt_list_data_pipelines.Rows) { rows.Add(item); }
            
            foreach (DataRow row in rows)
            {
                // Create variable about information data pipelines
                int watermark_id, source_connection_id, source_skip_line_number, destination_connection_id, destination_skip_line_number;
                string collection_type, source_object,
                source_query, source_connection_type, source_database_type, source_driver, source_server, source_database, source_port,
                source_user, source_password, source_input_directory, source_archive_directory, source_part_sheet_name_or_delimited, watermark_column,
                destination_table, destination_sp_upsert, destination_table_type, destination_connection_type, destination_database_type,
                destination_driver, destination_server, destination_database, destination_port, destination_user, destination_password,
                destination_input_directory, destination_archive_directory, destination_part_sheet_name_or_delimited;
                DateTime watermark_value;

                watermark_id = (int)row["watermark_id"];
                collection_type = row["collection_type"].ToString().Trim();
                source_object = row["source_object"].ToString().Trim();
                source_query = row["source_query"].ToString().Trim();
                source_connection_id = (int)row["source_connection_id"];
                source_connection_type = row["source_connection_type"].ToString().Trim();
                source_database_type = row["source_database_type"].ToString().Trim();
                source_driver = row["source_driver"].ToString().Trim();
                source_server = row["source_server"].ToString().Trim();
                source_database = row["source_database"].ToString().Trim();
                source_port = row["source_port"].ToString().Trim();
                source_user = row["source_user"].ToString().Trim();
                source_password = row["source_password"].ToString().Trim();
                source_input_directory = row["source_input_directory"].ToString().Trim();
                source_archive_directory = row["source_archive_directory"].ToString().Trim();
                source_part_sheet_name_or_delimited = row["source_part_sheet_name_or_delimited"].ToString().Trim();
                source_skip_line_number = (int)row["source_skip_line_number"];
                watermark_column = row["watermark_column"].ToString().Trim();
                watermark_value = (DateTime)row["watermark_value"];
                destination_table = row["destination_table"].ToString().Trim();
                destination_sp_upsert = row["destination_sp_upsert"].ToString().Trim();
                destination_table_type = row["destination_table_type"].ToString().Trim();
                destination_connection_id = (int)row["destination_connection_id"];
                destination_connection_type = row["destination_connection_type"].ToString().Trim();
                destination_database_type = row["destination_database_type"].ToString().Trim();
                destination_driver = row["destination_driver"].ToString().Trim();
                destination_server = row["destination_server"].ToString().Trim();
                destination_database = row["destination_database"].ToString().Trim();
                destination_port = row["destination_port"].ToString().Trim();
                destination_user = row["destination_user"].ToString().Trim();
                destination_password = row["destination_password"].ToString().Trim();
                destination_input_directory = row["destination_input_directory"].ToString().Trim();
                destination_archive_directory = row["destination_archive_directory"].ToString().Trim();
                destination_part_sheet_name_or_delimited = row["destination_part_sheet_name_or_delimited"].ToString().Trim();
                destination_skip_line_number = (int)row["destination_skip_line_number"];

                ETL_ExecutionDataPipeline(watermark_id, collection_type, source_object, source_query, source_connection_id, source_connection_type,
                    source_database_type, source_driver, source_server, source_database, source_port, source_user, source_password, source_input_directory,
                    source_archive_directory, source_part_sheet_name_or_delimited, source_skip_line_number, watermark_column, watermark_value,
                    destination_table, destination_sp_upsert, destination_table_type, destination_connection_id, destination_connection_type, destination_database_type,
                    destination_driver, destination_server, destination_database, destination_port, destination_user, destination_password);
            }
        }
        #endregion

        #region Temporary

        #endregion
    }
}
