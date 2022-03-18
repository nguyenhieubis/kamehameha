USE ETLMaster
GO
/************************* etl_get_connection_etl_master **************************/
CREATE OR ALTER PROC dbo.etl_get_connection_etl_master @decryption_key NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 1
           connection_type,
           database_type,
           driver,
           CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, [server])) AS [server],
           CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, [database])) AS [database],
           CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, [port])) AS [port],
           CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, [user])) AS [user],
           CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, [password])) AS [password]
    FROM dbo.etl_connection
    WHERE connection_id = 9999
          OR connection_type = 'ETLMaster'
    ORDER BY connection_id DESC;
END;
GO
/************************* etl_check_batch_is_running **************************/
CREATE OR ALTER PROC dbo.etl_check_batch_is_running @batch_type NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @is_running BIT,
            @is_completed BIT;
    SELECT TOP 1
           @is_completed = is_completed
    FROM dbo.etl_batch
    WHERE batch_type = @batch_type
    ORDER BY batch_id DESC;

    SELECT @is_running = IIF(@is_completed = 0, 1, 0);

    SELECT @is_running AS is_running;
    RETURN @is_running;
END;
GO
/************************* etl_check_batch_is_failed **************************/
CREATE OR ALTER PROC dbo.etl_check_batch_is_failed @batch_id INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @is_failed BIT = 1;
    SELECT @is_failed = IIF(is_succeeded = 1, 0, 1)
    FROM dbo.etl_batch
    WHERE batch_id = @batch_id
          AND is_completed = 1;

    SELECT @is_failed AS is_failed;
    RETURN @is_failed;
END;
GO
/************************* etl_change_watermark_value_by_load_type **************************/
CREATE OR ALTER PROC dbo.etl_change_watermark_value_by_load_type
    @batch_type NVARCHAR(255),
    @collection_type NVARCHAR(255),
    @load_type INT,
    @manual_start_date DATETIME = '2999-12-31'
AS
BEGIN
    SET NOCOUNT ON;

    -- 0: Incremental Load, 1: Full Load, 2: Manual Load
    IF @load_type IN ( 0, 1, 2 )
    BEGIN
        IF @load_type = 1
        BEGIN
            UPDATE dbo.etl_watermark
            SET [watermark_value] = '1900-01-01'
            WHERE [enable] = 1
                  AND batch_type = @batch_type
                  AND collection_type = @collection_type;
        END;
        IF @load_type = 2
        BEGIN
            UPDATE dbo.etl_watermark
            SET [watermark_value] = @manual_start_date
            WHERE [enable] = 1
                  AND batch_type = @batch_type
                  AND collection_type = @collection_type;
        END;
    END;
END;
GO
/************************* etl_get_list_data_pipelines **************************/
CREATE OR ALTER PROC dbo.etl_get_list_data_pipelines
    @batch_type NVARCHAR(255),
    @collection_type NVARCHAR(255) = NULL,
    @decryption_key NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT w.watermark_id,
           w.collection_type,
           --NULL AS source_object,
           ISNULL(w.source_object, '') AS source_object,
           ISNULL(w.source_query, '') AS source_query,
           w.source_connection_id,
           ISNULL(cs.connection_type, '') AS source_connection_type,
           ISNULL(cs.database_type, '') AS source_database_type,
           ISNULL(cs.driver, '') AS source_driver,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cs.[server])), '') AS source_server,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cs.[database])), '') AS source_database,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cs.[port])), '') AS source_port,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cs.[user])), '') AS source_user,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cs.[password])), '') AS source_password,
           ISNULL(cs.input_directory, '') AS source_input_directory,
           ISNULL(cs.archive_directory, '') AS source_archive_directory,
           ISNULL(cs.part_sheet_name_or_delimited, '') AS source_part_sheet_name_or_delimited,
           ISNULL(cs.skip_line_number, 0) AS source_skip_line_number,
           ISNULL(w.watermark_column, '') AS watermark_column,
           ISNULL(w.watermark_value, '2999-12-31') AS watermark_value,
           ISNULL(w.destination_table, '') AS destination_table,
           ISNULL(w.destination_sp_upsert, '') AS destination_sp_upsert,
           ISNULL(w.destination_table_type, '') AS destination_table_type,
           w.destination_connection_id,
           ISNULL(cd.connection_type, '') AS destination_connection_type,
           ISNULL(cd.database_type, '') AS destination_database_type,
           ISNULL(cd.driver, '') AS destination_driver,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cd.[server])), '') AS destination_server,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cd.[database])), '') AS destination_database,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cd.[port])), '') AS destination_port,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cd.[user])), '') AS destination_user,
           ISNULL(CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cd.[password])), '') AS destination_password,
           ISNULL(cd.input_directory, '') AS destination_input_directory,
           ISNULL(cd.archive_directory, '') AS destination_archive_directory,
           ISNULL(cd.part_sheet_name_or_delimited, '') AS destination_part_sheet_name_or_delimited,
           ISNULL(cd.skip_line_number, 0) AS destination_skip_line_number
    FROM dbo.etl_watermark w
        JOIN dbo.etl_connection cs
            ON cs.connection_id = w.source_connection_id
        JOIN dbo.etl_connection cd
            ON cd.connection_id = w.destination_connection_id
    WHERE w.batch_type = @batch_type
          AND w.collection_type = @collection_type
          AND w.enable = 1
    ORDER BY w.collection_type,
             w.ordinal;

