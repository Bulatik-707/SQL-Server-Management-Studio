USE [406_Борей_Мухаматуллин]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Запретить вставлять запись о сотруднике в Т_Заказы если СтоимостьДоставки < 20К
Create TRIGGER _3_Create_Tr_Insert__Zakaz_Oclad 
ON Заказы2
After insert
AS
BEGIN                              
Set NOCOUNT ON;
If(Select СтоимостьДоставки from inserted) > '20000'
ROLLBACK
Print 'Нельзя вставлять запись о сотруднике с окладом < 20К'
END
