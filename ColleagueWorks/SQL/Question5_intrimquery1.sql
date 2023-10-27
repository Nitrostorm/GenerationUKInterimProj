SELECT  
      SSWD.BusinessEntityID, 
	  SSWD.Name AS StoreName,
	  SSWD.AnnualSales,
	  SSWD.YearOpened,
	  SSWD.NumberEmployees,
	  SSWD.AnnualRevenue,
	  (2019-SSWD.YearOpened) AS TradingDurationYears,
	  SSWA.CountryRegionName
FROM Sales.vStoreWithDemographics AS SSWD
INNER JOIN Sales.vStoreWithAddresses AS SSWA 
      ON SSWD.BusinessEntityID= SSWA.BusinessEntityID
ORDER BY  TradingDurationYears desc;