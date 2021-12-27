--Процедера выводит ОбращатьсяК, Страна, Город, Адрес
--Из Т_Клиенты (ТЕХ КТО ЖИВЕТ ВО Франция)
Create proc _3_proc_Kl_France__Cursor__Message
AS
declare @КодКлиента varchar(5), @ОбращатьсяК varchar(30),
 @Страна varchar(20), @Город varchar(15), 
 @Адрес varchar(60), @Message varchar(100)
 
 --char(13) / Print '' - ПЕРЕНОС СТРОКИ
Print 'Клиенты из Франции:'+char(13)
Set nocount on -- читает число записей Автомат.
declare CC CURSOR
Local
scroll
for
--Откуда, что брать
select ОбращатьсяК, Страна, Город, Адрес from Клиенты3
WHERE  Страна = 'Франция' 
Order by ОбращатьсяК, Страна, Город, Адрес

open CC
fetch next from CC into @ОбращатьсяК, @Страна, @Город, @Адрес

--установили курсор в первую запись
while @@FETCH_STATUS=0

BEGIN
--Если таблица ЕСТЬ, то Удалить
----if object_id('Т_Клиент_Франция') is not null drop table Т_Клиент_Франция 
--Какие поля ВЫБРАТЬ из Т_Клиенты
----SELECT КодКлиента, Название, Страна, Город
--Имя новой табл / куда сохр.
----INTO Т_Клиент_Франция 
----From Клиенты3

--Какие поля ВЫБРАТЬ из Т_Клиенты
Select @Message = 'Клиент: '+@ОбращатьсяК+', Город: '+@Город+', Адрес: '+@Адрес+'.' 
Print @Message

fetch next from CC into @ОбращатьсяК, @Страна,@Город, @Адрес
END

Close CC
-- Освободить память
DEALLOCATE CC
--char(13) / Print '' - ПЕРЕНОС СТРОКИ
Print char(13)+'Клиенты НЕ из франции:'+char(13)

declare CC2 CURSOR
Local
scroll
for
--Откуда, что брать
select ОбращатьсяК, Страна, Город, Адрес from Клиенты3

--Если НЕ <>  Франция
WHERE  Страна <> 'Франция' 

Order by ОбращатьсяК, Страна, Город, Адрес

open CC2
fetch next from CC2 into @ОбращатьсяК, @Страна, @Город, @Адрес
--установили курсор в первую запись
while @@FETCH_STATUS=0

BEGIN
--Какие поля ВЫБРАТЬ из Т_Клиенты
Select @Message = 'Страна: '+@Страна+', Город: '+@Город +
', Клиент: '+@ОбращатьсяК+', Адрес: '+@Адрес+'.'
Print @Message

fetch next from CC2 into @ОбращатьсяК, @Страна,@Город, @Адрес
END
Close CC2
-- Освободить память
DEALLOCATE CC2