END;
GO
/************************* etl_get_batch_id **************************/
CREATE OR ALTER PROC dbo.etl_get_batch_id
    @batch_type NVARCHAR(255),
    @batch_name NVARCHAR(255),
    @collection_types NVARCHAR(255) = NULL,
    @new_watermark_value DATETIME = NULL,
    @load_type INT = NULL,
    @manual_start_datetime DATETIME = NULL,
    @machine_name NVARCHAR(255) = NULL,
    @user_name NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @batch_id INT = -9999;
    DECLARE @table_etl_batch TABLE
    (
        batch_id INT
    );

    INSERT dbo.etl_batch
    (
        batch_name,
        batch_type,
        collection_types,
        new_watermark_value,
        created_datetime,
        load_type,
        manual_start_datetime,
        machine_name,
        user_name,
        modified_datetime
    )
    OUTPUT Inserted.batch_id
    INTO @table_etl_batch
    VALUES
    (   @batch_name,            -- batch_name - nvarchar(255)
        @batch_type,            -- batch_type - nvarchar(255)
        @collection_types,      -- collection_types - varchar(255)
        @new_watermark_value,   -- watermark_value - datetime
        GETDATE(),              -- created_datetime - datetime
        @load_type,             -- type_load - int
        @manual_start_datetime, -- manual_start_datetime - datetime
        @machine_name,          -- machine_name - nvarchar(255)
        @user_name,             -- user_name - nvarchar(255)
        GETDATE()               -- modified_datetime - datetime
        );

    SELECT TOP 1
           @batch_id = batch_id
    FROM @table_etl_batch;

    SELECT @batch_id AS batch_id;
    RETURN @batch_id;
END;
GO
/************************* etl_get_log_id **************************/
CREATE OR ALTER PROC dbo.etl_get_log_id
    @batch_id INT,
    @watermark_id INT,
    @watermark_value DATETIME,
    @new_watermark_value DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @log_id INT = -9999;
    DECLARE @table_etl_log TABLE
    (
        log_id INT
    );

    INSERT dbo.etl_log
    (
        created_datetime,
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
        modified_datetime
    )
    OUTPUT Inserted.log_id
    INTO @table_etl_log
    SELECT GETDATE(),
           @batch_id,
           watermark_id,
           batch_type,
           collection_type,
           source_connection_id,
           source_object,
           source_query,
           watermark_column,
           @watermark_value,
           @new_watermark_value,
           destination_connection_id,
           destination_table,
           destination_sp_upsert,
           destination_table_type,
           ordinal,
           GETDATE()
    FROM dbo.etl_watermark
    WHERE watermark_id = @watermark_id;

    SELECT TOP 1
           @log_id = log_id
    FROM @table_etl_log;

    SELECT @log_id AS log_id;
    RETURN @log_id;
END;
GO
/************************* etl_get_filelog_id **************************/
CREATE OR ALTER PROC dbo.etl_get_filelog_id
    @log_id INT,
    @file_name NVARCHAR(255),
    @full_path_input NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @filelog_id INT = -9999;
    DECLARE @table_etl_filelog TABLE
    (
        filelog_id INT
    );

    INSERT dbo.etl_filelog
    (
        file_name,
        full_path_input,
        created_datetime,
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
        modified_datetime
    )
    OUTPUT Inserted.filelog_id
    INTO @table_etl_filelog
    SELECT @file_name,
           @full_path_input,
           GETDATE(),
           l.batch_id,
           l.watermark_id,
           l.log_id,
           c.connection_type,
           c.database_type,
           c.input_directory,
           c.archive_directory,
           l.source_object,
           c.part_sheet_name_or_delimited,
           c.skip_line_number,
           GETDATE()
    FROM dbo.etl_log l
        JOIN dbo.etl_watermark w
            ON w.watermark_id = l.watermark_id
        JOIN dbo.etl_connection c
            ON c.connection_id = w.source_connection_id
    WHERE l.log_id = @log_id;

    SELECT TOP 1
           @filelog_id = filelog_id
    FROM @table_etl_filelog;

    SELECT @filelog_id AS filelog_id;
    RETURN @filelog_id;
