USE [406_Борей_Мухаматуллин]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER _3_Cr_Tr_Delete__Zak_Stoim_Dostavki_menee
ON Заказы2 
AFTER Delete
AS 
BEGIN
	Set NOCOUNT ON;
If(Select СтоимостьДоставки FROM deleted) >='50000'
Print 'НЕЛЬЗЯ удалять запись,Стоимость Доставки которых > 50К'
ROLLBACK
END
