Create Procedure plusPrice
@Par int
AS
BEGIN
UPDATE TestTable 
-- ������. �����. �� ���. ��������
Set Price = Price + ((Price*@minys_Price)/100)
Select * From TestTable
END
