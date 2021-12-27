/* 
Создать табл (1я степень числа, 2, 3, 4)
Цикл while от 1-51 (50 записей) 2 в 3 = 2*2*2
*/

Create proc Proc_9
/*If OBJECT_ID (N'Т_Степень', 'U')IS null;  Print 'Таблицы НЕТ'; Else Print 'Есть';  */

AS 
-- ПРОВЕРКА, ЕСТЬ Табл. / НЕТ
If not exists (select * from SYSOBJECTS Where name = 'Т_Степень' AND xtype = 'U')
Print 'Таблицы Т_Степень НЕТ'
Else 
Print 'Таблица Т_Степень СОЗДАНА';

create table Т_Степень(
Число int primary key,
Квадрат int not null,
Куб int not null,
Четв_Ст int not null,)

Declare @a int, @Квадрат int, @Куб int, @Четв_Ст int;
Set @a=1
While (@a < 51)
BEGIN
Set @Квадрат = @a*@a; Set @Куб = @a*@a*@a; Set @Четв_Ст = @a*@a*@a*@a

insert into Т_Степень(Число, Квадрат, Куб, Четв_Ст) values (@a, @Квадрат, @Куб, @Четв_Ст)
Set @a = @a+1
Continue
END