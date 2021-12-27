USE [406_Борей_Мухаматуллин]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Проц. Добавления товара 
Create proc _3_Proc_Tr__Insert_Tov
--Вводим код, марка, Цена
@code int, @name varchar(50), @price money
AS
Insert into Товары2(КодТовара, Марка, Цена) values(@code, @name, @price)