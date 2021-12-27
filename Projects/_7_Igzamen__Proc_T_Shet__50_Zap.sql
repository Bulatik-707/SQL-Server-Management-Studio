--Создать Т_Счет (Номер_счета, Приход, Расход, Остаток, Годовой_доход, Процент)
--Заполнить 50 Записей (Номер_счета - сетчик)
--На счет каждого клиента положить сумму как Номер_счета * 1000
--Годовой_доход = [Приход * %]
--Посчитать % Годовой_доход * 12%  (если ПРИХОД > 1000 руб.)
--% Годовой_доход в новое поле ПРОЦЕНТ,  и вывести общую сумму поле Годовой_доход (Процент + приход).

USE [406_Борей_Мухаматуллин]
GO
Create proc _7_Igzamen__Proc_T_Shet__50_Zap
@Proc int 
AS

--Если таблица ЕСТЬ, то Удалить
if object_id('Т_Счет') is not null drop table Т_Счет 

--Созд. Табл, с полями
Create table Т_Счет
(Номер_счета int primary key identity(1,1),
Приход money,
Расход money,
Остаток money,
Годовой_доход money,
Процент money)

Declare @id int,  @Prihod money, @Rashod money, @Ostatok money, @God_dohod money, @Procent money

Set @id = 1 -- Ключ нач. от
While (@id < 51) --Доб 50 записей

--Заполняем поля Табл_
BEGIN
Set @Prihod = @id * 1000
SET @Rashod = 0
SET @Ostatok = 0--@Prihod - @Rashod

--Год_доход
--Set @God_dohod = @Prihod + @Prihod  * 0.12  + @Procent
Set @God_dohod = @Prihod + @Prihod  * (@Proc / 100.0)  + @Procent

--ПРОЦЕНТ
If(@Prihod > 1000) Set @Procent = (@God_dohod / 100.0)  --(@Proc / 100)  
ELSE SET @Procent = 0

--Доб. в табл (поле - значение)
insert into Т_Счет(Приход, Расход, Остаток, Годовой_доход, Процент)
  values (@Prihod, @Rashod, @Ostatok, @God_dohod, @Procent)
 
 Set @id = @id+1 --Id_записи четчик
 Continue
END

SELeCT * FROM Т_Счет
