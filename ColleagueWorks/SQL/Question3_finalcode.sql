
--CHARLES
SELECT CASE WHEN ST.CountryRegionCode = 'DE' THEN 'Germany'
			WHEN ST.CountryRegionCode = 'FR' THEN 'France'
			WHEN ST.CountryRegionCode = 'GB' THEN 'United Kingdom'
			WHEN ST.CountryRegionCode = 'AU' THEN 'Australia'
			WHEN ST.CountryRegionCode = 'CA' THEN 'Canada' 
			WHEN ST.CountryRegionCode = 'US' THEN 'United States'
			END AS Country,
	SUM(SOD.OrderQTY) AS Order_Quantity,
	SUM(SOD.OrderQTY * SOD.UnitPrice) AS Revenue 

FROM Sales.SalesTerritory AS ST
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOH.TerritoryID = ST.TerritoryID
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
Group BY CountryRegionCode
;
-- BASIL
SELECT TOP (1000)
Count(CountryRegionName) as stores
      ,[CountryRegionName]
  FROM [AdventureWorks2019].[Sales].[vStoreWithAddresses]

  group by CountryRegionName

-- BASIL, creating a view based on the previous above query to join to other view

  CREATE VIEW Stores AS 
  SELECT TOP (1000)
Count(CountryRegionName) as stores
      ,[CountryRegionName]
  FROM [AdventureWorks2019].[Sales].[vStoreWithAddresses]

  group by CountryRegionName;

-- BASIL, creating charles' code into a view 
CREATE VIEW Revenue AS
SELECT CASE WHEN ST.CountryRegionCode = 'DE' THEN 'Germany'
			WHEN ST.CountryRegionCode = 'FR' THEN 'France'
			WHEN ST.CountryRegionCode = 'GB' THEN 'United Kingdom'
			WHEN ST.CountryRegionCode = 'AU' THEN 'Australia'
			WHEN ST.CountryRegionCode = 'CA' THEN 'Canada' 
			WHEN ST.CountryRegionCode = 'US' THEN 'United States'
			END AS Country,
	SUM(SOD.OrderQTY) AS Order_Quantity,
	SUM(SOD.OrderQTY * SOD.UnitPrice) AS Revenue 

FROM Sales.SalesTerritory AS ST
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOH.TerritoryID = ST.TerritoryID
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
Group BY CountryRegionCode
;

-- BASIL, joining the 2 views into one for easier access

  SELECT Country, stores, Order_Quantity, Revenue
  FROM Stores AS S
  INNER JOIN Revenue AS R
  ON CountryRegionName = Country;

  CREATE VIEW S_R AS
  SELECT Country, stores, Order_Quantity, Revenue
  FROM Stores AS S
  INNER JOIN Revenue AS R
  ON CountryRegionName = Country;