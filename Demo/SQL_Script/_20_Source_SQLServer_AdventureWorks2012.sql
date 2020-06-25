-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ScrapReason //------------------------- --
-- PROCEDURE: sp_select_Production_ScrapReason
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ScrapReason];
GO
CREATE PROCEDURE [sp_select_Production_ScrapReason]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ScrapReasonID],
[Name],
[ModifiedDate]
FROM Production.ScrapReason (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// HumanResources.Shift //------------------------- --
-- PROCEDURE: sp_select_HumanResources_Shift
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_HumanResources_Shift];
GO
CREATE PROCEDURE [sp_select_HumanResources_Shift]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ShiftID],
[Name],
[StartTime],
[EndTime],
[ModifiedDate]
FROM HumanResources.Shift (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductCategory //------------------------- --
-- PROCEDURE: sp_select_Production_ProductCategory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductCategory];
GO
CREATE PROCEDURE [sp_select_Production_ProductCategory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductCategoryID],
[Name],
[rowguid],
[ModifiedDate]
FROM Production.ProductCategory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Purchasing.ShipMethod //------------------------- --
-- PROCEDURE: sp_select_Purchasing_ShipMethod
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Purchasing_ShipMethod];
GO
CREATE PROCEDURE [sp_select_Purchasing_ShipMethod]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ShipMethodID],
[Name],
[ShipBase],
[ShipRate],
[rowguid],
[ModifiedDate]
FROM Purchasing.ShipMethod (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductCostHistory //------------------------- --
-- PROCEDURE: sp_select_Production_ProductCostHistory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductCostHistory];
GO
CREATE PROCEDURE [sp_select_Production_ProductCostHistory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductID],
[StartDate],
[EndDate],
[StandardCost],
[ModifiedDate]
FROM Production.ProductCostHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductDescription //------------------------- --
-- PROCEDURE: sp_select_Production_ProductDescription
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductDescription];
GO
CREATE PROCEDURE [sp_select_Production_ProductDescription]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductDescriptionID],
[Description],
[rowguid],
[ModifiedDate]
FROM Production.ProductDescription (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.ShoppingCartItem //------------------------- --
-- PROCEDURE: sp_select_Sales_ShoppingCartItem
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_ShoppingCartItem];
GO
CREATE PROCEDURE [sp_select_Sales_ShoppingCartItem]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ShoppingCartItemID],
[ShoppingCartID],
[Quantity],
[ProductID],
[DateCreated],
[ModifiedDate]
FROM Sales.ShoppingCartItem (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// dbo.DatabaseLog //------------------------- --
-- PROCEDURE: sp_select_dbo_DatabaseLog
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_dbo_DatabaseLog];
GO
CREATE PROCEDURE [sp_select_dbo_DatabaseLog]
AS
BEGIN
SET NOCOUNT ON;
SELECT [DatabaseLogID],
[PostTime],
[DatabaseUser],
[Event],
[Schema],
[Object],
[TSQL],
[XmlEvent]
FROM dbo.DatabaseLog (NOLOCK);
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductInventory //------------------------- --
-- PROCEDURE: sp_select_Production_ProductInventory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductInventory];
GO
CREATE PROCEDURE [sp_select_Production_ProductInventory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductID],
[LocationID],
[Shelf],
[Bin],
[Quantity],
[rowguid],
[ModifiedDate]
FROM Production.ProductInventory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SpecialOffer //------------------------- --
-- PROCEDURE: sp_select_Sales_SpecialOffer
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SpecialOffer];
GO
CREATE PROCEDURE [sp_select_Sales_SpecialOffer]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [SpecialOfferID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// dbo.ErrorLog //------------------------- --
-- PROCEDURE: sp_select_dbo_ErrorLog
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_dbo_ErrorLog];
GO
CREATE PROCEDURE [sp_select_dbo_ErrorLog]
AS
BEGIN
SET NOCOUNT ON;
SELECT [ErrorLogID],
[ErrorTime],
[UserName],
[ErrorNumber],
[ErrorSeverity],
[ErrorState],
[ErrorProcedure],
[ErrorLine],
[ErrorMessage]
FROM dbo.ErrorLog (NOLOCK);
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductListPriceHistory //------------------------- --
-- PROCEDURE: sp_select_Production_ProductListPriceHistory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductListPriceHistory];
GO
CREATE PROCEDURE [sp_select_Production_ProductListPriceHistory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductID],
[StartDate],
[EndDate],
[ListPrice],
[ModifiedDate]
FROM Production.ProductListPriceHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SpecialOfferProduct //------------------------- --
-- PROCEDURE: sp_select_Sales_SpecialOfferProduct
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SpecialOfferProduct];
GO
CREATE PROCEDURE [sp_select_Sales_SpecialOfferProduct]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [SpecialOfferID],
[ProductID],
[rowguid],
[ModifiedDate]
FROM Sales.SpecialOfferProduct (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductModel //------------------------- --
-- PROCEDURE: sp_select_Production_ProductModel
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductModel];
GO
CREATE PROCEDURE [sp_select_Production_ProductModel]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductModelID],
[Name],
[CatalogDescription],
[Instructions],
[rowguid],
[ModifiedDate]
FROM Production.ProductModel (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.StateProvince //------------------------- --
-- PROCEDURE: sp_select_Person_StateProvince
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_StateProvince];
GO
CREATE PROCEDURE [sp_select_Person_StateProvince]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [StateProvinceID],
[StateProvinceCode],
[CountryRegionCode],
[IsOnlyStateProvinceFlag],
[Name],
[TerritoryID],
[rowguid],
[ModifiedDate]
FROM Person.StateProvince (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductModelIllustration //------------------------- --
-- PROCEDURE: sp_select_Production_ProductModelIllustration
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductModelIllustration];
GO
CREATE PROCEDURE [sp_select_Production_ProductModelIllustration]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductModelID],
[IllustrationID],
[ModifiedDate]
FROM Production.ProductModelIllustration (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// dbo.AWBuildVersion //------------------------- --
-- PROCEDURE: sp_select_dbo_AWBuildVersion
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_dbo_AWBuildVersion];
GO
CREATE PROCEDURE [sp_select_dbo_AWBuildVersion]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [SystemInformationID],
[Database Version],
[VersionDate],
[ModifiedDate]
FROM dbo.AWBuildVersion (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductModelProductDescriptionCulture //------------------------- --
-- PROCEDURE: sp_select_Production_ProductModelProductDescriptionCulture
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductModelProductDescriptionCulture];
GO
CREATE PROCEDURE [sp_select_Production_ProductModelProductDescriptionCulture]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductModelID],
[ProductDescriptionID],
[CultureID],
[ModifiedDate]
FROM Production.ProductModelProductDescriptionCulture (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.BillOfMaterials //------------------------- --
-- PROCEDURE: sp_select_Production_BillOfMaterials
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_BillOfMaterials];
GO
CREATE PROCEDURE [sp_select_Production_BillOfMaterials]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BillOfMaterialsID],
[ProductAssemblyID],
[ComponentID],
[StartDate],
[EndDate],
[UnitMeasureCode],
[BOMLevel],
[PerAssemblyQty],
[ModifiedDate]
FROM Production.BillOfMaterials (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.Store //------------------------- --
-- PROCEDURE: sp_select_Sales_Store
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_Store];
GO
CREATE PROCEDURE [sp_select_Sales_Store]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[Name],
[SalesPersonID],
[Demographics],
[rowguid],
[ModifiedDate]
FROM Sales.Store (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductPhoto //------------------------- --
-- PROCEDURE: sp_select_Production_ProductPhoto
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductPhoto];
GO
CREATE PROCEDURE [sp_select_Production_ProductPhoto]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductPhotoID],
[ThumbNailPhoto],
[ThumbnailPhotoFileName],
[LargePhoto],
[LargePhotoFileName],
[ModifiedDate]
FROM Production.ProductPhoto (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductProductPhoto //------------------------- --
-- PROCEDURE: sp_select_Production_ProductProductPhoto
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductProductPhoto];
GO
CREATE PROCEDURE [sp_select_Production_ProductProductPhoto]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductID],
[ProductPhotoID],
[Primary],
[ModifiedDate]
FROM Production.ProductProductPhoto (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.TransactionHistory //------------------------- --
-- PROCEDURE: sp_select_Production_TransactionHistory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_TransactionHistory];
GO
CREATE PROCEDURE [sp_select_Production_TransactionHistory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [TransactionID],
[ProductID],
[ReferenceOrderID],
[ReferenceOrderLineID],
[TransactionDate],
[TransactionType],
[Quantity],
[ActualCost],
[ModifiedDate]
FROM Production.TransactionHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductReview //------------------------- --
-- PROCEDURE: sp_select_Production_ProductReview
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductReview];
GO
CREATE PROCEDURE [sp_select_Production_ProductReview]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductReviewID],
[ProductID],
[ReviewerName],
[ReviewDate],
[EmailAddress],
[Rating],
[Comments],
[ModifiedDate]
FROM Production.ProductReview (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.BusinessEntity //------------------------- --
-- PROCEDURE: sp_select_Person_BusinessEntity
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_BusinessEntity];
GO
CREATE PROCEDURE [sp_select_Person_BusinessEntity]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[rowguid],
[ModifiedDate]
FROM Person.BusinessEntity (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.TransactionHistoryArchive //------------------------- --
-- PROCEDURE: sp_select_Production_TransactionHistoryArchive
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_TransactionHistoryArchive];
GO
CREATE PROCEDURE [sp_select_Production_TransactionHistoryArchive]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [TransactionID],
[ProductID],
[ReferenceOrderID],
[ReferenceOrderLineID],
[TransactionDate],
[TransactionType],
[Quantity],
[ActualCost],
[ModifiedDate]
FROM Production.TransactionHistoryArchive (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.ProductSubcategory //------------------------- --
-- PROCEDURE: sp_select_Production_ProductSubcategory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_ProductSubcategory];
GO
CREATE PROCEDURE [sp_select_Production_ProductSubcategory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductSubcategoryID],
[ProductCategoryID],
[Name],
[rowguid],
[ModifiedDate]
FROM Production.ProductSubcategory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.BusinessEntityAddress //------------------------- --
-- PROCEDURE: sp_select_Person_BusinessEntityAddress
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_BusinessEntityAddress];
GO
CREATE PROCEDURE [sp_select_Person_BusinessEntityAddress]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[AddressID],
[AddressTypeID],
[rowguid],
[ModifiedDate]
FROM Person.BusinessEntityAddress (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Purchasing.ProductVendor //------------------------- --
-- PROCEDURE: sp_select_Purchasing_ProductVendor
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Purchasing_ProductVendor];
GO
CREATE PROCEDURE [sp_select_Purchasing_ProductVendor]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.BusinessEntityContact //------------------------- --
-- PROCEDURE: sp_select_Person_BusinessEntityContact
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_BusinessEntityContact];
GO
CREATE PROCEDURE [sp_select_Person_BusinessEntityContact]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[PersonID],
[ContactTypeID],
[rowguid],
[ModifiedDate]
FROM Person.BusinessEntityContact (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.UnitMeasure //------------------------- --
-- PROCEDURE: sp_select_Production_UnitMeasure
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_UnitMeasure];
GO
CREATE PROCEDURE [sp_select_Production_UnitMeasure]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [UnitMeasureCode],
[Name],
[ModifiedDate]
FROM Production.UnitMeasure (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Purchasing.Vendor //------------------------- --
-- PROCEDURE: sp_select_Purchasing_Vendor
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Purchasing_Vendor];
GO
CREATE PROCEDURE [sp_select_Purchasing_Vendor]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[AccountNumber],
[Name],
[CreditRating],
[PreferredVendorStatus],
[ActiveFlag],
[PurchasingWebServiceURL],
[ModifiedDate]
FROM Purchasing.Vendor (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.ContactType //------------------------- --
-- PROCEDURE: sp_select_Person_ContactType
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_ContactType];
GO
CREATE PROCEDURE [sp_select_Person_ContactType]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ContactTypeID],
[Name],
[ModifiedDate]
FROM Person.ContactType (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.CountryRegionCurrency //------------------------- --
-- PROCEDURE: sp_select_Sales_CountryRegionCurrency
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_CountryRegionCurrency];
GO
CREATE PROCEDURE [sp_select_Sales_CountryRegionCurrency]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [CountryRegionCode],
[CurrencyCode],
[ModifiedDate]
FROM Sales.CountryRegionCurrency (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.CountryRegion //------------------------- --
-- PROCEDURE: sp_select_Person_CountryRegion
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_CountryRegion];
GO
CREATE PROCEDURE [sp_select_Person_CountryRegion]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [CountryRegionCode],
[Name],
[ModifiedDate]
FROM Person.CountryRegion (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.WorkOrder //------------------------- --
-- PROCEDURE: sp_select_Production_WorkOrder
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_WorkOrder];
GO
CREATE PROCEDURE [sp_select_Production_WorkOrder]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [WorkOrderID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Purchasing.PurchaseOrderDetail //------------------------- --
-- PROCEDURE: sp_select_Purchasing_PurchaseOrderDetail
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Purchasing_PurchaseOrderDetail];
GO
CREATE PROCEDURE [sp_select_Purchasing_PurchaseOrderDetail]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [PurchaseOrderID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.CreditCard //------------------------- --
-- PROCEDURE: sp_select_Sales_CreditCard
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_CreditCard];
GO
CREATE PROCEDURE [sp_select_Sales_CreditCard]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [CreditCardID],
[CardType],
[CardNumber],
[ExpMonth],
[ExpYear],
[ModifiedDate]
FROM Sales.CreditCard (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.Culture //------------------------- --
-- PROCEDURE: sp_select_Production_Culture
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_Culture];
GO
CREATE PROCEDURE [sp_select_Production_Culture]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [CultureID],
[Name],
[ModifiedDate]
FROM Production.Culture (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.WorkOrderRouting //------------------------- --
-- PROCEDURE: sp_select_Production_WorkOrderRouting
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_WorkOrderRouting];
GO
CREATE PROCEDURE [sp_select_Production_WorkOrderRouting]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [WorkOrderID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.Currency //------------------------- --
-- PROCEDURE: sp_select_Sales_Currency
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_Currency];
GO
CREATE PROCEDURE [sp_select_Sales_Currency]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [CurrencyCode],
[Name],
[ModifiedDate]
FROM Sales.Currency (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Purchasing.PurchaseOrderHeader //------------------------- --
-- PROCEDURE: sp_select_Purchasing_PurchaseOrderHeader
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Purchasing_PurchaseOrderHeader];
GO
CREATE PROCEDURE [sp_select_Purchasing_PurchaseOrderHeader]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [PurchaseOrderID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.CurrencyRate //------------------------- --
-- PROCEDURE: sp_select_Sales_CurrencyRate
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_CurrencyRate];
GO
CREATE PROCEDURE [sp_select_Sales_CurrencyRate]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [CurrencyRateID],
[CurrencyRateDate],
[FromCurrencyCode],
[ToCurrencyCode],
[AverageRate],
[EndOfDayRate],
[ModifiedDate]
FROM Sales.CurrencyRate (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.Customer //------------------------- --
-- PROCEDURE: sp_select_Sales_Customer
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_Customer];
GO
CREATE PROCEDURE [sp_select_Sales_Customer]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [CustomerID],
[PersonID],
[StoreID],
[TerritoryID],
[AccountNumber],
[rowguid],
[ModifiedDate]
FROM Sales.Customer (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// HumanResources.Department //------------------------- --
-- PROCEDURE: sp_select_HumanResources_Department
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_HumanResources_Department];
GO
CREATE PROCEDURE [sp_select_HumanResources_Department]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [DepartmentID],
[Name],
[GroupName],
[ModifiedDate]
FROM HumanResources.Department (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SalesOrderDetail //------------------------- --
-- PROCEDURE: sp_select_Sales_SalesOrderDetail
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SalesOrderDetail];
GO
CREATE PROCEDURE [sp_select_Sales_SalesOrderDetail]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [SalesOrderID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.EmailAddress //------------------------- --
-- PROCEDURE: sp_select_Person_EmailAddress
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_EmailAddress];
GO
CREATE PROCEDURE [sp_select_Person_EmailAddress]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[EmailAddressID],
[EmailAddress],
[rowguid],
[ModifiedDate]
FROM Person.EmailAddress (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// HumanResources.Employee //------------------------- --
-- PROCEDURE: sp_select_HumanResources_Employee
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_HumanResources_Employee];
GO
CREATE PROCEDURE [sp_select_HumanResources_Employee]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SalesOrderHeader //------------------------- --
-- PROCEDURE: sp_select_Sales_SalesOrderHeader
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SalesOrderHeader];
GO
CREATE PROCEDURE [sp_select_Sales_SalesOrderHeader]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [SalesOrderID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// HumanResources.EmployeeDepartmentHistory //------------------------- --
-- PROCEDURE: sp_select_HumanResources_EmployeeDepartmentHistory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_HumanResources_EmployeeDepartmentHistory];
GO
CREATE PROCEDURE [sp_select_HumanResources_EmployeeDepartmentHistory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[DepartmentID],
[ShiftID],
[StartDate],
[EndDate],
[ModifiedDate]
FROM HumanResources.EmployeeDepartmentHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// HumanResources.EmployeePayHistory //------------------------- --
-- PROCEDURE: sp_select_HumanResources_EmployeePayHistory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_HumanResources_EmployeePayHistory];
GO
CREATE PROCEDURE [sp_select_HumanResources_EmployeePayHistory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[RateChangeDate],
[Rate],
[PayFrequency],
[ModifiedDate]
FROM HumanResources.EmployeePayHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SalesOrderHeaderSalesReason //------------------------- --
-- PROCEDURE: sp_select_Sales_SalesOrderHeaderSalesReason
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SalesOrderHeaderSalesReason];
GO
CREATE PROCEDURE [sp_select_Sales_SalesOrderHeaderSalesReason]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [SalesOrderID],
[SalesReasonID],
[ModifiedDate]
FROM Sales.SalesOrderHeaderSalesReason (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SalesPerson //------------------------- --
-- PROCEDURE: sp_select_Sales_SalesPerson
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SalesPerson];
GO
CREATE PROCEDURE [sp_select_Sales_SalesPerson]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[TerritoryID],
[SalesQuota],
[Bonus],
[CommissionPct],
[SalesYTD],
[SalesLastYear],
[rowguid],
[ModifiedDate]
FROM Sales.SalesPerson (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.Illustration //------------------------- --
-- PROCEDURE: sp_select_Production_Illustration
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_Illustration];
GO
CREATE PROCEDURE [sp_select_Production_Illustration]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [IllustrationID],
[Diagram],
[ModifiedDate]
FROM Production.Illustration (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// HumanResources.JobCandidate //------------------------- --
-- PROCEDURE: sp_select_HumanResources_JobCandidate
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_HumanResources_JobCandidate];
GO
CREATE PROCEDURE [sp_select_HumanResources_JobCandidate]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [JobCandidateID],
[BusinessEntityID],
[Resume],
[ModifiedDate]
FROM HumanResources.JobCandidate (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.Location //------------------------- --
-- PROCEDURE: sp_select_Production_Location
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_Location];
GO
CREATE PROCEDURE [sp_select_Production_Location]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [LocationID],
[Name],
[CostRate],
[Availability],
[ModifiedDate]
FROM Production.Location (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.Password //------------------------- --
-- PROCEDURE: sp_select_Person_Password
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_Password];
GO
CREATE PROCEDURE [sp_select_Person_Password]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[PasswordHash],
[PasswordSalt],
[rowguid],
[ModifiedDate]
FROM Person.Password (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SalesPersonQuotaHistory //------------------------- --
-- PROCEDURE: sp_select_Sales_SalesPersonQuotaHistory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SalesPersonQuotaHistory];
GO
CREATE PROCEDURE [sp_select_Sales_SalesPersonQuotaHistory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[QuotaDate],
[SalesQuota],
[rowguid],
[ModifiedDate]
FROM Sales.SalesPersonQuotaHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.Person //------------------------- --
-- PROCEDURE: sp_select_Person_Person
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_Person];
GO
CREATE PROCEDURE [sp_select_Person_Person]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SalesReason //------------------------- --
-- PROCEDURE: sp_select_Sales_SalesReason
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SalesReason];
GO
CREATE PROCEDURE [sp_select_Sales_SalesReason]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [SalesReasonID],
[Name],
[ReasonType],
[ModifiedDate]
FROM Sales.SalesReason (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SalesTaxRate //------------------------- --
-- PROCEDURE: sp_select_Sales_SalesTaxRate
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SalesTaxRate];
GO
CREATE PROCEDURE [sp_select_Sales_SalesTaxRate]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [SalesTaxRateID],
[StateProvinceID],
[TaxType],
[TaxRate],
[Name],
[rowguid],
[ModifiedDate]
FROM Sales.SalesTaxRate (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.PersonCreditCard //------------------------- --
-- PROCEDURE: sp_select_Sales_PersonCreditCard
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_PersonCreditCard];
GO
CREATE PROCEDURE [sp_select_Sales_PersonCreditCard]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[CreditCardID],
[ModifiedDate]
FROM Sales.PersonCreditCard (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.PersonPhone //------------------------- --
-- PROCEDURE: sp_select_Person_PersonPhone
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_PersonPhone];
GO
CREATE PROCEDURE [sp_select_Person_PersonPhone]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[PhoneNumber],
[PhoneNumberTypeID],
[ModifiedDate]
FROM Person.PersonPhone (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SalesTerritory //------------------------- --
-- PROCEDURE: sp_select_Sales_SalesTerritory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SalesTerritory];
GO
CREATE PROCEDURE [sp_select_Sales_SalesTerritory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [TerritoryID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Person.PhoneNumberType //------------------------- --
-- PROCEDURE: sp_select_Person_PhoneNumberType
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Person_PhoneNumberType];
GO
CREATE PROCEDURE [sp_select_Person_PhoneNumberType]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [PhoneNumberTypeID],
[Name],
[ModifiedDate]
FROM Person.PhoneNumberType (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Production.Product //------------------------- --
-- PROCEDURE: sp_select_Production_Product
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Production_Product];
GO
CREATE PROCEDURE [sp_select_Production_Product]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [ProductID],
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
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


-- --// SQLServer - localhost - AdventureWorks2012 //-- --
-- -------------------------// Sales.SalesTerritoryHistory //------------------------- --
-- PROCEDURE: sp_select_Sales_SalesTerritoryHistory
USE [AdventureWorks2012];
GO
DROP PROCEDURE IF EXISTS [sp_select_Sales_SalesTerritoryHistory];
GO
CREATE PROCEDURE [sp_select_Sales_SalesTerritoryHistory]
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT [BusinessEntityID],
[TerritoryID],
[StartDate],
[EndDate],
[rowguid],
[ModifiedDate]
FROM Sales.SalesTerritoryHistory (NOLOCK)
WHERE [ModifiedDate] BETWEEN @WatermarkValue AND @NewWatermarkValue;
END
GO


