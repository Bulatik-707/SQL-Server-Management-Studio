USE [406_Test]
GO
/****** Object:  StoredProcedure [dbo].[TestProcedure1]    Script Date: 09/03/2020 12:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Созд. Проц.
ALTER proc [dbo].[TestProcedure1]
--входящие параметры 
(@CatID int, 
@ProductName varchar(100), 
@Price Money = 0)
AS
BEGIN
SET @ProductName = LTRIM(RTRIM(@ProductName))
-- добавляем новую запись
Insert into TestTable (CatID, ProductName, Price) 
values (@CatID, @ProductName, @Price) 
select * from TestTable
END