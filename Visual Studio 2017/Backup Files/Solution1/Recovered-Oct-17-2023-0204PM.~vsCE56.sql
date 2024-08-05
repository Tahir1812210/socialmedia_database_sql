SELECT VehicleTemperatureID,
Temperature AS Celcius,
Temperature * 1.8 + 32 AS Fahreinheit
From Warehouse.VehicleTemperatures;

CREATE FUNCTION Warehouse.Fahreinheit (@Celcius decimal(10,2))
RETURNS decimal (10,2)
AS 
BEGIN
	DECLARE @Fahreinheit decimal(10,2);
	SET @Fahreinheit = (@Celcius * 1.8 + 32);
	RETURN @Fahreinheit;
END

SELECT VehicleTemperatureID,
Temperature AS Celcius,
Warehouse.Fahreinheit(Temperature) AS Fahreinheit
FROM Warehouse.VehicleTemperatures;