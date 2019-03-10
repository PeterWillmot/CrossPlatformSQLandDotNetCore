USE QriDemo
GO

SELECT t.name AS Type, r.name, r.geo
FROM Region r
	JOIN RegionType t ON t.typeID = r.typeID
WHERE t.name = 'Province'