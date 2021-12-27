USE [406_Борей_Мухаматуллин]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Проц, Меняем КодПоставщика + 1
CREATE TRIGGER _4_Create_Tr_Upd_Tov
ON Товары2 For Update
AS 
Declare @code int
Select @code = i.КодТовара From Товары2 t, inserted i
Where t.КодТовара = i.КодТовара
If(@code = 10)

BEGIN
Commit tran
Print 'Изменить поставщика ' +str(@code)

Update Товары2
Set КодПоставщика = КодПоставщика+1
END

Else
Begin
Rollback tran
Print ('Измененние невозможно!!!')
end