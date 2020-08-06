DROP TABLE IF EXISTS [dbo].[DimDate];
CREATE TABLE [dbo].[DimDate](
	[DateKey] [INT] NOT NULL,
	[Date] [DATE] NOT NULL,
	[DayNumber] [INT] NOT NULL,
	[DayLabel] [NVARCHAR](2) NOT NULL,
	[WeekDay] [NVARCHAR](10) NOT NULL,
	[ShortWeekDay] [NVARCHAR](3) NOT NULL,
	[WeekDayVN] [NVARCHAR](20) NOT NULL,
	[Month] [NVARCHAR](10) NOT NULL,
	[ShortMonth] [NVARCHAR](3) NOT NULL,
	[MonthNumber] [INT] NOT NULL,
	[MonthLabel] [NVARCHAR](20) NOT NULL,
	[MonthVN] [NVARCHAR](20) NOT NULL,
	[QuarterNumber] [INT] NOT NULL,
	[QuarterLabel] [NVARCHAR](1) NOT NULL,
	[YearNumber] [INT] NOT NULL,
	[YearLabel] [NVARCHAR](4) NOT NULL,
	[ISOWeekNumber] [INT] NOT NULL,
	[LunarDate] [NVARCHAR](10) NULL,
	[LunarDay] [INT] NULL,
	[LunarMonth] [INT] NULL,
	[LunarYear] [INT] NULL,
	[LunarIsLeapMonth] [BIT] NULL,
	[LunarIsLeapYear] [BIT] NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
)
GO
--===================================================================
CREATE OR ALTER FUNCTION [dbo].[GenerateDateDimensionColumns]
(
    @Date DATE
)
RETURNS TABLE
AS
RETURN SELECT YEAR(@Date) * 10000 + MONTH(@Date) * 100 + DAY(@Date) AS DateKey,
              @Date AS [Date],
              DAY(@Date) AS [DayNumber],
              CAST(DAY(@Date) AS NVARCHAR(2)) AS DayLabel,
              CAST(DATENAME(WEEKDAY, @Date) AS NVARCHAR(10)) AS [WeekDay],
              CAST(SUBSTRING(DATENAME(WEEKDAY, @Date), 1, 3) AS NVARCHAR(10)) AS [ShortWeekDay],
              CASE DATENAME(WEEKDAY, @Date)
                  WHEN N'Monday' THEN
                      N'Thứ hai'
                  WHEN N'Tuesday' THEN
                      N'Thứ ba'
                  WHEN N'Wednesday' THEN
                      N'Thứ tư'
                  WHEN N'Thursday' THEN
                      N'Thứ năm'
                  WHEN N'Friday' THEN
                      N'Thứ sáu'
                  WHEN N'Saturday' THEN
                      N'Thứ bảy'
                  WHEN N'Sunday' THEN
                      N'Chủ nhật'
                  ELSE
                      N'Unknown'
              END AS WeekdayVN,
              CAST(DATENAME(MONTH, @Date) AS NVARCHAR(10)) AS [Month],
              CAST(SUBSTRING(DATENAME(MONTH, @Date), 1, 3) AS NVARCHAR(3)) AS [ShortMonth],
              MONTH(@Date) AS [MonthNumber],
              CAST(CAST(YEAR(@Date) AS NVARCHAR(4)) + N'-' + SUBSTRING(DATENAME(MONTH, @Date), 1, 3) AS NVARCHAR(10)) AS [MonthLabel],
              CONCAT(N'Tháng ', CAST(MONTH(@Date) AS NVARCHAR(2))) AS MonthVN,
              DATENAME(QUARTER, @Date) AS QuarterNumber,
              CAST(DATENAME(QUARTER, @Date) AS NVARCHAR(1)) AS QuarterLabel,
              YEAR(@Date) AS [YearNumber],
              CAST(YEAR(@Date) AS NVARCHAR(4)) AS YearLabel,
              DATEPART(ISO_WEEK, @Date) AS [ISOWeekNumber];
GO
--===================================================================
CREATE OR ALTER PROCEDURE [dbo].[PopulateDateDimensionForYear] @YearNumber INT
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @DateCounter DATE = DATEFROMPARTS(@YearNumber, 1, 1);

    BEGIN TRY;

        BEGIN TRAN;

        WHILE YEAR(@DateCounter) = @YearNumber
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM dbo.DimDate WHERE [Date] = @DateCounter)
            BEGIN
                INSERT dbo.DimDate
                (
                    DateKey,
                    Date,
                    DayNumber,
                    DayLabel,
                    WeekDay,
                    ShortWeekDay,
                    WeekDayVN,
                    Month,
                    ShortMonth,
                    MonthNumber,
                    MonthLabel,
                    MonthVN,
                    QuarterNumber,
                    QuarterLabel,
                    YearNumber,
                    YearLabel,
                    ISOWeekNumber
                )
                SELECT DateKey,
                       Date,
                       DayNumber,
                       DayLabel,
                       WeekDay,
                       ShortWeekDay,
                       WeekdayVN,
                       Month,
                       ShortMonth,
                       MonthNumber,
                       MonthLabel,
                       MonthVN,
                       QuarterNumber,
                       QuarterLabel,
                       YearNumber,
                       YearLabel,
                       ISOWeekNumber
                FROM dbo.GenerateDateDimensionColumns(@DateCounter);
            END;
            SET @DateCounter = DATEADD(DAY, 1, @DateCounter);
        END;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK;
        PRINT N'Unable to populate dates for the year';
        THROW;
        RETURN -1;
    END CATCH;

    RETURN 0;
END;
GO

