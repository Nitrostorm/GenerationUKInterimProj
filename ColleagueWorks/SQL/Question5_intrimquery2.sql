Select Avg([SalesYTD])As Avg_Sales,[CountryRegionCode]
FROM [Sales].[SalesTerritory]
GROUP BY CountryRegionCode,SalesYTD