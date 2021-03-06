USE [406_Борей_Мухаматуллин]
GO
/****** Object:  Trigger [dbo].[_3_Create_Tr_Delete__Tov]    Script Date: 10/23/2020 13:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create TRIGGER _4_Create_Tr_Delete__Tov
ON Товары2
AFTER Delete
AS 
--Объявляем переменые
Declare @code int, @name varchar(50), @price money
--Привязка
Select @code = i.КодТовара, @name = i.Марка, @price = i.Цена
From Товары2 t, inserted i
Where t.КодТовара = i.КодТовара
Print @name

If(Select Цена FROM deleted) >='5000'

BEGIN
--Откат
ROLLBACK Tran
Print 'НЕЛЬЗЯ удалять запись,Цена которых > 5К'
END

Else 
Begin
--Если успешно
COMMIT 
Print 'Удалили товар: '+@name +str(@code)
End

