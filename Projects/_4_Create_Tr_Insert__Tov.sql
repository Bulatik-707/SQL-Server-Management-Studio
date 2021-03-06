USE [406_Борей_Мухаматуллин]
GO
/****** Object:  Trigger [dbo].[_3_Create_Tr_Insert__Tov]    Script Date: 10/23/2020 12:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Запретить вставлять запись о Товаре (Товары2)  если Цена < 200, 
--Иначе добавляет
Create TRIGGER _4_Create_Tr_Insert__Tov
ON Товары2
After insert
AS
--Принимаем Код, Имя, Цена
Declare @code int, @name varchar(50), @price money
--Привязка
Select @code = i.КодТовара, @name = i.Марка, @price = i.Цена
From Товары2 t, inserted i
 
Where t.КодТовара = i.КодТовара
If(Select Цена from inserted) < '200'

BEGIN 
--Если НЕТ, откат
ROLLBACK TRAN
Print 'Нельзя вставлять запись о Товаре с Ценой < 200'
END
--Если успешно
Else 
Begin
Print ('Добавили товар: ' +@name)
End