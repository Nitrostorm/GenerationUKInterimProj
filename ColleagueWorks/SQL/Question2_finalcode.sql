-- using humanresources.employee and sales.salesperson we are able to get the tables

SELECT E.BusinessEntityID, SP.Bonus, E.vacationhours AS 'Vacation Hours', D.Name, SalesLastYear, SalesQuota, SalesYTD, SickLeaveHours, JobTitle, HireDate, CommissionPct
FROM HumanResources.EmployeeDepartmentHistory AS EDH
INNER JOIN Sales.SalesPerson AS SP
ON SP.BusinessEntityID = EDH.BusinessEntityID
INNER JOIN HumanResources.Department AS D
ON EDH.DepartmentID = D.DepartmentID
INNER JOIN HumanResources.Employee AS E
ON EDH.BusinessEntityID = E.BusinessEntityID


ORDER BY HireDate;

/* As you can see you have only gotten the bonuses for sales department as the others were null this could either mean we do not have enough data or other departments do not receieve bonuses but
without more data we wouldnt be able to be sure */

SELECT E.BusinessEntityID, SP.Bonus, E.vacationhours AS 'Vacation Hours', D.Name, SalesLastYear, JobTitle
FROM HumanResources.EmployeeDepartmentHistory AS EDH
INNER JOIN Sales.SalesPerson AS SP
ON SP.BusinessEntityID = EDH.BusinessEntityID
INNER JOIN HumanResources.Department AS D
ON EDH.DepartmentID = D.DepartmentID
INNER JOIN HumanResources.Employee AS E
ON EDH.BusinessEntityID = E.BusinessEntityID;




-- Maybe a histogram can work thus grouping the hours but after seeing the layout of data it would not work

SELECT Vacationgroups, SUM(Bonus) AS Bonus, SUM([Vacation Hours]) As 'Vacation hours'
FROM (SELECT SP.Bonus AS Bonus, E.vacationhours AS 'Vacation Hours', 
		CASE WHEN VacationHours <= 27 THEN 'Low'
		     WHEN VacationHours <= 34 THEN 'Medium'
			 WHEN VacationHours <= 40 THEN 'High'
			 END AS Vacationgroups
FROM HumanResources.EmployeeDepartmentHistory AS EDH
INNER JOIN Sales.SalesPerson AS SP
ON SP.BusinessEntityID = EDH.BusinessEntityID
INNER JOIN HumanResources.Department AS D
ON EDH.DepartmentID = D.DepartmentID
INNER JOIN HumanResources.Employee AS E
ON EDH.BusinessEntityID = E.BusinessEntityID) AS Subquery

GROUP BY Vacationgroups;

--Trying to figure out if education level matters but not enough data 

SELECT E.BusinessEntityID, SP.Bonus, E.vacationhours AS 'Vacation Hours', JC.JobCandidateID, JCE.[Edu.Level]
FROM HumanResources.vJobCandidate AS JC
INNER JOIN Sales.SalesPerson AS SP
ON JC.BusinessEntityID = SP.BusinessEntityID
INNER JOIN HumanResources.Employee AS E
ON JC.BusinessEntityID = E.BusinessEntityID
INNER JOIN HumanResources.vJobCandidateEducation AS JCE
ON JC.JobCandidateID = JCE.JobCandidateID;

