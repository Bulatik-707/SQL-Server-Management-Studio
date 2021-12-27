USE [406_Борей_Мухаматуллин]
GO
/****** Object:  StoredProcedure [dbo].[_1_proc_Kl_Gemany_Berlin__Trigger_Cursor]    Script Date: 10/16/2020 13:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc _2_proc_Kl_Gemany__Cursor
AS
declare @КодКлиента nvarchar(5), @Название nvarchar(40), @Страна nvarchar(20), @Город nvarchar(15)

Set nocount on -- читает число записей Автомат.
declare CC CURSOR
Local
scroll
for
select @Страна from Клиенты3
open CC
fetch next from CC into @Страна

--установили курсор в первую запись
while @@FETCH_STATUS=0

BEGIN
--Если таблица ЕСТЬ, то Удалить
if object_id('Т_Клиент_Германия') is not null drop table Т_Клиент_Германия 

--Какие поля ВЫБРАТЬ из Т_Клиенты
SELECT КодКлиента, Название, Страна, Город
--Имя новой табл / куда сохр.
INTO Т_Клиент_Германия 
From Клиенты3
--Условие какая Страна и Город
WHERE  Страна = 'Германия'
fetch next from CC into @Страна

END

Close CC
-- Освободить память
DEALLOCATE CC

--Вывести Табл. со ВСЕМИ полями
select * from Т_Клиент_Германия
