USE CompareAdmin;  

--Login 
IF OBJECT_ID ('CompareAdmin.dbo.Users', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.Users;  

--Notes
IF OBJECT_ID ('CompareAdmin.dbo.Notes', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.Notes;  

--Products  
IF OBJECT_ID ('CompareAdmin.dbo.ProductDetails', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.ProductDetails;  

IF OBJECT_ID ('CompareAdmin.dbo.ProductSpecifications', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.ProductSpecifications;  

IF OBJECT_ID ('CompareAdmin.dbo.Products', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.Products;  

--Vendors
IF OBJECT_ID ('CompareAdmin.dbo.VendorsCategories', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.VendorsCategories;  

IF OBJECT_ID ('CompareAdmin.dbo.Addresses', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.Addresses;  

IF OBJECT_ID ('CompareAdmin.dbo.Vendors', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.Vendors;  

--Categories

IF OBJECT_ID ('CompareAdmin.dbo.CategoryParameters', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.CategoryParameters;  

IF OBJECT_ID ('CompareAdmin.dbo.Categories', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.Categories;  

IF OBJECT_ID ('CompareAdmin.dbo.ParentCategories', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.ParentCategories;  

--Brands

IF OBJECT_ID ('CompareAdmin.dbo.Brands', 'U') IS NOT NULL  
   DROP TABLE CompareAdmin.dbo.Brands;  

GO  

CREATE TABLE CompareAdmin.dbo.Users (
userName		VARCHAR(20) NOT NULL,
password		VARCHAR(20) NOT NULL,
realName		VARCHAR(100) NOT NULL,
CONSTRAINT pk_Users PRIMARY KEY(userName)
);

CREATE TABLE CompareAdmin.dbo.Notes (
noteID			SMALLINT IDENTITY(1,1),
noteText		VARCHAR(500),	
createdDate		DATETIME NOT NULL,
createdBy		VARCHAR(10) NOT NULL
CONSTRAINT pk_Notes PRIMARY KEY(noteID)
);

CREATE TABLE CompareAdmin.dbo.ParentCategories (
parentCategoryName NVARCHAR(80),
CONSTRAINT pk_ParentCategories PRIMARY KEY(parentCategoryName)
);

CREATE TABLE CompareAdmin.dbo.Categories (
categoryID			SMALLINT IDENTITY(1,1),
categoryName		NVARCHAR(80) NOT NULL,
parentCategoryName	NVARCHAR(80),
createdBy			VARCHAR(10) NOT NULL,
createdDate			DATETIME NOT NULL,
lastUpdatedBy			VARCHAR(10),
lastUpdatedDate			DATETIME ,		
CONSTRAINT unique_Categories UNIQUE(categoryName,parentCategoryName),
CONSTRAINT pk_Categories PRIMARY KEY(categoryID)
);

CREATE TABLE CompareAdmin.dbo.CategoryParameters (
categoryParameterID INT IDENTITY(1,1),
categoryID			SMALLINT,
parameterName		NVARCHAR(50) NOT NULL,
parameterValues		NVARCHAR(200) NOT NULL,
createdBy			VARCHAR(10) NOT NULL,
createdDate			DATETIME NOT NULL,
lastUpdatedBy			VARCHAR(10),
lastUpdatedDate			DATETIME ,		
CONSTRAINT unique_CategoryAttributes UNIQUE(categoryID,parameterName),
CONSTRAINT pk_CategoryAttributes PRIMARY KEY(categoryParameterID),
CONSTRAINT fk_CategoryAttributes_CategoryID   FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);


CREATE TABLE CompareAdmin.dbo.Vendors (
vendorID 	    INT IDENTITY(1,1),
vendorName 		VARCHAR(100) NOT NULL UNIQUE,
rating 		    DECIMAL(3,2)	NOT NULL,
dealsIn 	    VARCHAR(200) NOT NULL,
webShop		    TINYINT NOT NULL,
paymentOption   VARCHAR(300),
shippingOption  VARCHAR(300),
Isfeatured		BIT,	
status		    BIT,	
createdBy		VARCHAR(10) NOT NULL,
createdDate		DATETIME NOT NULL,
lastUpdatedBy			VARCHAR(10),
lastUpdatedDate			DATETIME ,		
CONSTRAINT pk_Vendors PRIMARY KEY(vendorID)
);

CREATE TABLE CompareAdmin.dbo.VendorsCategories (
vendorCategoryId INT IDENTITY(1,1),
vendorID		 INT,		
categoryID    SMALLINT,
CONSTRAINT pk_VendorsSubCategories PRIMARY KEY(vendorCategoryId),
CONSTRAINT fk_VendorsSubCategories_vendorID   FOREIGN KEY (vendorID)   REFERENCES Vendors(vendorID),
CONSTRAINT fk_VendorsCategories_CategoryID FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
 );

CREATE TABLE CompareAdmin.dbo.Addresses (
addressId INT IDENTITY(1,1),
address	  VARCHAR(300) NOT NULL,
city 	  VARCHAR(60)  NOT NULL,
telephone VARCHAR(60),
cell 	  VARCHAR(60),	
email 	  VARCHAR(120),
vendorID  INT,
CONSTRAINT pk_Addresses PRIMARY KEY(addressId),
CONSTRAINT fk_Addresses_vendorID FOREIGN KEY (vendorID) REFERENCES Vendors(vendorID)
);

CREATE TABLE CompareAdmin.dbo.Brands (
brandID   SMALLINT IDENTITY(1,1),
brandName NVARCHAR(100) NOT NULL UNIQUE,
CONSTRAINT pk_Brands PRIMARY KEY(brandID)
);

CREATE TABLE CompareAdmin.dbo.Products (
productID 		INT IDENTITY(1,1),
productName 	NVARCHAR(100) NOT NULL,
categoryID  	SMALLINT NOT NULL,
createdBy		VARCHAR(10) NOT NULL,
createdDate		DATETIME NOT NULL,
lastUpdatedBy			VARCHAR(10),
lastUpdatedDate			DATETIME ,		
CONSTRAINT pk_Products PRIMARY KEY(productID),
CONSTRAINT unique_Products UNIQUE(productName,categoryID),
CONSTRAINT fk_Products_CategoryID FOREIGN KEY (categoryid) REFERENCES Categories(categoryID)
);

CREATE TABLE CompareAdmin.dbo.ProductDetails (
ProductDetailsID BIGINT IDENTITY(1,1), 
productID 			INT,
vendorID			INT NOT NULL,		
productVariant		VARCHAR(500),
brandid 			SMALLINT NOT NULL,
price				DECIMAL(12,2),
priceUnits			VARCHAR(50),
registeredFrom		DATETIME,
registeredTo		DATETIME,
CONSTRAINT pk_ProductDetails PRIMARY KEY(ProductDetailsID),
CONSTRAINT unique_ProductDetails UNIQUE(productID,vendorID,productVariant),
CONSTRAINT fk_ProductDetails_productID  FOREIGN KEY (productID)  REFERENCES Products(productID),
CONSTRAINT fk_ProductDetails_vendorID FOREIGN KEY (vendorID) REFERENCES Vendors(vendorID),
CONSTRAINT fk_ProductDetails_brandID  FOREIGN KEY (brandID)  REFERENCES Brands(brandID)
);


