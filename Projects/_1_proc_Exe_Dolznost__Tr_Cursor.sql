--Create Proc Proc_Exe
--AS
--Вызвать процедуру
--Execute proc_Exe_Dolznost__Tr_Cursor

Create procedure _1_proc_Exe_Dolznost__Tr_Cursor
--"Отменяем изменения" Представитель2 -> Представитель
AS
declare @КодКлиента nvarchar(5), @Название nvarchar(40), @Должность nvarchar(30)
--Set nocount on -- читает число записей Автомат.
declare CC CURSOR
Local
scroll
for
select @Должность from Клиенты3
open CC
fetch next from CC into @Должность 
--установили курсор в первую запись
while @@FETCH_STATUS=0

BEGIN

UPDATE  Клиенты3 SET Должность = 'Представитель'
WHERE Должность = 'Представитель2'
PRINT 'Представитель2 заменен на Представитель';

fetch next from CC into @Должность
END

Close CC
-- Освободить память
DEALLOCATE CC
select * from Клиенты3