USE [406_Борей_Мухаматуллин]
GO
--Create proc _7_Proc_Cl_Zak_Cost
--AS
--Если таблица ЕСТЬ, то Удалить
if object_id('T_Cl_Zak_Cost') is not null drop table T_Cl_Zak_Cost

--Созд. Таблицу, с полями
CREATE TABLE T_Cl_Zak_Cost(
	id_Zak int NOT NULL,
	id_Kl nvarchar(5) NOT NULL,
	StoimDost money NULL,
	Adres_Pol nvarchar(60) NULL,)
	
--Зап. Табл. (Поля), Полями из Таблицы 	
Insert into T_Cl_Zak_Cost(id_Zak, id_Kl,  StoimDost, Adres_Pol) 
Select КодЗаказа, КодКлиента, СтоимостьДоставки, АдресПолучателя From Заказы2 
--
DECLARE @id_Zak int, @id_Kl nvarchar(5), @StoimDost money, @Adres_Pol nvarchar(60)

--Созд. курсор
declare CC CURSOR
Local scroll for
--Что, откуда
SELECT id_Zak, id_Kl, StoimDost, Adres_Pol FROM T_Cl_Zak_Cost

--Открыть курсор
open CC
--параметры
fetch next from CC into @id_Zak, @id_Kl, @StoimDost, @Adres_Pol
--установили курсор в первую запись
while @@FETCH_STATUS=0

BEGIN 

Print 'код клиента: '+str(@id_Zak) +'; код заказа: '+@id_Kl +';'+char(13)+
' стоим. доставки: '+str(@StoimDost)+'; адрес получателя: '+@Adres_Pol +'.'+char(13)

fetch next from CC into @id_Zak, @id_Kl, @StoimDost, @Adres_Pol
END
--Закрыть курсор
Close CC
-- Очистить память
DEALLOCATE CC

--Вывести Табл. со ВСЕМИ полями
select * from T_Cl_Zak_Cost