END;
GO
/************************* etl_insert_logdetail **************************/
CREATE OR ALTER PROC dbo.etl_insert_logdetail
    @connection_id INT,
    @connection_type NVARCHAR(255),
    @watermark_id INT,
    @batch_id INT,
    @log_id INT,
    @filelog_id INT = NULL,
    @object_log NVARCHAR(255),
    @time_span TIME(7),
    @extract_rows INT = NULL,
    @before_import_rows INT = NULL,
    @import_rows INT = NULL,
    @after_import_rows INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT dbo.etl_logdetail
    (
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
        created_datetime
    )
    VALUES
    (   @connection_id,      -- connection_id - int
        @connection_type,    -- connection_type - nvarchar(255)
        @watermark_id,       -- watermark_id int
        @batch_id,           -- batch_id int
        @log_id,             -- log_id - int
        @filelog_id,         -- filelog_id - int
        @object_log,         -- object_log - nvarchar(255)
        @time_span,          -- time_span - time(7)
        @extract_rows,       -- extract_rows - int
        @before_import_rows, -- before_import_rows - int
        @import_rows,        -- import_rows - int
        @after_import_rows,  -- after_import_rows - int
        GETDATE()            -- created_datetime - datetime
        );
END;
GO
/************************* etl_insert_error **************************/
CREATE OR ALTER PROC dbo.etl_insert_error
    @batch_id INT,
    @log_id INT,
    @code NVARCHAR(255),
    @description NVARCHAR(MAX),
    @filelog_id INT = NULL,
    @pipeline NVARCHAR(255) = NULL,
    @task NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT dbo.etl_error
    (
        batch_id,
        log_id,
        filelog_id,
        code,
        description,
        pipeline,
        task,
        created_datetime
    )
    VALUES
    (   @batch_id,    -- batch_id - int
        @log_id,      -- log_id - int
        @filelog_id,  -- filelog_id int
        @code,        -- code - nvarchar(255)
        @description, -- description - nvarchar(max)
        @pipeline,    -- pipeline - nvarchar(255)
        @task,        -- task - nvarchar(255)
        GETDATE()     -- created_datetime - datetime
        );
END;
GO
/************************* etl_update_filelog_id **************************/
CREATE OR ALTER PROC dbo.etl_update_filelog_id
    @filelog_id INT,
    @is_succeeded BIT = 0,
    @full_path_archive NVARCHAR(500) = NULL,
    @extract_rows_file INT = NULL,
    @before_import_rows_file INT = NULL,
    @import_rows_file INT = NULL,
    @after_import_rows_file INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.etl_filelog
    SET full_path_archive = @full_path_archive,
        is_succeeded = @is_succeeded,
        is_completed = 1,
        completed_datetime = GETDATE(),
        failed_datetime = IIF(@is_succeeded = 1, NULL, GETDATE()),
        extract_rows = @extract_rows_file,
        before_import_rows = @before_import_rows_file,
        import_rows = @import_rows_file,
        after_import_rows = @after_import_rows_file,
		modified_datetime = GETDATE()
    WHERE filelog_id = @filelog_id;
END;
GO
/************************* etl_update_log_id **************************/
CREATE OR ALTER PROC dbo.etl_update_log_id
    @log_id INT,
    @is_succeeded BIT = 0,
    @extract_rows INT = NULL,
    @before_import_rows INT = NULL,
    @import_rows INT = NULL,
    @after_import_rows INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.etl_log
    SET is_succeeded = @is_succeeded,
        is_completed = 1,
        completed_datetime = GETDATE(),
        failed_datetime = IIF(@is_succeeded = 1, NULL, GETDATE()),
        extract_rows = @extract_rows,
        before_import_rows = @before_import_rows,
        import_rows = @import_rows,
        after_import_rows = @after_import_rows,
		modified_datetime = GETDATE()
    WHERE log_id = @log_id;
END;
GO
/************************* etl_update_watermark_id **************************/
CREATE OR ALTER PROC dbo.etl_update_watermark_id
    @watermark_id INT,
    @new_watermark_value DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.etl_watermark
    SET watermark_value = @new_watermark_value,
        last_watermark_value = watermark_value,
		modified_datetime = GETDATE()
    WHERE watermark_id = @watermark_id;
