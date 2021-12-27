USE [406_Борей_Мухаматуллин]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Прощедура Обновлем товар, по КОДУ
Create proc _3_Proc_Tr__Upd_Tov
@code int
AS
Update Товары2
SET КодПоставщика = КодПоставщика+1
WHERE КодТовара = @code