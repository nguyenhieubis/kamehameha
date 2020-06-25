-- -------------------------// dw_Agreement_Template_Detail //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Agreement_Template_Detail
DROP TABLE IF EXISTS dw_Agreement_Template_Detail;
GO
CREATE TABLE dw_Agreement_Template_Detail(
[TXN_KEY] nvarchar(255),
[CRITERIA_CD] nvarchar(255),
[OBJ_CD] nvarchar(255),
[OBJ_TYPE] nvarchar(255),
[SUB_OBJ_TYPE] nvarchar(255),
[PRD_CD] nvarchar(255),
[PRD_TYPE] nvarchar(255),
[MSL_TYPE] nvarchar(255),
[MAX_POINT] nvarchar(255),
[TARGET] nvarchar(255),
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_DISTRIBUTOR_INFO //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_DISTRIBUTOR_INFO
DROP TABLE IF EXISTS dw_DISTRIBUTOR_INFO;
GO
CREATE TABLE dw_DISTRIBUTOR_INFO(
[DistributorCode] nvarchar(255),
[DistributorName] nvarchar(255),
[Area] nvarchar(255),
[Region] nvarchar(255),
[Branch] nvarchar(255),
[Status] int,
[Channel] float,
[CNVSiteCode] float,
[Prov_Town] float,
[Address] nvarchar(255),
[Email] float,
[Tel] nvarchar(255),
[Fax] float,
[Contact] float,
[TaxCode] float,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_HumanResources_Department //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_HumanResources_Department
DROP TABLE IF EXISTS dw_HumanResources_Department;
GO
CREATE TABLE dw_HumanResources_Department(
[DepartmentID] smallint,
[Name] nvarchar(50),
[GroupName] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_HumanResources_Employee //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_HumanResources_Employee
DROP TABLE IF EXISTS dw_HumanResources_Employee;
GO
CREATE TABLE dw_HumanResources_Employee(
[BusinessEntityID] int,
[NationalIDNumber] nvarchar(15),
[LoginID] nvarchar(256),
[OrganizationNode] nvarchar(1000),
[OrganizationLevel] smallint,
[JobTitle] nvarchar(50),
[BirthDate] date,
[MaritalStatus] nchar(1),
[Gender] nchar(1),
[HireDate] date,
[SalariedFlag] bit,
[VacationHours] smallint,
[SickLeaveHours] smallint,
[CurrentFlag] bit,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_HumanResources_EmployeeDepartmentHistory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_HumanResources_EmployeeDepartmentHistory
DROP TABLE IF EXISTS dw_HumanResources_EmployeeDepartmentHistory;
GO
CREATE TABLE dw_HumanResources_EmployeeDepartmentHistory(
[BusinessEntityID] int,
[DepartmentID] smallint,
[ShiftID] tinyint,
[StartDate] date,
[EndDate] date,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_HumanResources_EmployeePayHistory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_HumanResources_EmployeePayHistory
DROP TABLE IF EXISTS dw_HumanResources_EmployeePayHistory;
GO
CREATE TABLE dw_HumanResources_EmployeePayHistory(
[BusinessEntityID] int,
[RateChangeDate] datetime,
[Rate] money,
[PayFrequency] tinyint,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_HumanResources_JobCandidate //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_HumanResources_JobCandidate
DROP TABLE IF EXISTS dw_HumanResources_JobCandidate;
GO
CREATE TABLE dw_HumanResources_JobCandidate(
[JobCandidateID] int,
[BusinessEntityID] int,
[Resume] xml,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_HumanResources_Shift //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_HumanResources_Shift
DROP TABLE IF EXISTS dw_HumanResources_Shift;
GO
CREATE TABLE dw_HumanResources_Shift(
[ShiftID] tinyint,
[Name] nvarchar(50),
[StartTime] time(7),
[EndTime] time(7),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_NPS_Price //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_NPS_Price
DROP TABLE IF EXISTS dw_NPS_Price;
GO
CREATE TABLE dw_NPS_Price(
[SalesGroup] nvarchar(255),
[RegionPrice] nvarchar(255),
[Itemnumber] int,
[Productname] nvarchar(255),
[Itemgroup] nvarchar(255),
[NPSPrice(vnd)] int,
[FromDate] datetime,
[ToDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_BusinessEntity //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_BusinessEntity
DROP TABLE IF EXISTS dw_Person_BusinessEntity;
GO
CREATE TABLE dw_Person_BusinessEntity(
[BusinessEntityID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_BusinessEntityAddress //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_BusinessEntityAddress
DROP TABLE IF EXISTS dw_Person_BusinessEntityAddress;
GO
CREATE TABLE dw_Person_BusinessEntityAddress(
[BusinessEntityID] int,
[AddressID] int,
[AddressTypeID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_BusinessEntityContact //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_BusinessEntityContact
DROP TABLE IF EXISTS dw_Person_BusinessEntityContact;
GO
CREATE TABLE dw_Person_BusinessEntityContact(
[BusinessEntityID] int,
[PersonID] int,
[ContactTypeID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_ContactType //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_ContactType
DROP TABLE IF EXISTS dw_Person_ContactType;
GO
CREATE TABLE dw_Person_ContactType(
[ContactTypeID] int,
[Name] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_CountryRegion //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_CountryRegion
DROP TABLE IF EXISTS dw_Person_CountryRegion;
GO
CREATE TABLE dw_Person_CountryRegion(
[CountryRegionCode] nvarchar(3),
[Name] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_EmailAddress //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_EmailAddress
DROP TABLE IF EXISTS dw_Person_EmailAddress;
GO
CREATE TABLE dw_Person_EmailAddress(
[BusinessEntityID] int,
[EmailAddressID] int,
[EmailAddress] nvarchar(50),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_Password //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_Password
DROP TABLE IF EXISTS dw_Person_Password;
GO
CREATE TABLE dw_Person_Password(
[BusinessEntityID] int,
[PasswordHash] varchar(128),
[PasswordSalt] varchar(10),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_Person //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_Person
DROP TABLE IF EXISTS dw_Person_Person;
GO
CREATE TABLE dw_Person_Person(
[BusinessEntityID] int,
[PersonType] nchar(2),
[NameStyle] bit,
[Title] nvarchar(8),
[FirstName] nvarchar(50),
[MiddleName] nvarchar(50),
[LastName] nvarchar(50),
[Suffix] nvarchar(10),
[EmailPromotion] int,
[AdditionalContactInfo] xml,
[Demographics] xml,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_PersonPhone //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_PersonPhone
DROP TABLE IF EXISTS dw_Person_PersonPhone;
GO
CREATE TABLE dw_Person_PersonPhone(
[BusinessEntityID] int,
[PhoneNumber] nvarchar(25),
[PhoneNumberTypeID] int,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_PhoneNumberType //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_PhoneNumberType
DROP TABLE IF EXISTS dw_Person_PhoneNumberType;
GO
CREATE TABLE dw_Person_PhoneNumberType(
[PhoneNumberTypeID] int,
[Name] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Person_StateProvince //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Person_StateProvince
DROP TABLE IF EXISTS dw_Person_StateProvince;
GO
CREATE TABLE dw_Person_StateProvince(
[StateProvinceID] int,
[StateProvinceCode] nchar(3),
[CountryRegionCode] nvarchar(3),
[IsOnlyStateProvinceFlag] bit,
[Name] nvarchar(50),
[TerritoryID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_BillOfMaterials //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_BillOfMaterials
DROP TABLE IF EXISTS dw_Production_BillOfMaterials;
GO
CREATE TABLE dw_Production_BillOfMaterials(
[BillOfMaterialsID] int,
[ProductAssemblyID] int,
[ComponentID] int,
[StartDate] datetime,
[EndDate] datetime,
[UnitMeasureCode] nchar(3),
[BOMLevel] smallint,
[PerAssemblyQty] decimal(8,2),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_Culture //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_Culture
DROP TABLE IF EXISTS dw_Production_Culture;
GO
CREATE TABLE dw_Production_Culture(
[CultureID] nchar(6),
[Name] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_Illustration //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_Illustration
DROP TABLE IF EXISTS dw_Production_Illustration;
GO
CREATE TABLE dw_Production_Illustration(
[IllustrationID] int,
[Diagram] xml,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_Location //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_Location
DROP TABLE IF EXISTS dw_Production_Location;
GO
CREATE TABLE dw_Production_Location(
[LocationID] smallint,
[Name] nvarchar(50),
[CostRate] smallmoney,
[Availability] decimal(8,2),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_Product //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_Product
DROP TABLE IF EXISTS dw_Production_Product;
GO
CREATE TABLE dw_Production_Product(
[ProductID] int,
[Name] nvarchar(50),
[ProductNumber] nvarchar(25),
[MakeFlag] bit,
[FinishedGoodsFlag] bit,
[Color] nvarchar(15),
[SafetyStockLevel] smallint,
[ReorderPoint] smallint,
[StandardCost] money,
[ListPrice] money,
[Size] nvarchar(5),
[SizeUnitMeasureCode] nchar(3),
[WeightUnitMeasureCode] nchar(3),
[Weight] decimal(8,2),
[DaysToManufacture] int,
[ProductLine] nchar(2),
[Class] nchar(2),
[Style] nchar(2),
[ProductSubcategoryID] int,
[ProductModelID] int,
[SellStartDate] datetime,
[SellEndDate] datetime,
[DiscontinuedDate] datetime,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductCategory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductCategory
DROP TABLE IF EXISTS dw_Production_ProductCategory;
GO
CREATE TABLE dw_Production_ProductCategory(
[ProductCategoryID] int,
[Name] nvarchar(50),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductCostHistory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductCostHistory
DROP TABLE IF EXISTS dw_Production_ProductCostHistory;
GO
CREATE TABLE dw_Production_ProductCostHistory(
[ProductID] int,
[StartDate] datetime,
[EndDate] datetime,
[StandardCost] money,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductDescription //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductDescription
DROP TABLE IF EXISTS dw_Production_ProductDescription;
GO
CREATE TABLE dw_Production_ProductDescription(
[ProductDescriptionID] int,
[Description] nvarchar(400),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductInventory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductInventory
DROP TABLE IF EXISTS dw_Production_ProductInventory;
GO
CREATE TABLE dw_Production_ProductInventory(
[ProductID] int,
[LocationID] smallint,
[Shelf] nvarchar(10),
[Bin] tinyint,
[Quantity] smallint,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductListPriceHistory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductListPriceHistory
DROP TABLE IF EXISTS dw_Production_ProductListPriceHistory;
GO
CREATE TABLE dw_Production_ProductListPriceHistory(
[ProductID] int,
[StartDate] datetime,
[EndDate] datetime,
[ListPrice] money,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductModel //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductModel
DROP TABLE IF EXISTS dw_Production_ProductModel;
GO
CREATE TABLE dw_Production_ProductModel(
[ProductModelID] int,
[Name] nvarchar(50),
[CatalogDescription] xml,
[Instructions] xml,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductModelIllustration //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductModelIllustration
DROP TABLE IF EXISTS dw_Production_ProductModelIllustration;
GO
CREATE TABLE dw_Production_ProductModelIllustration(
[ProductModelID] int,
[IllustrationID] int,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductModelProductDescriptionCulture //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductModelProductDescriptionCulture
DROP TABLE IF EXISTS dw_Production_ProductModelProductDescriptionCulture;
GO
CREATE TABLE dw_Production_ProductModelProductDescriptionCulture(
[ProductModelID] int,
[ProductDescriptionID] int,
[CultureID] nchar(6),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductPhoto //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductPhoto
DROP TABLE IF EXISTS dw_Production_ProductPhoto;
GO
CREATE TABLE dw_Production_ProductPhoto(
[ProductPhotoID] int,
[ThumbNailPhoto] varbinary(max),
[ThumbnailPhotoFileName] nvarchar(50),
[LargePhoto] varbinary(max),
[LargePhotoFileName] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductProductPhoto //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductProductPhoto
DROP TABLE IF EXISTS dw_Production_ProductProductPhoto;
GO
CREATE TABLE dw_Production_ProductProductPhoto(
[ProductID] int,
[ProductPhotoID] int,
[Primary] bit,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductReview //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductReview
DROP TABLE IF EXISTS dw_Production_ProductReview;
GO
CREATE TABLE dw_Production_ProductReview(
[ProductReviewID] int,
[ProductID] int,
[ReviewerName] nvarchar(50),
[ReviewDate] datetime,
[EmailAddress] nvarchar(50),
[Rating] int,
[Comments] nvarchar(3850),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ProductSubcategory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ProductSubcategory
DROP TABLE IF EXISTS dw_Production_ProductSubcategory;
GO
CREATE TABLE dw_Production_ProductSubcategory(
[ProductSubcategoryID] int,
[ProductCategoryID] int,
[Name] nvarchar(50),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_ScrapReason //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_ScrapReason
DROP TABLE IF EXISTS dw_Production_ScrapReason;
GO
CREATE TABLE dw_Production_ScrapReason(
[ScrapReasonID] smallint,
[Name] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_TransactionHistory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_TransactionHistory
DROP TABLE IF EXISTS dw_Production_TransactionHistory;
GO
CREATE TABLE dw_Production_TransactionHistory(
[TransactionID] int,
[ProductID] int,
[ReferenceOrderID] int,
[ReferenceOrderLineID] int,
[TransactionDate] datetime,
[TransactionType] nchar(1),
[Quantity] int,
[ActualCost] money,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_TransactionHistoryArchive //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_TransactionHistoryArchive
DROP TABLE IF EXISTS dw_Production_TransactionHistoryArchive;
GO
CREATE TABLE dw_Production_TransactionHistoryArchive(
[TransactionID] int,
[ProductID] int,
[ReferenceOrderID] int,
[ReferenceOrderLineID] int,
[TransactionDate] datetime,
[TransactionType] nchar(1),
[Quantity] int,
[ActualCost] money,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_UnitMeasure //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_UnitMeasure
DROP TABLE IF EXISTS dw_Production_UnitMeasure;
GO
CREATE TABLE dw_Production_UnitMeasure(
[UnitMeasureCode] nchar(3),
[Name] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_WorkOrder //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_WorkOrder
DROP TABLE IF EXISTS dw_Production_WorkOrder;
GO
CREATE TABLE dw_Production_WorkOrder(
[WorkOrderID] int,
[ProductID] int,
[OrderQty] int,
[StockedQty] int,
[ScrappedQty] smallint,
[StartDate] datetime,
[EndDate] datetime,
[DueDate] datetime,
[ScrapReasonID] smallint,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Production_WorkOrderRouting //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Production_WorkOrderRouting
DROP TABLE IF EXISTS dw_Production_WorkOrderRouting;
GO
CREATE TABLE dw_Production_WorkOrderRouting(
[WorkOrderID] int,
[ProductID] int,
[OperationSequence] smallint,
[LocationID] smallint,
[ScheduledStartDate] datetime,
[ScheduledEndDate] datetime,
[ActualStartDate] datetime,
[ActualEndDate] datetime,
[ActualResourceHrs] decimal(9,4),
[PlannedCost] money,
[ActualCost] money,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Purchasing_ProductVendor //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Purchasing_ProductVendor
DROP TABLE IF EXISTS dw_Purchasing_ProductVendor;
GO
CREATE TABLE dw_Purchasing_ProductVendor(
[ProductID] int,
[BusinessEntityID] int,
[AverageLeadTime] int,
[StandardPrice] money,
[LastReceiptCost] money,
[LastReceiptDate] datetime,
[MinOrderQty] int,
[MaxOrderQty] int,
[OnOrderQty] int,
[UnitMeasureCode] nchar(3),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Purchasing_PurchaseOrderDetail //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Purchasing_PurchaseOrderDetail
DROP TABLE IF EXISTS dw_Purchasing_PurchaseOrderDetail;
GO
CREATE TABLE dw_Purchasing_PurchaseOrderDetail(
[PurchaseOrderID] int,
[PurchaseOrderDetailID] int,
[DueDate] datetime,
[OrderQty] smallint,
[ProductID] int,
[UnitPrice] money,
[LineTotal] money,
[ReceivedQty] decimal(8,2),
[RejectedQty] decimal(8,2),
[StockedQty] decimal(9,2),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Purchasing_PurchaseOrderHeader //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Purchasing_PurchaseOrderHeader
DROP TABLE IF EXISTS dw_Purchasing_PurchaseOrderHeader;
GO
CREATE TABLE dw_Purchasing_PurchaseOrderHeader(
[PurchaseOrderID] int,
[RevisionNumber] tinyint,
[Status] tinyint,
[EmployeeID] int,
[VendorID] int,
[ShipMethodID] int,
[OrderDate] datetime,
[ShipDate] datetime,
[SubTotal] money,
[TaxAmt] money,
[Freight] money,
[TotalDue] money,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Purchasing_ShipMethod //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Purchasing_ShipMethod
DROP TABLE IF EXISTS dw_Purchasing_ShipMethod;
GO
CREATE TABLE dw_Purchasing_ShipMethod(
[ShipMethodID] int,
[Name] nvarchar(50),
[ShipBase] money,
[ShipRate] money,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Purchasing_Vendor //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Purchasing_Vendor
DROP TABLE IF EXISTS dw_Purchasing_Vendor;
GO
CREATE TABLE dw_Purchasing_Vendor(
[BusinessEntityID] int,
[AccountNumber] nvarchar(15),
[Name] nvarchar(50),
[CreditRating] tinyint,
[PreferredVendorStatus] bit,
[ActiveFlag] bit,
[PurchasingWebServiceURL] nvarchar(1024),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_CountryRegionCurrency //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_CountryRegionCurrency
DROP TABLE IF EXISTS dw_Sales_CountryRegionCurrency;
GO
CREATE TABLE dw_Sales_CountryRegionCurrency(
[CountryRegionCode] nvarchar(3),
[CurrencyCode] nchar(3),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_CreditCard //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_CreditCard
DROP TABLE IF EXISTS dw_Sales_CreditCard;
GO
CREATE TABLE dw_Sales_CreditCard(
[CreditCardID] int,
[CardType] nvarchar(50),
[CardNumber] nvarchar(25),
[ExpMonth] tinyint,
[ExpYear] smallint,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_Currency //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_Currency
DROP TABLE IF EXISTS dw_Sales_Currency;
GO
CREATE TABLE dw_Sales_Currency(
[CurrencyCode] nchar(3),
[Name] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_CurrencyRate //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_CurrencyRate
DROP TABLE IF EXISTS dw_Sales_CurrencyRate;
GO
CREATE TABLE dw_Sales_CurrencyRate(
[CurrencyRateID] int,
[CurrencyRateDate] datetime,
[FromCurrencyCode] nchar(3),
[ToCurrencyCode] nchar(3),
[AverageRate] money,
[EndOfDayRate] money,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_Customer //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_Customer
DROP TABLE IF EXISTS dw_Sales_Customer;
GO
CREATE TABLE dw_Sales_Customer(
[CustomerID] int,
[PersonID] int,
[StoreID] int,
[TerritoryID] int,
[AccountNumber] varchar(10),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_PersonCreditCard //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_PersonCreditCard
DROP TABLE IF EXISTS dw_Sales_PersonCreditCard;
GO
CREATE TABLE dw_Sales_PersonCreditCard(
[BusinessEntityID] int,
[CreditCardID] int,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SalesOrderDetail //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SalesOrderDetail
DROP TABLE IF EXISTS dw_Sales_SalesOrderDetail;
GO
CREATE TABLE dw_Sales_SalesOrderDetail(
[SalesOrderID] int,
[SalesOrderDetailID] int,
[CarrierTrackingNumber] nvarchar(25),
[OrderQty] smallint,
[ProductID] int,
[SpecialOfferID] int,
[UnitPrice] money,
[UnitPriceDiscount] money,
[LineTotal] numeric(38,6),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SalesOrderHeader //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SalesOrderHeader
DROP TABLE IF EXISTS dw_Sales_SalesOrderHeader;
GO
CREATE TABLE dw_Sales_SalesOrderHeader(
[SalesOrderID] int,
[RevisionNumber] tinyint,
[OrderDate] datetime,
[DueDate] datetime,
[ShipDate] datetime,
[Status] tinyint,
[OnlineOrderFlag] bit,
[SalesOrderNumber] nvarchar(25),
[PurchaseOrderNumber] nvarchar(25),
[AccountNumber] nvarchar(15),
[CustomerID] int,
[SalesPersonID] int,
[TerritoryID] int,
[BillToAddressID] int,
[ShipToAddressID] int,
[ShipMethodID] int,
[CreditCardID] int,
[CreditCardApprovalCode] varchar(15),
[CurrencyRateID] int,
[SubTotal] money,
[TaxAmt] money,
[Freight] money,
[TotalDue] money,
[Comment] nvarchar(128),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SalesOrderHeaderSalesReason //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SalesOrderHeaderSalesReason
DROP TABLE IF EXISTS dw_Sales_SalesOrderHeaderSalesReason;
GO
CREATE TABLE dw_Sales_SalesOrderHeaderSalesReason(
[SalesOrderID] int,
[SalesReasonID] int,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SalesPerson //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SalesPerson
DROP TABLE IF EXISTS dw_Sales_SalesPerson;
GO
CREATE TABLE dw_Sales_SalesPerson(
[BusinessEntityID] int,
[TerritoryID] int,
[SalesQuota] money,
[Bonus] money,
[CommissionPct] smallmoney,
[SalesYTD] money,
[SalesLastYear] money,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SalesPersonQuotaHistory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SalesPersonQuotaHistory
DROP TABLE IF EXISTS dw_Sales_SalesPersonQuotaHistory;
GO
CREATE TABLE dw_Sales_SalesPersonQuotaHistory(
[BusinessEntityID] int,
[QuotaDate] datetime,
[SalesQuota] money,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SalesReason //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SalesReason
DROP TABLE IF EXISTS dw_Sales_SalesReason;
GO
CREATE TABLE dw_Sales_SalesReason(
[SalesReasonID] int,
[Name] nvarchar(50),
[ReasonType] nvarchar(50),
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SalesTaxRate //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SalesTaxRate
DROP TABLE IF EXISTS dw_Sales_SalesTaxRate;
GO
CREATE TABLE dw_Sales_SalesTaxRate(
[SalesTaxRateID] int,
[StateProvinceID] int,
[TaxType] tinyint,
[TaxRate] smallmoney,
[Name] nvarchar(50),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SalesTerritory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SalesTerritory
DROP TABLE IF EXISTS dw_Sales_SalesTerritory;
GO
CREATE TABLE dw_Sales_SalesTerritory(
[TerritoryID] int,
[Name] nvarchar(50),
[CountryRegionCode] nvarchar(3),
[Group] nvarchar(50),
[SalesYTD] money,
[SalesLastYear] money,
[CostYTD] money,
[CostLastYear] money,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SalesTerritoryHistory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SalesTerritoryHistory
DROP TABLE IF EXISTS dw_Sales_SalesTerritoryHistory;
GO
CREATE TABLE dw_Sales_SalesTerritoryHistory(
[BusinessEntityID] int,
[TerritoryID] int,
[StartDate] datetime,
[EndDate] datetime,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_ShoppingCartItem //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_ShoppingCartItem
DROP TABLE IF EXISTS dw_Sales_ShoppingCartItem;
GO
CREATE TABLE dw_Sales_ShoppingCartItem(
[ShoppingCartItemID] int,
[ShoppingCartID] nvarchar(50),
[Quantity] int,
[ProductID] int,
[DateCreated] datetime,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SpecialOffer //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SpecialOffer
DROP TABLE IF EXISTS dw_Sales_SpecialOffer;
GO
CREATE TABLE dw_Sales_SpecialOffer(
[SpecialOfferID] int,
[Description] nvarchar(255),
[DiscountPct] smallmoney,
[Type] nvarchar(50),
[Category] nvarchar(50),
[StartDate] datetime,
[EndDate] datetime,
[MinQty] int,
[MaxQty] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_SpecialOfferProduct //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_SpecialOfferProduct
DROP TABLE IF EXISTS dw_Sales_SpecialOfferProduct;
GO
CREATE TABLE dw_Sales_SpecialOfferProduct(
[SpecialOfferID] int,
[ProductID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Sales_Store //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_Sales_Store
DROP TABLE IF EXISTS dw_Sales_Store;
GO
CREATE TABLE dw_Sales_Store(
[BusinessEntityID] int,
[Name] nvarchar(50),
[SalesPersonID] int,
[Demographics] xml,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_dbo_AWBuildVersion //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_dbo_AWBuildVersion
DROP TABLE IF EXISTS dw_dbo_AWBuildVersion;
GO
CREATE TABLE dw_dbo_AWBuildVersion(
[SystemInformationID] tinyint,
[DatabaseVersion] nvarchar(25),
[VersionDate] datetime,
[ModifiedDate] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_dbo_DatabaseLog //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_dbo_DatabaseLog
DROP TABLE IF EXISTS dw_dbo_DatabaseLog;
GO
CREATE TABLE dw_dbo_DatabaseLog(
[DatabaseLogID] int,
[PostTime] datetime,
[DatabaseUser] nvarchar(128),
[Event] nvarchar(128),
[Schema] nvarchar(128),
[Object] nvarchar(128),
[TSQL] nvarchar(max),
[XmlEvent] xml,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_dbo_ErrorLog //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_dbo_ErrorLog
DROP TABLE IF EXISTS dw_dbo_ErrorLog;
GO
CREATE TABLE dw_dbo_ErrorLog(
[ErrorLogID] int,
[ErrorTime] datetime,
[UserName] nvarchar(128),
[ErrorNumber] int,
[ErrorSeverity] int,
[ErrorState] int,
[ErrorProcedure] nvarchar(126),
[ErrorLine] int,
[ErrorMessage] nvarchar(4000),
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_mondb_restaurants //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_mondb_restaurants
DROP TABLE IF EXISTS dw_mondb_restaurants;
GO
CREATE TABLE dw_mondb_restaurants(
[_id_mongodb] nvarchar(1000),
[address] nvarchar(max),
[borough] nvarchar(1000),
[cuisine] nvarchar(1000),
[grades] nvarchar(max),
[name] nvarchar(1000),
[restaurant_id] nvarchar(1000),
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_mysql_customers //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_mysql_customers
DROP TABLE IF EXISTS dw_mysql_customers;
GO
CREATE TABLE dw_mysql_customers(
[customerNumber] int,
[customerName] nvarchar(50),
[contactLastName] nvarchar(50),
[contactFirstName] nvarchar(50),
[phone] nvarchar(50),
[addressLine1] nvarchar(50),
[addressLine2] nvarchar(50),
[city] nvarchar(50),
[state] nvarchar(50),
[postalCode] nvarchar(15),
[country] nvarchar(50),
[salesRepEmployeeNumber] int,
[creditLimit] float,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_mysql_employees //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_mysql_employees
DROP TABLE IF EXISTS dw_mysql_employees;
GO
CREATE TABLE dw_mysql_employees(
[employeeNumber] int,
[lastName] nvarchar(50),
[firstName] nvarchar(50),
[extension] nvarchar(10),
[email] nvarchar(100),
[officeCode] nvarchar(10),
[reportsTo] int,
[jobTitle] nvarchar(50),
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_mysql_offices //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_mysql_offices
DROP TABLE IF EXISTS dw_mysql_offices;
GO
CREATE TABLE dw_mysql_offices(
[officeCode] nvarchar(10),
[city] nvarchar(50),
[phone] nvarchar(50),
[addressLine1] nvarchar(50),
[addressLine2] nvarchar(50),
[state] nvarchar(50),
[country] nvarchar(50),
[postalCode] nvarchar(15),
[territory] nvarchar(10),
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_mysql_orderdetails //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_mysql_orderdetails
DROP TABLE IF EXISTS dw_mysql_orderdetails;
GO
CREATE TABLE dw_mysql_orderdetails(
[orderNumber] int,
[productCode] nvarchar(15),
[quantityOrdered] int,
[priceEach] float,
[orderLineNumber] smallint,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_mysql_orders //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_mysql_orders
DROP TABLE IF EXISTS dw_mysql_orders;
GO
CREATE TABLE dw_mysql_orders(
[orderNumber] int,
[orderDate] datetime,
[requiredDate] datetime,
[shippedDate] datetime,
[status] nvarchar(15),
[comments] nvarchar(max),
[customerNumber] int,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_mysql_payments //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_mysql_payments
DROP TABLE IF EXISTS dw_mysql_payments;
GO
CREATE TABLE dw_mysql_payments(
[customerNumber] int,
[checkNumber] nvarchar(50),
[paymentDate] datetime,
[amount] float,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_mysql_productlines //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_mysql_productlines
DROP TABLE IF EXISTS dw_mysql_productlines;
GO
CREATE TABLE dw_mysql_productlines(
[productLine] nvarchar(50),
[textDescription] nvarchar(4000),
[htmlDescription] nvarchar(max),
[image] varbinary(max),
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_mysql_products //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_mysql_products
DROP TABLE IF EXISTS dw_mysql_products;
GO
CREATE TABLE dw_mysql_products(
[productCode] nvarchar(15),
[productName] nvarchar(70),
[productLine] nvarchar(50),
[productScale] nvarchar(10),
[productVendor] nvarchar(50),
[productDescription] nvarchar(max),
[quantityInStock] smallint,
[buyPrice] float,
[MSRP] float,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_actor //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_actor
DROP TABLE IF EXISTS dw_pgsql_actor;
GO
CREATE TABLE dw_pgsql_actor(
[actor_id] int,
[first_name] nvarchar(45),
[last_name] nvarchar(45),
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_address //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_address
DROP TABLE IF EXISTS dw_pgsql_address;
GO
CREATE TABLE dw_pgsql_address(
[address_id] int,
[address] nvarchar(50),
[address2] nvarchar(50),
[district] nvarchar(20),
[city_id] smallint,
[postal_code] nvarchar(10),
[phone] nvarchar(20),
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_category //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_category
DROP TABLE IF EXISTS dw_pgsql_category;
GO
CREATE TABLE dw_pgsql_category(
[category_id] int,
[name] nvarchar(25),
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_city //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_city
DROP TABLE IF EXISTS dw_pgsql_city;
GO
CREATE TABLE dw_pgsql_city(
[city_id] int,
[city] nvarchar(50),
[country_id] smallint,
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_country //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_country
DROP TABLE IF EXISTS dw_pgsql_country;
GO
CREATE TABLE dw_pgsql_country(
[country_id] int,
[country] nvarchar(50),
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_customer //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_customer
DROP TABLE IF EXISTS dw_pgsql_customer;
GO
CREATE TABLE dw_pgsql_customer(
[customer_id] int,
[store_id] smallint,
[first_name] nvarchar(45),
[last_name] nvarchar(45),
[email] nvarchar(50),
[address_id] smallint,
[activebool] bit,
[create_date] datetime,
[last_update] datetime,
[active] int,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_film //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_film
DROP TABLE IF EXISTS dw_pgsql_film;
GO
CREATE TABLE dw_pgsql_film(
[film_id] int,
[title] nvarchar(255),
[description] nvarchar(max),
[release_year] int,
[language_id] smallint,
[rental_duration] smallint,
[rental_rate] float,
[length] smallint,
[replacement_cost] float,
[rating] nvarchar(max),
[last_update] datetime,
[special_features] nvarchar(max),
[fulltext] nvarchar(max),
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_film_actor //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_film_actor
DROP TABLE IF EXISTS dw_pgsql_film_actor;
GO
CREATE TABLE dw_pgsql_film_actor(
[actor_id] smallint,
[film_id] smallint,
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_film_category //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_film_category
DROP TABLE IF EXISTS dw_pgsql_film_category;
GO
CREATE TABLE dw_pgsql_film_category(
[film_id] smallint,
[category_id] smallint,
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_inventory //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_inventory
DROP TABLE IF EXISTS dw_pgsql_inventory;
GO
CREATE TABLE dw_pgsql_inventory(
[inventory_id] int,
[film_id] smallint,
[store_id] smallint,
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_language //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_language
DROP TABLE IF EXISTS dw_pgsql_language;
GO
CREATE TABLE dw_pgsql_language(
[language_id] int,
[name] nvarchar(20),
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_payment //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_payment
DROP TABLE IF EXISTS dw_pgsql_payment;
GO
CREATE TABLE dw_pgsql_payment(
[payment_id] int,
[customer_id] smallint,
[staff_id] smallint,
[rental_id] int,
[amount] float,
[payment_date] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_rental //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_rental
DROP TABLE IF EXISTS dw_pgsql_rental;
GO
CREATE TABLE dw_pgsql_rental(
[rental_id] int,
[rental_date] datetime,
[inventory_id] int,
[customer_id] smallint,
[return_date] datetime,
[staff_id] smallint,
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_staff //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_staff
DROP TABLE IF EXISTS dw_pgsql_staff;
GO
CREATE TABLE dw_pgsql_staff(
[staff_id] int,
[first_name] nvarchar(45),
[last_name] nvarchar(45),
[address_id] smallint,
[email] nvarchar(50),
[store_id] smallint,
[active] bit,
[username] nvarchar(16),
[password] nvarchar(40),
[last_update] datetime,
[picture] varbinary(max),
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_pgsql_store //------------------------- --
USE [Dev_DW]
GO

-- TABLE: dw_pgsql_store
DROP TABLE IF EXISTS dw_pgsql_store;
GO
CREATE TABLE dw_pgsql_store(
[store_id] int,
[manager_staff_id] smallint,
[address_id] smallint,
[last_update] datetime,
[_LogID] int,
[_LogID_List] nvarchar(max),
[_ID] int identity(1,1) NOT FOR REPLICATION NOT NULL,
[_InsertedAt] datetime default getdate(),
[_UpdatedAt] datetime default getdate(),
[_DeletedAt] datetime,
[_IsActive] bit default 1
);
GO

-- -------------------------// dw_Agreement_Template_Detail //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Agreement_Template_Detail];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Agreement_Template_Detail];
GO
DROP TYPE IF EXISTS [type_dw_Agreement_Template_Detail];
GO
-- TABLE TYPE: type_dw_Agreement_Template_Detail
CREATE TYPE [type_dw_Agreement_Template_Detail] AS TABLE(
[TXN_KEY] nvarchar(255),
[CRITERIA_CD] nvarchar(255),
[OBJ_CD] nvarchar(255),
[OBJ_TYPE] nvarchar(255),
[SUB_OBJ_TYPE] nvarchar(255),
[PRD_CD] nvarchar(255),
[PRD_TYPE] nvarchar(255),
[MSL_TYPE] nvarchar(255),
[MAX_POINT] nvarchar(255),
[TARGET] nvarchar(255)
);
GO
-- PROCEDURE: sp_upsert_dw_Agreement_Template_Detail
CREATE PROC [sp_upsert_dw_Agreement_Template_Detail]
(
@tvp [type_dw_Agreement_Template_Detail] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Agreement_Template_Detail AS target
USING (
SELECT ISNULL([TXN_KEY], '') AS [TXN_KEY],
[CRITERIA_CD] AS [CRITERIA_CD],
ISNULL([OBJ_CD], '') AS [OBJ_CD],
[OBJ_TYPE] AS [OBJ_TYPE],
[SUB_OBJ_TYPE] AS [SUB_OBJ_TYPE],
[PRD_CD] AS [PRD_CD],
[PRD_TYPE] AS [PRD_TYPE],
[MSL_TYPE] AS [MSL_TYPE],
[MAX_POINT] AS [MAX_POINT],
[TARGET] AS [TARGET],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[TXN_KEY] = source.[TXN_KEY]
AND target.[OBJ_CD] = source.[OBJ_CD]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[CRITERIA_CD] = source.[CRITERIA_CD],
target.[OBJ_TYPE] = source.[OBJ_TYPE],
target.[SUB_OBJ_TYPE] = source.[SUB_OBJ_TYPE],
target.[PRD_CD] = source.[PRD_CD],
target.[PRD_TYPE] = source.[PRD_TYPE],
target.[MSL_TYPE] = source.[MSL_TYPE],
target.[MAX_POINT] = source.[MAX_POINT],
target.[TARGET] = source.[TARGET],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([TXN_KEY],
[CRITERIA_CD],
[OBJ_CD],
[OBJ_TYPE],
[SUB_OBJ_TYPE],
[PRD_CD],
[PRD_TYPE],
[MSL_TYPE],
[MAX_POINT],
[TARGET],
[_LogID],
[_LogID_List]
)
VALUES (source.[TXN_KEY],
source.[CRITERIA_CD],
source.[OBJ_CD],
source.[OBJ_TYPE],
source.[SUB_OBJ_TYPE],
source.[PRD_CD],
source.[PRD_TYPE],
source.[MSL_TYPE],
source.[MAX_POINT],
source.[TARGET],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_DISTRIBUTOR_INFO //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_DISTRIBUTOR_INFO];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_DISTRIBUTOR_INFO];
GO
DROP TYPE IF EXISTS [type_dw_DISTRIBUTOR_INFO];
GO
-- TABLE TYPE: type_dw_DISTRIBUTOR_INFO
CREATE TYPE [type_dw_DISTRIBUTOR_INFO] AS TABLE(
[DistributorCode] nvarchar(255),
[DistributorName] nvarchar(255),
[Area] nvarchar(255),
[Region] nvarchar(255),
[Branch] nvarchar(255),
[Status] int,
[Channel] float,
[CNVSiteCode] float,
[Prov_Town] float,
[Address] nvarchar(255),
[Email] float,
[Tel] nvarchar(255),
[Fax] float,
[Contact] float,
[TaxCode] float
);
GO
-- PROCEDURE: sp_upsert_dw_DISTRIBUTOR_INFO
CREATE PROC [sp_upsert_dw_DISTRIBUTOR_INFO]
(
@tvp [type_dw_DISTRIBUTOR_INFO] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_DISTRIBUTOR_INFO AS target
USING (
SELECT ISNULL([DistributorCode], '') AS [DistributorCode],
[DistributorName] AS [DistributorName],
[Area] AS [Area],
[Region] AS [Region],
[Branch] AS [Branch],
[Status] AS [Status],
[Channel] AS [Channel],
[CNVSiteCode] AS [CNVSiteCode],
[Prov_Town] AS [Prov_Town],
[Address] AS [Address],
[Email] AS [Email],
[Tel] AS [Tel],
[Fax] AS [Fax],
[Contact] AS [Contact],
[TaxCode] AS [TaxCode],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[DistributorCode] = source.[DistributorCode]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[DistributorName] = source.[DistributorName],
target.[Area] = source.[Area],
target.[Region] = source.[Region],
target.[Branch] = source.[Branch],
target.[Status] = source.[Status],
target.[Channel] = source.[Channel],
target.[CNVSiteCode] = source.[CNVSiteCode],
target.[Prov_Town] = source.[Prov_Town],
target.[Address] = source.[Address],
target.[Email] = source.[Email],
target.[Tel] = source.[Tel],
target.[Fax] = source.[Fax],
target.[Contact] = source.[Contact],
target.[TaxCode] = source.[TaxCode],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([DistributorCode],
[DistributorName],
[Area],
[Region],
[Branch],
[Status],
[Channel],
[CNVSiteCode],
[Prov_Town],
[Address],
[Email],
[Tel],
[Fax],
[Contact],
[TaxCode],
[_LogID],
[_LogID_List]
)
VALUES (source.[DistributorCode],
source.[DistributorName],
source.[Area],
source.[Region],
source.[Branch],
source.[Status],
source.[Channel],
source.[CNVSiteCode],
source.[Prov_Town],
source.[Address],
source.[Email],
source.[Tel],
source.[Fax],
source.[Contact],
source.[TaxCode],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_NPS_Price //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_NPS_Price];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_NPS_Price];
GO
DROP TYPE IF EXISTS [type_dw_NPS_Price];
GO
-- TABLE TYPE: type_dw_NPS_Price
CREATE TYPE [type_dw_NPS_Price] AS TABLE(
[SalesGroup] nvarchar(255),
[RegionPrice] nvarchar(255),
[Itemnumber] int,
[Productname] nvarchar(255),
[Itemgroup] nvarchar(255),
[NPSPrice(vnd)] int,
[FromDate] datetime,
[ToDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_NPS_Price
CREATE PROC [sp_upsert_dw_NPS_Price]
(
@tvp [type_dw_NPS_Price] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_NPS_Price AS target
USING (
SELECT ISNULL([SalesGroup], '') AS [SalesGroup],
ISNULL([RegionPrice], '') AS [RegionPrice],
ISNULL([Itemnumber], 0) AS [Itemnumber],
[Productname] AS [Productname],
[Itemgroup] AS [Itemgroup],
[NPSPrice(vnd)] AS [NPSPrice(vnd)],
ISNULL([FromDate], '9999-12-31') AS [FromDate],
[ToDate] AS [ToDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[SalesGroup] = source.[SalesGroup]
AND target.[RegionPrice] = source.[RegionPrice]
AND target.[Itemnumber] = source.[Itemnumber]
AND target.[FromDate] = source.[FromDate]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Productname] = source.[Productname],
target.[Itemgroup] = source.[Itemgroup],
target.[NPSPrice(vnd)] = source.[NPSPrice(vnd)],
target.[ToDate] = source.[ToDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SalesGroup],
[RegionPrice],
[Itemnumber],
[Productname],
[Itemgroup],
[NPSPrice(vnd)],
[FromDate],
[ToDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[SalesGroup],
source.[RegionPrice],
source.[Itemnumber],
source.[Productname],
source.[Itemgroup],
source.[NPSPrice(vnd)],
source.[FromDate],
source.[ToDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ScrapReason //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ScrapReason];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ScrapReason];
GO
DROP TYPE IF EXISTS [type_dw_Production_ScrapReason];
GO
-- TABLE TYPE: type_dw_Production_ScrapReason
CREATE TYPE [type_dw_Production_ScrapReason] AS TABLE(
[ScrapReasonID] smallint,
[Name] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ScrapReason
CREATE PROC [sp_upsert_dw_Production_ScrapReason]
(
@tvp [type_dw_Production_ScrapReason] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ScrapReason AS target
USING (
SELECT ISNULL([ScrapReasonID], 0) AS [ScrapReasonID],
[Name] AS [Name],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ScrapReasonID] = source.[ScrapReasonID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ScrapReasonID],
[Name],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ScrapReasonID],
source.[Name],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_HumanResources_Shift //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_HumanResources_Shift];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_HumanResources_Shift];
GO
DROP TYPE IF EXISTS [type_dw_HumanResources_Shift];
GO
-- TABLE TYPE: type_dw_HumanResources_Shift
CREATE TYPE [type_dw_HumanResources_Shift] AS TABLE(
[ShiftID] tinyint,
[Name] nvarchar(50),
[StartTime] time(7),
[EndTime] time(7),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_HumanResources_Shift
CREATE PROC [sp_upsert_dw_HumanResources_Shift]
(
@tvp [type_dw_HumanResources_Shift] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_HumanResources_Shift AS target
USING (
SELECT ISNULL([ShiftID], 0) AS [ShiftID],
[Name] AS [Name],
[StartTime] AS [StartTime],
[EndTime] AS [EndTime],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ShiftID] = source.[ShiftID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[StartTime] = source.[StartTime],
target.[EndTime] = source.[EndTime],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ShiftID],
[Name],
[StartTime],
[EndTime],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ShiftID],
source.[Name],
source.[StartTime],
source.[EndTime],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductCategory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductCategory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductCategory];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductCategory];
GO
-- TABLE TYPE: type_dw_Production_ProductCategory
CREATE TYPE [type_dw_Production_ProductCategory] AS TABLE(
[ProductCategoryID] int,
[Name] nvarchar(50),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductCategory
CREATE PROC [sp_upsert_dw_Production_ProductCategory]
(
@tvp [type_dw_Production_ProductCategory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductCategory AS target
USING (
SELECT ISNULL([ProductCategoryID], 0) AS [ProductCategoryID],
[Name] AS [Name],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductCategoryID] = source.[ProductCategoryID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductCategoryID],
[Name],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductCategoryID],
source.[Name],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Purchasing_ShipMethod //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Purchasing_ShipMethod];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Purchasing_ShipMethod];
GO
DROP TYPE IF EXISTS [type_dw_Purchasing_ShipMethod];
GO
-- TABLE TYPE: type_dw_Purchasing_ShipMethod
CREATE TYPE [type_dw_Purchasing_ShipMethod] AS TABLE(
[ShipMethodID] int,
[Name] nvarchar(50),
[ShipBase] money,
[ShipRate] money,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Purchasing_ShipMethod
CREATE PROC [sp_upsert_dw_Purchasing_ShipMethod]
(
@tvp [type_dw_Purchasing_ShipMethod] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Purchasing_ShipMethod AS target
USING (
SELECT ISNULL([ShipMethodID], 0) AS [ShipMethodID],
[Name] AS [Name],
[ShipBase] AS [ShipBase],
[ShipRate] AS [ShipRate],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ShipMethodID] = source.[ShipMethodID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ShipBase] = source.[ShipBase],
target.[ShipRate] = source.[ShipRate],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ShipMethodID],
[Name],
[ShipBase],
[ShipRate],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ShipMethodID],
source.[Name],
source.[ShipBase],
source.[ShipRate],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductCostHistory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductCostHistory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductCostHistory];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductCostHistory];
GO
-- TABLE TYPE: type_dw_Production_ProductCostHistory
CREATE TYPE [type_dw_Production_ProductCostHistory] AS TABLE(
[ProductID] int,
[StartDate] datetime,
[EndDate] datetime,
[StandardCost] money,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductCostHistory
CREATE PROC [sp_upsert_dw_Production_ProductCostHistory]
(
@tvp [type_dw_Production_ProductCostHistory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductCostHistory AS target
USING (
SELECT ISNULL([ProductID], 0) AS [ProductID],
ISNULL([StartDate], '9999-12-31') AS [StartDate],
[EndDate] AS [EndDate],
[StandardCost] AS [StandardCost],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductID] = source.[ProductID]
AND target.[StartDate] = source.[StartDate]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[EndDate] = source.[EndDate],
target.[StandardCost] = source.[StandardCost],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductID],
[StartDate],
[EndDate],
[StandardCost],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductID],
source.[StartDate],
source.[EndDate],
source.[StandardCost],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductDescription //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductDescription];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductDescription];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductDescription];
GO
-- TABLE TYPE: type_dw_Production_ProductDescription
CREATE TYPE [type_dw_Production_ProductDescription] AS TABLE(
[ProductDescriptionID] int,
[Description] nvarchar(400),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductDescription
CREATE PROC [sp_upsert_dw_Production_ProductDescription]
(
@tvp [type_dw_Production_ProductDescription] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductDescription AS target
USING (
SELECT ISNULL([ProductDescriptionID], 0) AS [ProductDescriptionID],
[Description] AS [Description],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductDescriptionID] = source.[ProductDescriptionID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Description] = source.[Description],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductDescriptionID],
[Description],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductDescriptionID],
source.[Description],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_ShoppingCartItem //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_ShoppingCartItem];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_ShoppingCartItem];
GO
DROP TYPE IF EXISTS [type_dw_Sales_ShoppingCartItem];
GO
-- TABLE TYPE: type_dw_Sales_ShoppingCartItem
CREATE TYPE [type_dw_Sales_ShoppingCartItem] AS TABLE(
[ShoppingCartItemID] int,
[ShoppingCartID] nvarchar(50),
[Quantity] int,
[ProductID] int,
[DateCreated] datetime,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_ShoppingCartItem
CREATE PROC [sp_upsert_dw_Sales_ShoppingCartItem]
(
@tvp [type_dw_Sales_ShoppingCartItem] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_ShoppingCartItem AS target
USING (
SELECT ISNULL([ShoppingCartItemID], 0) AS [ShoppingCartItemID],
[ShoppingCartID] AS [ShoppingCartID],
[Quantity] AS [Quantity],
[ProductID] AS [ProductID],
[DateCreated] AS [DateCreated],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ShoppingCartItemID] = source.[ShoppingCartItemID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ShoppingCartID] = source.[ShoppingCartID],
target.[Quantity] = source.[Quantity],
target.[ProductID] = source.[ProductID],
target.[DateCreated] = source.[DateCreated],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ShoppingCartItemID],
[ShoppingCartID],
[Quantity],
[ProductID],
[DateCreated],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ShoppingCartItemID],
source.[ShoppingCartID],
source.[Quantity],
source.[ProductID],
source.[DateCreated],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_dbo_DatabaseLog //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_dbo_DatabaseLog];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_dbo_DatabaseLog];
GO
DROP TYPE IF EXISTS [type_dw_dbo_DatabaseLog];
GO
-- TABLE TYPE: type_dw_dbo_DatabaseLog
CREATE TYPE [type_dw_dbo_DatabaseLog] AS TABLE(
[DatabaseLogID] int,
[PostTime] datetime,
[DatabaseUser] nvarchar(128),
[Event] nvarchar(128),
[Schema] nvarchar(128),
[Object] nvarchar(128),
[TSQL] nvarchar(max),
[XmlEvent] xml
);
GO
-- PROCEDURE: sp_upsert_dw_dbo_DatabaseLog
CREATE PROC [sp_upsert_dw_dbo_DatabaseLog]
(
@tvp [type_dw_dbo_DatabaseLog] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_dbo_DatabaseLog AS target
USING (
SELECT ISNULL([DatabaseLogID], 0) AS [DatabaseLogID],
[PostTime] AS [PostTime],
[DatabaseUser] AS [DatabaseUser],
[Event] AS [Event],
[Schema] AS [Schema],
[Object] AS [Object],
[TSQL] AS [TSQL],
[XmlEvent] AS [XmlEvent],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[DatabaseLogID] = source.[DatabaseLogID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[PostTime] = source.[PostTime],
target.[DatabaseUser] = source.[DatabaseUser],
target.[Event] = source.[Event],
target.[Schema] = source.[Schema],
target.[Object] = source.[Object],
target.[TSQL] = source.[TSQL],
target.[XmlEvent] = source.[XmlEvent],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([DatabaseLogID],
[PostTime],
[DatabaseUser],
[Event],
[Schema],
[Object],
[TSQL],
[XmlEvent],
[_LogID],
[_LogID_List]
)
VALUES (source.[DatabaseLogID],
source.[PostTime],
source.[DatabaseUser],
source.[Event],
source.[Schema],
source.[Object],
source.[TSQL],
source.[XmlEvent],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductInventory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductInventory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductInventory];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductInventory];
GO
-- TABLE TYPE: type_dw_Production_ProductInventory
CREATE TYPE [type_dw_Production_ProductInventory] AS TABLE(
[ProductID] int,
[LocationID] smallint,
[Shelf] nvarchar(10),
[Bin] tinyint,
[Quantity] smallint,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductInventory
CREATE PROC [sp_upsert_dw_Production_ProductInventory]
(
@tvp [type_dw_Production_ProductInventory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductInventory AS target
USING (
SELECT ISNULL([ProductID], 0) AS [ProductID],
ISNULL([LocationID], 0) AS [LocationID],
[Shelf] AS [Shelf],
[Bin] AS [Bin],
[Quantity] AS [Quantity],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductID] = source.[ProductID]
AND target.[LocationID] = source.[LocationID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Shelf] = source.[Shelf],
target.[Bin] = source.[Bin],
target.[Quantity] = source.[Quantity],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductID],
[LocationID],
[Shelf],
[Bin],
[Quantity],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductID],
source.[LocationID],
source.[Shelf],
source.[Bin],
source.[Quantity],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SpecialOffer //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SpecialOffer];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SpecialOffer];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SpecialOffer];
GO
-- TABLE TYPE: type_dw_Sales_SpecialOffer
CREATE TYPE [type_dw_Sales_SpecialOffer] AS TABLE(
[SpecialOfferID] int,
[Description] nvarchar(255),
[DiscountPct] smallmoney,
[Type] nvarchar(50),
[Category] nvarchar(50),
[StartDate] datetime,
[EndDate] datetime,
[MinQty] int,
[MaxQty] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SpecialOffer
CREATE PROC [sp_upsert_dw_Sales_SpecialOffer]
(
@tvp [type_dw_Sales_SpecialOffer] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SpecialOffer AS target
USING (
SELECT ISNULL([SpecialOfferID], 0) AS [SpecialOfferID],
[Description] AS [Description],
[DiscountPct] AS [DiscountPct],
[Type] AS [Type],
[Category] AS [Category],
[StartDate] AS [StartDate],
[EndDate] AS [EndDate],
[MinQty] AS [MinQty],
[MaxQty] AS [MaxQty],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[SpecialOfferID] = source.[SpecialOfferID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Description] = source.[Description],
target.[DiscountPct] = source.[DiscountPct],
target.[Type] = source.[Type],
target.[Category] = source.[Category],
target.[StartDate] = source.[StartDate],
target.[EndDate] = source.[EndDate],
target.[MinQty] = source.[MinQty],
target.[MaxQty] = source.[MaxQty],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SpecialOfferID],
[Description],
[DiscountPct],
[Type],
[Category],
[StartDate],
[EndDate],
[MinQty],
[MaxQty],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[SpecialOfferID],
source.[Description],
source.[DiscountPct],
source.[Type],
source.[Category],
source.[StartDate],
source.[EndDate],
source.[MinQty],
source.[MaxQty],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_dbo_ErrorLog //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_dbo_ErrorLog];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_dbo_ErrorLog];
GO
DROP TYPE IF EXISTS [type_dw_dbo_ErrorLog];
GO
-- TABLE TYPE: type_dw_dbo_ErrorLog
CREATE TYPE [type_dw_dbo_ErrorLog] AS TABLE(
[ErrorLogID] int,
[ErrorTime] datetime,
[UserName] nvarchar(128),
[ErrorNumber] int,
[ErrorSeverity] int,
[ErrorState] int,
[ErrorProcedure] nvarchar(126),
[ErrorLine] int,
[ErrorMessage] nvarchar(4000)
);
GO
-- PROCEDURE: sp_upsert_dw_dbo_ErrorLog
CREATE PROC [sp_upsert_dw_dbo_ErrorLog]
(
@tvp [type_dw_dbo_ErrorLog] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_dbo_ErrorLog AS target
USING (
SELECT ISNULL([ErrorLogID], 0) AS [ErrorLogID],
[ErrorTime] AS [ErrorTime],
[UserName] AS [UserName],
[ErrorNumber] AS [ErrorNumber],
[ErrorSeverity] AS [ErrorSeverity],
[ErrorState] AS [ErrorState],
[ErrorProcedure] AS [ErrorProcedure],
[ErrorLine] AS [ErrorLine],
[ErrorMessage] AS [ErrorMessage],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ErrorLogID] = source.[ErrorLogID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ErrorTime] = source.[ErrorTime],
target.[UserName] = source.[UserName],
target.[ErrorNumber] = source.[ErrorNumber],
target.[ErrorSeverity] = source.[ErrorSeverity],
target.[ErrorState] = source.[ErrorState],
target.[ErrorProcedure] = source.[ErrorProcedure],
target.[ErrorLine] = source.[ErrorLine],
target.[ErrorMessage] = source.[ErrorMessage],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ErrorLogID],
[ErrorTime],
[UserName],
[ErrorNumber],
[ErrorSeverity],
[ErrorState],
[ErrorProcedure],
[ErrorLine],
[ErrorMessage],
[_LogID],
[_LogID_List]
)
VALUES (source.[ErrorLogID],
source.[ErrorTime],
source.[UserName],
source.[ErrorNumber],
source.[ErrorSeverity],
source.[ErrorState],
source.[ErrorProcedure],
source.[ErrorLine],
source.[ErrorMessage],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductListPriceHistory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductListPriceHistory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductListPriceHistory];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductListPriceHistory];
GO
-- TABLE TYPE: type_dw_Production_ProductListPriceHistory
CREATE TYPE [type_dw_Production_ProductListPriceHistory] AS TABLE(
[ProductID] int,
[StartDate] datetime,
[EndDate] datetime,
[ListPrice] money,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductListPriceHistory
CREATE PROC [sp_upsert_dw_Production_ProductListPriceHistory]
(
@tvp [type_dw_Production_ProductListPriceHistory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductListPriceHistory AS target
USING (
SELECT ISNULL([ProductID], 0) AS [ProductID],
ISNULL([StartDate], '9999-12-31') AS [StartDate],
[EndDate] AS [EndDate],
[ListPrice] AS [ListPrice],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductID] = source.[ProductID]
AND target.[StartDate] = source.[StartDate]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[EndDate] = source.[EndDate],
target.[ListPrice] = source.[ListPrice],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductID],
[StartDate],
[EndDate],
[ListPrice],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductID],
source.[StartDate],
source.[EndDate],
source.[ListPrice],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SpecialOfferProduct //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SpecialOfferProduct];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SpecialOfferProduct];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SpecialOfferProduct];
GO
-- TABLE TYPE: type_dw_Sales_SpecialOfferProduct
CREATE TYPE [type_dw_Sales_SpecialOfferProduct] AS TABLE(
[SpecialOfferID] int,
[ProductID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SpecialOfferProduct
CREATE PROC [sp_upsert_dw_Sales_SpecialOfferProduct]
(
@tvp [type_dw_Sales_SpecialOfferProduct] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SpecialOfferProduct AS target
USING (
SELECT ISNULL([SpecialOfferID], 0) AS [SpecialOfferID],
ISNULL([ProductID], 0) AS [ProductID],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[SpecialOfferID] = source.[SpecialOfferID]
AND target.[ProductID] = source.[ProductID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SpecialOfferID],
[ProductID],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[SpecialOfferID],
source.[ProductID],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductModel //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductModel];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductModel];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductModel];
GO
-- TABLE TYPE: type_dw_Production_ProductModel
CREATE TYPE [type_dw_Production_ProductModel] AS TABLE(
[ProductModelID] int,
[Name] nvarchar(50),
[CatalogDescription] xml,
[Instructions] xml,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductModel
CREATE PROC [sp_upsert_dw_Production_ProductModel]
(
@tvp [type_dw_Production_ProductModel] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductModel AS target
USING (
SELECT ISNULL([ProductModelID], 0) AS [ProductModelID],
[Name] AS [Name],
[CatalogDescription] AS [CatalogDescription],
[Instructions] AS [Instructions],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductModelID] = source.[ProductModelID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[CatalogDescription] = source.[CatalogDescription],
target.[Instructions] = source.[Instructions],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductModelID],
[Name],
[CatalogDescription],
[Instructions],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductModelID],
source.[Name],
source.[CatalogDescription],
source.[Instructions],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_StateProvince //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_StateProvince];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_StateProvince];
GO
DROP TYPE IF EXISTS [type_dw_Person_StateProvince];
GO
-- TABLE TYPE: type_dw_Person_StateProvince
CREATE TYPE [type_dw_Person_StateProvince] AS TABLE(
[StateProvinceID] int,
[StateProvinceCode] nchar(3),
[CountryRegionCode] nvarchar(3),
[IsOnlyStateProvinceFlag] bit,
[Name] nvarchar(50),
[TerritoryID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_StateProvince
CREATE PROC [sp_upsert_dw_Person_StateProvince]
(
@tvp [type_dw_Person_StateProvince] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_StateProvince AS target
USING (
SELECT ISNULL([StateProvinceID], 0) AS [StateProvinceID],
[StateProvinceCode] AS [StateProvinceCode],
[CountryRegionCode] AS [CountryRegionCode],
[IsOnlyStateProvinceFlag] AS [IsOnlyStateProvinceFlag],
[Name] AS [Name],
[TerritoryID] AS [TerritoryID],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[StateProvinceID] = source.[StateProvinceID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[StateProvinceCode] = source.[StateProvinceCode],
target.[CountryRegionCode] = source.[CountryRegionCode],
target.[IsOnlyStateProvinceFlag] = source.[IsOnlyStateProvinceFlag],
target.[Name] = source.[Name],
target.[TerritoryID] = source.[TerritoryID],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([StateProvinceID],
[StateProvinceCode],
[CountryRegionCode],
[IsOnlyStateProvinceFlag],
[Name],
[TerritoryID],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[StateProvinceID],
source.[StateProvinceCode],
source.[CountryRegionCode],
source.[IsOnlyStateProvinceFlag],
source.[Name],
source.[TerritoryID],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductModelIllustration //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductModelIllustration];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductModelIllustration];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductModelIllustration];
GO
-- TABLE TYPE: type_dw_Production_ProductModelIllustration
CREATE TYPE [type_dw_Production_ProductModelIllustration] AS TABLE(
[ProductModelID] int,
[IllustrationID] int,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductModelIllustration
CREATE PROC [sp_upsert_dw_Production_ProductModelIllustration]
(
@tvp [type_dw_Production_ProductModelIllustration] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductModelIllustration AS target
USING (
SELECT ISNULL([ProductModelID], 0) AS [ProductModelID],
ISNULL([IllustrationID], 0) AS [IllustrationID],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductModelID] = source.[ProductModelID]
AND target.[IllustrationID] = source.[IllustrationID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductModelID],
[IllustrationID],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductModelID],
source.[IllustrationID],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_dbo_AWBuildVersion //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_dbo_AWBuildVersion];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_dbo_AWBuildVersion];
GO
DROP TYPE IF EXISTS [type_dw_dbo_AWBuildVersion];
GO
-- TABLE TYPE: type_dw_dbo_AWBuildVersion
CREATE TYPE [type_dw_dbo_AWBuildVersion] AS TABLE(
[SystemInformationID] tinyint,
[DatabaseVersion] nvarchar(25),
[VersionDate] datetime,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_dbo_AWBuildVersion
CREATE PROC [sp_upsert_dw_dbo_AWBuildVersion]
(
@tvp [type_dw_dbo_AWBuildVersion] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_dbo_AWBuildVersion AS target
USING (
SELECT ISNULL([SystemInformationID], 0) AS [SystemInformationID],
[DatabaseVersion] AS [DatabaseVersion],
[VersionDate] AS [VersionDate],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[SystemInformationID] = source.[SystemInformationID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[DatabaseVersion] = source.[DatabaseVersion],
target.[VersionDate] = source.[VersionDate],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SystemInformationID],
[DatabaseVersion],
[VersionDate],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[SystemInformationID],
source.[DatabaseVersion],
source.[VersionDate],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductModelProductDescriptionCulture //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductModelProductDescriptionCulture];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductModelProductDescriptionCulture];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductModelProductDescriptionCulture];
GO
-- TABLE TYPE: type_dw_Production_ProductModelProductDescriptionCulture
CREATE TYPE [type_dw_Production_ProductModelProductDescriptionCulture] AS TABLE(
[ProductModelID] int,
[ProductDescriptionID] int,
[CultureID] nchar(6),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductModelProductDescriptionCulture
CREATE PROC [sp_upsert_dw_Production_ProductModelProductDescriptionCulture]
(
@tvp [type_dw_Production_ProductModelProductDescriptionCulture] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductModelProductDescriptionCulture AS target
USING (
SELECT ISNULL([ProductModelID], 0) AS [ProductModelID],
ISNULL([ProductDescriptionID], 0) AS [ProductDescriptionID],
ISNULL([CultureID], '') AS [CultureID],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductModelID] = source.[ProductModelID]
AND target.[ProductDescriptionID] = source.[ProductDescriptionID]
AND target.[CultureID] = source.[CultureID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductModelID],
[ProductDescriptionID],
[CultureID],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductModelID],
source.[ProductDescriptionID],
source.[CultureID],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_BillOfMaterials //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_BillOfMaterials];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_BillOfMaterials];
GO
DROP TYPE IF EXISTS [type_dw_Production_BillOfMaterials];
GO
-- TABLE TYPE: type_dw_Production_BillOfMaterials
CREATE TYPE [type_dw_Production_BillOfMaterials] AS TABLE(
[BillOfMaterialsID] int,
[ProductAssemblyID] int,
[ComponentID] int,
[StartDate] datetime,
[EndDate] datetime,
[UnitMeasureCode] nchar(3),
[BOMLevel] smallint,
[PerAssemblyQty] decimal(8,2),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_BillOfMaterials
CREATE PROC [sp_upsert_dw_Production_BillOfMaterials]
(
@tvp [type_dw_Production_BillOfMaterials] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_BillOfMaterials AS target
USING (
SELECT ISNULL([BillOfMaterialsID], 0) AS [BillOfMaterialsID],
[ProductAssemblyID] AS [ProductAssemblyID],
[ComponentID] AS [ComponentID],
[StartDate] AS [StartDate],
[EndDate] AS [EndDate],
[UnitMeasureCode] AS [UnitMeasureCode],
[BOMLevel] AS [BOMLevel],
[PerAssemblyQty] AS [PerAssemblyQty],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BillOfMaterialsID] = source.[BillOfMaterialsID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ProductAssemblyID] = source.[ProductAssemblyID],
target.[ComponentID] = source.[ComponentID],
target.[StartDate] = source.[StartDate],
target.[EndDate] = source.[EndDate],
target.[UnitMeasureCode] = source.[UnitMeasureCode],
target.[BOMLevel] = source.[BOMLevel],
target.[PerAssemblyQty] = source.[PerAssemblyQty],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BillOfMaterialsID],
[ProductAssemblyID],
[ComponentID],
[StartDate],
[EndDate],
[UnitMeasureCode],
[BOMLevel],
[PerAssemblyQty],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BillOfMaterialsID],
source.[ProductAssemblyID],
source.[ComponentID],
source.[StartDate],
source.[EndDate],
source.[UnitMeasureCode],
source.[BOMLevel],
source.[PerAssemblyQty],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_Store //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_Store];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_Store];
GO
DROP TYPE IF EXISTS [type_dw_Sales_Store];
GO
-- TABLE TYPE: type_dw_Sales_Store
CREATE TYPE [type_dw_Sales_Store] AS TABLE(
[BusinessEntityID] int,
[Name] nvarchar(50),
[SalesPersonID] int,
[Demographics] xml,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_Store
CREATE PROC [sp_upsert_dw_Sales_Store]
(
@tvp [type_dw_Sales_Store] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_Store AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
[Name] AS [Name],
[SalesPersonID] AS [SalesPersonID],
[Demographics] AS [Demographics],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[SalesPersonID] = source.[SalesPersonID],
target.[Demographics] = source.[Demographics],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[Name],
[SalesPersonID],
[Demographics],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[Name],
source.[SalesPersonID],
source.[Demographics],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductPhoto //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductPhoto];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductPhoto];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductPhoto];
GO
-- TABLE TYPE: type_dw_Production_ProductPhoto
CREATE TYPE [type_dw_Production_ProductPhoto] AS TABLE(
[ProductPhotoID] int,
[ThumbNailPhoto] varbinary(max),
[ThumbnailPhotoFileName] nvarchar(50),
[LargePhoto] varbinary(max),
[LargePhotoFileName] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductPhoto
CREATE PROC [sp_upsert_dw_Production_ProductPhoto]
(
@tvp [type_dw_Production_ProductPhoto] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductPhoto AS target
USING (
SELECT ISNULL([ProductPhotoID], 0) AS [ProductPhotoID],
[ThumbNailPhoto] AS [ThumbNailPhoto],
[ThumbnailPhotoFileName] AS [ThumbnailPhotoFileName],
[LargePhoto] AS [LargePhoto],
[LargePhotoFileName] AS [LargePhotoFileName],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductPhotoID] = source.[ProductPhotoID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ThumbNailPhoto] = source.[ThumbNailPhoto],
target.[ThumbnailPhotoFileName] = source.[ThumbnailPhotoFileName],
target.[LargePhoto] = source.[LargePhoto],
target.[LargePhotoFileName] = source.[LargePhotoFileName],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductPhotoID],
[ThumbNailPhoto],
[ThumbnailPhotoFileName],
[LargePhoto],
[LargePhotoFileName],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductPhotoID],
source.[ThumbNailPhoto],
source.[ThumbnailPhotoFileName],
source.[LargePhoto],
source.[LargePhotoFileName],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductProductPhoto //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductProductPhoto];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductProductPhoto];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductProductPhoto];
GO
-- TABLE TYPE: type_dw_Production_ProductProductPhoto
CREATE TYPE [type_dw_Production_ProductProductPhoto] AS TABLE(
[ProductID] int,
[ProductPhotoID] int,
[Primary] bit,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductProductPhoto
CREATE PROC [sp_upsert_dw_Production_ProductProductPhoto]
(
@tvp [type_dw_Production_ProductProductPhoto] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductProductPhoto AS target
USING (
SELECT ISNULL([ProductID], 0) AS [ProductID],
ISNULL([ProductPhotoID], 0) AS [ProductPhotoID],
[Primary] AS [Primary],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductID] = source.[ProductID]
AND target.[ProductPhotoID] = source.[ProductPhotoID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Primary] = source.[Primary],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductID],
[ProductPhotoID],
[Primary],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductID],
source.[ProductPhotoID],
source.[Primary],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_TransactionHistory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_TransactionHistory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_TransactionHistory];
GO
DROP TYPE IF EXISTS [type_dw_Production_TransactionHistory];
GO
-- TABLE TYPE: type_dw_Production_TransactionHistory
CREATE TYPE [type_dw_Production_TransactionHistory] AS TABLE(
[TransactionID] int,
[ProductID] int,
[ReferenceOrderID] int,
[ReferenceOrderLineID] int,
[TransactionDate] datetime,
[TransactionType] nchar(1),
[Quantity] int,
[ActualCost] money,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_TransactionHistory
CREATE PROC [sp_upsert_dw_Production_TransactionHistory]
(
@tvp [type_dw_Production_TransactionHistory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_TransactionHistory AS target
USING (
SELECT ISNULL([TransactionID], 0) AS [TransactionID],
[ProductID] AS [ProductID],
[ReferenceOrderID] AS [ReferenceOrderID],
[ReferenceOrderLineID] AS [ReferenceOrderLineID],
[TransactionDate] AS [TransactionDate],
[TransactionType] AS [TransactionType],
[Quantity] AS [Quantity],
[ActualCost] AS [ActualCost],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[TransactionID] = source.[TransactionID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ProductID] = source.[ProductID],
target.[ReferenceOrderID] = source.[ReferenceOrderID],
target.[ReferenceOrderLineID] = source.[ReferenceOrderLineID],
target.[TransactionDate] = source.[TransactionDate],
target.[TransactionType] = source.[TransactionType],
target.[Quantity] = source.[Quantity],
target.[ActualCost] = source.[ActualCost],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([TransactionID],
[ProductID],
[ReferenceOrderID],
[ReferenceOrderLineID],
[TransactionDate],
[TransactionType],
[Quantity],
[ActualCost],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[TransactionID],
source.[ProductID],
source.[ReferenceOrderID],
source.[ReferenceOrderLineID],
source.[TransactionDate],
source.[TransactionType],
source.[Quantity],
source.[ActualCost],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductReview //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductReview];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductReview];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductReview];
GO
-- TABLE TYPE: type_dw_Production_ProductReview
CREATE TYPE [type_dw_Production_ProductReview] AS TABLE(
[ProductReviewID] int,
[ProductID] int,
[ReviewerName] nvarchar(50),
[ReviewDate] datetime,
[EmailAddress] nvarchar(50),
[Rating] int,
[Comments] nvarchar(3850),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductReview
CREATE PROC [sp_upsert_dw_Production_ProductReview]
(
@tvp [type_dw_Production_ProductReview] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductReview AS target
USING (
SELECT ISNULL([ProductReviewID], 0) AS [ProductReviewID],
[ProductID] AS [ProductID],
[ReviewerName] AS [ReviewerName],
[ReviewDate] AS [ReviewDate],
[EmailAddress] AS [EmailAddress],
[Rating] AS [Rating],
[Comments] AS [Comments],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductReviewID] = source.[ProductReviewID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ProductID] = source.[ProductID],
target.[ReviewerName] = source.[ReviewerName],
target.[ReviewDate] = source.[ReviewDate],
target.[EmailAddress] = source.[EmailAddress],
target.[Rating] = source.[Rating],
target.[Comments] = source.[Comments],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductReviewID],
[ProductID],
[ReviewerName],
[ReviewDate],
[EmailAddress],
[Rating],
[Comments],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductReviewID],
source.[ProductID],
source.[ReviewerName],
source.[ReviewDate],
source.[EmailAddress],
source.[Rating],
source.[Comments],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_BusinessEntity //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_BusinessEntity];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_BusinessEntity];
GO
DROP TYPE IF EXISTS [type_dw_Person_BusinessEntity];
GO
-- TABLE TYPE: type_dw_Person_BusinessEntity
CREATE TYPE [type_dw_Person_BusinessEntity] AS TABLE(
[BusinessEntityID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_BusinessEntity
CREATE PROC [sp_upsert_dw_Person_BusinessEntity]
(
@tvp [type_dw_Person_BusinessEntity] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_BusinessEntity AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_TransactionHistoryArchive //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_TransactionHistoryArchive];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_TransactionHistoryArchive];
GO
DROP TYPE IF EXISTS [type_dw_Production_TransactionHistoryArchive];
GO
-- TABLE TYPE: type_dw_Production_TransactionHistoryArchive
CREATE TYPE [type_dw_Production_TransactionHistoryArchive] AS TABLE(
[TransactionID] int,
[ProductID] int,
[ReferenceOrderID] int,
[ReferenceOrderLineID] int,
[TransactionDate] datetime,
[TransactionType] nchar(1),
[Quantity] int,
[ActualCost] money,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_TransactionHistoryArchive
CREATE PROC [sp_upsert_dw_Production_TransactionHistoryArchive]
(
@tvp [type_dw_Production_TransactionHistoryArchive] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_TransactionHistoryArchive AS target
USING (
SELECT ISNULL([TransactionID], 0) AS [TransactionID],
[ProductID] AS [ProductID],
[ReferenceOrderID] AS [ReferenceOrderID],
[ReferenceOrderLineID] AS [ReferenceOrderLineID],
[TransactionDate] AS [TransactionDate],
[TransactionType] AS [TransactionType],
[Quantity] AS [Quantity],
[ActualCost] AS [ActualCost],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[TransactionID] = source.[TransactionID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ProductID] = source.[ProductID],
target.[ReferenceOrderID] = source.[ReferenceOrderID],
target.[ReferenceOrderLineID] = source.[ReferenceOrderLineID],
target.[TransactionDate] = source.[TransactionDate],
target.[TransactionType] = source.[TransactionType],
target.[Quantity] = source.[Quantity],
target.[ActualCost] = source.[ActualCost],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([TransactionID],
[ProductID],
[ReferenceOrderID],
[ReferenceOrderLineID],
[TransactionDate],
[TransactionType],
[Quantity],
[ActualCost],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[TransactionID],
source.[ProductID],
source.[ReferenceOrderID],
source.[ReferenceOrderLineID],
source.[TransactionDate],
source.[TransactionType],
source.[Quantity],
source.[ActualCost],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_ProductSubcategory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_ProductSubcategory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_ProductSubcategory];
GO
DROP TYPE IF EXISTS [type_dw_Production_ProductSubcategory];
GO
-- TABLE TYPE: type_dw_Production_ProductSubcategory
CREATE TYPE [type_dw_Production_ProductSubcategory] AS TABLE(
[ProductSubcategoryID] int,
[ProductCategoryID] int,
[Name] nvarchar(50),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_ProductSubcategory
CREATE PROC [sp_upsert_dw_Production_ProductSubcategory]
(
@tvp [type_dw_Production_ProductSubcategory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_ProductSubcategory AS target
USING (
SELECT ISNULL([ProductSubcategoryID], 0) AS [ProductSubcategoryID],
[ProductCategoryID] AS [ProductCategoryID],
[Name] AS [Name],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductSubcategoryID] = source.[ProductSubcategoryID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ProductCategoryID] = source.[ProductCategoryID],
target.[Name] = source.[Name],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductSubcategoryID],
[ProductCategoryID],
[Name],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductSubcategoryID],
source.[ProductCategoryID],
source.[Name],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_BusinessEntityAddress //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_BusinessEntityAddress];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_BusinessEntityAddress];
GO
DROP TYPE IF EXISTS [type_dw_Person_BusinessEntityAddress];
GO
-- TABLE TYPE: type_dw_Person_BusinessEntityAddress
CREATE TYPE [type_dw_Person_BusinessEntityAddress] AS TABLE(
[BusinessEntityID] int,
[AddressID] int,
[AddressTypeID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_BusinessEntityAddress
CREATE PROC [sp_upsert_dw_Person_BusinessEntityAddress]
(
@tvp [type_dw_Person_BusinessEntityAddress] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_BusinessEntityAddress AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
ISNULL([AddressID], 0) AS [AddressID],
ISNULL([AddressTypeID], 0) AS [AddressTypeID],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
AND target.[AddressID] = source.[AddressID]
AND target.[AddressTypeID] = source.[AddressTypeID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[AddressID],
[AddressTypeID],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[AddressID],
source.[AddressTypeID],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Purchasing_ProductVendor //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Purchasing_ProductVendor];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Purchasing_ProductVendor];
GO
DROP TYPE IF EXISTS [type_dw_Purchasing_ProductVendor];
GO
-- TABLE TYPE: type_dw_Purchasing_ProductVendor
CREATE TYPE [type_dw_Purchasing_ProductVendor] AS TABLE(
[ProductID] int,
[BusinessEntityID] int,
[AverageLeadTime] int,
[StandardPrice] money,
[LastReceiptCost] money,
[LastReceiptDate] datetime,
[MinOrderQty] int,
[MaxOrderQty] int,
[OnOrderQty] int,
[UnitMeasureCode] nchar(3),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Purchasing_ProductVendor
CREATE PROC [sp_upsert_dw_Purchasing_ProductVendor]
(
@tvp [type_dw_Purchasing_ProductVendor] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Purchasing_ProductVendor AS target
USING (
SELECT ISNULL([ProductID], 0) AS [ProductID],
ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
[AverageLeadTime] AS [AverageLeadTime],
[StandardPrice] AS [StandardPrice],
[LastReceiptCost] AS [LastReceiptCost],
[LastReceiptDate] AS [LastReceiptDate],
[MinOrderQty] AS [MinOrderQty],
[MaxOrderQty] AS [MaxOrderQty],
[OnOrderQty] AS [OnOrderQty],
[UnitMeasureCode] AS [UnitMeasureCode],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductID] = source.[ProductID]
AND target.[BusinessEntityID] = source.[BusinessEntityID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[AverageLeadTime] = source.[AverageLeadTime],
target.[StandardPrice] = source.[StandardPrice],
target.[LastReceiptCost] = source.[LastReceiptCost],
target.[LastReceiptDate] = source.[LastReceiptDate],
target.[MinOrderQty] = source.[MinOrderQty],
target.[MaxOrderQty] = source.[MaxOrderQty],
target.[OnOrderQty] = source.[OnOrderQty],
target.[UnitMeasureCode] = source.[UnitMeasureCode],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductID],
[BusinessEntityID],
[AverageLeadTime],
[StandardPrice],
[LastReceiptCost],
[LastReceiptDate],
[MinOrderQty],
[MaxOrderQty],
[OnOrderQty],
[UnitMeasureCode],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductID],
source.[BusinessEntityID],
source.[AverageLeadTime],
source.[StandardPrice],
source.[LastReceiptCost],
source.[LastReceiptDate],
source.[MinOrderQty],
source.[MaxOrderQty],
source.[OnOrderQty],
source.[UnitMeasureCode],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_BusinessEntityContact //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_BusinessEntityContact];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_BusinessEntityContact];
GO
DROP TYPE IF EXISTS [type_dw_Person_BusinessEntityContact];
GO
-- TABLE TYPE: type_dw_Person_BusinessEntityContact
CREATE TYPE [type_dw_Person_BusinessEntityContact] AS TABLE(
[BusinessEntityID] int,
[PersonID] int,
[ContactTypeID] int,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_BusinessEntityContact
CREATE PROC [sp_upsert_dw_Person_BusinessEntityContact]
(
@tvp [type_dw_Person_BusinessEntityContact] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_BusinessEntityContact AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
ISNULL([PersonID], 0) AS [PersonID],
ISNULL([ContactTypeID], 0) AS [ContactTypeID],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
AND target.[PersonID] = source.[PersonID]
AND target.[ContactTypeID] = source.[ContactTypeID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[PersonID],
[ContactTypeID],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[PersonID],
source.[ContactTypeID],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_UnitMeasure //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_UnitMeasure];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_UnitMeasure];
GO
DROP TYPE IF EXISTS [type_dw_Production_UnitMeasure];
GO
-- TABLE TYPE: type_dw_Production_UnitMeasure
CREATE TYPE [type_dw_Production_UnitMeasure] AS TABLE(
[UnitMeasureCode] nchar(3),
[Name] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_UnitMeasure
CREATE PROC [sp_upsert_dw_Production_UnitMeasure]
(
@tvp [type_dw_Production_UnitMeasure] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_UnitMeasure AS target
USING (
SELECT ISNULL([UnitMeasureCode], '') AS [UnitMeasureCode],
[Name] AS [Name],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[UnitMeasureCode] = source.[UnitMeasureCode]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([UnitMeasureCode],
[Name],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[UnitMeasureCode],
source.[Name],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Purchasing_Vendor //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Purchasing_Vendor];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Purchasing_Vendor];
GO
DROP TYPE IF EXISTS [type_dw_Purchasing_Vendor];
GO
-- TABLE TYPE: type_dw_Purchasing_Vendor
CREATE TYPE [type_dw_Purchasing_Vendor] AS TABLE(
[BusinessEntityID] int,
[AccountNumber] nvarchar(15),
[Name] nvarchar(50),
[CreditRating] tinyint,
[PreferredVendorStatus] bit,
[ActiveFlag] bit,
[PurchasingWebServiceURL] nvarchar(1024),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Purchasing_Vendor
CREATE PROC [sp_upsert_dw_Purchasing_Vendor]
(
@tvp [type_dw_Purchasing_Vendor] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Purchasing_Vendor AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
[AccountNumber] AS [AccountNumber],
[Name] AS [Name],
[CreditRating] AS [CreditRating],
[PreferredVendorStatus] AS [PreferredVendorStatus],
[ActiveFlag] AS [ActiveFlag],
[PurchasingWebServiceURL] AS [PurchasingWebServiceURL],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[AccountNumber] = source.[AccountNumber],
target.[Name] = source.[Name],
target.[CreditRating] = source.[CreditRating],
target.[PreferredVendorStatus] = source.[PreferredVendorStatus],
target.[ActiveFlag] = source.[ActiveFlag],
target.[PurchasingWebServiceURL] = source.[PurchasingWebServiceURL],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[AccountNumber],
[Name],
[CreditRating],
[PreferredVendorStatus],
[ActiveFlag],
[PurchasingWebServiceURL],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[AccountNumber],
source.[Name],
source.[CreditRating],
source.[PreferredVendorStatus],
source.[ActiveFlag],
source.[PurchasingWebServiceURL],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_ContactType //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_ContactType];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_ContactType];
GO
DROP TYPE IF EXISTS [type_dw_Person_ContactType];
GO
-- TABLE TYPE: type_dw_Person_ContactType
CREATE TYPE [type_dw_Person_ContactType] AS TABLE(
[ContactTypeID] int,
[Name] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_ContactType
CREATE PROC [sp_upsert_dw_Person_ContactType]
(
@tvp [type_dw_Person_ContactType] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_ContactType AS target
USING (
SELECT ISNULL([ContactTypeID], 0) AS [ContactTypeID],
[Name] AS [Name],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ContactTypeID] = source.[ContactTypeID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ContactTypeID],
[Name],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ContactTypeID],
source.[Name],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_CountryRegionCurrency //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_CountryRegionCurrency];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_CountryRegionCurrency];
GO
DROP TYPE IF EXISTS [type_dw_Sales_CountryRegionCurrency];
GO
-- TABLE TYPE: type_dw_Sales_CountryRegionCurrency
CREATE TYPE [type_dw_Sales_CountryRegionCurrency] AS TABLE(
[CountryRegionCode] nvarchar(3),
[CurrencyCode] nchar(3),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_CountryRegionCurrency
CREATE PROC [sp_upsert_dw_Sales_CountryRegionCurrency]
(
@tvp [type_dw_Sales_CountryRegionCurrency] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_CountryRegionCurrency AS target
USING (
SELECT ISNULL([CountryRegionCode], '') AS [CountryRegionCode],
ISNULL([CurrencyCode], '') AS [CurrencyCode],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[CountryRegionCode] = source.[CountryRegionCode]
AND target.[CurrencyCode] = source.[CurrencyCode]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([CountryRegionCode],
[CurrencyCode],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[CountryRegionCode],
source.[CurrencyCode],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_CountryRegion //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_CountryRegion];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_CountryRegion];
GO
DROP TYPE IF EXISTS [type_dw_Person_CountryRegion];
GO
-- TABLE TYPE: type_dw_Person_CountryRegion
CREATE TYPE [type_dw_Person_CountryRegion] AS TABLE(
[CountryRegionCode] nvarchar(3),
[Name] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_CountryRegion
CREATE PROC [sp_upsert_dw_Person_CountryRegion]
(
@tvp [type_dw_Person_CountryRegion] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_CountryRegion AS target
USING (
SELECT ISNULL([CountryRegionCode], '') AS [CountryRegionCode],
[Name] AS [Name],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[CountryRegionCode] = source.[CountryRegionCode]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([CountryRegionCode],
[Name],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[CountryRegionCode],
source.[Name],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_WorkOrder //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_WorkOrder];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_WorkOrder];
GO
DROP TYPE IF EXISTS [type_dw_Production_WorkOrder];
GO
-- TABLE TYPE: type_dw_Production_WorkOrder
CREATE TYPE [type_dw_Production_WorkOrder] AS TABLE(
[WorkOrderID] int,
[ProductID] int,
[OrderQty] int,
[StockedQty] int,
[ScrappedQty] smallint,
[StartDate] datetime,
[EndDate] datetime,
[DueDate] datetime,
[ScrapReasonID] smallint,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_WorkOrder
CREATE PROC [sp_upsert_dw_Production_WorkOrder]
(
@tvp [type_dw_Production_WorkOrder] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_WorkOrder AS target
USING (
SELECT ISNULL([WorkOrderID], 0) AS [WorkOrderID],
[ProductID] AS [ProductID],
[OrderQty] AS [OrderQty],
[StockedQty] AS [StockedQty],
[ScrappedQty] AS [ScrappedQty],
[StartDate] AS [StartDate],
[EndDate] AS [EndDate],
[DueDate] AS [DueDate],
[ScrapReasonID] AS [ScrapReasonID],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[WorkOrderID] = source.[WorkOrderID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ProductID] = source.[ProductID],
target.[OrderQty] = source.[OrderQty],
target.[StockedQty] = source.[StockedQty],
target.[ScrappedQty] = source.[ScrappedQty],
target.[StartDate] = source.[StartDate],
target.[EndDate] = source.[EndDate],
target.[DueDate] = source.[DueDate],
target.[ScrapReasonID] = source.[ScrapReasonID],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([WorkOrderID],
[ProductID],
[OrderQty],
[StockedQty],
[ScrappedQty],
[StartDate],
[EndDate],
[DueDate],
[ScrapReasonID],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[WorkOrderID],
source.[ProductID],
source.[OrderQty],
source.[StockedQty],
source.[ScrappedQty],
source.[StartDate],
source.[EndDate],
source.[DueDate],
source.[ScrapReasonID],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Purchasing_PurchaseOrderDetail //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Purchasing_PurchaseOrderDetail];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Purchasing_PurchaseOrderDetail];
GO
DROP TYPE IF EXISTS [type_dw_Purchasing_PurchaseOrderDetail];
GO
-- TABLE TYPE: type_dw_Purchasing_PurchaseOrderDetail
CREATE TYPE [type_dw_Purchasing_PurchaseOrderDetail] AS TABLE(
[PurchaseOrderID] int,
[PurchaseOrderDetailID] int,
[DueDate] datetime,
[OrderQty] smallint,
[ProductID] int,
[UnitPrice] money,
[LineTotal] money,
[ReceivedQty] decimal(8,2),
[RejectedQty] decimal(8,2),
[StockedQty] decimal(9,2),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Purchasing_PurchaseOrderDetail
CREATE PROC [sp_upsert_dw_Purchasing_PurchaseOrderDetail]
(
@tvp [type_dw_Purchasing_PurchaseOrderDetail] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Purchasing_PurchaseOrderDetail AS target
USING (
SELECT ISNULL([PurchaseOrderID], 0) AS [PurchaseOrderID],
ISNULL([PurchaseOrderDetailID], 0) AS [PurchaseOrderDetailID],
[DueDate] AS [DueDate],
[OrderQty] AS [OrderQty],
[ProductID] AS [ProductID],
[UnitPrice] AS [UnitPrice],
[LineTotal] AS [LineTotal],
[ReceivedQty] AS [ReceivedQty],
[RejectedQty] AS [RejectedQty],
[StockedQty] AS [StockedQty],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[PurchaseOrderID] = source.[PurchaseOrderID]
AND target.[PurchaseOrderDetailID] = source.[PurchaseOrderDetailID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[DueDate] = source.[DueDate],
target.[OrderQty] = source.[OrderQty],
target.[ProductID] = source.[ProductID],
target.[UnitPrice] = source.[UnitPrice],
target.[LineTotal] = source.[LineTotal],
target.[ReceivedQty] = source.[ReceivedQty],
target.[RejectedQty] = source.[RejectedQty],
target.[StockedQty] = source.[StockedQty],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([PurchaseOrderID],
[PurchaseOrderDetailID],
[DueDate],
[OrderQty],
[ProductID],
[UnitPrice],
[LineTotal],
[ReceivedQty],
[RejectedQty],
[StockedQty],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[PurchaseOrderID],
source.[PurchaseOrderDetailID],
source.[DueDate],
source.[OrderQty],
source.[ProductID],
source.[UnitPrice],
source.[LineTotal],
source.[ReceivedQty],
source.[RejectedQty],
source.[StockedQty],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_CreditCard //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_CreditCard];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_CreditCard];
GO
DROP TYPE IF EXISTS [type_dw_Sales_CreditCard];
GO
-- TABLE TYPE: type_dw_Sales_CreditCard
CREATE TYPE [type_dw_Sales_CreditCard] AS TABLE(
[CreditCardID] int,
[CardType] nvarchar(50),
[CardNumber] nvarchar(25),
[ExpMonth] tinyint,
[ExpYear] smallint,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_CreditCard
CREATE PROC [sp_upsert_dw_Sales_CreditCard]
(
@tvp [type_dw_Sales_CreditCard] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_CreditCard AS target
USING (
SELECT ISNULL([CreditCardID], 0) AS [CreditCardID],
[CardType] AS [CardType],
[CardNumber] AS [CardNumber],
[ExpMonth] AS [ExpMonth],
[ExpYear] AS [ExpYear],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[CreditCardID] = source.[CreditCardID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[CardType] = source.[CardType],
target.[CardNumber] = source.[CardNumber],
target.[ExpMonth] = source.[ExpMonth],
target.[ExpYear] = source.[ExpYear],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([CreditCardID],
[CardType],
[CardNumber],
[ExpMonth],
[ExpYear],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[CreditCardID],
source.[CardType],
source.[CardNumber],
source.[ExpMonth],
source.[ExpYear],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_Culture //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_Culture];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_Culture];
GO
DROP TYPE IF EXISTS [type_dw_Production_Culture];
GO
-- TABLE TYPE: type_dw_Production_Culture
CREATE TYPE [type_dw_Production_Culture] AS TABLE(
[CultureID] nchar(6),
[Name] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_Culture
CREATE PROC [sp_upsert_dw_Production_Culture]
(
@tvp [type_dw_Production_Culture] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_Culture AS target
USING (
SELECT ISNULL([CultureID], '') AS [CultureID],
[Name] AS [Name],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[CultureID] = source.[CultureID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([CultureID],
[Name],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[CultureID],
source.[Name],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_WorkOrderRouting //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_WorkOrderRouting];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_WorkOrderRouting];
GO
DROP TYPE IF EXISTS [type_dw_Production_WorkOrderRouting];
GO
-- TABLE TYPE: type_dw_Production_WorkOrderRouting
CREATE TYPE [type_dw_Production_WorkOrderRouting] AS TABLE(
[WorkOrderID] int,
[ProductID] int,
[OperationSequence] smallint,
[LocationID] smallint,
[ScheduledStartDate] datetime,
[ScheduledEndDate] datetime,
[ActualStartDate] datetime,
[ActualEndDate] datetime,
[ActualResourceHrs] decimal(9,4),
[PlannedCost] money,
[ActualCost] money,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_WorkOrderRouting
CREATE PROC [sp_upsert_dw_Production_WorkOrderRouting]
(
@tvp [type_dw_Production_WorkOrderRouting] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_WorkOrderRouting AS target
USING (
SELECT ISNULL([WorkOrderID], 0) AS [WorkOrderID],
ISNULL([ProductID], 0) AS [ProductID],
ISNULL([OperationSequence], 0) AS [OperationSequence],
[LocationID] AS [LocationID],
[ScheduledStartDate] AS [ScheduledStartDate],
[ScheduledEndDate] AS [ScheduledEndDate],
[ActualStartDate] AS [ActualStartDate],
[ActualEndDate] AS [ActualEndDate],
[ActualResourceHrs] AS [ActualResourceHrs],
[PlannedCost] AS [PlannedCost],
[ActualCost] AS [ActualCost],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[WorkOrderID] = source.[WorkOrderID]
AND target.[ProductID] = source.[ProductID]
AND target.[OperationSequence] = source.[OperationSequence]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[LocationID] = source.[LocationID],
target.[ScheduledStartDate] = source.[ScheduledStartDate],
target.[ScheduledEndDate] = source.[ScheduledEndDate],
target.[ActualStartDate] = source.[ActualStartDate],
target.[ActualEndDate] = source.[ActualEndDate],
target.[ActualResourceHrs] = source.[ActualResourceHrs],
target.[PlannedCost] = source.[PlannedCost],
target.[ActualCost] = source.[ActualCost],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([WorkOrderID],
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
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[WorkOrderID],
source.[ProductID],
source.[OperationSequence],
source.[LocationID],
source.[ScheduledStartDate],
source.[ScheduledEndDate],
source.[ActualStartDate],
source.[ActualEndDate],
source.[ActualResourceHrs],
source.[PlannedCost],
source.[ActualCost],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_Currency //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_Currency];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_Currency];
GO
DROP TYPE IF EXISTS [type_dw_Sales_Currency];
GO
-- TABLE TYPE: type_dw_Sales_Currency
CREATE TYPE [type_dw_Sales_Currency] AS TABLE(
[CurrencyCode] nchar(3),
[Name] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_Currency
CREATE PROC [sp_upsert_dw_Sales_Currency]
(
@tvp [type_dw_Sales_Currency] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_Currency AS target
USING (
SELECT ISNULL([CurrencyCode], '') AS [CurrencyCode],
[Name] AS [Name],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[CurrencyCode] = source.[CurrencyCode]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([CurrencyCode],
[Name],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[CurrencyCode],
source.[Name],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Purchasing_PurchaseOrderHeader //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Purchasing_PurchaseOrderHeader];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Purchasing_PurchaseOrderHeader];
GO
DROP TYPE IF EXISTS [type_dw_Purchasing_PurchaseOrderHeader];
GO
-- TABLE TYPE: type_dw_Purchasing_PurchaseOrderHeader
CREATE TYPE [type_dw_Purchasing_PurchaseOrderHeader] AS TABLE(
[PurchaseOrderID] int,
[RevisionNumber] tinyint,
[Status] tinyint,
[EmployeeID] int,
[VendorID] int,
[ShipMethodID] int,
[OrderDate] datetime,
[ShipDate] datetime,
[SubTotal] money,
[TaxAmt] money,
[Freight] money,
[TotalDue] money,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Purchasing_PurchaseOrderHeader
CREATE PROC [sp_upsert_dw_Purchasing_PurchaseOrderHeader]
(
@tvp [type_dw_Purchasing_PurchaseOrderHeader] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Purchasing_PurchaseOrderHeader AS target
USING (
SELECT ISNULL([PurchaseOrderID], 0) AS [PurchaseOrderID],
[RevisionNumber] AS [RevisionNumber],
[Status] AS [Status],
[EmployeeID] AS [EmployeeID],
[VendorID] AS [VendorID],
[ShipMethodID] AS [ShipMethodID],
[OrderDate] AS [OrderDate],
[ShipDate] AS [ShipDate],
[SubTotal] AS [SubTotal],
[TaxAmt] AS [TaxAmt],
[Freight] AS [Freight],
[TotalDue] AS [TotalDue],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[PurchaseOrderID] = source.[PurchaseOrderID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[RevisionNumber] = source.[RevisionNumber],
target.[Status] = source.[Status],
target.[EmployeeID] = source.[EmployeeID],
target.[VendorID] = source.[VendorID],
target.[ShipMethodID] = source.[ShipMethodID],
target.[OrderDate] = source.[OrderDate],
target.[ShipDate] = source.[ShipDate],
target.[SubTotal] = source.[SubTotal],
target.[TaxAmt] = source.[TaxAmt],
target.[Freight] = source.[Freight],
target.[TotalDue] = source.[TotalDue],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([PurchaseOrderID],
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
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[PurchaseOrderID],
source.[RevisionNumber],
source.[Status],
source.[EmployeeID],
source.[VendorID],
source.[ShipMethodID],
source.[OrderDate],
source.[ShipDate],
source.[SubTotal],
source.[TaxAmt],
source.[Freight],
source.[TotalDue],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_CurrencyRate //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_CurrencyRate];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_CurrencyRate];
GO
DROP TYPE IF EXISTS [type_dw_Sales_CurrencyRate];
GO
-- TABLE TYPE: type_dw_Sales_CurrencyRate
CREATE TYPE [type_dw_Sales_CurrencyRate] AS TABLE(
[CurrencyRateID] int,
[CurrencyRateDate] datetime,
[FromCurrencyCode] nchar(3),
[ToCurrencyCode] nchar(3),
[AverageRate] money,
[EndOfDayRate] money,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_CurrencyRate
CREATE PROC [sp_upsert_dw_Sales_CurrencyRate]
(
@tvp [type_dw_Sales_CurrencyRate] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_CurrencyRate AS target
USING (
SELECT ISNULL([CurrencyRateID], 0) AS [CurrencyRateID],
[CurrencyRateDate] AS [CurrencyRateDate],
[FromCurrencyCode] AS [FromCurrencyCode],
[ToCurrencyCode] AS [ToCurrencyCode],
[AverageRate] AS [AverageRate],
[EndOfDayRate] AS [EndOfDayRate],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[CurrencyRateID] = source.[CurrencyRateID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[CurrencyRateDate] = source.[CurrencyRateDate],
target.[FromCurrencyCode] = source.[FromCurrencyCode],
target.[ToCurrencyCode] = source.[ToCurrencyCode],
target.[AverageRate] = source.[AverageRate],
target.[EndOfDayRate] = source.[EndOfDayRate],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([CurrencyRateID],
[CurrencyRateDate],
[FromCurrencyCode],
[ToCurrencyCode],
[AverageRate],
[EndOfDayRate],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[CurrencyRateID],
source.[CurrencyRateDate],
source.[FromCurrencyCode],
source.[ToCurrencyCode],
source.[AverageRate],
source.[EndOfDayRate],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_Customer //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_Customer];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_Customer];
GO
DROP TYPE IF EXISTS [type_dw_Sales_Customer];
GO
-- TABLE TYPE: type_dw_Sales_Customer
CREATE TYPE [type_dw_Sales_Customer] AS TABLE(
[CustomerID] int,
[PersonID] int,
[StoreID] int,
[TerritoryID] int,
[AccountNumber] varchar(10),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_Customer
CREATE PROC [sp_upsert_dw_Sales_Customer]
(
@tvp [type_dw_Sales_Customer] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_Customer AS target
USING (
SELECT ISNULL([CustomerID], 0) AS [CustomerID],
[PersonID] AS [PersonID],
[StoreID] AS [StoreID],
[TerritoryID] AS [TerritoryID],
[AccountNumber] AS [AccountNumber],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[CustomerID] = source.[CustomerID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[PersonID] = source.[PersonID],
target.[StoreID] = source.[StoreID],
target.[TerritoryID] = source.[TerritoryID],
target.[AccountNumber] = source.[AccountNumber],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([CustomerID],
[PersonID],
[StoreID],
[TerritoryID],
[AccountNumber],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[CustomerID],
source.[PersonID],
source.[StoreID],
source.[TerritoryID],
source.[AccountNumber],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_HumanResources_Department //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_HumanResources_Department];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_HumanResources_Department];
GO
DROP TYPE IF EXISTS [type_dw_HumanResources_Department];
GO
-- TABLE TYPE: type_dw_HumanResources_Department
CREATE TYPE [type_dw_HumanResources_Department] AS TABLE(
[DepartmentID] smallint,
[Name] nvarchar(50),
[GroupName] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_HumanResources_Department
CREATE PROC [sp_upsert_dw_HumanResources_Department]
(
@tvp [type_dw_HumanResources_Department] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_HumanResources_Department AS target
USING (
SELECT ISNULL([DepartmentID], 0) AS [DepartmentID],
[Name] AS [Name],
[GroupName] AS [GroupName],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[DepartmentID] = source.[DepartmentID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[GroupName] = source.[GroupName],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([DepartmentID],
[Name],
[GroupName],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[DepartmentID],
source.[Name],
source.[GroupName],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SalesOrderDetail //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SalesOrderDetail];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SalesOrderDetail];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SalesOrderDetail];
GO
-- TABLE TYPE: type_dw_Sales_SalesOrderDetail
CREATE TYPE [type_dw_Sales_SalesOrderDetail] AS TABLE(
[SalesOrderID] int,
[SalesOrderDetailID] int,
[CarrierTrackingNumber] nvarchar(25),
[OrderQty] smallint,
[ProductID] int,
[SpecialOfferID] int,
[UnitPrice] money,
[UnitPriceDiscount] money,
[LineTotal] numeric(38,6),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SalesOrderDetail
CREATE PROC [sp_upsert_dw_Sales_SalesOrderDetail]
(
@tvp [type_dw_Sales_SalesOrderDetail] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SalesOrderDetail AS target
USING (
SELECT ISNULL([SalesOrderID], 0) AS [SalesOrderID],
ISNULL([SalesOrderDetailID], 0) AS [SalesOrderDetailID],
[CarrierTrackingNumber] AS [CarrierTrackingNumber],
[OrderQty] AS [OrderQty],
[ProductID] AS [ProductID],
[SpecialOfferID] AS [SpecialOfferID],
[UnitPrice] AS [UnitPrice],
[UnitPriceDiscount] AS [UnitPriceDiscount],
[LineTotal] AS [LineTotal],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[SalesOrderID] = source.[SalesOrderID]
AND target.[SalesOrderDetailID] = source.[SalesOrderDetailID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[CarrierTrackingNumber] = source.[CarrierTrackingNumber],
target.[OrderQty] = source.[OrderQty],
target.[ProductID] = source.[ProductID],
target.[SpecialOfferID] = source.[SpecialOfferID],
target.[UnitPrice] = source.[UnitPrice],
target.[UnitPriceDiscount] = source.[UnitPriceDiscount],
target.[LineTotal] = source.[LineTotal],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SalesOrderID],
[SalesOrderDetailID],
[CarrierTrackingNumber],
[OrderQty],
[ProductID],
[SpecialOfferID],
[UnitPrice],
[UnitPriceDiscount],
[LineTotal],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[SalesOrderID],
source.[SalesOrderDetailID],
source.[CarrierTrackingNumber],
source.[OrderQty],
source.[ProductID],
source.[SpecialOfferID],
source.[UnitPrice],
source.[UnitPriceDiscount],
source.[LineTotal],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_EmailAddress //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_EmailAddress];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_EmailAddress];
GO
DROP TYPE IF EXISTS [type_dw_Person_EmailAddress];
GO
-- TABLE TYPE: type_dw_Person_EmailAddress
CREATE TYPE [type_dw_Person_EmailAddress] AS TABLE(
[BusinessEntityID] int,
[EmailAddressID] int,
[EmailAddress] nvarchar(50),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_EmailAddress
CREATE PROC [sp_upsert_dw_Person_EmailAddress]
(
@tvp [type_dw_Person_EmailAddress] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_EmailAddress AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
ISNULL([EmailAddressID], 0) AS [EmailAddressID],
[EmailAddress] AS [EmailAddress],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
AND target.[EmailAddressID] = source.[EmailAddressID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[EmailAddress] = source.[EmailAddress],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[EmailAddressID],
[EmailAddress],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[EmailAddressID],
source.[EmailAddress],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_HumanResources_Employee //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_HumanResources_Employee];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_HumanResources_Employee];
GO
DROP TYPE IF EXISTS [type_dw_HumanResources_Employee];
GO
-- TABLE TYPE: type_dw_HumanResources_Employee
CREATE TYPE [type_dw_HumanResources_Employee] AS TABLE(
[BusinessEntityID] int,
[NationalIDNumber] nvarchar(15),
[LoginID] nvarchar(256),
[OrganizationNode] nvarchar(1000),
[OrganizationLevel] smallint,
[JobTitle] nvarchar(50),
[BirthDate] date,
[MaritalStatus] nchar(1),
[Gender] nchar(1),
[HireDate] date,
[SalariedFlag] bit,
[VacationHours] smallint,
[SickLeaveHours] smallint,
[CurrentFlag] bit,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_HumanResources_Employee
CREATE PROC [sp_upsert_dw_HumanResources_Employee]
(
@tvp [type_dw_HumanResources_Employee] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_HumanResources_Employee AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
[NationalIDNumber] AS [NationalIDNumber],
[LoginID] AS [LoginID],
[OrganizationNode] AS [OrganizationNode],
[OrganizationLevel] AS [OrganizationLevel],
[JobTitle] AS [JobTitle],
[BirthDate] AS [BirthDate],
[MaritalStatus] AS [MaritalStatus],
[Gender] AS [Gender],
[HireDate] AS [HireDate],
[SalariedFlag] AS [SalariedFlag],
[VacationHours] AS [VacationHours],
[SickLeaveHours] AS [SickLeaveHours],
[CurrentFlag] AS [CurrentFlag],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[NationalIDNumber] = source.[NationalIDNumber],
target.[LoginID] = source.[LoginID],
target.[OrganizationNode] = source.[OrganizationNode],
target.[OrganizationLevel] = source.[OrganizationLevel],
target.[JobTitle] = source.[JobTitle],
target.[BirthDate] = source.[BirthDate],
target.[MaritalStatus] = source.[MaritalStatus],
target.[Gender] = source.[Gender],
target.[HireDate] = source.[HireDate],
target.[SalariedFlag] = source.[SalariedFlag],
target.[VacationHours] = source.[VacationHours],
target.[SickLeaveHours] = source.[SickLeaveHours],
target.[CurrentFlag] = source.[CurrentFlag],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[NationalIDNumber],
[LoginID],
[OrganizationNode],
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
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[NationalIDNumber],
source.[LoginID],
source.[OrganizationNode],
source.[OrganizationLevel],
source.[JobTitle],
source.[BirthDate],
source.[MaritalStatus],
source.[Gender],
source.[HireDate],
source.[SalariedFlag],
source.[VacationHours],
source.[SickLeaveHours],
source.[CurrentFlag],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SalesOrderHeader //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SalesOrderHeader];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SalesOrderHeader];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SalesOrderHeader];
GO
-- TABLE TYPE: type_dw_Sales_SalesOrderHeader
CREATE TYPE [type_dw_Sales_SalesOrderHeader] AS TABLE(
[SalesOrderID] int,
[RevisionNumber] tinyint,
[OrderDate] datetime,
[DueDate] datetime,
[ShipDate] datetime,
[Status] tinyint,
[OnlineOrderFlag] bit,
[SalesOrderNumber] nvarchar(25),
[PurchaseOrderNumber] nvarchar(25),
[AccountNumber] nvarchar(15),
[CustomerID] int,
[SalesPersonID] int,
[TerritoryID] int,
[BillToAddressID] int,
[ShipToAddressID] int,
[ShipMethodID] int,
[CreditCardID] int,
[CreditCardApprovalCode] varchar(15),
[CurrencyRateID] int,
[SubTotal] money,
[TaxAmt] money,
[Freight] money,
[TotalDue] money,
[Comment] nvarchar(128),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SalesOrderHeader
CREATE PROC [sp_upsert_dw_Sales_SalesOrderHeader]
(
@tvp [type_dw_Sales_SalesOrderHeader] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SalesOrderHeader AS target
USING (
SELECT ISNULL([SalesOrderID], 0) AS [SalesOrderID],
[RevisionNumber] AS [RevisionNumber],
[OrderDate] AS [OrderDate],
[DueDate] AS [DueDate],
[ShipDate] AS [ShipDate],
[Status] AS [Status],
[OnlineOrderFlag] AS [OnlineOrderFlag],
[SalesOrderNumber] AS [SalesOrderNumber],
[PurchaseOrderNumber] AS [PurchaseOrderNumber],
[AccountNumber] AS [AccountNumber],
[CustomerID] AS [CustomerID],
[SalesPersonID] AS [SalesPersonID],
[TerritoryID] AS [TerritoryID],
[BillToAddressID] AS [BillToAddressID],
[ShipToAddressID] AS [ShipToAddressID],
[ShipMethodID] AS [ShipMethodID],
[CreditCardID] AS [CreditCardID],
[CreditCardApprovalCode] AS [CreditCardApprovalCode],
[CurrencyRateID] AS [CurrencyRateID],
[SubTotal] AS [SubTotal],
[TaxAmt] AS [TaxAmt],
[Freight] AS [Freight],
[TotalDue] AS [TotalDue],
[Comment] AS [Comment],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[SalesOrderID] = source.[SalesOrderID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[RevisionNumber] = source.[RevisionNumber],
target.[OrderDate] = source.[OrderDate],
target.[DueDate] = source.[DueDate],
target.[ShipDate] = source.[ShipDate],
target.[Status] = source.[Status],
target.[OnlineOrderFlag] = source.[OnlineOrderFlag],
target.[SalesOrderNumber] = source.[SalesOrderNumber],
target.[PurchaseOrderNumber] = source.[PurchaseOrderNumber],
target.[AccountNumber] = source.[AccountNumber],
target.[CustomerID] = source.[CustomerID],
target.[SalesPersonID] = source.[SalesPersonID],
target.[TerritoryID] = source.[TerritoryID],
target.[BillToAddressID] = source.[BillToAddressID],
target.[ShipToAddressID] = source.[ShipToAddressID],
target.[ShipMethodID] = source.[ShipMethodID],
target.[CreditCardID] = source.[CreditCardID],
target.[CreditCardApprovalCode] = source.[CreditCardApprovalCode],
target.[CurrencyRateID] = source.[CurrencyRateID],
target.[SubTotal] = source.[SubTotal],
target.[TaxAmt] = source.[TaxAmt],
target.[Freight] = source.[Freight],
target.[TotalDue] = source.[TotalDue],
target.[Comment] = source.[Comment],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SalesOrderID],
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
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[SalesOrderID],
source.[RevisionNumber],
source.[OrderDate],
source.[DueDate],
source.[ShipDate],
source.[Status],
source.[OnlineOrderFlag],
source.[SalesOrderNumber],
source.[PurchaseOrderNumber],
source.[AccountNumber],
source.[CustomerID],
source.[SalesPersonID],
source.[TerritoryID],
source.[BillToAddressID],
source.[ShipToAddressID],
source.[ShipMethodID],
source.[CreditCardID],
source.[CreditCardApprovalCode],
source.[CurrencyRateID],
source.[SubTotal],
source.[TaxAmt],
source.[Freight],
source.[TotalDue],
source.[Comment],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_HumanResources_EmployeeDepartmentHistory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_HumanResources_EmployeeDepartmentHistory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_HumanResources_EmployeeDepartmentHistory];
GO
DROP TYPE IF EXISTS [type_dw_HumanResources_EmployeeDepartmentHistory];
GO
-- TABLE TYPE: type_dw_HumanResources_EmployeeDepartmentHistory
CREATE TYPE [type_dw_HumanResources_EmployeeDepartmentHistory] AS TABLE(
[BusinessEntityID] int,
[DepartmentID] smallint,
[ShiftID] tinyint,
[StartDate] date,
[EndDate] date,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_HumanResources_EmployeeDepartmentHistory
CREATE PROC [sp_upsert_dw_HumanResources_EmployeeDepartmentHistory]
(
@tvp [type_dw_HumanResources_EmployeeDepartmentHistory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_HumanResources_EmployeeDepartmentHistory AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
ISNULL([DepartmentID], 0) AS [DepartmentID],
ISNULL([ShiftID], 0) AS [ShiftID],
ISNULL([StartDate], '9999-12-31') AS [StartDate],
[EndDate] AS [EndDate],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
AND target.[DepartmentID] = source.[DepartmentID]
AND target.[ShiftID] = source.[ShiftID]
AND target.[StartDate] = source.[StartDate]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[EndDate] = source.[EndDate],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[DepartmentID],
[ShiftID],
[StartDate],
[EndDate],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[DepartmentID],
source.[ShiftID],
source.[StartDate],
source.[EndDate],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_HumanResources_EmployeePayHistory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_HumanResources_EmployeePayHistory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_HumanResources_EmployeePayHistory];
GO
DROP TYPE IF EXISTS [type_dw_HumanResources_EmployeePayHistory];
GO
-- TABLE TYPE: type_dw_HumanResources_EmployeePayHistory
CREATE TYPE [type_dw_HumanResources_EmployeePayHistory] AS TABLE(
[BusinessEntityID] int,
[RateChangeDate] datetime,
[Rate] money,
[PayFrequency] tinyint,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_HumanResources_EmployeePayHistory
CREATE PROC [sp_upsert_dw_HumanResources_EmployeePayHistory]
(
@tvp [type_dw_HumanResources_EmployeePayHistory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_HumanResources_EmployeePayHistory AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
ISNULL([RateChangeDate], '9999-12-31') AS [RateChangeDate],
[Rate] AS [Rate],
[PayFrequency] AS [PayFrequency],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
AND target.[RateChangeDate] = source.[RateChangeDate]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Rate] = source.[Rate],
target.[PayFrequency] = source.[PayFrequency],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[RateChangeDate],
[Rate],
[PayFrequency],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[RateChangeDate],
source.[Rate],
source.[PayFrequency],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SalesOrderHeaderSalesReason //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SalesOrderHeaderSalesReason];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SalesOrderHeaderSalesReason];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SalesOrderHeaderSalesReason];
GO
-- TABLE TYPE: type_dw_Sales_SalesOrderHeaderSalesReason
CREATE TYPE [type_dw_Sales_SalesOrderHeaderSalesReason] AS TABLE(
[SalesOrderID] int,
[SalesReasonID] int,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SalesOrderHeaderSalesReason
CREATE PROC [sp_upsert_dw_Sales_SalesOrderHeaderSalesReason]
(
@tvp [type_dw_Sales_SalesOrderHeaderSalesReason] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SalesOrderHeaderSalesReason AS target
USING (
SELECT ISNULL([SalesOrderID], 0) AS [SalesOrderID],
ISNULL([SalesReasonID], 0) AS [SalesReasonID],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[SalesOrderID] = source.[SalesOrderID]
AND target.[SalesReasonID] = source.[SalesReasonID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SalesOrderID],
[SalesReasonID],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[SalesOrderID],
source.[SalesReasonID],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SalesPerson //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SalesPerson];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SalesPerson];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SalesPerson];
GO
-- TABLE TYPE: type_dw_Sales_SalesPerson
CREATE TYPE [type_dw_Sales_SalesPerson] AS TABLE(
[BusinessEntityID] int,
[TerritoryID] int,
[SalesQuota] money,
[Bonus] money,
[CommissionPct] smallmoney,
[SalesYTD] money,
[SalesLastYear] money,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SalesPerson
CREATE PROC [sp_upsert_dw_Sales_SalesPerson]
(
@tvp [type_dw_Sales_SalesPerson] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SalesPerson AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
[TerritoryID] AS [TerritoryID],
[SalesQuota] AS [SalesQuota],
[Bonus] AS [Bonus],
[CommissionPct] AS [CommissionPct],
[SalesYTD] AS [SalesYTD],
[SalesLastYear] AS [SalesLastYear],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[TerritoryID] = source.[TerritoryID],
target.[SalesQuota] = source.[SalesQuota],
target.[Bonus] = source.[Bonus],
target.[CommissionPct] = source.[CommissionPct],
target.[SalesYTD] = source.[SalesYTD],
target.[SalesLastYear] = source.[SalesLastYear],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[TerritoryID],
[SalesQuota],
[Bonus],
[CommissionPct],
[SalesYTD],
[SalesLastYear],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[TerritoryID],
source.[SalesQuota],
source.[Bonus],
source.[CommissionPct],
source.[SalesYTD],
source.[SalesLastYear],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_Illustration //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_Illustration];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_Illustration];
GO
DROP TYPE IF EXISTS [type_dw_Production_Illustration];
GO
-- TABLE TYPE: type_dw_Production_Illustration
CREATE TYPE [type_dw_Production_Illustration] AS TABLE(
[IllustrationID] int,
[Diagram] xml,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_Illustration
CREATE PROC [sp_upsert_dw_Production_Illustration]
(
@tvp [type_dw_Production_Illustration] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_Illustration AS target
USING (
SELECT ISNULL([IllustrationID], 0) AS [IllustrationID],
[Diagram] AS [Diagram],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[IllustrationID] = source.[IllustrationID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Diagram] = source.[Diagram],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([IllustrationID],
[Diagram],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[IllustrationID],
source.[Diagram],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_HumanResources_JobCandidate //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_HumanResources_JobCandidate];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_HumanResources_JobCandidate];
GO
DROP TYPE IF EXISTS [type_dw_HumanResources_JobCandidate];
GO
-- TABLE TYPE: type_dw_HumanResources_JobCandidate
CREATE TYPE [type_dw_HumanResources_JobCandidate] AS TABLE(
[JobCandidateID] int,
[BusinessEntityID] int,
[Resume] xml,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_HumanResources_JobCandidate
CREATE PROC [sp_upsert_dw_HumanResources_JobCandidate]
(
@tvp [type_dw_HumanResources_JobCandidate] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_HumanResources_JobCandidate AS target
USING (
SELECT ISNULL([JobCandidateID], 0) AS [JobCandidateID],
[BusinessEntityID] AS [BusinessEntityID],
[Resume] AS [Resume],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[JobCandidateID] = source.[JobCandidateID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[BusinessEntityID] = source.[BusinessEntityID],
target.[Resume] = source.[Resume],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([JobCandidateID],
[BusinessEntityID],
[Resume],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[JobCandidateID],
source.[BusinessEntityID],
source.[Resume],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_Location //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_Location];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_Location];
GO
DROP TYPE IF EXISTS [type_dw_Production_Location];
GO
-- TABLE TYPE: type_dw_Production_Location
CREATE TYPE [type_dw_Production_Location] AS TABLE(
[LocationID] smallint,
[Name] nvarchar(50),
[CostRate] smallmoney,
[Availability] decimal(8,2),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_Location
CREATE PROC [sp_upsert_dw_Production_Location]
(
@tvp [type_dw_Production_Location] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_Location AS target
USING (
SELECT ISNULL([LocationID], 0) AS [LocationID],
[Name] AS [Name],
[CostRate] AS [CostRate],
[Availability] AS [Availability],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[LocationID] = source.[LocationID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[CostRate] = source.[CostRate],
target.[Availability] = source.[Availability],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([LocationID],
[Name],
[CostRate],
[Availability],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[LocationID],
source.[Name],
source.[CostRate],
source.[Availability],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_Password //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_Password];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_Password];
GO
DROP TYPE IF EXISTS [type_dw_Person_Password];
GO
-- TABLE TYPE: type_dw_Person_Password
CREATE TYPE [type_dw_Person_Password] AS TABLE(
[BusinessEntityID] int,
[PasswordHash] varchar(128),
[PasswordSalt] varchar(10),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_Password
CREATE PROC [sp_upsert_dw_Person_Password]
(
@tvp [type_dw_Person_Password] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_Password AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
[PasswordHash] AS [PasswordHash],
[PasswordSalt] AS [PasswordSalt],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[PasswordHash] = source.[PasswordHash],
target.[PasswordSalt] = source.[PasswordSalt],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[PasswordHash],
[PasswordSalt],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[PasswordHash],
source.[PasswordSalt],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SalesPersonQuotaHistory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SalesPersonQuotaHistory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SalesPersonQuotaHistory];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SalesPersonQuotaHistory];
GO
-- TABLE TYPE: type_dw_Sales_SalesPersonQuotaHistory
CREATE TYPE [type_dw_Sales_SalesPersonQuotaHistory] AS TABLE(
[BusinessEntityID] int,
[QuotaDate] datetime,
[SalesQuota] money,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SalesPersonQuotaHistory
CREATE PROC [sp_upsert_dw_Sales_SalesPersonQuotaHistory]
(
@tvp [type_dw_Sales_SalesPersonQuotaHistory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SalesPersonQuotaHistory AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
ISNULL([QuotaDate], '9999-12-31') AS [QuotaDate],
[SalesQuota] AS [SalesQuota],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
AND target.[QuotaDate] = source.[QuotaDate]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[SalesQuota] = source.[SalesQuota],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[QuotaDate],
[SalesQuota],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[QuotaDate],
source.[SalesQuota],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_Person //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_Person];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_Person];
GO
DROP TYPE IF EXISTS [type_dw_Person_Person];
GO
-- TABLE TYPE: type_dw_Person_Person
CREATE TYPE [type_dw_Person_Person] AS TABLE(
[BusinessEntityID] int,
[PersonType] nchar(2),
[NameStyle] bit,
[Title] nvarchar(8),
[FirstName] nvarchar(50),
[MiddleName] nvarchar(50),
[LastName] nvarchar(50),
[Suffix] nvarchar(10),
[EmailPromotion] int,
[AdditionalContactInfo] xml,
[Demographics] xml,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_Person
CREATE PROC [sp_upsert_dw_Person_Person]
(
@tvp [type_dw_Person_Person] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_Person AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
[PersonType] AS [PersonType],
[NameStyle] AS [NameStyle],
[Title] AS [Title],
[FirstName] AS [FirstName],
[MiddleName] AS [MiddleName],
[LastName] AS [LastName],
[Suffix] AS [Suffix],
[EmailPromotion] AS [EmailPromotion],
[AdditionalContactInfo] AS [AdditionalContactInfo],
[Demographics] AS [Demographics],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[PersonType] = source.[PersonType],
target.[NameStyle] = source.[NameStyle],
target.[Title] = source.[Title],
target.[FirstName] = source.[FirstName],
target.[MiddleName] = source.[MiddleName],
target.[LastName] = source.[LastName],
target.[Suffix] = source.[Suffix],
target.[EmailPromotion] = source.[EmailPromotion],
target.[AdditionalContactInfo] = source.[AdditionalContactInfo],
target.[Demographics] = source.[Demographics],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
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
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[PersonType],
source.[NameStyle],
source.[Title],
source.[FirstName],
source.[MiddleName],
source.[LastName],
source.[Suffix],
source.[EmailPromotion],
source.[AdditionalContactInfo],
source.[Demographics],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SalesReason //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SalesReason];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SalesReason];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SalesReason];
GO
-- TABLE TYPE: type_dw_Sales_SalesReason
CREATE TYPE [type_dw_Sales_SalesReason] AS TABLE(
[SalesReasonID] int,
[Name] nvarchar(50),
[ReasonType] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SalesReason
CREATE PROC [sp_upsert_dw_Sales_SalesReason]
(
@tvp [type_dw_Sales_SalesReason] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SalesReason AS target
USING (
SELECT ISNULL([SalesReasonID], 0) AS [SalesReasonID],
[Name] AS [Name],
[ReasonType] AS [ReasonType],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[SalesReasonID] = source.[SalesReasonID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ReasonType] = source.[ReasonType],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SalesReasonID],
[Name],
[ReasonType],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[SalesReasonID],
source.[Name],
source.[ReasonType],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SalesTaxRate //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SalesTaxRate];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SalesTaxRate];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SalesTaxRate];
GO
-- TABLE TYPE: type_dw_Sales_SalesTaxRate
CREATE TYPE [type_dw_Sales_SalesTaxRate] AS TABLE(
[SalesTaxRateID] int,
[StateProvinceID] int,
[TaxType] tinyint,
[TaxRate] smallmoney,
[Name] nvarchar(50),
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SalesTaxRate
CREATE PROC [sp_upsert_dw_Sales_SalesTaxRate]
(
@tvp [type_dw_Sales_SalesTaxRate] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SalesTaxRate AS target
USING (
SELECT ISNULL([SalesTaxRateID], 0) AS [SalesTaxRateID],
[StateProvinceID] AS [StateProvinceID],
[TaxType] AS [TaxType],
[TaxRate] AS [TaxRate],
[Name] AS [Name],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[SalesTaxRateID] = source.[SalesTaxRateID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[StateProvinceID] = source.[StateProvinceID],
target.[TaxType] = source.[TaxType],
target.[TaxRate] = source.[TaxRate],
target.[Name] = source.[Name],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SalesTaxRateID],
[StateProvinceID],
[TaxType],
[TaxRate],
[Name],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[SalesTaxRateID],
source.[StateProvinceID],
source.[TaxType],
source.[TaxRate],
source.[Name],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_PersonCreditCard //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_PersonCreditCard];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_PersonCreditCard];
GO
DROP TYPE IF EXISTS [type_dw_Sales_PersonCreditCard];
GO
-- TABLE TYPE: type_dw_Sales_PersonCreditCard
CREATE TYPE [type_dw_Sales_PersonCreditCard] AS TABLE(
[BusinessEntityID] int,
[CreditCardID] int,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_PersonCreditCard
CREATE PROC [sp_upsert_dw_Sales_PersonCreditCard]
(
@tvp [type_dw_Sales_PersonCreditCard] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_PersonCreditCard AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
ISNULL([CreditCardID], 0) AS [CreditCardID],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
AND target.[CreditCardID] = source.[CreditCardID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[CreditCardID],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[CreditCardID],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_PersonPhone //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_PersonPhone];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_PersonPhone];
GO
DROP TYPE IF EXISTS [type_dw_Person_PersonPhone];
GO
-- TABLE TYPE: type_dw_Person_PersonPhone
CREATE TYPE [type_dw_Person_PersonPhone] AS TABLE(
[BusinessEntityID] int,
[PhoneNumber] nvarchar(25),
[PhoneNumberTypeID] int,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_PersonPhone
CREATE PROC [sp_upsert_dw_Person_PersonPhone]
(
@tvp [type_dw_Person_PersonPhone] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_PersonPhone AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
ISNULL([PhoneNumber], '') AS [PhoneNumber],
ISNULL([PhoneNumberTypeID], 0) AS [PhoneNumberTypeID],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
AND target.[PhoneNumber] = source.[PhoneNumber]
AND target.[PhoneNumberTypeID] = source.[PhoneNumberTypeID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[PhoneNumber],
[PhoneNumberTypeID],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[PhoneNumber],
source.[PhoneNumberTypeID],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SalesTerritory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SalesTerritory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SalesTerritory];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SalesTerritory];
GO
-- TABLE TYPE: type_dw_Sales_SalesTerritory
CREATE TYPE [type_dw_Sales_SalesTerritory] AS TABLE(
[TerritoryID] int,
[Name] nvarchar(50),
[CountryRegionCode] nvarchar(3),
[Group] nvarchar(50),
[SalesYTD] money,
[SalesLastYear] money,
[CostYTD] money,
[CostLastYear] money,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SalesTerritory
CREATE PROC [sp_upsert_dw_Sales_SalesTerritory]
(
@tvp [type_dw_Sales_SalesTerritory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SalesTerritory AS target
USING (
SELECT ISNULL([TerritoryID], 0) AS [TerritoryID],
[Name] AS [Name],
[CountryRegionCode] AS [CountryRegionCode],
[Group] AS [Group],
[SalesYTD] AS [SalesYTD],
[SalesLastYear] AS [SalesLastYear],
[CostYTD] AS [CostYTD],
[CostLastYear] AS [CostLastYear],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[TerritoryID] = source.[TerritoryID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[CountryRegionCode] = source.[CountryRegionCode],
target.[Group] = source.[Group],
target.[SalesYTD] = source.[SalesYTD],
target.[SalesLastYear] = source.[SalesLastYear],
target.[CostYTD] = source.[CostYTD],
target.[CostLastYear] = source.[CostLastYear],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([TerritoryID],
[Name],
[CountryRegionCode],
[Group],
[SalesYTD],
[SalesLastYear],
[CostYTD],
[CostLastYear],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[TerritoryID],
source.[Name],
source.[CountryRegionCode],
source.[Group],
source.[SalesYTD],
source.[SalesLastYear],
source.[CostYTD],
source.[CostLastYear],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Person_PhoneNumberType //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Person_PhoneNumberType];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Person_PhoneNumberType];
GO
DROP TYPE IF EXISTS [type_dw_Person_PhoneNumberType];
GO
-- TABLE TYPE: type_dw_Person_PhoneNumberType
CREATE TYPE [type_dw_Person_PhoneNumberType] AS TABLE(
[PhoneNumberTypeID] int,
[Name] nvarchar(50),
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Person_PhoneNumberType
CREATE PROC [sp_upsert_dw_Person_PhoneNumberType]
(
@tvp [type_dw_Person_PhoneNumberType] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Person_PhoneNumberType AS target
USING (
SELECT ISNULL([PhoneNumberTypeID], 0) AS [PhoneNumberTypeID],
[Name] AS [Name],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[PhoneNumberTypeID] = source.[PhoneNumberTypeID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([PhoneNumberTypeID],
[Name],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[PhoneNumberTypeID],
source.[Name],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Production_Product //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Production_Product];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Production_Product];
GO
DROP TYPE IF EXISTS [type_dw_Production_Product];
GO
-- TABLE TYPE: type_dw_Production_Product
CREATE TYPE [type_dw_Production_Product] AS TABLE(
[ProductID] int,
[Name] nvarchar(50),
[ProductNumber] nvarchar(25),
[MakeFlag] bit,
[FinishedGoodsFlag] bit,
[Color] nvarchar(15),
[SafetyStockLevel] smallint,
[ReorderPoint] smallint,
[StandardCost] money,
[ListPrice] money,
[Size] nvarchar(5),
[SizeUnitMeasureCode] nchar(3),
[WeightUnitMeasureCode] nchar(3),
[Weight] decimal(8,2),
[DaysToManufacture] int,
[ProductLine] nchar(2),
[Class] nchar(2),
[Style] nchar(2),
[ProductSubcategoryID] int,
[ProductModelID] int,
[SellStartDate] datetime,
[SellEndDate] datetime,
[DiscontinuedDate] datetime,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Production_Product
CREATE PROC [sp_upsert_dw_Production_Product]
(
@tvp [type_dw_Production_Product] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Production_Product AS target
USING (
SELECT ISNULL([ProductID], 0) AS [ProductID],
[Name] AS [Name],
[ProductNumber] AS [ProductNumber],
[MakeFlag] AS [MakeFlag],
[FinishedGoodsFlag] AS [FinishedGoodsFlag],
[Color] AS [Color],
[SafetyStockLevel] AS [SafetyStockLevel],
[ReorderPoint] AS [ReorderPoint],
[StandardCost] AS [StandardCost],
[ListPrice] AS [ListPrice],
[Size] AS [Size],
[SizeUnitMeasureCode] AS [SizeUnitMeasureCode],
[WeightUnitMeasureCode] AS [WeightUnitMeasureCode],
[Weight] AS [Weight],
[DaysToManufacture] AS [DaysToManufacture],
[ProductLine] AS [ProductLine],
[Class] AS [Class],
[Style] AS [Style],
[ProductSubcategoryID] AS [ProductSubcategoryID],
[ProductModelID] AS [ProductModelID],
[SellStartDate] AS [SellStartDate],
[SellEndDate] AS [SellEndDate],
[DiscontinuedDate] AS [DiscontinuedDate],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[ProductID] = source.[ProductID]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[Name] = source.[Name],
target.[ProductNumber] = source.[ProductNumber],
target.[MakeFlag] = source.[MakeFlag],
target.[FinishedGoodsFlag] = source.[FinishedGoodsFlag],
target.[Color] = source.[Color],
target.[SafetyStockLevel] = source.[SafetyStockLevel],
target.[ReorderPoint] = source.[ReorderPoint],
target.[StandardCost] = source.[StandardCost],
target.[ListPrice] = source.[ListPrice],
target.[Size] = source.[Size],
target.[SizeUnitMeasureCode] = source.[SizeUnitMeasureCode],
target.[WeightUnitMeasureCode] = source.[WeightUnitMeasureCode],
target.[Weight] = source.[Weight],
target.[DaysToManufacture] = source.[DaysToManufacture],
target.[ProductLine] = source.[ProductLine],
target.[Class] = source.[Class],
target.[Style] = source.[Style],
target.[ProductSubcategoryID] = source.[ProductSubcategoryID],
target.[ProductModelID] = source.[ProductModelID],
target.[SellStartDate] = source.[SellStartDate],
target.[SellEndDate] = source.[SellEndDate],
target.[DiscontinuedDate] = source.[DiscontinuedDate],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([ProductID],
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
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[ProductID],
source.[Name],
source.[ProductNumber],
source.[MakeFlag],
source.[FinishedGoodsFlag],
source.[Color],
source.[SafetyStockLevel],
source.[ReorderPoint],
source.[StandardCost],
source.[ListPrice],
source.[Size],
source.[SizeUnitMeasureCode],
source.[WeightUnitMeasureCode],
source.[Weight],
source.[DaysToManufacture],
source.[ProductLine],
source.[Class],
source.[Style],
source.[ProductSubcategoryID],
source.[ProductModelID],
source.[SellStartDate],
source.[SellEndDate],
source.[DiscontinuedDate],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_Sales_SalesTerritoryHistory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_Sales_SalesTerritoryHistory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_Sales_SalesTerritoryHistory];
GO
DROP TYPE IF EXISTS [type_dw_Sales_SalesTerritoryHistory];
GO
-- TABLE TYPE: type_dw_Sales_SalesTerritoryHistory
CREATE TYPE [type_dw_Sales_SalesTerritoryHistory] AS TABLE(
[BusinessEntityID] int,
[TerritoryID] int,
[StartDate] datetime,
[EndDate] datetime,
[rowguid] uniqueidentifier,
[ModifiedDate] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_Sales_SalesTerritoryHistory
CREATE PROC [sp_upsert_dw_Sales_SalesTerritoryHistory]
(
@tvp [type_dw_Sales_SalesTerritoryHistory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_Sales_SalesTerritoryHistory AS target
USING (
SELECT ISNULL([BusinessEntityID], 0) AS [BusinessEntityID],
ISNULL([TerritoryID], 0) AS [TerritoryID],
ISNULL([StartDate], '9999-12-31') AS [StartDate],
[EndDate] AS [EndDate],
[rowguid] AS [rowguid],
[ModifiedDate] AS [ModifiedDate],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[BusinessEntityID] = source.[BusinessEntityID]
AND target.[TerritoryID] = source.[TerritoryID]
AND target.[StartDate] = source.[StartDate]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[EndDate] = source.[EndDate],
target.[rowguid] = source.[rowguid],
target.[ModifiedDate] = source.[ModifiedDate],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([BusinessEntityID],
[TerritoryID],
[StartDate],
[EndDate],
[rowguid],
[ModifiedDate],
[_LogID],
[_LogID_List]
)
VALUES (source.[BusinessEntityID],
source.[TerritoryID],
source.[StartDate],
source.[EndDate],
source.[rowguid],
source.[ModifiedDate],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_mysql_customers //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_mysql_customers];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_mysql_customers];
GO
DROP TYPE IF EXISTS [type_dw_mysql_customers];
GO
-- TABLE TYPE: type_dw_mysql_customers
CREATE TYPE [type_dw_mysql_customers] AS TABLE(
[customerNumber] int,
[customerName] nvarchar(50),
[contactLastName] nvarchar(50),
[contactFirstName] nvarchar(50),
[phone] nvarchar(50),
[addressLine1] nvarchar(50),
[addressLine2] nvarchar(50),
[city] nvarchar(50),
[state] nvarchar(50),
[postalCode] nvarchar(15),
[country] nvarchar(50),
[salesRepEmployeeNumber] int,
[creditLimit] float
);
GO
-- PROCEDURE: sp_upsert_dw_mysql_customers
CREATE PROC [sp_upsert_dw_mysql_customers]
(
@tvp [type_dw_mysql_customers] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_mysql_customers AS target
USING (
SELECT ISNULL([customerNumber], 0) AS [customerNumber],
[customerName] AS [customerName],
[contactLastName] AS [contactLastName],
[contactFirstName] AS [contactFirstName],
[phone] AS [phone],
[addressLine1] AS [addressLine1],
[addressLine2] AS [addressLine2],
[city] AS [city],
[state] AS [state],
[postalCode] AS [postalCode],
[country] AS [country],
[salesRepEmployeeNumber] AS [salesRepEmployeeNumber],
[creditLimit] AS [creditLimit],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[customerNumber] = source.[customerNumber]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[customerName] = source.[customerName],
target.[contactLastName] = source.[contactLastName],
target.[contactFirstName] = source.[contactFirstName],
target.[phone] = source.[phone],
target.[addressLine1] = source.[addressLine1],
target.[addressLine2] = source.[addressLine2],
target.[city] = source.[city],
target.[state] = source.[state],
target.[postalCode] = source.[postalCode],
target.[country] = source.[country],
target.[salesRepEmployeeNumber] = source.[salesRepEmployeeNumber],
target.[creditLimit] = source.[creditLimit],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([customerNumber],
[customerName],
[contactLastName],
[contactFirstName],
[phone],
[addressLine1],
[addressLine2],
[city],
[state],
[postalCode],
[country],
[salesRepEmployeeNumber],
[creditLimit],
[_LogID],
[_LogID_List]
)
VALUES (source.[customerNumber],
source.[customerName],
source.[contactLastName],
source.[contactFirstName],
source.[phone],
source.[addressLine1],
source.[addressLine2],
source.[city],
source.[state],
source.[postalCode],
source.[country],
source.[salesRepEmployeeNumber],
source.[creditLimit],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_mysql_employees //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_mysql_employees];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_mysql_employees];
GO
DROP TYPE IF EXISTS [type_dw_mysql_employees];
GO
-- TABLE TYPE: type_dw_mysql_employees
CREATE TYPE [type_dw_mysql_employees] AS TABLE(
[employeeNumber] int,
[lastName] nvarchar(50),
[firstName] nvarchar(50),
[extension] nvarchar(10),
[email] nvarchar(100),
[officeCode] nvarchar(10),
[reportsTo] int,
[jobTitle] nvarchar(50)
);
GO
-- PROCEDURE: sp_upsert_dw_mysql_employees
CREATE PROC [sp_upsert_dw_mysql_employees]
(
@tvp [type_dw_mysql_employees] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_mysql_employees AS target
USING (
SELECT ISNULL([employeeNumber], 0) AS [employeeNumber],
[lastName] AS [lastName],
[firstName] AS [firstName],
[extension] AS [extension],
[email] AS [email],
[officeCode] AS [officeCode],
[reportsTo] AS [reportsTo],
[jobTitle] AS [jobTitle],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[employeeNumber] = source.[employeeNumber]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[lastName] = source.[lastName],
target.[firstName] = source.[firstName],
target.[extension] = source.[extension],
target.[email] = source.[email],
target.[officeCode] = source.[officeCode],
target.[reportsTo] = source.[reportsTo],
target.[jobTitle] = source.[jobTitle],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([employeeNumber],
[lastName],
[firstName],
[extension],
[email],
[officeCode],
[reportsTo],
[jobTitle],
[_LogID],
[_LogID_List]
)
VALUES (source.[employeeNumber],
source.[lastName],
source.[firstName],
source.[extension],
source.[email],
source.[officeCode],
source.[reportsTo],
source.[jobTitle],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_mysql_offices //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_mysql_offices];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_mysql_offices];
GO
DROP TYPE IF EXISTS [type_dw_mysql_offices];
GO
-- TABLE TYPE: type_dw_mysql_offices
CREATE TYPE [type_dw_mysql_offices] AS TABLE(
[officeCode] nvarchar(10),
[city] nvarchar(50),
[phone] nvarchar(50),
[addressLine1] nvarchar(50),
[addressLine2] nvarchar(50),
[state] nvarchar(50),
[country] nvarchar(50),
[postalCode] nvarchar(15),
[territory] nvarchar(10)
);
GO
-- PROCEDURE: sp_upsert_dw_mysql_offices
CREATE PROC [sp_upsert_dw_mysql_offices]
(
@tvp [type_dw_mysql_offices] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_mysql_offices AS target
USING (
SELECT ISNULL([officeCode], '') AS [officeCode],
[city] AS [city],
[phone] AS [phone],
[addressLine1] AS [addressLine1],
[addressLine2] AS [addressLine2],
[state] AS [state],
[country] AS [country],
[postalCode] AS [postalCode],
[territory] AS [territory],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[officeCode] = source.[officeCode]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[city] = source.[city],
target.[phone] = source.[phone],
target.[addressLine1] = source.[addressLine1],
target.[addressLine2] = source.[addressLine2],
target.[state] = source.[state],
target.[country] = source.[country],
target.[postalCode] = source.[postalCode],
target.[territory] = source.[territory],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([officeCode],
[city],
[phone],
[addressLine1],
[addressLine2],
[state],
[country],
[postalCode],
[territory],
[_LogID],
[_LogID_List]
)
VALUES (source.[officeCode],
source.[city],
source.[phone],
source.[addressLine1],
source.[addressLine2],
source.[state],
source.[country],
source.[postalCode],
source.[territory],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_mysql_orderdetails //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_mysql_orderdetails];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_mysql_orderdetails];
GO
DROP TYPE IF EXISTS [type_dw_mysql_orderdetails];
GO
-- TABLE TYPE: type_dw_mysql_orderdetails
CREATE TYPE [type_dw_mysql_orderdetails] AS TABLE(
[orderNumber] int,
[productCode] nvarchar(15),
[quantityOrdered] int,
[priceEach] float,
[orderLineNumber] smallint
);
GO
-- PROCEDURE: sp_upsert_dw_mysql_orderdetails
CREATE PROC [sp_upsert_dw_mysql_orderdetails]
(
@tvp [type_dw_mysql_orderdetails] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_mysql_orderdetails AS target
USING (
SELECT ISNULL([orderNumber], 0) AS [orderNumber],
ISNULL([productCode], '') AS [productCode],
[quantityOrdered] AS [quantityOrdered],
[priceEach] AS [priceEach],
[orderLineNumber] AS [orderLineNumber],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[orderNumber] = source.[orderNumber]
AND target.[productCode] = source.[productCode]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[quantityOrdered] = source.[quantityOrdered],
target.[priceEach] = source.[priceEach],
target.[orderLineNumber] = source.[orderLineNumber],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([orderNumber],
[productCode],
[quantityOrdered],
[priceEach],
[orderLineNumber],
[_LogID],
[_LogID_List]
)
VALUES (source.[orderNumber],
source.[productCode],
source.[quantityOrdered],
source.[priceEach],
source.[orderLineNumber],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_mysql_orders //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_mysql_orders];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_mysql_orders];
GO
DROP TYPE IF EXISTS [type_dw_mysql_orders];
GO
-- TABLE TYPE: type_dw_mysql_orders
CREATE TYPE [type_dw_mysql_orders] AS TABLE(
[orderNumber] int,
[orderDate] datetime,
[requiredDate] datetime,
[shippedDate] datetime,
[status] nvarchar(15),
[comments] nvarchar(max),
[customerNumber] int
);
GO
-- PROCEDURE: sp_upsert_dw_mysql_orders
CREATE PROC [sp_upsert_dw_mysql_orders]
(
@tvp [type_dw_mysql_orders] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_mysql_orders AS target
USING (
SELECT ISNULL([orderNumber], 0) AS [orderNumber],
[orderDate] AS [orderDate],
[requiredDate] AS [requiredDate],
[shippedDate] AS [shippedDate],
[status] AS [status],
[comments] AS [comments],
[customerNumber] AS [customerNumber],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[orderNumber] = source.[orderNumber]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[orderDate] = source.[orderDate],
target.[requiredDate] = source.[requiredDate],
target.[shippedDate] = source.[shippedDate],
target.[status] = source.[status],
target.[comments] = source.[comments],
target.[customerNumber] = source.[customerNumber],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([orderNumber],
[orderDate],
[requiredDate],
[shippedDate],
[status],
[comments],
[customerNumber],
[_LogID],
[_LogID_List]
)
VALUES (source.[orderNumber],
source.[orderDate],
source.[requiredDate],
source.[shippedDate],
source.[status],
source.[comments],
source.[customerNumber],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_mysql_payments //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_mysql_payments];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_mysql_payments];
GO
DROP TYPE IF EXISTS [type_dw_mysql_payments];
GO
-- TABLE TYPE: type_dw_mysql_payments
CREATE TYPE [type_dw_mysql_payments] AS TABLE(
[customerNumber] int,
[checkNumber] nvarchar(50),
[paymentDate] datetime,
[amount] float
);
GO
-- PROCEDURE: sp_upsert_dw_mysql_payments
CREATE PROC [sp_upsert_dw_mysql_payments]
(
@tvp [type_dw_mysql_payments] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_mysql_payments AS target
USING (
SELECT ISNULL([customerNumber], 0) AS [customerNumber],
ISNULL([checkNumber], '') AS [checkNumber],
[paymentDate] AS [paymentDate],
[amount] AS [amount],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[customerNumber] = source.[customerNumber]
AND target.[checkNumber] = source.[checkNumber]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[paymentDate] = source.[paymentDate],
target.[amount] = source.[amount],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([customerNumber],
[checkNumber],
[paymentDate],
[amount],
[_LogID],
[_LogID_List]
)
VALUES (source.[customerNumber],
source.[checkNumber],
source.[paymentDate],
source.[amount],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_mysql_productlines //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_mysql_productlines];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_mysql_productlines];
GO
DROP TYPE IF EXISTS [type_dw_mysql_productlines];
GO
-- TABLE TYPE: type_dw_mysql_productlines
CREATE TYPE [type_dw_mysql_productlines] AS TABLE(
[productLine] nvarchar(50),
[textDescription] nvarchar(4000),
[htmlDescription] nvarchar(max),
[image] varbinary(max)
);
GO
-- PROCEDURE: sp_upsert_dw_mysql_productlines
CREATE PROC [sp_upsert_dw_mysql_productlines]
(
@tvp [type_dw_mysql_productlines] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_mysql_productlines AS target
USING (
SELECT ISNULL([productLine], '') AS [productLine],
[textDescription] AS [textDescription],
[htmlDescription] AS [htmlDescription],
[image] AS [image],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[productLine] = source.[productLine]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[textDescription] = source.[textDescription],
target.[htmlDescription] = source.[htmlDescription],
target.[image] = source.[image],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([productLine],
[textDescription],
[htmlDescription],
[image],
[_LogID],
[_LogID_List]
)
VALUES (source.[productLine],
source.[textDescription],
source.[htmlDescription],
source.[image],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_mysql_products //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_mysql_products];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_mysql_products];
GO
DROP TYPE IF EXISTS [type_dw_mysql_products];
GO
-- TABLE TYPE: type_dw_mysql_products
CREATE TYPE [type_dw_mysql_products] AS TABLE(
[productCode] nvarchar(15),
[productName] nvarchar(70),
[productLine] nvarchar(50),
[productScale] nvarchar(10),
[productVendor] nvarchar(50),
[productDescription] nvarchar(max),
[quantityInStock] smallint,
[buyPrice] float,
[MSRP] float
);
GO
-- PROCEDURE: sp_upsert_dw_mysql_products
CREATE PROC [sp_upsert_dw_mysql_products]
(
@tvp [type_dw_mysql_products] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_mysql_products AS target
USING (
SELECT ISNULL([productCode], '') AS [productCode],
[productName] AS [productName],
[productLine] AS [productLine],
[productScale] AS [productScale],
[productVendor] AS [productVendor],
[productDescription] AS [productDescription],
[quantityInStock] AS [quantityInStock],
[buyPrice] AS [buyPrice],
[MSRP] AS [MSRP],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[productCode] = source.[productCode]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[productName] = source.[productName],
target.[productLine] = source.[productLine],
target.[productScale] = source.[productScale],
target.[productVendor] = source.[productVendor],
target.[productDescription] = source.[productDescription],
target.[quantityInStock] = source.[quantityInStock],
target.[buyPrice] = source.[buyPrice],
target.[MSRP] = source.[MSRP],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([productCode],
[productName],
[productLine],
[productScale],
[productVendor],
[productDescription],
[quantityInStock],
[buyPrice],
[MSRP],
[_LogID],
[_LogID_List]
)
VALUES (source.[productCode],
source.[productName],
source.[productLine],
source.[productScale],
source.[productVendor],
source.[productDescription],
source.[quantityInStock],
source.[buyPrice],
source.[MSRP],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_actor //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_actor];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_actor];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_actor];
GO
-- TABLE TYPE: type_dw_pgsql_actor
CREATE TYPE [type_dw_pgsql_actor] AS TABLE(
[actor_id] int,
[first_name] nvarchar(45),
[last_name] nvarchar(45),
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_actor
CREATE PROC [sp_upsert_dw_pgsql_actor]
(
@tvp [type_dw_pgsql_actor] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_actor AS target
USING (
SELECT ISNULL([actor_id], 0) AS [actor_id],
[first_name] AS [first_name],
[last_name] AS [last_name],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[actor_id] = source.[actor_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[first_name] = source.[first_name],
target.[last_name] = source.[last_name],
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([actor_id],
[first_name],
[last_name],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[actor_id],
source.[first_name],
source.[last_name],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_store //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_store];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_store];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_store];
GO
-- TABLE TYPE: type_dw_pgsql_store
CREATE TYPE [type_dw_pgsql_store] AS TABLE(
[store_id] int,
[manager_staff_id] smallint,
[address_id] smallint,
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_store
CREATE PROC [sp_upsert_dw_pgsql_store]
(
@tvp [type_dw_pgsql_store] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_store AS target
USING (
SELECT ISNULL([store_id], 0) AS [store_id],
[manager_staff_id] AS [manager_staff_id],
[address_id] AS [address_id],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[store_id] = source.[store_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[manager_staff_id] = source.[manager_staff_id],
target.[address_id] = source.[address_id],
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([store_id],
[manager_staff_id],
[address_id],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[store_id],
source.[manager_staff_id],
source.[address_id],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_address //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_address];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_address];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_address];
GO
-- TABLE TYPE: type_dw_pgsql_address
CREATE TYPE [type_dw_pgsql_address] AS TABLE(
[address_id] int,
[address] nvarchar(50),
[address2] nvarchar(50),
[district] nvarchar(20),
[city_id] smallint,
[postal_code] nvarchar(10),
[phone] nvarchar(20),
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_address
CREATE PROC [sp_upsert_dw_pgsql_address]
(
@tvp [type_dw_pgsql_address] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_address AS target
USING (
SELECT ISNULL([address_id], 0) AS [address_id],
[address] AS [address],
[address2] AS [address2],
[district] AS [district],
[city_id] AS [city_id],
[postal_code] AS [postal_code],
[phone] AS [phone],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[address_id] = source.[address_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[address] = source.[address],
target.[address2] = source.[address2],
target.[district] = source.[district],
target.[city_id] = source.[city_id],
target.[postal_code] = source.[postal_code],
target.[phone] = source.[phone],
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([address_id],
[address],
[address2],
[district],
[city_id],
[postal_code],
[phone],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[address_id],
source.[address],
source.[address2],
source.[district],
source.[city_id],
source.[postal_code],
source.[phone],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_category //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_category];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_category];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_category];
GO
-- TABLE TYPE: type_dw_pgsql_category
CREATE TYPE [type_dw_pgsql_category] AS TABLE(
[category_id] int,
[name] nvarchar(25),
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_category
CREATE PROC [sp_upsert_dw_pgsql_category]
(
@tvp [type_dw_pgsql_category] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_category AS target
USING (
SELECT ISNULL([category_id], 0) AS [category_id],
[name] AS [name],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[category_id] = source.[category_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[name] = source.[name],
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([category_id],
[name],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[category_id],
source.[name],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_city //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_city];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_city];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_city];
GO
-- TABLE TYPE: type_dw_pgsql_city
CREATE TYPE [type_dw_pgsql_city] AS TABLE(
[city_id] int,
[city] nvarchar(50),
[country_id] smallint,
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_city
CREATE PROC [sp_upsert_dw_pgsql_city]
(
@tvp [type_dw_pgsql_city] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_city AS target
USING (
SELECT ISNULL([city_id], 0) AS [city_id],
[city] AS [city],
[country_id] AS [country_id],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[city_id] = source.[city_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[city] = source.[city],
target.[country_id] = source.[country_id],
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([city_id],
[city],
[country_id],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[city_id],
source.[city],
source.[country_id],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_country //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_country];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_country];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_country];
GO
-- TABLE TYPE: type_dw_pgsql_country
CREATE TYPE [type_dw_pgsql_country] AS TABLE(
[country_id] int,
[country] nvarchar(50),
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_country
CREATE PROC [sp_upsert_dw_pgsql_country]
(
@tvp [type_dw_pgsql_country] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_country AS target
USING (
SELECT ISNULL([country_id], 0) AS [country_id],
[country] AS [country],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[country_id] = source.[country_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[country] = source.[country],
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([country_id],
[country],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[country_id],
source.[country],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_customer //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_customer];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_customer];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_customer];
GO
-- TABLE TYPE: type_dw_pgsql_customer
CREATE TYPE [type_dw_pgsql_customer] AS TABLE(
[customer_id] int,
[store_id] smallint,
[first_name] nvarchar(45),
[last_name] nvarchar(45),
[email] nvarchar(50),
[address_id] smallint,
[activebool] bit,
[create_date] datetime,
[last_update] datetime,
[active] int
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_customer
CREATE PROC [sp_upsert_dw_pgsql_customer]
(
@tvp [type_dw_pgsql_customer] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_customer AS target
USING (
SELECT ISNULL([customer_id], 0) AS [customer_id],
[store_id] AS [store_id],
[first_name] AS [first_name],
[last_name] AS [last_name],
[email] AS [email],
[address_id] AS [address_id],
[activebool] AS [activebool],
[create_date] AS [create_date],
[last_update] AS [last_update],
[active] AS [active],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[customer_id] = source.[customer_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[store_id] = source.[store_id],
target.[first_name] = source.[first_name],
target.[last_name] = source.[last_name],
target.[email] = source.[email],
target.[address_id] = source.[address_id],
target.[activebool] = source.[activebool],
target.[create_date] = source.[create_date],
target.[last_update] = source.[last_update],
target.[active] = source.[active],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([customer_id],
[store_id],
[first_name],
[last_name],
[email],
[address_id],
[activebool],
[create_date],
[last_update],
[active],
[_LogID],
[_LogID_List]
)
VALUES (source.[customer_id],
source.[store_id],
source.[first_name],
source.[last_name],
source.[email],
source.[address_id],
source.[activebool],
source.[create_date],
source.[last_update],
source.[active],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_film_actor //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_film_actor];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_film_actor];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_film_actor];
GO
-- TABLE TYPE: type_dw_pgsql_film_actor
CREATE TYPE [type_dw_pgsql_film_actor] AS TABLE(
[actor_id] smallint,
[film_id] smallint,
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_film_actor
CREATE PROC [sp_upsert_dw_pgsql_film_actor]
(
@tvp [type_dw_pgsql_film_actor] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_film_actor AS target
USING (
SELECT ISNULL([actor_id], 0) AS [actor_id],
ISNULL([film_id], 0) AS [film_id],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[actor_id] = source.[actor_id]
AND target.[film_id] = source.[film_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([actor_id],
[film_id],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[actor_id],
source.[film_id],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_film_category //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_film_category];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_film_category];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_film_category];
GO
-- TABLE TYPE: type_dw_pgsql_film_category
CREATE TYPE [type_dw_pgsql_film_category] AS TABLE(
[film_id] smallint,
[category_id] smallint,
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_film_category
CREATE PROC [sp_upsert_dw_pgsql_film_category]
(
@tvp [type_dw_pgsql_film_category] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_film_category AS target
USING (
SELECT ISNULL([film_id], 0) AS [film_id],
ISNULL([category_id], 0) AS [category_id],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[film_id] = source.[film_id]
AND target.[category_id] = source.[category_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([film_id],
[category_id],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[film_id],
source.[category_id],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_inventory //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_inventory];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_inventory];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_inventory];
GO
-- TABLE TYPE: type_dw_pgsql_inventory
CREATE TYPE [type_dw_pgsql_inventory] AS TABLE(
[inventory_id] int,
[film_id] smallint,
[store_id] smallint,
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_inventory
CREATE PROC [sp_upsert_dw_pgsql_inventory]
(
@tvp [type_dw_pgsql_inventory] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_inventory AS target
USING (
SELECT ISNULL([inventory_id], 0) AS [inventory_id],
[film_id] AS [film_id],
[store_id] AS [store_id],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[inventory_id] = source.[inventory_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[film_id] = source.[film_id],
target.[store_id] = source.[store_id],
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([inventory_id],
[film_id],
[store_id],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[inventory_id],
source.[film_id],
source.[store_id],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_language //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_language];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_language];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_language];
GO
-- TABLE TYPE: type_dw_pgsql_language
CREATE TYPE [type_dw_pgsql_language] AS TABLE(
[language_id] int,
[name] nvarchar(20),
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_language
CREATE PROC [sp_upsert_dw_pgsql_language]
(
@tvp [type_dw_pgsql_language] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_language AS target
USING (
SELECT ISNULL([language_id], 0) AS [language_id],
[name] AS [name],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[language_id] = source.[language_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[name] = source.[name],
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([language_id],
[name],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[language_id],
source.[name],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_rental //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_rental];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_rental];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_rental];
GO
-- TABLE TYPE: type_dw_pgsql_rental
CREATE TYPE [type_dw_pgsql_rental] AS TABLE(
[rental_id] int,
[rental_date] datetime,
[inventory_id] int,
[customer_id] smallint,
[return_date] datetime,
[staff_id] smallint,
[last_update] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_rental
CREATE PROC [sp_upsert_dw_pgsql_rental]
(
@tvp [type_dw_pgsql_rental] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_rental AS target
USING (
SELECT ISNULL([rental_id], 0) AS [rental_id],
[rental_date] AS [rental_date],
[inventory_id] AS [inventory_id],
[customer_id] AS [customer_id],
[return_date] AS [return_date],
[staff_id] AS [staff_id],
[last_update] AS [last_update],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[rental_id] = source.[rental_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[rental_date] = source.[rental_date],
target.[inventory_id] = source.[inventory_id],
target.[customer_id] = source.[customer_id],
target.[return_date] = source.[return_date],
target.[staff_id] = source.[staff_id],
target.[last_update] = source.[last_update],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([rental_id],
[rental_date],
[inventory_id],
[customer_id],
[return_date],
[staff_id],
[last_update],
[_LogID],
[_LogID_List]
)
VALUES (source.[rental_id],
source.[rental_date],
source.[inventory_id],
source.[customer_id],
source.[return_date],
source.[staff_id],
source.[last_update],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_staff //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_staff];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_staff];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_staff];
GO
-- TABLE TYPE: type_dw_pgsql_staff
CREATE TYPE [type_dw_pgsql_staff] AS TABLE(
[staff_id] int,
[first_name] nvarchar(45),
[last_name] nvarchar(45),
[address_id] smallint,
[email] nvarchar(50),
[store_id] smallint,
[active] bit,
[username] nvarchar(16),
[password] nvarchar(40),
[last_update] datetime,
[picture] varbinary(max)
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_staff
CREATE PROC [sp_upsert_dw_pgsql_staff]
(
@tvp [type_dw_pgsql_staff] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_staff AS target
USING (
SELECT ISNULL([staff_id], 0) AS [staff_id],
[first_name] AS [first_name],
[last_name] AS [last_name],
[address_id] AS [address_id],
[email] AS [email],
[store_id] AS [store_id],
[active] AS [active],
[username] AS [username],
[password] AS [password],
[last_update] AS [last_update],
[picture] AS [picture],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[staff_id] = source.[staff_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[first_name] = source.[first_name],
target.[last_name] = source.[last_name],
target.[address_id] = source.[address_id],
target.[email] = source.[email],
target.[store_id] = source.[store_id],
target.[active] = source.[active],
target.[username] = source.[username],
target.[password] = source.[password],
target.[last_update] = source.[last_update],
target.[picture] = source.[picture],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([staff_id],
[first_name],
[last_name],
[address_id],
[email],
[store_id],
[active],
[username],
[password],
[last_update],
[picture],
[_LogID],
[_LogID_List]
)
VALUES (source.[staff_id],
source.[first_name],
source.[last_name],
source.[address_id],
source.[email],
source.[store_id],
source.[active],
source.[username],
source.[password],
source.[last_update],
source.[picture],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_payment //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_payment];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_payment];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_payment];
GO
-- TABLE TYPE: type_dw_pgsql_payment
CREATE TYPE [type_dw_pgsql_payment] AS TABLE(
[payment_id] int,
[customer_id] smallint,
[staff_id] smallint,
[rental_id] int,
[amount] float,
[payment_date] datetime
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_payment
CREATE PROC [sp_upsert_dw_pgsql_payment]
(
@tvp [type_dw_pgsql_payment] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_payment AS target
USING (
SELECT ISNULL([payment_id], 0) AS [payment_id],
[customer_id] AS [customer_id],
[staff_id] AS [staff_id],
[rental_id] AS [rental_id],
[amount] AS [amount],
[payment_date] AS [payment_date],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[payment_id] = source.[payment_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[customer_id] = source.[customer_id],
target.[staff_id] = source.[staff_id],
target.[rental_id] = source.[rental_id],
target.[amount] = source.[amount],
target.[payment_date] = source.[payment_date],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([payment_id],
[customer_id],
[staff_id],
[rental_id],
[amount],
[payment_date],
[_LogID],
[_LogID_List]
)
VALUES (source.[payment_id],
source.[customer_id],
source.[staff_id],
source.[rental_id],
source.[amount],
source.[payment_date],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_pgsql_film //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_pgsql_film];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_pgsql_film];
GO
DROP TYPE IF EXISTS [type_dw_pgsql_film];
GO
-- TABLE TYPE: type_dw_pgsql_film
CREATE TYPE [type_dw_pgsql_film] AS TABLE(
[film_id] int,
[title] nvarchar(255),
[description] nvarchar(max),
[release_year] int,
[language_id] smallint,
[rental_duration] smallint,
[rental_rate] float,
[length] smallint,
[replacement_cost] float,
[rating] nvarchar(max),
[last_update] datetime,
[special_features] nvarchar(max),
[fulltext] nvarchar(max)
);
GO
-- PROCEDURE: sp_upsert_dw_pgsql_film
CREATE PROC [sp_upsert_dw_pgsql_film]
(
@tvp [type_dw_pgsql_film] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_pgsql_film AS target
USING (
SELECT ISNULL([film_id], 0) AS [film_id],
[title] AS [title],
[description] AS [description],
[release_year] AS [release_year],
[language_id] AS [language_id],
[rental_duration] AS [rental_duration],
[rental_rate] AS [rental_rate],
[length] AS [length],
[replacement_cost] AS [replacement_cost],
[rating] AS [rating],
[last_update] AS [last_update],
[special_features] AS [special_features],
[fulltext] AS [fulltext],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[film_id] = source.[film_id]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[title] = source.[title],
target.[description] = source.[description],
target.[release_year] = source.[release_year],
target.[language_id] = source.[language_id],
target.[rental_duration] = source.[rental_duration],
target.[rental_rate] = source.[rental_rate],
target.[length] = source.[length],
target.[replacement_cost] = source.[replacement_cost],
target.[rating] = source.[rating],
target.[last_update] = source.[last_update],
target.[special_features] = source.[special_features],
target.[fulltext] = source.[fulltext],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([film_id],
[title],
[description],
[release_year],
[language_id],
[rental_duration],
[rental_rate],
[length],
[replacement_cost],
[rating],
[last_update],
[special_features],
[fulltext],
[_LogID],
[_LogID_List]
)
VALUES (source.[film_id],
source.[title],
source.[description],
source.[release_year],
source.[language_id],
source.[rental_duration],
source.[rental_rate],
source.[length],
source.[replacement_cost],
source.[rating],
source.[last_update],
source.[special_features],
source.[fulltext],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
-- -------------------------// dw_mondb_restaurants //------------------------- --
USE [Dev_DW]
GO
DROP PROCEDURE IF EXISTS [sp_select_dw_mondb_restaurants];
GO
DROP PROCEDURE IF EXISTS [sp_upsert_dw_mondb_restaurants];
GO
DROP TYPE IF EXISTS [type_dw_mondb_restaurants];
GO
-- TABLE TYPE: type_dw_mondb_restaurants
CREATE TYPE [type_dw_mondb_restaurants] AS TABLE(
[_id_mongodb] nvarchar(1000),
[address] nvarchar(max),
[borough] nvarchar(1000),
[cuisine] nvarchar(1000),
[grades] nvarchar(max),
[name] nvarchar(1000),
[restaurant_id] nvarchar(1000)
);
GO
-- PROCEDURE: sp_upsert_dw_mondb_restaurants
CREATE PROC [sp_upsert_dw_mondb_restaurants]
(
@tvp [type_dw_mondb_restaurants] READONLY,
@etl_logid int = -1,
@etl_filelogid int = NULL,
@new_watermark_value datetime = '19000101'
)
AS
BEGIN
SET NOCOUNT ON;
MERGE dw_mondb_restaurants AS target
USING (
SELECT ISNULL([_id_mongodb], '') AS [_id_mongodb],
[address] AS [address],
[borough] AS [borough],
[cuisine] AS [cuisine],
[grades] AS [grades],
[name] AS [name],
[restaurant_id] AS [restaurant_id],
@etl_logid AS [_LogID],
@etl_logid AS [_LogID_List]
FROM @tvp
) AS source
ON (
target.[_id_mongodb] = source.[_id_mongodb]
)
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE(),
target.[address] = source.[address],
target.[borough] = source.[borough],
target.[cuisine] = source.[cuisine],
target.[grades] = source.[grades],
target.[name] = source.[name],
target.[restaurant_id] = source.[restaurant_id],
target.[_LogID] = source.[_LogID],
target.[_LogID_List] = IIF(target._LogID = source._LogID, target.[_LogID_List], CONCAT(target.[_LogID_List],',',TRY_CONVERT(NVARCHAR(20), source.[_LogID])))
WHEN NOT MATCHED BY TARGET THEN
INSERT ([_id_mongodb],
[address],
[borough],
[cuisine],
[grades],
[name],
[restaurant_id],
[_LogID],
[_LogID_List]
)
VALUES (source.[_id_mongodb],
source.[address],
source.[borough],
source.[cuisine],
source.[grades],
source.[name],
source.[restaurant_id],
source.[_LogID],
source.[_LogID_List]
);
END;
GO
