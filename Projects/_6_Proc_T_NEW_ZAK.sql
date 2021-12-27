USE [406_Борей_Мухаматуллин]
GO
--Создать Т_Новые_заказы с полем new_Zak, Тригер выводящий СМС, 
--Если стоимость <100, то + 5%, и записать в новое поле табл.
-- «Стоимость была А, стало В»

Create proc _6_Proc_T_NEW_ZAK
AS
--Если таблица ЕСТЬ, то Удалить
if object_id('T_new_Zak') is not null drop table T_new_Zak 

--Созд. Таблицу, с полями
CREATE TABLE T_new_Zak(
	id int NOT NULL,
	СтоимостьДоставки money NULL,
	НоваяСтоимость money NULL,)
	
--Зап. Табл. (Поля), Полями из Таблицы 	
Insert into T_new_Zak(id, СтоимостьДоставки) 
Select КодЗаказа, СтоимостьДоставки 
From Заказы2
--
DECLARE @id int, @StoimDost money, @NewStoim money

--Созд. курсор
declare CC CURSOR
Local scroll for
--Что, откуда
SELECT id, СтоимостьДоставки, НоваяСтоимость FROM T_new_Zak

--Открыть курсор
open CC
--параметры
fetch next from CC into @id, @StoimDost, @NewStoim
--установили курсор в первую запись
while @@FETCH_STATUS=0


BEGIN 
SET @StoimDost = (Select СтоимостьДоставки From T_new_Zak 
WHERE id = @id)

IF (@StoimDost < 100)
Begin 
--Если стоимость < 100, то + 5%
--Обновляем табл, и зап. в поле (НоваяСтоимость) данные, Если код =
Update T_new_Zak Set НоваяСтоимость = @StoimDost + (@StoimDost / 100 * 5)
 Where id = @id
End

ELSE
Begin
--Обновляем табл, НоваяСтоимость не меняется 
Update T_new_Zak Set НоваяСтоимость = @StoimDost Where id = @id
--СМС
Declare @Mes nvarchar(100) = 'Стоимость Доставки ' +str(@StoimDost) +' > 100'
End
Print @Mes
--параметры
fetch next from CC into @id, @StoimDost, @NewStoim
END

--Закрыть курсор
Close CC
-- Очистить память
DEALLOCATE CC


--Вывести Табл. со ВСЕМИ полями
--select * from T_new_Zak

