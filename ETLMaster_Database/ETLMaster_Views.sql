/*********************************** dbo.v_etl_connection ***********************************/
CREATE OR ALTER VIEW dbo.v_etl_connection
AS
SELECT connection_id,
       connection_type,
       database_type,
       driver,
       server,
       [database],
       port,
       [user],
       password,
       input_directory,
       archive_directory,
       part_sheet_name_or_delimited,
       skip_line_number,
       created_datetime,
       modified_datetime
FROM dbo.etl_connection (NOLOCK);
GO
/*********************************** dbo.v_etl_watermark ***********************************/
CREATE OR ALTER VIEW dbo.v_etl_watermark
AS
SELECT watermark_id,
       batch_type,
       collection_type,
       source_connection_id,
       source_object,
       source_query,
       watermark_column,
       watermark_value,
       last_watermark_value,
       destination_connection_id,
       destination_table,
       destination_sp_upsert,
       destination_table_type,
       ordinal,
       enable,
       scds,
       created_datetime,
       modified_datetime
FROM dbo.etl_watermark (NOLOCK);
GO
/*********************************** dbo.v_etl_batch ***********************************/
CREATE OR ALTER VIEW dbo.v_etl_batch
AS
SELECT batch_id,
       batch_name,
       batch_type,
       collection_types,
       new_watermark_value,
       is_succeeded,
       is_completed,
       created_datetime,
       completed_datetime,
       failed_datetime,
       load_type,
	   manual_start_datetime,
       machine_name,
       user_name,
       modified_datetime,
       TRY_CONVERT(NVARCHAR(20), batch_id) AS batch_id_string,
       TRY_CONVERT(DATE, created_datetime) AS created_date,
       CASE load_type
           WHEN 0 THEN
               'Incremental'
           WHEN 1 THEN
               'Full'
           WHEN 2 THEN
               'Manual'
           ELSE
               'Unknown'
       END AS load_type_name,
       CASE
           WHEN is_completed = 0 THEN
               2
           WHEN is_completed = 1
                AND is_succeeded = 0 THEN
               0
           WHEN is_completed = 1
                AND is_succeeded = 1 THEN
               1
           ELSE
               99
       END AS status_id, -- 0: Failed, 1: Succeeded, 2: Running, 99: Unknown
       CASE
           WHEN is_completed = 0 THEN
               'Running'
           WHEN is_completed = 1
                AND is_succeeded = 0 THEN
               'Failed'
           WHEN is_completed = 1
                AND is_succeeded = 1 THEN
               'Succeeded'
           ELSE
               'Unknown'
       END AS status_name,
       DATEDIFF(MILLISECOND, created_datetime, completed_datetime) AS duration_in_milli_seconds,
       DATEDIFF(SECOND, created_datetime, completed_datetime) AS duration_in_seconds,
       ROUND(TRY_CONVERT(FLOAT, DATEDIFF(SECOND, created_datetime, completed_datetime)) / 60, 2) AS duration_in_minutes
FROM dbo.etl_batch (NOLOCK);
GO
/*********************************** dbo.v_etl_log ***********************************/
CREATE OR ALTER VIEW dbo.v_etl_log
AS
SELECT log_id,
       is_succeeded,
       is_completed,
       created_datetime,
       completed_datetime,
       failed_datetime,
                         --extract_rows,
                         --before_import_rows,
                         --import_rows,
                         --after_import_rows,
       batch_id,
       watermark_id,
       batch_type,
       collection_type,
	   source_connection_id,
       source_object,
       source_query,
       watermark_column,
       watermark_value,
       new_watermark_value,
	   destination_connection_id,
       destination_table,
       destination_sp_upsert,
       destination_table_type,
       ordinal,
       modified_datetime,
       CASE
           WHEN is_completed = 0 THEN
               2
           WHEN is_completed = 1
                AND is_succeeded = 0 THEN
               0
           WHEN is_completed = 1
                AND is_succeeded = 1 THEN
               1
           ELSE
               99
       END AS status_id, -- 0: Failed, 1: Succeeded, 2: Running, 99: Unknown
       CASE
           WHEN is_completed = 0 THEN
               'Running'
           WHEN is_completed = 1
                AND is_succeeded = 0 THEN
               'Failed'
           WHEN is_completed = 1
                AND is_succeeded = 1 THEN
               'Succeeded'
           ELSE
               'Unknown'
       END AS status_name,
       DATEDIFF(MILLISECOND, created_datetime, completed_datetime) AS duration_in_milli_seconds,
       DATEDIFF(SECOND, created_datetime, completed_datetime) AS duration_in_seconds,
       ROUND(TRY_CONVERT(FLOAT, DATEDIFF(SECOND, created_datetime, completed_datetime)) / 60, 2) AS duration_in_minutes,
       ISNULL(extract_rows, 0) AS extract_rows,
       ISNULL(before_import_rows, 0) AS before_import_rows,
       ISNULL(import_rows, 0) AS import_rows,
       ISNULL(after_import_rows, 0) AS after_import_rows,
       IIF(is_completed = 1, ISNULL(after_import_rows - before_import_rows, 0), 0) AS insert_rows,
       IIF(is_completed = 1, ISNULL(import_rows - (after_import_rows - before_import_rows), 0), 0) AS update_rows
