﻿DROP TABLE IF EXISTS [dbo].[d_date];
CREATE TABLE [dbo].[d_date]
(
    [DateKey] [INT] NOT NULL,
    [Date] [DATE] NOT NULL,
    [DayNumber] [tinyint] NOT NULL,
    [DayLabel] [NVARCHAR](2) NOT NULL,
    [WeekDay] [NVARCHAR](10) NOT NULL,
    [ShortWeekDay] [NVARCHAR](3) NOT NULL,
    [WeekDayVN] [NVARCHAR](10) NOT NULL,
    [Month] [NVARCHAR](10) NOT NULL,
    [ShortMonth] [NVARCHAR](3) NOT NULL,
    [MonthNumber] [tinyint] NOT NULL,
    [MonthLabel] [NVARCHAR](20) NOT NULL,
	[MonthID] INT,
    [MonthVN] [NVARCHAR](10) NOT NULL,
    [QuarterNumber] [tinyint] NOT NULL,
    [QuarterLabel] [NVARCHAR](1) NOT NULL,
    [YearNumber] [smallint] NOT NULL,
    [YearLabel] [NVARCHAR](4) NOT NULL,
    [ISOWeekNumber] [tinyint] NOT NULL,
    [LunarDate] [NVARCHAR](10) NULL,
    [LunarDay] [tinyint] NULL,
    [LunarMonth] [tinyint] NULL,
    [LunarYear] [smallint] NULL,
    [LunarIsLeapMonth] [BIT] NULL,
    [LunarIsLeapYear] [BIT] NULL,
    CONSTRAINT [PK_d_date]
        PRIMARY KEY CLUSTERED (DateKey)
);
GO
CREATE OR ALTER VIEW v_d_date
AS
SELECT DateKey,
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
	   [MonthID],
       MonthVN,
       QuarterNumber,
       QuarterLabel,
       YearNumber,
       YearLabel,
       ISOWeekNumber,
       LunarDate,
       LunarDay,
       LunarMonth,
       LunarYear,
       LunarIsLeapMonth,
       LunarIsLeapYear
FROM dbo.d_date (NOLOCK)
WHERE YearNumber <= YEAR(GETDATE())
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
			  YEAR(@Date)*100 + MONTH(@Date) AS [MonthID],
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
            IF NOT EXISTS (SELECT 1 FROM dbo.d_date WHERE [Date] = @DateCounter)
            BEGIN
                INSERT dbo.d_date
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
					[MonthID],
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
					   [MonthID],
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
DROP PROC IF EXISTS [usp_upsert_lunar_d_date];
DROP TYPE IF EXISTS [dbo].[type_d_date];
CREATE TYPE [dbo].[type_d_date] AS TABLE
(
    [DateKey] [INT] NOT NULL,
    [Date] [DATE] NOT NULL,
    [DayNumber] [tinyint] NOT NULL,
    [DayLabel] [NVARCHAR](2) NOT NULL,
    [WeekDay] [NVARCHAR](10) NOT NULL,
    [ShortWeekDay] [NVARCHAR](3) NOT NULL,
    [WeekDayVN] [NVARCHAR](10) NOT NULL,
    [Month] [NVARCHAR](10) NOT NULL,
    [ShortMonth] [NVARCHAR](3) NOT NULL,
    [MonthNumber] [tinyint] NOT NULL,
    [MonthLabel] [NVARCHAR](20) NOT NULL,
	[MonthID] INT,
    [MonthVN] [NVARCHAR](10) NOT NULL,
    [QuarterNumber] [tinyint] NOT NULL,
    [QuarterLabel] [NVARCHAR](1) NOT NULL,
    [YearNumber] [smallint] NOT NULL,
    [YearLabel] [NVARCHAR](4) NOT NULL,
    [ISOWeekNumber] [tinyint] NOT NULL,
    [LunarDate] [NVARCHAR](10) NULL,
    [LunarDay] [tinyint] NULL,
    [LunarMonth] [tinyint] NULL,
    [LunarYear] [smallint] NULL,
    [LunarIsLeapMonth] [BIT] NULL,
    [LunarIsLeapYear] [BIT] NULL
);
GO
CREATE OR ALTER PROC [dbo].[usp_upsert_lunar_d_date] @tvp type_d_date READONLY
AS
BEGIN
    SET NOCOUNT ON;

    MERGE dbo.d_date AS target
    USING
    (
        SELECT DateKey,
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
			   [MonthID],
               MonthVN,
               QuarterNumber,
               QuarterLabel,
               YearNumber,
               YearLabel,
               ISOWeekNumber,
               LunarDate,
               LunarDay,
               LunarMonth,
               LunarYear,
               LunarIsLeapMonth,
               LunarIsLeapYear
        FROM @tvp
    ) AS source
    ON target.DateKey = source.DateKey
    WHEN MATCHED THEN
        UPDATE SET target.LunarDate = source.LunarDate,
                   target.LunarDay = source.LunarDay,
                   target.LunarMonth = source.LunarMonth,
                   target.LunarYear = source.LunarYear,
                   target.LunarIsLeapMonth = source.LunarIsLeapMonth,
                   target.LunarIsLeapYear = source.LunarIsLeapYear
    WHEN NOT MATCHED THEN
        INSERT
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
			[MonthID],
            MonthVN,
            QuarterNumber,
            QuarterLabel,
            YearNumber,
            YearLabel,
            ISOWeekNumber,
            LunarDate,
            LunarDay,
            LunarMonth,
            LunarYear,
            LunarIsLeapMonth,
            LunarIsLeapYear
        )
        VALUES
        (source.DateKey, source.Date, source.DayNumber, source.DayLabel, source.WeekDay, source.ShortWeekDay,
         source.WeekDayVN, source.Month, source.ShortMonth, source.MonthNumber, source.MonthLabel, source.[MonthID], source.MonthVN,
         source.QuarterNumber, source.QuarterLabel, source.YearNumber, source.YearLabel, source.ISOWeekNumber,
         source.LunarDate, source.LunarDay, source.LunarMonth, source.LunarYear, source.LunarIsLeapMonth,
         source.LunarIsLeapYear);
END;
