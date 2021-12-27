Create Procedure plusPrice
@Par int
AS
BEGIN
UPDATE TestTable 
-- Увелич. стоим. на зад. значение
Set Price = Price + ((Price*@minys_Price)/100)
Select * From TestTable
END
