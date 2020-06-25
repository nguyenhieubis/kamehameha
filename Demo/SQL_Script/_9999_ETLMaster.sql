USE ETLMaster
GO
---------------------------// CONNECTION //---------------------------
DECLARE @key nvarchar(255) = 'fb.com/dobuinguyenhieu'
INSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES (9999, 'ETLMaster', 'SQLServer', NULL, ENCRYPTBYPASSPHRASE(@key, 'localhost'), 
ENCRYPTBYPASSPHRASE(@key, 'ETLMaster'), NULL, NULL, NULL, 
NULL, NULL, NULL, NULL);

INSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES (200, 'DW', 'SQLServer', NULL, ENCRYPTBYPASSPHRASE(@key, 'localhost'), 
ENCRYPTBYPASSPHRASE(@key, 'Dev_DW'), NULL, ENCRYPTBYPASSPHRASE(@key, 'hieudo'), ENCRYPTBYPASSPHRASE(@key, 'P@ssw0rd1'), 
NULL, NULL, NULL, NULL);

INSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES (100, 'Staging', 'SQLServer', NULL, ENCRYPTBYPASSPHRASE(@key, 'localhost'), 
ENCRYPTBYPASSPHRASE(@key, 'Dev_Staging'), NULL, ENCRYPTBYPASSPHRASE(@key, 'hieudo'), ENCRYPTBYPASSPHRASE(@key, 'P@ssw0rd1'), 
NULL, NULL, NULL, NULL);

INSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES (1, 'Source', 'CSV', NULL, NULL, 
NULL, NULL, NULL, NULL, 
'C:\GitHub\kamehameha\Demo\Train_CSV','C:\GitHub\kamehameha\Demo\Train_CSV\Archive','|',NULL);

INSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES (2, 'Source', 'Excel', NULL, NULL, 
NULL, NULL, NULL, NULL, 
'C:\GitHub\kamehameha\Demo\Train_Excel','C:\GitHub\kamehameha\Demo\Train_Excel\Archive',NULL, NULL);

INSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES (20, 'Source', 'SQLServer', NULL, ENCRYPTBYPASSPHRASE(@key, 'localhost'), 
ENCRYPTBYPASSPHRASE(@key, 'AdventureWorks2012'), NULL, ENCRYPTBYPASSPHRASE(@key, 'hieudo'), ENCRYPTBYPASSPHRASE(@key, 'P@ssw0rd1'), 
NULL, NULL, NULL, NULL);

INSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES (30, 'Source', 'MySQL', 'MySQL ODBC 8.0 Unicode Driver',ENCRYPTBYPASSPHRASE(@key, 'localhost'), 
ENCRYPTBYPASSPHRASE(@key, 'classicmodels'), NULL, ENCRYPTBYPASSPHRASE(@key, 'hieudo'), ENCRYPTBYPASSPHRASE(@key, 'P@ssw0rd1'), 
NULL, NULL, NULL, NULL);

INSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES (40, 'Source', 'PostgreSQL', 'PostgreSQL ODBC Driver(UNICODE)',ENCRYPTBYPASSPHRASE(@key, 'localhost'), 
ENCRYPTBYPASSPHRASE(@key, 'dvdrental'), NULL, ENCRYPTBYPASSPHRASE(@key, 'hieudo'), ENCRYPTBYPASSPHRASE(@key, 'P@ssw0rd1'), 
NULL, NULL, NULL, NULL);

INSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES (50, 'Source', 'MongoDB', NULL, ENCRYPTBYPASSPHRASE(@key, 'localhost'), 
ENCRYPTBYPASSPHRASE(@key, 'sample_db'), NULL, ENCRYPTBYPASSPHRASE(@key, 'hieudo'), ENCRYPTBYPASSPHRASE(@key, 'P@ssw0rd1'), 
NULL, NULL, NULL, NULL);


