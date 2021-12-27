USE [406_Борей_Мухаматуллин]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Проц. Удалить запись по коду
Create proc _3_Proc_Tr__Dell_Tov
--Принимает код
@code int
AS
Print 'Удалили товар с Кодом: ' +str(@code)
Delete From Товары2
Where @code = КодТовара