END;
GO
/************************* etl_update_batch_id **************************/
CREATE OR ALTER PROC dbo.etl_update_batch_id @batch_id INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @is_run BIT,
            @is_succeeded BIT,
            @count_pipeline INT,
            @count_pipeline_log_failed INT;
    SELECT @is_run = IIF(EXISTS (SELECT 1 FROM dbo.etl_log WHERE batch_id = @batch_id AND is_completed = 0), 1, 0);

    IF @is_run = 0
    BEGIN
        SELECT @count_pipeline_log_failed = SUM(IIF(is_succeeded = 0, 1, 0)),
               @count_pipeline = COUNT(1)
        FROM dbo.etl_log
        WHERE batch_id = @batch_id;

        SELECT @is_succeeded = IIF(
                                   @count_pipeline_log_failed = 0
                                   AND @count_pipeline > 0
                                   AND NOT EXISTS(SELECT 1 FROM dbo.etl_error WHERE batch_id = @batch_id),
                                   1,
                                   0);

        UPDATE dbo.etl_batch
        SET is_succeeded = @is_succeeded,
            is_completed = 1,
            completed_datetime = GETDATE(),
            failed_datetime = IIF(@is_succeeded = 1, NULL, GETDATE()),
            modified_datetime = GETDATE()
        WHERE batch_id = @batch_id;
    END;
END;
GO
/************************* etl_get_error_description **************************/
CREATE OR ALTER PROC dbo.etl_get_error_description
    @batch_id INT,
    @decryption_key NVARCHAR(255) = N'fb.com/dobuinguyenhieu',
    @error_description NVARCHAR(MAX) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @error_description = N'
'   ;

    SELECT @error_description
        = CONCAT(
                    @error_description,
                    '» error_id: ',
                    CONVERT(NVARCHAR(20), e.error_id),
                    ' | ',
                    'code: ',
                    ISNULL(e.code, 'NULL'),
                    ' | ',
                    '
	¬ ',
                    'message: ',
                    e.description,
                    '
	¬ ',
                    'watermark_id: ',
                    ISNULL(CONVERT(NVARCHAR(20), l.watermark_id), 'NULL'),
                    ' | ',
                    'log_id: ',
                    ISNULL(CONVERT(NVARCHAR(20), e.log_id), 'NULL'),
                    ' | ',
                    IIF(fl.filelog_id IS NOT NULL, 'filelog_id: ', ''),
                    IIF(fl.filelog_id IS NOT NULL, CONVERT(NVARCHAR(20), fl.filelog_id), ''),
                    IIF(fl.filelog_id IS NOT NULL, ' | ', ''),
                    '
	¬ ',
                    'connection_source: ',
                    ISNULL(CONVERT(NVARCHAR(20), l.source_connection_id), 'NULL'),
                    ' - ',
                    COALESCE(
                                CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cs.[database])),
                                cs.input_directory,
                                'NULL'
                            ),
                    ' | ',
                    'source_object: ',
                    ISNULL(l.source_object, 'NULL'),
                    ' | ',
                    IIF(fl.filelog_id IS NOT NULL, 'file_name: ', ''),
                    IIF(fl.filelog_id IS NOT NULL, fl.file_name, ''),
                    IIF(fl.filelog_id IS NOT NULL, ' | ', ''),
					IIF(fl.filelog_id IS NOT NULL, '
		* full_path_input: ', ''),
                    IIF(fl.filelog_id IS NOT NULL, fl.full_path_input, ''),
					IIF(fl.filelog_id IS NOT NULL, '
		* full_path_archive: ', ''),
                    IIF(fl.filelog_id IS NOT NULL, fl.full_path_archive, ''),
                    '
	¬ ',
                    'connection_destination: ',
                    ISNULL(CONVERT(NVARCHAR(20), l.destination_connection_id), 'NULL'),
                    ' - ',
                    COALESCE(
                                CONVERT(VARCHAR(255), DECRYPTBYPASSPHRASE(@decryption_key, cd.[database])),
                                cd.input_directory,
                                'NULL'
                            ),
                    ' | ',
                    'destination_table: ',
                    ISNULL(l.destination_table, 'NULL'),
                    ' | ',
                    'destination_table_type: ',
                    ISNULL(l.destination_table_type, 'NULL'),
                    ' | ',
                    'destination_sp_upsert: ',
                    ISNULL(l.destination_sp_upsert, 'NULL'),
                    ' | ',
                    '
'
                )
    --SELECT *				
    FROM dbo.etl_error e
        LEFT JOIN dbo.etl_log l
            ON e.log_id = l.log_id
        LEFT JOIN dbo.etl_connection cs
            ON l.source_connection_id = cs.connection_id
        LEFT JOIN dbo.etl_connection cd
            ON l.destination_connection_id = cd.connection_id
        LEFT JOIN dbo.etl_filelog fl
            ON fl.filelog_id = e.filelog_id
    WHERE e.batch_id = @batch_id;

    SELECT @error_description AS error_description;
--RETURN @error_description;
--PRINT @error_description
END;
GO
