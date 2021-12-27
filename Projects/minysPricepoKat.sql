ALTER procedure [dbo].[minysPricepoKat]
(@minys_Price int,
@katID int)
AS
BEGIN 
Update TestTable
Set Price = Price - ((Price*@minys_Price)/100)
where CatID=@katID;
select * from TestTable
END