USE [406_Борей_Мухаматуллин]
GO
/****** Object:  StoredProcedure [dbo].[Barey__Proc_Create_T_Skidki]    Script Date: 09/05/2020 13:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- проц. созд. Табл.
Create proc [dbo].[Barey__Proc_Create_T_Skidki]
AS
--  Имя табл и поля тип
Create table Т_Скидки(
Клиент varchar(5),
Скидка float,
Кол int)
