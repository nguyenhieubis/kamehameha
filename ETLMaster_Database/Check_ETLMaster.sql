/*
TRUNCATE TABLE dbo.etl_connection
TRUNCATE TABLE dbo.etl_watermark

TRUNCATE TABLE dbo.etl_batch
TRUNCATE TABLE dbo.etl_log
TRUNCATE TABLE dbo.etl_filelog
TRUNCATE TABLE dbo.etl_error
TRUNCATE TABLE dbo.etl_logdetail
*/

SELECT * FROM dbo.etl_connection ORDER BY connection_id DESC
SELECT * FROM dbo.etl_watermark ORDER BY watermark_id DESC

SELECT * FROM dbo.etl_batch ORDER BY batch_id DESC
SELECT TOP 1000 * FROM dbo.etl_log ORDER BY batch_id DESC, watermark_id DESC

SELECT TOP 1000 * FROM dbo.etl_logdetail ORDER BY logdetail_id DESC

SELECT TOP 1000 * FROM dbo.etl_filelog ORDER BY filelog_id DESC

SELECT * FROM dbo.etl_error ORDER BY error_id DESC


GO

SELECT datediff(second,created_datetime,completed_datetime),* FROM dbo.etl_batch

GO

go


