USE [406_Борей_Мухаматуллин]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Процедура, копир. Т_Товары
Create proc _2_Proc_Copy_Tovar2
AS
BEGIN

Select * into Товары2
From Товары
END
