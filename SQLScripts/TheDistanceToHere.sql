USE QriDemo
GO

IF NOT EXISTS(SELECT 1 FROM QRIGeoSpatialInfoSource.dbo.Airports WHERE city = 'Reykjavik') INSERT QRIGeoSpatialInfoSource.dbo.Airports(city, lon, lat) VALUES('Reykjavik', -22.625723, 63.998562)

SELECT * FROM QRIGeoSpatialInfoSource.dbo.Airports

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'Airports') DROP TABLE Airports
GO

CREATE TABLE Airports
(
	city VARCHAR(MAX)
	, location GEOGRAPHY
)
GO

INSERT Airports(city, location)
SELECT city, 'POINT(' + CAST(lon AS VARCHAR(MAX)) + ' ' + CAST(lat AS VARCHAR(MAX)) + ')'
FROM QRIGeoSpatialInfoSource.dbo.Airports


DECLARE @reyk GEOGRAPHY
SELECT @reyk = location FROM Airports WHERE city = 'Reykjavik'

SELECT city, CAST((location.STDistance(@reyk) / 1000) AS INTEGER) AS 'KMs'
FROM Airports
WHERE city <> 'Reykjavik'