USE [406_Борей_Мухаматуллин]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER _3_Cr_Tr_Update__Zak_Pol_Zapis
ON Заказы2 
AFTER Update
AS 
BEGIN
	Set NOCOUNT ON;
If(Select СтоимостьДоставки FROM inserted) < 0
Print '!вставлять запись с ОТРИЦАТЕЛЬНОЙ Стоимостью Доставки'
ROLLBACK
END

