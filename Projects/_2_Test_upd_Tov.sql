USE [406_Борей_Мухаматуллин]
GO
--3
Create Proc _2_Test_upd_Tov

@Code int, @Mark nvarchar(20)
AS
Update Товары_Н
SET Марка = @Mark
WHERE КодТовара = @Code