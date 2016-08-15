INSERT INTO CompareAdmin.dbo.ParentCategories(parentCategoryName) VALUES('Mobiles');
INSERT INTO CompareAdmin.dbo.ParentCategories(parentCategoryName) VALUES('Tablets & Laptops');
INSERT INTO CompareAdmin.dbo.ParentCategories(parentCategoryName) VALUES('Home Appliances');
INSERT INTO CompareAdmin.dbo.ParentCategories(parentCategoryName) VALUES('Entertainment');



INSERT INTO CompareAdmin.dbo.Categories(categoryName,parentCategoryName,createdBy,createdDate) VALUES('MobilePhones','Mobiles','sakha',SYSDATETIME());
INSERT INTO CompareAdmin.dbo.Categories(categoryName,parentCategoryName,createdBy,createdDate) VALUES('Tablets','Tablets & Laptops','sakha',SYSDATETIME());
INSERT INTO CompareAdmin.dbo.Categories(categoryName,parentCategoryName,createdBy,createdDate) VALUES('Laptops','Tablets & Laptops','sakha',SYSDATETIME());
INSERT INTO CompareAdmin.dbo.Categories(categoryName,parentCategoryName,createdBy,createdDate) VALUES('WashingMachine','Home Appliances','sakha',SYSDATETIME());
INSERT INTO CompareAdmin.dbo.Categories(categoryName,parentCategoryName,createdBy,createdDate) VALUES('Books','Entertainment','sakha',SYSDATETIME());







