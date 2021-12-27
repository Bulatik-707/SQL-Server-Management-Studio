USE [406_Борей_Мухаматуллин]
GO


Create proc _7_Proc_T_Stoim_Dost

@Procent int 
AS
if object_id('T_Stoim_Dost') is not null drop table T_Stoim_Dost 

CREATE TABLE T_Stoim_Dost(
	Код_Заказа int NOT NULL,
	Стоимость_Доставки money NULL,
	Новая_Стоимость money NULL,)
	

Insert into T_Stoim_Dost(Код_Заказа, Стоимость_Доставки) 
Select КодЗаказа, СтоимостьДоставки 
From Заказы2
--
DECLARE @id int, @StoimDost money, @NewStoim money


declare CC CURSOR
Local scroll for
SELECT Код_Заказа, Стоимость_Доставки, Новая_Стоимость FROM T_Stoim_Dost


open CC
fetch next from CC into @id, @StoimDost, @NewStoim
while @@FETCH_STATUS=0


BEGIN 
SET @StoimDost = (Select Стоимость_Доставки From T_Stoim_Dost 
WHERE Код_Заказа = @id)

Update T_Stoim_Dost Set Новая_Стоимость = @StoimDost + (@StoimDost / 100 * @Procent)

--Declare @Mes nvarchar(100) = 'Стоимость Доставки ' +str(@StoimDost) +''

--параметры
fetch next from CC into @id, @StoimDost, @NewStoim
END
--Print @Mes
--Закрыть курсор
Close CC
-- Очистить память
DEALLOCATE CC


--Вывести Табл. со ВСЕМИ полями
select * from T_Stoim_Dost
