Create proc Proc_Create_T_Shet(

@SUM int) -- Вводим сумму при зап. процедуры
AS 
/*
-- ПРОВЕРКА, ЕСТЬ Табл. / НЕТ
If not exists (select * from SYSOBJECTS Where name = 'T_Shet' AND xtype = 'U')
Print 'Таблицы  НЕТ'
Else 
Print 'Таблица СОЗДАНА';
*/
Set NOCOUNT ON;
-- Если есть удаляем старую и создаем снова, для доб. новой суммы
IF(OBJECT_ID(N'dbo.T_Shet', N'U') is not NULL)
BEGIN 
Drop table T_Shet
END

--Создаем табл. (с полями)
create table T_Shet(
ID_Sheta__Sh int primary key,
Vhod_Sum__Sh int,
Prihod__Sh int,
Rashod__Sh int,
Ostatok__Sh int,)

Declare @a int, @Vhod_Sum int, @Prihod int, @Rashod int, @Ostatok int
Set @a = 1 -- Ключ нач. от
While (@a < 51) --Доб 50 записей

BEGIN
Set @Vhod_Sum = @a * @SUM

--Update T_Shet Set Prihod__Sh = 5000 Where Vhod_Sum__Sh < 4000 
--Заполняем поле ПРИХОД
 If(@Vhod_Sum < 4000) Set @Prihod = 5000
Else Set @Prihod = 3000

--Доб. в табл (поле - значение)
insert into T_Shet(ID_Sheta__Sh, Vhod_Sum__Sh, Prihod__Sh, Rashod__Sh, Ostatok__Sh)
  values (@a, @Vhod_Sum, @Prihod, @Rashod, @Ostatok)
 
 
Set @a = @a+1 --Id_записи четчик
Continue
END
