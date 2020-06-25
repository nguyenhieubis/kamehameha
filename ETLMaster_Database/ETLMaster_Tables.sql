/************************* etl_connection **************************/
DROP TABLE IF EXISTS [dbo].[etl_connection];
GO
CREATE TABLE [dbo].[etl_connection]
(
    [connection_id] [INT] NOT NULL PRIMARY KEY,
    [connection_type] [VARCHAR](255) NULL,
    [database_type] [VARCHAR](255) NULL,
    [driver] [NVARCHAR](255) NULL,
    [server] [VARCHAR](255) NULL,
    [database] [VARCHAR](255) NULL,
    [port] [NVARCHAR](20) NULL,
    [user] [VARCHAR](255) NULL,
    [password] [VARCHAR](255) NULL,
    [input_directory] [NVARCHAR](500) NULL,
    [archive_directory] [NVARCHAR](500) NULL,
    [part_sheet_name_or_delimited] [NVARCHAR](255) NULL,
    [skip_line_number] [INT] NULL DEFAULT 0,
    [created_datetime] [DATETIME]
        DEFAULT GETDATE(),
    [modified_datetime] [DATETIME]
        DEFAULT GETDATE()
);
GO
/************************* etl_watermark **************************/
DROP TABLE IF EXISTS [dbo].[etl_watermark];
GO
CREATE TABLE [dbo].[etl_watermark]
(
    [watermark_id] [INT] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
    [batch_type] [NVARCHAR](255) NULL,
    [collection_type] [VARCHAR](255) NOT NULL,
    [source_connection_id] [INT] NULL,
    [source_object] [VARCHAR](255) NULL,
    [source_query] [NVARCHAR](MAX) NULL,
    [watermark_column] [VARCHAR](255) NULL,
    [watermark_value] [DATETIME] NULL DEFAULT '1900-01-01',
    [last_watermark_value] [DATETIME] NULL DEFAULT '1900-01-01',
    [destination_connection_id] [INT] NULL,
    [destination_table] [VARCHAR](255) NULL,
    [destination_sp_upsert] [NVARCHAR](255) NULL,
    [destination_table_type] [VARCHAR](255) NULL,
    [ordinal] [INT] NULL,
    [enable] [BIT]
        DEFAULT 0,
    [scds] INT NULL,
    [created_datetime] [DATETIME]
        DEFAULT GETDATE(),
    [modified_datetime] [DATETIME]
        DEFAULT GETDATE()
);
GO
/************************* etl_batch **************************/
DROP TABLE IF EXISTS [dbo].[etl_batch];
GO
CREATE TABLE [dbo].[etl_batch]
(
    [batch_id] [INT] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
    [batch_name] [NVARCHAR](255) NULL,
    [batch_type] [NVARCHAR](255) NULL,
    [collection_types] [VARCHAR](255) NOT NULL,
    [new_watermark_value] [DATETIME] NULL,
    [is_succeeded] [BIT]
        DEFAULT 0,
    [is_completed] [BIT]
        DEFAULT 0,
    [created_datetime] [DATETIME]
        DEFAULT GETDATE(),
    [completed_datetime] [DATETIME] NULL,
    [failed_datetime] [DATETIME] NULL,
    [load_type] [INT] NULL,
	[manual_start_datetime] DATETIME,
    [machine_name] [NVARCHAR](255) NULL,
    [user_name] [NVARCHAR](255) NULL,
    [modified_datetime] [DATETIME]
        DEFAULT GETDATE()
);
GO
/************************* etl_log **************************/
DROP TABLE IF EXISTS [dbo].[etl_log];
GO
CREATE TABLE [dbo].[etl_log]
(
    [log_id] [INT] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
    [is_succeeded] [BIT]
        DEFAULT 0,
    [is_completed] [BIT]
        DEFAULT 0,
    [created_datetime] [DATETIME]
        DEFAULT GETDATE(),
    [completed_datetime] [DATETIME] NULL,
    [failed_datetime] [DATETIME] NULL,
    [extract_rows] [INT] NULL,
    [before_import_rows] [INT] NULL,
    [import_rows] [INT] NULL,
    [after_import_rows] [INT] NULL,
    [batch_id] [INT] NOT NULL,
    [watermark_id] [INT] NOT NULL,
    [batch_type] [NVARCHAR](255) NULL,
    [collection_type] [NVARCHAR](255) NULL,
	[source_connection_id] INT,
    [source_object] [NVARCHAR](255) NULL,
    [source_query] [NVARCHAR](MAX) NULL,
    [watermark_column] [NVARCHAR](255) NULL,
    [watermark_value] [DATETIME] NULL,
    [new_watermark_value] [DATETIME] NULL,
	[destination_connection_id] INT,
    [destination_table] [NVARCHAR](255) NULL,
    [destination_sp_upsert] [NVARCHAR](255) NULL,
    [destination_table_type] [NVARCHAR](255) NULL,
    [ordinal] [INT] NULL,
    [modified_datetime] [DATETIME]
        DEFAULT GETDATE()
);
GO
/************************* etl_logdetail **************************/
DROP TABLE IF EXISTS [dbo].[etl_logdetail];
GO
CREATE TABLE [dbo].[etl_logdetail]
(
    [logdetail_id] [INT] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
    [connection_id] INT NULL,
    [connection_type] [NVARCHAR](255) NULL,
    [watermark_id] INT NULL,
    [batch_id] INT NULL,
    [log_id] [INT] NULL,
    [filelog_id] [INT] NULL,
    [object_log] [NVARCHAR](255) NULL,
    [time_span] [TIME](7) NULL,
    [extract_rows] [INT] NULL,
    [before_import_rows] [INT] NULL,
    [import_rows] [INT] NULL,
    [after_import_rows] [INT] NULL,
    [created_datetime] [DATETIME]
        DEFAULT GETDATE()
);
GO
/************************* etl_filelog **************************/
DROP TABLE IF EXISTS [dbo].[etl_filelog];
GO
CREATE TABLE [dbo].[etl_filelog]
(
    [filelog_id] [INT] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
    [file_name] [NVARCHAR](255) NULL,
    [full_path_input] [NVARCHAR](500) NULL,
    [full_path_archive] [NVARCHAR](500) NULL,
    [is_succeeded] [BIT]
        DEFAULT 0,
    [is_completed] [BIT]
        DEFAULT 0,
    [created_datetime] [DATETIME]
        DEFAULT GETDATE(),
    [completed_datetime] [DATETIME] NULL,
    [failed_datetime] [DATETIME] NULL,
    [extract_rows] [INT] NULL,
    [before_import_rows] [INT] NULL,
    [import_rows] [INT] NULL,
    [after_import_rows] [INT] NULL,
    [batch_id] [INT] NOT NULL,
    [watermark_id] [INT] NULL,
    [log_id] [INT] NOT NULL,
    [connection_type] [NVARCHAR](255) NULL,
    [database_type] [NVARCHAR](255) NULL,
    [input_directory] [NVARCHAR](255) NULL,
    [archive_directory] [NVARCHAR](255) NULL,
    [search_pattern] [NVARCHAR](255) NULL,
    [part_sheet_name_or_delimited] [NVARCHAR](255) NULL,
    [skip_line_number] [INT] NULL,
    [modified_datetime] [DATETIME]
        DEFAULT GETDATE()
);
GO
/************************* etl_error **************************/
DROP TABLE IF EXISTS [dbo].[etl_error];
GO
CREATE TABLE [dbo].[etl_error]
(
    [error_id] [INT] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
    [batch_id] INT,
    [log_id] INT,
	[filelog_id] INT,
    [code] NVARCHAR(255),
    [description] NVARCHAR(MAX),
    [pipeline] NVARCHAR(255),
    [task] NVARCHAR(255),
    [created_datetime] [DATETIME]
        DEFAULT GETDATE()
);
GO
