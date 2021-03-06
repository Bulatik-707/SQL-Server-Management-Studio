USE [406_Борей_Мухаматуллин]
GO
/****** Object:  StoredProcedure [dbo].[_1_proc_Kl_Gemany_Berlin__Trigger_Cursor]    Script Date: 10/16/2020 12:30:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc _1_proc_Kl_Gemany_Berlin__Trigger_Cursor
AS
declare @КодКлиента nvarchar(5), @Название nvarchar(40), @Страна nvarchar(20), @Город nvarchar(15), @Kol int

Set nocount on -- читает число записей Автомат.
declare CC CURSOR
Local
scroll
for
select @Страна, @Город from Клиенты3
open CC
fetch next from CC into @Страна,  @Город

--установили курсор в первую запись
while @@FETCH_STATUS=0

BEGIN
--Если таблица ЕСТЬ, то Удалить
if object_id('Т_Клиент_Берлин') is not null drop table Т_Клиент_Берлин 

--Какие поля ВЫБРАТЬ из Т_Клиенты
SELECT КодКлиента, Название, Страна, Город
--Имя новой табл / куда сохр.
INTO Т_Клиент_Берлин 
From Клиенты3

--Условие какая Страна и Город
WHERE  Страна = 'Германия' and Город = 'Берлин' 

--Кол-во запиисей по полю Город - COUNT(Город) / COUNT(*) - ВСЕ поля
Select @Kol = COUNT(*) From Т_Клиент_Берлин


fetch next from CC into @Страна, @Город

END

Close CC
-- Освободить память
DEALLOCATE CC

--Вывести Табл. со ВСЕМИ полями
select * from Т_Клиент_Берлин

Print 'В Германии, г. Берлине живут '+cast(@Kol as varchar(10))+ ' клиент(та/тов).'