USE ETLMaster
GO
---------------------------// WATERMARK //---------------------------
---------------// File : nan => Agreement_Template_Detail //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'File', 1, 'Agreement_Template_Detail*.*', @querystr, NULL, 
100, 'Agreement_Template_Detail', 'sp_upsert_Agreement_Template_Detail', 'type_Agreement_Template_Detail', 0, 1, 1);
GO
---------------// File : nan => DISTRIBUTOR_INFO //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'File', 1, 'DISTRIBUTOR_INFO*.*', @querystr, NULL, 
100, 'DISTRIBUTOR_INFO', 'sp_upsert_DISTRIBUTOR_INFO', 'type_DISTRIBUTOR_INFO', 1, 1, 1);
GO
---------------// File : nan => NPS_Price //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'File', 2, 'NPS_Price*.*', @querystr, NULL, 
100, 'NPS_Price', 'sp_upsert_NPS_Price', 'type_NPS_Price', 2, 1, 1);
GO
---------------// DB : sp_select_Production_ScrapReason => Production_ScrapReason //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ScrapReasonID],
[Name],
[ModifiedDate]
FROM Production.ScrapReason (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ScrapReason', @querystr, 'ModifiedDate', 
100, 'Production_ScrapReason', 'sp_upsert_Production_ScrapReason', 'type_Production_ScrapReason', 3, 1, 1);
GO
---------------// DB : sp_select_HumanResources_Shift => HumanResources_Shift //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ShiftID],
[Name],
[StartTime],
[EndTime],
[ModifiedDate]
FROM HumanResources.Shift (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_HumanResources_Shift', @querystr, 'ModifiedDate', 
100, 'HumanResources_Shift', 'sp_upsert_HumanResources_Shift', 'type_HumanResources_Shift', 4, 1, 1);
GO
---------------// DB : sp_select_Production_ProductCategory => Production_ProductCategory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductCategoryID],
[Name],
[rowguid],
[ModifiedDate]
FROM Production.ProductCategory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductCategory', @querystr, 'ModifiedDate', 
100, 'Production_ProductCategory', 'sp_upsert_Production_ProductCategory', 'type_Production_ProductCategory', 5, 1, 1);
GO
---------------// DB : sp_select_Purchasing_ShipMethod => Purchasing_ShipMethod //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ShipMethodID],
[Name],
[ShipBase],
[ShipRate],
[rowguid],
[ModifiedDate]
FROM Purchasing.ShipMethod (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Purchasing_ShipMethod', @querystr, 'ModifiedDate', 
100, 'Purchasing_ShipMethod', 'sp_upsert_Purchasing_ShipMethod', 'type_Purchasing_ShipMethod', 6, 1, 1);
GO
---------------// DB : sp_select_Production_ProductCostHistory => Production_ProductCostHistory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductID],
[StartDate],
[EndDate],
[StandardCost],
[ModifiedDate]
FROM Production.ProductCostHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductCostHistory', @querystr, 'ModifiedDate', 
100, 'Production_ProductCostHistory', 'sp_upsert_Production_ProductCostHistory', 'type_Production_ProductCostHistory', 7, 1, 1);
GO
---------------// DB : sp_select_Production_ProductDescription => Production_ProductDescription //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductDescriptionID],
[Description],
[rowguid],
[ModifiedDate]
FROM Production.ProductDescription (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductDescription', @querystr, 'ModifiedDate', 
100, 'Production_ProductDescription', 'sp_upsert_Production_ProductDescription', 'type_Production_ProductDescription', 8, 1, 1);
GO
---------------// DB : sp_select_Sales_ShoppingCartItem => Sales_ShoppingCartItem //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ShoppingCartItemID],
[ShoppingCartID],
[Quantity],
[ProductID],
[DateCreated],
[ModifiedDate]
FROM Sales.ShoppingCartItem (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_ShoppingCartItem', @querystr, 'ModifiedDate', 
100, 'Sales_ShoppingCartItem', 'sp_upsert_Sales_ShoppingCartItem', 'type_Sales_ShoppingCartItem', 9, 1, 1);
GO
---------------// DB : sp_select_dbo_DatabaseLog => dbo_DatabaseLog //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [DatabaseLogID],
[PostTime],
[DatabaseUser],
[Event],
[Schema],
[Object],
[TSQL],
[XmlEvent]
FROM dbo.DatabaseLog (NOLOCK);';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_dbo_DatabaseLog', @querystr, NULL, 
100, 'dbo_DatabaseLog', 'sp_upsert_dbo_DatabaseLog', 'type_dbo_DatabaseLog', 10, 1, 1);
GO
---------------// DB : sp_select_Production_ProductInventory => Production_ProductInventory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductID],
[LocationID],
[Shelf],
[Bin],
[Quantity],
[rowguid],
[ModifiedDate]
FROM Production.ProductInventory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductInventory', @querystr, 'ModifiedDate', 
100, 'Production_ProductInventory', 'sp_upsert_Production_ProductInventory', 'type_Production_ProductInventory', 11, 1, 1);
GO
---------------// DB : sp_select_Sales_SpecialOffer => Sales_SpecialOffer //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [SpecialOfferID],
[Description],
[DiscountPct],
[Type],
[Category],
[StartDate],
[EndDate],
[MinQty],
[MaxQty],
[rowguid],
[ModifiedDate]
FROM Sales.SpecialOffer (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SpecialOffer', @querystr, 'ModifiedDate', 
100, 'Sales_SpecialOffer', 'sp_upsert_Sales_SpecialOffer', 'type_Sales_SpecialOffer', 12, 1, 1);
GO
---------------// DB : sp_select_dbo_ErrorLog => dbo_ErrorLog //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ErrorLogID],
[ErrorTime],
[UserName],
[ErrorNumber],
[ErrorSeverity],
[ErrorState],
[ErrorProcedure],
[ErrorLine],
[ErrorMessage]
FROM dbo.ErrorLog (NOLOCK);';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_dbo_ErrorLog', @querystr, NULL, 
100, 'dbo_ErrorLog', 'sp_upsert_dbo_ErrorLog', 'type_dbo_ErrorLog', 13, 1, 1);
GO
---------------// DB : sp_select_Production_ProductListPriceHistory => Production_ProductListPriceHistory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductID],
[StartDate],
[EndDate],
[ListPrice],
[ModifiedDate]
FROM Production.ProductListPriceHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductListPriceHistory', @querystr, 'ModifiedDate', 
100, 'Production_ProductListPriceHistory', 'sp_upsert_Production_ProductListPriceHistory', 'type_Production_ProductListPriceHistory', 14, 1, 1);
GO
---------------// DB : sp_select_Sales_SpecialOfferProduct => Sales_SpecialOfferProduct //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [SpecialOfferID],
[ProductID],
[rowguid],
[ModifiedDate]
FROM Sales.SpecialOfferProduct (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SpecialOfferProduct', @querystr, 'ModifiedDate', 
100, 'Sales_SpecialOfferProduct', 'sp_upsert_Sales_SpecialOfferProduct', 'type_Sales_SpecialOfferProduct', 15, 1, 1);
GO
---------------// DB : sp_select_Production_ProductModel => Production_ProductModel //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductModelID],
[Name],
[CatalogDescription],
[Instructions],
[rowguid],
[ModifiedDate]
FROM Production.ProductModel (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductModel', @querystr, 'ModifiedDate', 
100, 'Production_ProductModel', 'sp_upsert_Production_ProductModel', 'type_Production_ProductModel', 16, 1, 1);
GO
---------------// DB : sp_select_Person_StateProvince => Person_StateProvince //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [StateProvinceID],
[StateProvinceCode],
[CountryRegionCode],
[IsOnlyStateProvinceFlag],
[Name],
[TerritoryID],
[rowguid],
[ModifiedDate]
FROM Person.StateProvince (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_StateProvince', @querystr, 'ModifiedDate', 
100, 'Person_StateProvince', 'sp_upsert_Person_StateProvince', 'type_Person_StateProvince', 17, 1, 1);
GO
---------------// DB : sp_select_Production_ProductModelIllustration => Production_ProductModelIllustration //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductModelID],
[IllustrationID],
[ModifiedDate]
FROM Production.ProductModelIllustration (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductModelIllustration', @querystr, 'ModifiedDate', 
100, 'Production_ProductModelIllustration', 'sp_upsert_Production_ProductModelIllustration', 'type_Production_ProductModelIllustration', 18, 1, 1);
GO
---------------// DB : sp_select_dbo_AWBuildVersion => dbo_AWBuildVersion //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [SystemInformationID],
[Database Version],
[VersionDate],
[ModifiedDate]
FROM dbo.AWBuildVersion (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_dbo_AWBuildVersion', @querystr, 'ModifiedDate', 
100, 'dbo_AWBuildVersion', 'sp_upsert_dbo_AWBuildVersion', 'type_dbo_AWBuildVersion', 19, 1, 1);
GO
---------------// DB : sp_select_Production_ProductModelProductDescriptionCulture => Production_ProductModelProductDescriptionCulture //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductModelID],
[ProductDescriptionID],
[CultureID],
[ModifiedDate]
FROM Production.ProductModelProductDescriptionCulture (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductModelProductDescriptionCulture', @querystr, 'ModifiedDate', 
100, 'Production_ProductModelProductDescriptionCulture', 'sp_upsert_Production_ProductModelProductDescriptionCulture', 'type_Production_ProductModelProductDescriptionCulture', 20, 1, 1);
GO
---------------// DB : sp_select_Production_BillOfMaterials => Production_BillOfMaterials //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BillOfMaterialsID],
[ProductAssemblyID],
[ComponentID],
[StartDate],
[EndDate],
[UnitMeasureCode],
[BOMLevel],
[PerAssemblyQty],
[ModifiedDate]
FROM Production.BillOfMaterials (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_BillOfMaterials', @querystr, 'ModifiedDate', 
100, 'Production_BillOfMaterials', 'sp_upsert_Production_BillOfMaterials', 'type_Production_BillOfMaterials', 21, 1, 1);
GO
---------------// DB : sp_select_Sales_Store => Sales_Store //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[Name],
[SalesPersonID],
[Demographics],
[rowguid],
[ModifiedDate]
FROM Sales.Store (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_Store', @querystr, 'ModifiedDate', 
100, 'Sales_Store', 'sp_upsert_Sales_Store', 'type_Sales_Store', 22, 1, 1);
GO
---------------// DB : sp_select_Production_ProductPhoto => Production_ProductPhoto //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductPhotoID],
[ThumbNailPhoto],
[ThumbnailPhotoFileName],
[LargePhoto],
[LargePhotoFileName],
[ModifiedDate]
FROM Production.ProductPhoto (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductPhoto', @querystr, 'ModifiedDate', 
100, 'Production_ProductPhoto', 'sp_upsert_Production_ProductPhoto', 'type_Production_ProductPhoto', 23, 1, 1);
GO
---------------// DB : sp_select_Production_ProductProductPhoto => Production_ProductProductPhoto //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductID],
[ProductPhotoID],
[Primary],
[ModifiedDate]
FROM Production.ProductProductPhoto (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductProductPhoto', @querystr, 'ModifiedDate', 
100, 'Production_ProductProductPhoto', 'sp_upsert_Production_ProductProductPhoto', 'type_Production_ProductProductPhoto', 24, 1, 1);
GO
---------------// DB : sp_select_Production_TransactionHistory => Production_TransactionHistory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [TransactionID],
[ProductID],
[ReferenceOrderID],
[ReferenceOrderLineID],
[TransactionDate],
[TransactionType],
[Quantity],
[ActualCost],
[ModifiedDate]
FROM Production.TransactionHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_TransactionHistory', @querystr, 'ModifiedDate', 
100, 'Production_TransactionHistory', 'sp_upsert_Production_TransactionHistory', 'type_Production_TransactionHistory', 25, 1, 1);
GO
---------------// DB : sp_select_Production_ProductReview => Production_ProductReview //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductReviewID],
[ProductID],
[ReviewerName],
[ReviewDate],
[EmailAddress],
[Rating],
[Comments],
[ModifiedDate]
FROM Production.ProductReview (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductReview', @querystr, 'ModifiedDate', 
100, 'Production_ProductReview', 'sp_upsert_Production_ProductReview', 'type_Production_ProductReview', 26, 1, 1);
GO
---------------// DB : sp_select_Person_BusinessEntity => Person_BusinessEntity //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[rowguid],
[ModifiedDate]
FROM Person.BusinessEntity (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_BusinessEntity', @querystr, 'ModifiedDate', 
100, 'Person_BusinessEntity', 'sp_upsert_Person_BusinessEntity', 'type_Person_BusinessEntity', 27, 1, 1);
GO
---------------// DB : sp_select_Production_TransactionHistoryArchive => Production_TransactionHistoryArchive //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [TransactionID],
[ProductID],
[ReferenceOrderID],
[ReferenceOrderLineID],
[TransactionDate],
[TransactionType],
[Quantity],
[ActualCost],
[ModifiedDate]
FROM Production.TransactionHistoryArchive (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_TransactionHistoryArchive', @querystr, 'ModifiedDate', 
100, 'Production_TransactionHistoryArchive', 'sp_upsert_Production_TransactionHistoryArchive', 'type_Production_TransactionHistoryArchive', 28, 1, 1);
GO
---------------// DB : sp_select_Production_ProductSubcategory => Production_ProductSubcategory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductSubcategoryID],
[ProductCategoryID],
[Name],
[rowguid],
[ModifiedDate]
FROM Production.ProductSubcategory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_ProductSubcategory', @querystr, 'ModifiedDate', 
100, 'Production_ProductSubcategory', 'sp_upsert_Production_ProductSubcategory', 'type_Production_ProductSubcategory', 29, 1, 1);
GO
---------------// DB : sp_select_Person_BusinessEntityAddress => Person_BusinessEntityAddress //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[AddressID],
[AddressTypeID],
[rowguid],
[ModifiedDate]
FROM Person.BusinessEntityAddress (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_BusinessEntityAddress', @querystr, 'ModifiedDate', 
100, 'Person_BusinessEntityAddress', 'sp_upsert_Person_BusinessEntityAddress', 'type_Person_BusinessEntityAddress', 30, 1, 1);
GO
---------------// DB : sp_select_Purchasing_ProductVendor => Purchasing_ProductVendor //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductID],
[BusinessEntityID],
[AverageLeadTime],
[StandardPrice],
[LastReceiptCost],
[LastReceiptDate],
[MinOrderQty],
[MaxOrderQty],
[OnOrderQty],
[UnitMeasureCode],
[ModifiedDate]
FROM Purchasing.ProductVendor (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Purchasing_ProductVendor', @querystr, 'ModifiedDate', 
100, 'Purchasing_ProductVendor', 'sp_upsert_Purchasing_ProductVendor', 'type_Purchasing_ProductVendor', 31, 1, 1);
GO
---------------// DB : sp_select_Person_BusinessEntityContact => Person_BusinessEntityContact //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[PersonID],
[ContactTypeID],
[rowguid],
[ModifiedDate]
FROM Person.BusinessEntityContact (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_BusinessEntityContact', @querystr, 'ModifiedDate', 
100, 'Person_BusinessEntityContact', 'sp_upsert_Person_BusinessEntityContact', 'type_Person_BusinessEntityContact', 32, 1, 1);
GO
---------------// DB : sp_select_Production_UnitMeasure => Production_UnitMeasure //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [UnitMeasureCode],
[Name],
[ModifiedDate]
FROM Production.UnitMeasure (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_UnitMeasure', @querystr, 'ModifiedDate', 
100, 'Production_UnitMeasure', 'sp_upsert_Production_UnitMeasure', 'type_Production_UnitMeasure', 33, 1, 1);
GO
---------------// DB : sp_select_Purchasing_Vendor => Purchasing_Vendor //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[AccountNumber],
[Name],
[CreditRating],
[PreferredVendorStatus],
[ActiveFlag],
[PurchasingWebServiceURL],
[ModifiedDate]
FROM Purchasing.Vendor (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Purchasing_Vendor', @querystr, 'ModifiedDate', 
100, 'Purchasing_Vendor', 'sp_upsert_Purchasing_Vendor', 'type_Purchasing_Vendor', 34, 1, 1);
GO
---------------// DB : sp_select_Person_ContactType => Person_ContactType //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ContactTypeID],
[Name],
[ModifiedDate]
FROM Person.ContactType (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_ContactType', @querystr, 'ModifiedDate', 
100, 'Person_ContactType', 'sp_upsert_Person_ContactType', 'type_Person_ContactType', 35, 1, 1);
GO
---------------// DB : sp_select_Sales_CountryRegionCurrency => Sales_CountryRegionCurrency //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [CountryRegionCode],
[CurrencyCode],
[ModifiedDate]
FROM Sales.CountryRegionCurrency (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_CountryRegionCurrency', @querystr, 'ModifiedDate', 
100, 'Sales_CountryRegionCurrency', 'sp_upsert_Sales_CountryRegionCurrency', 'type_Sales_CountryRegionCurrency', 36, 1, 1);
GO
---------------// DB : sp_select_Person_CountryRegion => Person_CountryRegion //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [CountryRegionCode],
[Name],
[ModifiedDate]
FROM Person.CountryRegion (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_CountryRegion', @querystr, 'ModifiedDate', 
100, 'Person_CountryRegion', 'sp_upsert_Person_CountryRegion', 'type_Person_CountryRegion', 37, 1, 1);
GO
---------------// DB : sp_select_Production_WorkOrder => Production_WorkOrder //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [WorkOrderID],
[ProductID],
[OrderQty],
[StockedQty],
[ScrappedQty],
[StartDate],
[EndDate],
[DueDate],
[ScrapReasonID],
[ModifiedDate]
FROM Production.WorkOrder (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_WorkOrder', @querystr, 'ModifiedDate', 
100, 'Production_WorkOrder', 'sp_upsert_Production_WorkOrder', 'type_Production_WorkOrder', 38, 1, 1);
GO
---------------// DB : sp_select_Purchasing_PurchaseOrderDetail => Purchasing_PurchaseOrderDetail //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [PurchaseOrderID],
[PurchaseOrderDetailID],
[DueDate],
[OrderQty],
[ProductID],
[UnitPrice],
[LineTotal],
[ReceivedQty],
[RejectedQty],
[StockedQty],
[ModifiedDate]
FROM Purchasing.PurchaseOrderDetail (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Purchasing_PurchaseOrderDetail', @querystr, 'ModifiedDate', 
100, 'Purchasing_PurchaseOrderDetail', 'sp_upsert_Purchasing_PurchaseOrderDetail', 'type_Purchasing_PurchaseOrderDetail', 39, 1, 1);
GO
---------------// DB : sp_select_Sales_CreditCard => Sales_CreditCard //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [CreditCardID],
[CardType],
[CardNumber],
[ExpMonth],
[ExpYear],
[ModifiedDate]
FROM Sales.CreditCard (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_CreditCard', @querystr, 'ModifiedDate', 
100, 'Sales_CreditCard', 'sp_upsert_Sales_CreditCard', 'type_Sales_CreditCard', 40, 1, 1);
GO
---------------// DB : sp_select_Production_Culture => Production_Culture //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [CultureID],
[Name],
[ModifiedDate]
FROM Production.Culture (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_Culture', @querystr, 'ModifiedDate', 
100, 'Production_Culture', 'sp_upsert_Production_Culture', 'type_Production_Culture', 41, 1, 1);
GO
---------------// DB : sp_select_Production_WorkOrderRouting => Production_WorkOrderRouting //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [WorkOrderID],
[ProductID],
[OperationSequence],
[LocationID],
[ScheduledStartDate],
[ScheduledEndDate],
[ActualStartDate],
[ActualEndDate],
[ActualResourceHrs],
[PlannedCost],
[ActualCost],
[ModifiedDate]
FROM Production.WorkOrderRouting (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_WorkOrderRouting', @querystr, 'ModifiedDate', 
100, 'Production_WorkOrderRouting', 'sp_upsert_Production_WorkOrderRouting', 'type_Production_WorkOrderRouting', 42, 1, 1);
GO
---------------// DB : sp_select_Sales_Currency => Sales_Currency //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [CurrencyCode],
[Name],
[ModifiedDate]
FROM Sales.Currency (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_Currency', @querystr, 'ModifiedDate', 
100, 'Sales_Currency', 'sp_upsert_Sales_Currency', 'type_Sales_Currency', 43, 1, 1);
GO
---------------// DB : sp_select_Purchasing_PurchaseOrderHeader => Purchasing_PurchaseOrderHeader //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [PurchaseOrderID],
[RevisionNumber],
[Status],
[EmployeeID],
[VendorID],
[ShipMethodID],
[OrderDate],
[ShipDate],
[SubTotal],
[TaxAmt],
[Freight],
[TotalDue],
[ModifiedDate]
FROM Purchasing.PurchaseOrderHeader (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Purchasing_PurchaseOrderHeader', @querystr, 'ModifiedDate', 
100, 'Purchasing_PurchaseOrderHeader', 'sp_upsert_Purchasing_PurchaseOrderHeader', 'type_Purchasing_PurchaseOrderHeader', 44, 1, 1);
GO
---------------// DB : sp_select_Sales_CurrencyRate => Sales_CurrencyRate //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [CurrencyRateID],
[CurrencyRateDate],
[FromCurrencyCode],
[ToCurrencyCode],
[AverageRate],
[EndOfDayRate],
[ModifiedDate]
FROM Sales.CurrencyRate (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_CurrencyRate', @querystr, 'ModifiedDate', 
100, 'Sales_CurrencyRate', 'sp_upsert_Sales_CurrencyRate', 'type_Sales_CurrencyRate', 45, 1, 1);
GO
---------------// DB : sp_select_Sales_Customer => Sales_Customer //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [CustomerID],
[PersonID],
[StoreID],
[TerritoryID],
[AccountNumber],
[rowguid],
[ModifiedDate]
FROM Sales.Customer (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_Customer', @querystr, 'ModifiedDate', 
100, 'Sales_Customer', 'sp_upsert_Sales_Customer', 'type_Sales_Customer', 46, 1, 1);
GO
---------------// DB : sp_select_HumanResources_Department => HumanResources_Department //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [DepartmentID],
[Name],
[GroupName],
[ModifiedDate]
FROM HumanResources.Department (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_HumanResources_Department', @querystr, 'ModifiedDate', 
100, 'HumanResources_Department', 'sp_upsert_HumanResources_Department', 'type_HumanResources_Department', 47, 1, 1);
GO
---------------// DB : sp_select_Sales_SalesOrderDetail => Sales_SalesOrderDetail //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [SalesOrderID],
[SalesOrderDetailID],
[CarrierTrackingNumber],
[OrderQty],
[ProductID],
[SpecialOfferID],
[UnitPrice],
[UnitPriceDiscount],
[LineTotal],
[rowguid],
[ModifiedDate]
FROM Sales.SalesOrderDetail (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SalesOrderDetail', @querystr, 'ModifiedDate', 
100, 'Sales_SalesOrderDetail', 'sp_upsert_Sales_SalesOrderDetail', 'type_Sales_SalesOrderDetail', 48, 1, 1);
GO
---------------// DB : sp_select_Person_EmailAddress => Person_EmailAddress //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[EmailAddressID],
[EmailAddress],
[rowguid],
[ModifiedDate]
FROM Person.EmailAddress (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_EmailAddress', @querystr, 'ModifiedDate', 
100, 'Person_EmailAddress', 'sp_upsert_Person_EmailAddress', 'type_Person_EmailAddress', 49, 1, 1);
GO
---------------// DB : sp_select_HumanResources_Employee => HumanResources_Employee //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[NationalIDNumber],
[LoginID],
TRY_CONVERT(nvarchar(1000),[OrganizationNode]) AS [OrganizationNode],
[OrganizationLevel],
[JobTitle],
[BirthDate],
[MaritalStatus],
[Gender],
[HireDate],
[SalariedFlag],
[VacationHours],
[SickLeaveHours],
[CurrentFlag],
[rowguid],
[ModifiedDate]
FROM HumanResources.Employee (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_HumanResources_Employee', @querystr, 'ModifiedDate', 
100, 'HumanResources_Employee', 'sp_upsert_HumanResources_Employee', 'type_HumanResources_Employee', 50, 1, 1);
GO
---------------// DB : sp_select_Sales_SalesOrderHeader => Sales_SalesOrderHeader //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [SalesOrderID],
[RevisionNumber],
[OrderDate],
[DueDate],
[ShipDate],
[Status],
[OnlineOrderFlag],
[SalesOrderNumber],
[PurchaseOrderNumber],
[AccountNumber],
[CustomerID],
[SalesPersonID],
[TerritoryID],
[BillToAddressID],
[ShipToAddressID],
[ShipMethodID],
[CreditCardID],
[CreditCardApprovalCode],
[CurrencyRateID],
[SubTotal],
[TaxAmt],
[Freight],
[TotalDue],
[Comment],
[rowguid],
[ModifiedDate]
FROM Sales.SalesOrderHeader (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SalesOrderHeader', @querystr, 'ModifiedDate', 
100, 'Sales_SalesOrderHeader', 'sp_upsert_Sales_SalesOrderHeader', 'type_Sales_SalesOrderHeader', 51, 1, 1);
GO
---------------// DB : sp_select_HumanResources_EmployeeDepartmentHistory => HumanResources_EmployeeDepartmentHistory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[DepartmentID],
[ShiftID],
[StartDate],
[EndDate],
[ModifiedDate]
FROM HumanResources.EmployeeDepartmentHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_HumanResources_EmployeeDepartmentHistory', @querystr, 'ModifiedDate', 
100, 'HumanResources_EmployeeDepartmentHistory', 'sp_upsert_HumanResources_EmployeeDepartmentHistory', 'type_HumanResources_EmployeeDepartmentHistory', 52, 1, 1);
GO
---------------// DB : sp_select_HumanResources_EmployeePayHistory => HumanResources_EmployeePayHistory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[RateChangeDate],
[Rate],
[PayFrequency],
[ModifiedDate]
FROM HumanResources.EmployeePayHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_HumanResources_EmployeePayHistory', @querystr, 'ModifiedDate', 
100, 'HumanResources_EmployeePayHistory', 'sp_upsert_HumanResources_EmployeePayHistory', 'type_HumanResources_EmployeePayHistory', 53, 1, 1);
GO
---------------// DB : sp_select_Sales_SalesOrderHeaderSalesReason => Sales_SalesOrderHeaderSalesReason //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [SalesOrderID],
[SalesReasonID],
[ModifiedDate]
FROM Sales.SalesOrderHeaderSalesReason (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SalesOrderHeaderSalesReason', @querystr, 'ModifiedDate', 
100, 'Sales_SalesOrderHeaderSalesReason', 'sp_upsert_Sales_SalesOrderHeaderSalesReason', 'type_Sales_SalesOrderHeaderSalesReason', 54, 1, 1);
GO
---------------// DB : sp_select_Sales_SalesPerson => Sales_SalesPerson //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[TerritoryID],
[SalesQuota],
[Bonus],
[CommissionPct],
[SalesYTD],
[SalesLastYear],
[rowguid],
[ModifiedDate]
FROM Sales.SalesPerson (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SalesPerson', @querystr, 'ModifiedDate', 
100, 'Sales_SalesPerson', 'sp_upsert_Sales_SalesPerson', 'type_Sales_SalesPerson', 55, 1, 1);
GO
---------------// DB : sp_select_Production_Illustration => Production_Illustration //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [IllustrationID],
[Diagram],
[ModifiedDate]
FROM Production.Illustration (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_Illustration', @querystr, 'ModifiedDate', 
100, 'Production_Illustration', 'sp_upsert_Production_Illustration', 'type_Production_Illustration', 56, 1, 1);
GO
---------------// DB : sp_select_HumanResources_JobCandidate => HumanResources_JobCandidate //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [JobCandidateID],
[BusinessEntityID],
[Resume],
[ModifiedDate]
FROM HumanResources.JobCandidate (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_HumanResources_JobCandidate', @querystr, 'ModifiedDate', 
100, 'HumanResources_JobCandidate', 'sp_upsert_HumanResources_JobCandidate', 'type_HumanResources_JobCandidate', 57, 1, 1);
GO
---------------// DB : sp_select_Production_Location => Production_Location //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [LocationID],
[Name],
[CostRate],
[Availability],
[ModifiedDate]
FROM Production.Location (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_Location', @querystr, 'ModifiedDate', 
100, 'Production_Location', 'sp_upsert_Production_Location', 'type_Production_Location', 58, 1, 1);
GO
---------------// DB : sp_select_Person_Password => Person_Password //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[PasswordHash],
[PasswordSalt],
[rowguid],
[ModifiedDate]
FROM Person.Password (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_Password', @querystr, 'ModifiedDate', 
100, 'Person_Password', 'sp_upsert_Person_Password', 'type_Person_Password', 59, 1, 1);
GO
---------------// DB : sp_select_Sales_SalesPersonQuotaHistory => Sales_SalesPersonQuotaHistory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[QuotaDate],
[SalesQuota],
[rowguid],
[ModifiedDate]
FROM Sales.SalesPersonQuotaHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SalesPersonQuotaHistory', @querystr, 'ModifiedDate', 
100, 'Sales_SalesPersonQuotaHistory', 'sp_upsert_Sales_SalesPersonQuotaHistory', 'type_Sales_SalesPersonQuotaHistory', 60, 1, 1);
GO
---------------// DB : sp_select_Person_Person => Person_Person //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[PersonType],
[NameStyle],
[Title],
[FirstName],
[MiddleName],
[LastName],
[Suffix],
[EmailPromotion],
[AdditionalContactInfo],
[Demographics],
[rowguid],
[ModifiedDate]
FROM Person.Person (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_Person', @querystr, 'ModifiedDate', 
100, 'Person_Person', 'sp_upsert_Person_Person', 'type_Person_Person', 61, 1, 1);
GO
---------------// DB : sp_select_Sales_SalesReason => Sales_SalesReason //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [SalesReasonID],
[Name],
[ReasonType],
[ModifiedDate]
FROM Sales.SalesReason (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SalesReason', @querystr, 'ModifiedDate', 
100, 'Sales_SalesReason', 'sp_upsert_Sales_SalesReason', 'type_Sales_SalesReason', 62, 1, 1);
GO
---------------// DB : sp_select_Sales_SalesTaxRate => Sales_SalesTaxRate //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [SalesTaxRateID],
[StateProvinceID],
[TaxType],
[TaxRate],
[Name],
[rowguid],
[ModifiedDate]
FROM Sales.SalesTaxRate (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SalesTaxRate', @querystr, 'ModifiedDate', 
100, 'Sales_SalesTaxRate', 'sp_upsert_Sales_SalesTaxRate', 'type_Sales_SalesTaxRate', 63, 1, 1);
GO
---------------// DB : sp_select_Sales_PersonCreditCard => Sales_PersonCreditCard //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[CreditCardID],
[ModifiedDate]
FROM Sales.PersonCreditCard (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_PersonCreditCard', @querystr, 'ModifiedDate', 
100, 'Sales_PersonCreditCard', 'sp_upsert_Sales_PersonCreditCard', 'type_Sales_PersonCreditCard', 64, 1, 1);
GO
---------------// DB : sp_select_Person_PersonPhone => Person_PersonPhone //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[PhoneNumber],
[PhoneNumberTypeID],
[ModifiedDate]
FROM Person.PersonPhone (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_PersonPhone', @querystr, 'ModifiedDate', 
100, 'Person_PersonPhone', 'sp_upsert_Person_PersonPhone', 'type_Person_PersonPhone', 65, 1, 1);
GO
---------------// DB : sp_select_Sales_SalesTerritory => Sales_SalesTerritory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [TerritoryID],
[Name],
[CountryRegionCode],
[Group],
[SalesYTD],
[SalesLastYear],
[CostYTD],
[CostLastYear],
[rowguid],
[ModifiedDate]
FROM Sales.SalesTerritory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SalesTerritory', @querystr, 'ModifiedDate', 
100, 'Sales_SalesTerritory', 'sp_upsert_Sales_SalesTerritory', 'type_Sales_SalesTerritory', 66, 1, 1);
GO
---------------// DB : sp_select_Person_PhoneNumberType => Person_PhoneNumberType //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [PhoneNumberTypeID],
[Name],
[ModifiedDate]
FROM Person.PhoneNumberType (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Person_PhoneNumberType', @querystr, 'ModifiedDate', 
100, 'Person_PhoneNumberType', 'sp_upsert_Person_PhoneNumberType', 'type_Person_PhoneNumberType', 67, 1, 1);
GO
---------------// DB : sp_select_Production_Product => Production_Product //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [ProductID],
[Name],
[ProductNumber],
[MakeFlag],
[FinishedGoodsFlag],
[Color],
[SafetyStockLevel],
[ReorderPoint],
[StandardCost],
[ListPrice],
[Size],
[SizeUnitMeasureCode],
[WeightUnitMeasureCode],
[Weight],
[DaysToManufacture],
[ProductLine],
[Class],
[Style],
[ProductSubcategoryID],
[ProductModelID],
[SellStartDate],
[SellEndDate],
[DiscontinuedDate],
[rowguid],
[ModifiedDate]
FROM Production.Product (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Production_Product', @querystr, 'ModifiedDate', 
100, 'Production_Product', 'sp_upsert_Production_Product', 'type_Production_Product', 68, 1, 1);
GO
---------------// DB : sp_select_Sales_SalesTerritoryHistory => Sales_SalesTerritoryHistory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT [BusinessEntityID],
[TerritoryID],
[StartDate],
[EndDate],
[rowguid],
[ModifiedDate]
FROM Sales.SalesTerritoryHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 20, 'sp_select_Sales_SalesTerritoryHistory', @querystr, 'ModifiedDate', 
100, 'Sales_SalesTerritoryHistory', 'sp_upsert_Sales_SalesTerritoryHistory', 'type_Sales_SalesTerritoryHistory', 69, 1, 1);
GO
---------------// DB : sp_select_customers => mysql_customers //---------------
DECLARE @querystr nvarchar(max) = N'SELECT `customerNumber`,
`customerName`,
`contactLastName`,
`contactFirstName`,
`phone`,
`addressLine1`,
`addressLine2`,
`city`,
`state`,
`postalCode`,
`country`,
`salesRepEmployeeNumber`,
`creditLimit`
FROM customers;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 30, 'sp_select_customers', @querystr, NULL, 
100, 'mysql_customers', 'sp_upsert_mysql_customers', 'type_mysql_customers', 70, 1, 1);
GO
---------------// DB : sp_select_employees => mysql_employees //---------------
DECLARE @querystr nvarchar(max) = N'SELECT `employeeNumber`,
`lastName`,
`firstName`,
`extension`,
`email`,
`officeCode`,
`reportsTo`,
`jobTitle`
FROM employees;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 30, 'sp_select_employees', @querystr, NULL, 
100, 'mysql_employees', 'sp_upsert_mysql_employees', 'type_mysql_employees', 71, 1, 1);
GO
---------------// DB : sp_select_offices => mysql_offices //---------------
DECLARE @querystr nvarchar(max) = N'SELECT `officeCode`,
`city`,
`phone`,
`addressLine1`,
`addressLine2`,
`state`,
`country`,
`postalCode`,
`territory`
FROM offices;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 30, 'sp_select_offices', @querystr, NULL, 
100, 'mysql_offices', 'sp_upsert_mysql_offices', 'type_mysql_offices', 72, 1, 1);
GO
---------------// DB : sp_select_orderdetails => mysql_orderdetails //---------------
DECLARE @querystr nvarchar(max) = N'SELECT `orderNumber`,
`productCode`,
`quantityOrdered`,
`priceEach`,
`orderLineNumber`
FROM orderdetails;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 30, 'sp_select_orderdetails', @querystr, NULL, 
100, 'mysql_orderdetails', 'sp_upsert_mysql_orderdetails', 'type_mysql_orderdetails', 73, 1, 1);
GO
---------------// DB : sp_select_orders => mysql_orders //---------------
DECLARE @querystr nvarchar(max) = N'SELECT `orderNumber`,
`orderDate`,
`requiredDate`,
`shippedDate`,
`status`,
`comments`,
`customerNumber`
FROM orders;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 30, 'sp_select_orders', @querystr, NULL, 
100, 'mysql_orders', 'sp_upsert_mysql_orders', 'type_mysql_orders', 74, 1, 1);
GO
---------------// DB : sp_select_payments => mysql_payments //---------------
DECLARE @querystr nvarchar(max) = N'SELECT `customerNumber`,
`checkNumber`,
`paymentDate`,
`amount`
FROM payments;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 30, 'sp_select_payments', @querystr, NULL, 
100, 'mysql_payments', 'sp_upsert_mysql_payments', 'type_mysql_payments', 75, 1, 1);
GO
---------------// DB : sp_select_productlines => mysql_productlines //---------------
DECLARE @querystr nvarchar(max) = N'SELECT `productLine`,
`textDescription`,
`htmlDescription`,
`image`
FROM productlines;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 30, 'sp_select_productlines', @querystr, NULL, 
100, 'mysql_productlines', 'sp_upsert_mysql_productlines', 'type_mysql_productlines', 76, 1, 1);
GO
---------------// DB : sp_select_products => mysql_products //---------------
DECLARE @querystr nvarchar(max) = N'SELECT `productCode`,
`productName`,
`productLine`,
`productScale`,
`productVendor`,
`productDescription`,
`quantityInStock`,
`buyPrice`,
`MSRP`
FROM products;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 30, 'sp_select_products', @querystr, NULL, 
100, 'mysql_products', 'sp_upsert_mysql_products', 'type_mysql_products', 77, 1, 1);
GO
---------------// DB : sp_select_actor => pgsql_actor //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "actor_id",
"first_name",
"last_name",
"last_update"
FROM actor
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_actor', @querystr, 'last_update', 
100, 'pgsql_actor', 'sp_upsert_pgsql_actor', 'type_pgsql_actor', 78, 1, 1);
GO
---------------// DB : sp_select_store => pgsql_store //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "store_id",
"manager_staff_id",
"address_id",
"last_update"
FROM store
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_store', @querystr, 'last_update', 
100, 'pgsql_store', 'sp_upsert_pgsql_store', 'type_pgsql_store', 79, 1, 1);
GO
---------------// DB : sp_select_address => pgsql_address //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "address_id",
"address",
"address2",
"district",
"city_id",
"postal_code",
"phone",
"last_update"
FROM address
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_address', @querystr, 'last_update', 
100, 'pgsql_address', 'sp_upsert_pgsql_address', 'type_pgsql_address', 80, 1, 1);
GO
---------------// DB : sp_select_category => pgsql_category //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "category_id",
"name",
"last_update"
FROM category
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_category', @querystr, 'last_update', 
100, 'pgsql_category', 'sp_upsert_pgsql_category', 'type_pgsql_category', 81, 1, 1);
GO
---------------// DB : sp_select_city => pgsql_city //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "city_id",
"city",
"country_id",
"last_update"
FROM city
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_city', @querystr, 'last_update', 
100, 'pgsql_city', 'sp_upsert_pgsql_city', 'type_pgsql_city', 82, 1, 1);
GO
---------------// DB : sp_select_country => pgsql_country //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "country_id",
"country",
"last_update"
FROM country
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_country', @querystr, 'last_update', 
100, 'pgsql_country', 'sp_upsert_pgsql_country', 'type_pgsql_country', 83, 1, 1);
GO
---------------// DB : sp_select_customer => pgsql_customer //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "customer_id",
"store_id",
"first_name",
"last_name",
"email",
"address_id",
"activebool",
"create_date",
"last_update",
"active"
FROM customer
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_customer', @querystr, 'last_update', 
100, 'pgsql_customer', 'sp_upsert_pgsql_customer', 'type_pgsql_customer', 84, 1, 1);
GO
---------------// DB : sp_select_film_actor => pgsql_film_actor //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "actor_id",
"film_id",
"last_update"
FROM film_actor
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_film_actor', @querystr, 'last_update', 
100, 'pgsql_film_actor', 'sp_upsert_pgsql_film_actor', 'type_pgsql_film_actor', 85, 1, 1);
GO
---------------// DB : sp_select_film_category => pgsql_film_category //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "film_id",
"category_id",
"last_update"
FROM film_category
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_film_category', @querystr, 'last_update', 
100, 'pgsql_film_category', 'sp_upsert_pgsql_film_category', 'type_pgsql_film_category', 86, 1, 1);
GO
---------------// DB : sp_select_inventory => pgsql_inventory //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "inventory_id",
"film_id",
"store_id",
"last_update"
FROM inventory
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_inventory', @querystr, 'last_update', 
100, 'pgsql_inventory', 'sp_upsert_pgsql_inventory', 'type_pgsql_inventory', 87, 1, 1);
GO
---------------// DB : sp_select_language => pgsql_language //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "language_id",
"name",
"last_update"
FROM language
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_language', @querystr, 'last_update', 
100, 'pgsql_language', 'sp_upsert_pgsql_language', 'type_pgsql_language', 88, 1, 1);
GO
---------------// DB : sp_select_rental => pgsql_rental //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "rental_id",
"rental_date",
"inventory_id",
"customer_id",
"return_date",
"staff_id",
"last_update"
FROM rental
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_rental', @querystr, 'last_update', 
100, 'pgsql_rental', 'sp_upsert_pgsql_rental', 'type_pgsql_rental', 89, 1, 1);
GO
---------------// DB : sp_select_staff => pgsql_staff //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "staff_id",
"first_name",
"last_name",
"address_id",
"email",
"store_id",
"active",
"username",
"password",
"last_update",
"picture"
FROM staff
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_staff', @querystr, 'last_update', 
100, 'pgsql_staff', 'sp_upsert_pgsql_staff', 'type_pgsql_staff', 90, 1, 1);
GO
---------------// DB : sp_select_payment => pgsql_payment //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "payment_id",
"customer_id",
"staff_id",
"rental_id",
"amount",
"payment_date"
FROM payment;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_payment', @querystr, NULL, 
100, 'pgsql_payment', 'sp_upsert_pgsql_payment', 'type_pgsql_payment', 91, 1, 1);
GO
---------------// DB : sp_select_film => pgsql_film //---------------
DECLARE @querystr nvarchar(max) = N'SELECT "film_id",
"title",
"description",
"release_year",
"language_id",
"rental_duration",
"rental_rate",
"length",
"replacement_cost",
"rating",
"last_update",
"special_features",
"fulltext"
FROM film
WHERE "last_update" > ? AND "last_update" <= ?;';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 40, 'sp_select_film', @querystr, 'last_update', 
100, 'pgsql_film', 'sp_upsert_pgsql_film', 'type_pgsql_film', 92, 1, 1);
GO
---------------// DB : restaurants => mondb_restaurants //---------------
DECLARE @querystr nvarchar(max) = N'{"_id": 1,"address": 1,"borough": 1,"cuisine": 1,"grades": 1,"name": 1,"restaurant_id": 1}';
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Source2Staging', 'DB', 50, 'restaurants', @querystr, NULL, 
100, 'mondb_restaurants', 'sp_upsert_mondb_restaurants', 'type_mondb_restaurants', 93, 1, 1);
GO
---------------// DB : nan => dw_Agreement_Template_Detail //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Agreement_Template_Detail', @querystr, '_UpdatedAt', 
200, 'dw_Agreement_Template_Detail', 'sp_upsert_dw_Agreement_Template_Detail', 'type_dw_Agreement_Template_Detail', 94, 1, 1);
GO
---------------// DB : nan => dw_DISTRIBUTOR_INFO //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_DISTRIBUTOR_INFO', @querystr, '_UpdatedAt', 
200, 'dw_DISTRIBUTOR_INFO', 'sp_upsert_dw_DISTRIBUTOR_INFO', 'type_dw_DISTRIBUTOR_INFO', 95, 1, 1);
GO
---------------// DB : nan => dw_NPS_Price //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_NPS_Price', @querystr, '_UpdatedAt', 
200, 'dw_NPS_Price', 'sp_upsert_dw_NPS_Price', 'type_dw_NPS_Price', 96, 1, 1);
GO
---------------// DB : nan => dw_Production_ScrapReason //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ScrapReason', @querystr, '_UpdatedAt', 
200, 'dw_Production_ScrapReason', 'sp_upsert_dw_Production_ScrapReason', 'type_dw_Production_ScrapReason', 97, 1, 1);
GO
---------------// DB : nan => dw_HumanResources_Shift //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_HumanResources_Shift', @querystr, '_UpdatedAt', 
200, 'dw_HumanResources_Shift', 'sp_upsert_dw_HumanResources_Shift', 'type_dw_HumanResources_Shift', 98, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductCategory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductCategory', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductCategory', 'sp_upsert_dw_Production_ProductCategory', 'type_dw_Production_ProductCategory', 99, 1, 1);
GO
---------------// DB : nan => dw_Purchasing_ShipMethod //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Purchasing_ShipMethod', @querystr, '_UpdatedAt', 
200, 'dw_Purchasing_ShipMethod', 'sp_upsert_dw_Purchasing_ShipMethod', 'type_dw_Purchasing_ShipMethod', 100, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductCostHistory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductCostHistory', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductCostHistory', 'sp_upsert_dw_Production_ProductCostHistory', 'type_dw_Production_ProductCostHistory', 101, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductDescription //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductDescription', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductDescription', 'sp_upsert_dw_Production_ProductDescription', 'type_dw_Production_ProductDescription', 102, 1, 1);
GO
---------------// DB : nan => dw_Sales_ShoppingCartItem //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_ShoppingCartItem', @querystr, '_UpdatedAt', 
200, 'dw_Sales_ShoppingCartItem', 'sp_upsert_dw_Sales_ShoppingCartItem', 'type_dw_Sales_ShoppingCartItem', 103, 1, 1);
GO
---------------// DB : nan => dw_dbo_DatabaseLog //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_dbo_DatabaseLog', @querystr, '_UpdatedAt', 
200, 'dw_dbo_DatabaseLog', 'sp_upsert_dw_dbo_DatabaseLog', 'type_dw_dbo_DatabaseLog', 104, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductInventory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductInventory', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductInventory', 'sp_upsert_dw_Production_ProductInventory', 'type_dw_Production_ProductInventory', 105, 1, 1);
GO
---------------// DB : nan => dw_Sales_SpecialOffer //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SpecialOffer', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SpecialOffer', 'sp_upsert_dw_Sales_SpecialOffer', 'type_dw_Sales_SpecialOffer', 106, 1, 1);
GO
---------------// DB : nan => dw_dbo_ErrorLog //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_dbo_ErrorLog', @querystr, '_UpdatedAt', 
200, 'dw_dbo_ErrorLog', 'sp_upsert_dw_dbo_ErrorLog', 'type_dw_dbo_ErrorLog', 107, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductListPriceHistory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductListPriceHistory', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductListPriceHistory', 'sp_upsert_dw_Production_ProductListPriceHistory', 'type_dw_Production_ProductListPriceHistory', 108, 1, 1);
GO
---------------// DB : nan => dw_Sales_SpecialOfferProduct //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SpecialOfferProduct', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SpecialOfferProduct', 'sp_upsert_dw_Sales_SpecialOfferProduct', 'type_dw_Sales_SpecialOfferProduct', 109, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductModel //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductModel', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductModel', 'sp_upsert_dw_Production_ProductModel', 'type_dw_Production_ProductModel', 110, 1, 1);
GO
---------------// DB : nan => dw_Person_StateProvince //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_StateProvince', @querystr, '_UpdatedAt', 
200, 'dw_Person_StateProvince', 'sp_upsert_dw_Person_StateProvince', 'type_dw_Person_StateProvince', 111, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductModelIllustration //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductModelIllustration', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductModelIllustration', 'sp_upsert_dw_Production_ProductModelIllustration', 'type_dw_Production_ProductModelIllustration', 112, 1, 1);
GO
---------------// DB : nan => dw_dbo_AWBuildVersion //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_dbo_AWBuildVersion', @querystr, '_UpdatedAt', 
200, 'dw_dbo_AWBuildVersion', 'sp_upsert_dw_dbo_AWBuildVersion', 'type_dw_dbo_AWBuildVersion', 113, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductModelProductDescriptionCulture //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductModelProductDescriptionCulture', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductModelProductDescriptionCulture', 'sp_upsert_dw_Production_ProductModelProductDescriptionCulture', 'type_dw_Production_ProductModelProductDescriptionCulture', 114, 1, 1);
GO
---------------// DB : nan => dw_Production_BillOfMaterials //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_BillOfMaterials', @querystr, '_UpdatedAt', 
200, 'dw_Production_BillOfMaterials', 'sp_upsert_dw_Production_BillOfMaterials', 'type_dw_Production_BillOfMaterials', 115, 1, 1);
GO
---------------// DB : nan => dw_Sales_Store //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_Store', @querystr, '_UpdatedAt', 
200, 'dw_Sales_Store', 'sp_upsert_dw_Sales_Store', 'type_dw_Sales_Store', 116, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductPhoto //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductPhoto', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductPhoto', 'sp_upsert_dw_Production_ProductPhoto', 'type_dw_Production_ProductPhoto', 117, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductProductPhoto //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductProductPhoto', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductProductPhoto', 'sp_upsert_dw_Production_ProductProductPhoto', 'type_dw_Production_ProductProductPhoto', 118, 1, 1);
GO
---------------// DB : nan => dw_Production_TransactionHistory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_TransactionHistory', @querystr, '_UpdatedAt', 
200, 'dw_Production_TransactionHistory', 'sp_upsert_dw_Production_TransactionHistory', 'type_dw_Production_TransactionHistory', 119, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductReview //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductReview', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductReview', 'sp_upsert_dw_Production_ProductReview', 'type_dw_Production_ProductReview', 120, 1, 1);
GO
---------------// DB : nan => dw_Person_BusinessEntity //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_BusinessEntity', @querystr, '_UpdatedAt', 
200, 'dw_Person_BusinessEntity', 'sp_upsert_dw_Person_BusinessEntity', 'type_dw_Person_BusinessEntity', 121, 1, 1);
GO
---------------// DB : nan => dw_Production_TransactionHistoryArchive //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_TransactionHistoryArchive', @querystr, '_UpdatedAt', 
200, 'dw_Production_TransactionHistoryArchive', 'sp_upsert_dw_Production_TransactionHistoryArchive', 'type_dw_Production_TransactionHistoryArchive', 122, 1, 1);
GO
---------------// DB : nan => dw_Production_ProductSubcategory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_ProductSubcategory', @querystr, '_UpdatedAt', 
200, 'dw_Production_ProductSubcategory', 'sp_upsert_dw_Production_ProductSubcategory', 'type_dw_Production_ProductSubcategory', 123, 1, 1);
GO
---------------// DB : nan => dw_Person_BusinessEntityAddress //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_BusinessEntityAddress', @querystr, '_UpdatedAt', 
200, 'dw_Person_BusinessEntityAddress', 'sp_upsert_dw_Person_BusinessEntityAddress', 'type_dw_Person_BusinessEntityAddress', 124, 1, 1);
GO
---------------// DB : nan => dw_Purchasing_ProductVendor //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Purchasing_ProductVendor', @querystr, '_UpdatedAt', 
200, 'dw_Purchasing_ProductVendor', 'sp_upsert_dw_Purchasing_ProductVendor', 'type_dw_Purchasing_ProductVendor', 125, 1, 1);
GO
---------------// DB : nan => dw_Person_BusinessEntityContact //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_BusinessEntityContact', @querystr, '_UpdatedAt', 
200, 'dw_Person_BusinessEntityContact', 'sp_upsert_dw_Person_BusinessEntityContact', 'type_dw_Person_BusinessEntityContact', 126, 1, 1);
GO
---------------// DB : nan => dw_Production_UnitMeasure //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_UnitMeasure', @querystr, '_UpdatedAt', 
200, 'dw_Production_UnitMeasure', 'sp_upsert_dw_Production_UnitMeasure', 'type_dw_Production_UnitMeasure', 127, 1, 1);
GO
---------------// DB : nan => dw_Purchasing_Vendor //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Purchasing_Vendor', @querystr, '_UpdatedAt', 
200, 'dw_Purchasing_Vendor', 'sp_upsert_dw_Purchasing_Vendor', 'type_dw_Purchasing_Vendor', 128, 1, 1);
GO
---------------// DB : nan => dw_Person_ContactType //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_ContactType', @querystr, '_UpdatedAt', 
200, 'dw_Person_ContactType', 'sp_upsert_dw_Person_ContactType', 'type_dw_Person_ContactType', 129, 1, 1);
GO
---------------// DB : nan => dw_Sales_CountryRegionCurrency //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_CountryRegionCurrency', @querystr, '_UpdatedAt', 
200, 'dw_Sales_CountryRegionCurrency', 'sp_upsert_dw_Sales_CountryRegionCurrency', 'type_dw_Sales_CountryRegionCurrency', 130, 1, 1);
GO
---------------// DB : nan => dw_Person_CountryRegion //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_CountryRegion', @querystr, '_UpdatedAt', 
200, 'dw_Person_CountryRegion', 'sp_upsert_dw_Person_CountryRegion', 'type_dw_Person_CountryRegion', 131, 1, 1);
GO
---------------// DB : nan => dw_Production_WorkOrder //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_WorkOrder', @querystr, '_UpdatedAt', 
200, 'dw_Production_WorkOrder', 'sp_upsert_dw_Production_WorkOrder', 'type_dw_Production_WorkOrder', 132, 1, 1);
GO
---------------// DB : nan => dw_Purchasing_PurchaseOrderDetail //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Purchasing_PurchaseOrderDetail', @querystr, '_UpdatedAt', 
200, 'dw_Purchasing_PurchaseOrderDetail', 'sp_upsert_dw_Purchasing_PurchaseOrderDetail', 'type_dw_Purchasing_PurchaseOrderDetail', 133, 1, 1);
GO
---------------// DB : nan => dw_Sales_CreditCard //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_CreditCard', @querystr, '_UpdatedAt', 
200, 'dw_Sales_CreditCard', 'sp_upsert_dw_Sales_CreditCard', 'type_dw_Sales_CreditCard', 134, 1, 1);
GO
---------------// DB : nan => dw_Production_Culture //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_Culture', @querystr, '_UpdatedAt', 
200, 'dw_Production_Culture', 'sp_upsert_dw_Production_Culture', 'type_dw_Production_Culture', 135, 1, 1);
GO
---------------// DB : nan => dw_Production_WorkOrderRouting //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_WorkOrderRouting', @querystr, '_UpdatedAt', 
200, 'dw_Production_WorkOrderRouting', 'sp_upsert_dw_Production_WorkOrderRouting', 'type_dw_Production_WorkOrderRouting', 136, 1, 1);
GO
---------------// DB : nan => dw_Sales_Currency //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_Currency', @querystr, '_UpdatedAt', 
200, 'dw_Sales_Currency', 'sp_upsert_dw_Sales_Currency', 'type_dw_Sales_Currency', 137, 1, 1);
GO
---------------// DB : nan => dw_Purchasing_PurchaseOrderHeader //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Purchasing_PurchaseOrderHeader', @querystr, '_UpdatedAt', 
200, 'dw_Purchasing_PurchaseOrderHeader', 'sp_upsert_dw_Purchasing_PurchaseOrderHeader', 'type_dw_Purchasing_PurchaseOrderHeader', 138, 1, 1);
GO
---------------// DB : nan => dw_Sales_CurrencyRate //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_CurrencyRate', @querystr, '_UpdatedAt', 
200, 'dw_Sales_CurrencyRate', 'sp_upsert_dw_Sales_CurrencyRate', 'type_dw_Sales_CurrencyRate', 139, 1, 1);
GO
---------------// DB : nan => dw_Sales_Customer //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_Customer', @querystr, '_UpdatedAt', 
200, 'dw_Sales_Customer', 'sp_upsert_dw_Sales_Customer', 'type_dw_Sales_Customer', 140, 1, 1);
GO
---------------// DB : nan => dw_HumanResources_Department //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_HumanResources_Department', @querystr, '_UpdatedAt', 
200, 'dw_HumanResources_Department', 'sp_upsert_dw_HumanResources_Department', 'type_dw_HumanResources_Department', 141, 1, 1);
GO
---------------// DB : nan => dw_Sales_SalesOrderDetail //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SalesOrderDetail', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SalesOrderDetail', 'sp_upsert_dw_Sales_SalesOrderDetail', 'type_dw_Sales_SalesOrderDetail', 142, 1, 1);
GO
---------------// DB : nan => dw_Person_EmailAddress //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_EmailAddress', @querystr, '_UpdatedAt', 
200, 'dw_Person_EmailAddress', 'sp_upsert_dw_Person_EmailAddress', 'type_dw_Person_EmailAddress', 143, 1, 1);
GO
---------------// DB : nan => dw_HumanResources_Employee //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_HumanResources_Employee', @querystr, '_UpdatedAt', 
200, 'dw_HumanResources_Employee', 'sp_upsert_dw_HumanResources_Employee', 'type_dw_HumanResources_Employee', 144, 1, 1);
GO
---------------// DB : nan => dw_Sales_SalesOrderHeader //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SalesOrderHeader', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SalesOrderHeader', 'sp_upsert_dw_Sales_SalesOrderHeader', 'type_dw_Sales_SalesOrderHeader', 145, 1, 1);
GO
---------------// DB : nan => dw_HumanResources_EmployeeDepartmentHistory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_HumanResources_EmployeeDepartmentHistory', @querystr, '_UpdatedAt', 
200, 'dw_HumanResources_EmployeeDepartmentHistory', 'sp_upsert_dw_HumanResources_EmployeeDepartmentHistory', 'type_dw_HumanResources_EmployeeDepartmentHistory', 146, 1, 1);
GO
---------------// DB : nan => dw_HumanResources_EmployeePayHistory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_HumanResources_EmployeePayHistory', @querystr, '_UpdatedAt', 
200, 'dw_HumanResources_EmployeePayHistory', 'sp_upsert_dw_HumanResources_EmployeePayHistory', 'type_dw_HumanResources_EmployeePayHistory', 147, 1, 1);
GO
---------------// DB : nan => dw_Sales_SalesOrderHeaderSalesReason //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SalesOrderHeaderSalesReason', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SalesOrderHeaderSalesReason', 'sp_upsert_dw_Sales_SalesOrderHeaderSalesReason', 'type_dw_Sales_SalesOrderHeaderSalesReason', 148, 1, 1);
GO
---------------// DB : nan => dw_Sales_SalesPerson //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SalesPerson', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SalesPerson', 'sp_upsert_dw_Sales_SalesPerson', 'type_dw_Sales_SalesPerson', 149, 1, 1);
GO
---------------// DB : nan => dw_Production_Illustration //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_Illustration', @querystr, '_UpdatedAt', 
200, 'dw_Production_Illustration', 'sp_upsert_dw_Production_Illustration', 'type_dw_Production_Illustration', 150, 1, 1);
GO
---------------// DB : nan => dw_HumanResources_JobCandidate //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_HumanResources_JobCandidate', @querystr, '_UpdatedAt', 
200, 'dw_HumanResources_JobCandidate', 'sp_upsert_dw_HumanResources_JobCandidate', 'type_dw_HumanResources_JobCandidate', 151, 1, 1);
GO
---------------// DB : nan => dw_Production_Location //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_Location', @querystr, '_UpdatedAt', 
200, 'dw_Production_Location', 'sp_upsert_dw_Production_Location', 'type_dw_Production_Location', 152, 1, 1);
GO
---------------// DB : nan => dw_Person_Password //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_Password', @querystr, '_UpdatedAt', 
200, 'dw_Person_Password', 'sp_upsert_dw_Person_Password', 'type_dw_Person_Password', 153, 1, 1);
GO
---------------// DB : nan => dw_Sales_SalesPersonQuotaHistory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SalesPersonQuotaHistory', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SalesPersonQuotaHistory', 'sp_upsert_dw_Sales_SalesPersonQuotaHistory', 'type_dw_Sales_SalesPersonQuotaHistory', 154, 1, 1);
GO
---------------// DB : nan => dw_Person_Person //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_Person', @querystr, '_UpdatedAt', 
200, 'dw_Person_Person', 'sp_upsert_dw_Person_Person', 'type_dw_Person_Person', 155, 1, 1);
GO
---------------// DB : nan => dw_Sales_SalesReason //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SalesReason', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SalesReason', 'sp_upsert_dw_Sales_SalesReason', 'type_dw_Sales_SalesReason', 156, 1, 1);
GO
---------------// DB : nan => dw_Sales_SalesTaxRate //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SalesTaxRate', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SalesTaxRate', 'sp_upsert_dw_Sales_SalesTaxRate', 'type_dw_Sales_SalesTaxRate', 157, 1, 1);
GO
---------------// DB : nan => dw_Sales_PersonCreditCard //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_PersonCreditCard', @querystr, '_UpdatedAt', 
200, 'dw_Sales_PersonCreditCard', 'sp_upsert_dw_Sales_PersonCreditCard', 'type_dw_Sales_PersonCreditCard', 158, 1, 1);
GO
---------------// DB : nan => dw_Person_PersonPhone //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_PersonPhone', @querystr, '_UpdatedAt', 
200, 'dw_Person_PersonPhone', 'sp_upsert_dw_Person_PersonPhone', 'type_dw_Person_PersonPhone', 159, 1, 1);
GO
---------------// DB : nan => dw_Sales_SalesTerritory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SalesTerritory', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SalesTerritory', 'sp_upsert_dw_Sales_SalesTerritory', 'type_dw_Sales_SalesTerritory', 160, 1, 1);
GO
---------------// DB : nan => dw_Person_PhoneNumberType //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Person_PhoneNumberType', @querystr, '_UpdatedAt', 
200, 'dw_Person_PhoneNumberType', 'sp_upsert_dw_Person_PhoneNumberType', 'type_dw_Person_PhoneNumberType', 161, 1, 1);
GO
---------------// DB : nan => dw_Production_Product //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Production_Product', @querystr, '_UpdatedAt', 
200, 'dw_Production_Product', 'sp_upsert_dw_Production_Product', 'type_dw_Production_Product', 162, 1, 1);
GO
---------------// DB : nan => dw_Sales_SalesTerritoryHistory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_Sales_SalesTerritoryHistory', @querystr, '_UpdatedAt', 
200, 'dw_Sales_SalesTerritoryHistory', 'sp_upsert_dw_Sales_SalesTerritoryHistory', 'type_dw_Sales_SalesTerritoryHistory', 163, 1, 1);
GO
---------------// DB : nan => dw_mysql_customers //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_mysql_customers', @querystr, '_UpdatedAt', 
200, 'dw_mysql_customers', 'sp_upsert_dw_mysql_customers', 'type_dw_mysql_customers', 164, 1, 1);
GO
---------------// DB : nan => dw_mysql_employees //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_mysql_employees', @querystr, '_UpdatedAt', 
200, 'dw_mysql_employees', 'sp_upsert_dw_mysql_employees', 'type_dw_mysql_employees', 165, 1, 1);
GO
---------------// DB : nan => dw_mysql_offices //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_mysql_offices', @querystr, '_UpdatedAt', 
200, 'dw_mysql_offices', 'sp_upsert_dw_mysql_offices', 'type_dw_mysql_offices', 166, 1, 1);
GO
---------------// DB : nan => dw_mysql_orderdetails //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_mysql_orderdetails', @querystr, '_UpdatedAt', 
200, 'dw_mysql_orderdetails', 'sp_upsert_dw_mysql_orderdetails', 'type_dw_mysql_orderdetails', 167, 1, 1);
GO
---------------// DB : nan => dw_mysql_orders //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_mysql_orders', @querystr, '_UpdatedAt', 
200, 'dw_mysql_orders', 'sp_upsert_dw_mysql_orders', 'type_dw_mysql_orders', 168, 1, 1);
GO
---------------// DB : nan => dw_mysql_payments //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_mysql_payments', @querystr, '_UpdatedAt', 
200, 'dw_mysql_payments', 'sp_upsert_dw_mysql_payments', 'type_dw_mysql_payments', 169, 1, 1);
GO
---------------// DB : nan => dw_mysql_productlines //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_mysql_productlines', @querystr, '_UpdatedAt', 
200, 'dw_mysql_productlines', 'sp_upsert_dw_mysql_productlines', 'type_dw_mysql_productlines', 170, 1, 1);
GO
---------------// DB : nan => dw_mysql_products //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_mysql_products', @querystr, '_UpdatedAt', 
200, 'dw_mysql_products', 'sp_upsert_dw_mysql_products', 'type_dw_mysql_products', 171, 1, 1);
GO
---------------// DB : nan => dw_pgsql_actor //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_actor', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_actor', 'sp_upsert_dw_pgsql_actor', 'type_dw_pgsql_actor', 172, 1, 1);
GO
---------------// DB : nan => dw_pgsql_store //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_store', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_store', 'sp_upsert_dw_pgsql_store', 'type_dw_pgsql_store', 173, 1, 1);
GO
---------------// DB : nan => dw_pgsql_address //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_address', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_address', 'sp_upsert_dw_pgsql_address', 'type_dw_pgsql_address', 174, 1, 1);
GO
---------------// DB : nan => dw_pgsql_category //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_category', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_category', 'sp_upsert_dw_pgsql_category', 'type_dw_pgsql_category', 175, 1, 1);
GO
---------------// DB : nan => dw_pgsql_city //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_city', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_city', 'sp_upsert_dw_pgsql_city', 'type_dw_pgsql_city', 176, 1, 1);
GO
---------------// DB : nan => dw_pgsql_country //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_country', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_country', 'sp_upsert_dw_pgsql_country', 'type_dw_pgsql_country', 177, 1, 1);
GO
---------------// DB : nan => dw_pgsql_customer //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_customer', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_customer', 'sp_upsert_dw_pgsql_customer', 'type_dw_pgsql_customer', 178, 1, 1);
GO
---------------// DB : nan => dw_pgsql_film_actor //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_film_actor', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_film_actor', 'sp_upsert_dw_pgsql_film_actor', 'type_dw_pgsql_film_actor', 179, 1, 1);
GO
---------------// DB : nan => dw_pgsql_film_category //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_film_category', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_film_category', 'sp_upsert_dw_pgsql_film_category', 'type_dw_pgsql_film_category', 180, 1, 1);
GO
---------------// DB : nan => dw_pgsql_inventory //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_inventory', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_inventory', 'sp_upsert_dw_pgsql_inventory', 'type_dw_pgsql_inventory', 181, 1, 1);
GO
---------------// DB : nan => dw_pgsql_language //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_language', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_language', 'sp_upsert_dw_pgsql_language', 'type_dw_pgsql_language', 182, 1, 1);
GO
---------------// DB : nan => dw_pgsql_rental //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_rental', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_rental', 'sp_upsert_dw_pgsql_rental', 'type_dw_pgsql_rental', 183, 1, 1);
GO
---------------// DB : nan => dw_pgsql_staff //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_staff', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_staff', 'sp_upsert_dw_pgsql_staff', 'type_dw_pgsql_staff', 184, 1, 1);
GO
---------------// DB : nan => dw_pgsql_payment //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_payment', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_payment', 'sp_upsert_dw_pgsql_payment', 'type_dw_pgsql_payment', 185, 1, 1);
GO
---------------// DB : nan => dw_pgsql_film //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_pgsql_film', @querystr, '_UpdatedAt', 
200, 'dw_pgsql_film', 'sp_upsert_dw_pgsql_film', 'type_dw_pgsql_film', 186, 1, 1);
GO
---------------// DB : nan => dw_mondb_restaurants //---------------
DECLARE @querystr nvarchar(max) = NULL
INSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES ('Staging2DW', 'DB', 100, 'sp_select_mondb_restaurants', @querystr, '_UpdatedAt', 
200, 'dw_mondb_restaurants', 'sp_upsert_dw_mondb_restaurants', 'type_dw_mondb_restaurants', 187, 1, 1);
GO