FROM dbo.etl_log (NOLOCK);
GO
/*********************************** dbo.v_etl_filelog ***********************************/
CREATE OR ALTER VIEW dbo.v_etl_filelog
AS
SELECT filelog_id,
       file_name,
       full_path_input,
       full_path_archive,
       is_succeeded,
       is_completed,
       created_datetime,
       completed_datetime,
       failed_datetime,
                         --extract_rows,
                         --before_import_rows,
                         --import_rows,
                         --after_import_rows,
       batch_id,
       watermark_id,
       log_id,
       connection_type,
       database_type,
       input_directory,
       archive_directory,
       search_pattern,
       part_sheet_name_or_delimited,
       skip_line_number,
       modified_datetime,
       CASE
           WHEN is_completed = 0 THEN
               2
           WHEN is_completed = 1
                AND is_succeeded = 0 THEN
               0
           WHEN is_completed = 1
                AND is_succeeded = 1 THEN
               1
           ELSE
               99
       END AS status_id, -- 0: Failed, 1: Succeeded, 2: Running, 99: Unknown
       CASE
           WHEN is_completed = 0 THEN
               'Running'
           WHEN is_completed = 1
                AND is_succeeded = 0 THEN
               'Failed'
           WHEN is_completed = 1
                AND is_succeeded = 1 THEN
               'Succeeded'
           ELSE
               'Unknown'
       END AS status_name,
       DATEDIFF(MILLISECOND, created_datetime, completed_datetime) AS duration_in_milli_seconds,
       DATEDIFF(SECOND, created_datetime, completed_datetime) AS duration_in_seconds,
       ROUND(TRY_CONVERT(FLOAT, DATEDIFF(SECOND, created_datetime, completed_datetime)) / 60, 2) AS duration_in_minutes,
       ISNULL(extract_rows, 0) AS extract_rows,
       ISNULL(before_import_rows, 0) AS before_import_rows,
       ISNULL(import_rows, 0) AS import_rows,
       ISNULL(after_import_rows, 0) AS after_import_rows,
       IIF(is_completed = 1, ISNULL(after_import_rows - before_import_rows, 0), 0) AS insert_rows,
       IIF(is_completed = 1, ISNULL(import_rows - (after_import_rows - before_import_rows), 0), 0) AS update_rows
FROM dbo.etl_filelog (NOLOCK);
GO
/*********************************** dbo.v_etl_logdetail ***********************************/
CREATE OR ALTER VIEW dbo.v_etl_logdetail
AS
SELECT logdetail_id,
       connection_id,
       connection_type,
       watermark_id,
       batch_id,
       log_id,
       filelog_id,
       object_log,
       time_span,
       extract_rows,
       before_import_rows,
       import_rows,
       after_import_rows,
       created_datetime,
       DATEDIFF(MILLISECOND, 0, time_span) AS duration_in_milli_seconds,
       DATEDIFF(SECOND, 0, time_span) AS duration_in_seconds,
       ROUND(TRY_CONVERT(FLOAT, DATEDIFF(SECOND, 0, time_span)) / 60, 2) AS duration_in_minutes
FROM dbo.etl_logdetail (NOLOCK);
GO
/*********************************** dbo.v_etl_error ***********************************/
CREATE OR ALTER VIEW dbo.v_etl_error
AS
SELECT error_id,
       batch_id,
       log_id,
       filelog_id,
       code,
       description,
       pipeline,
       task,
       created_datetime
FROM dbo.etl_error (NOLOCK);
GO
