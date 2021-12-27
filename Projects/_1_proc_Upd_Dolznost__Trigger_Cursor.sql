--USE [406_Борей_Мухаматуллин]
--GO
/****** Object:  StoredProcedure [dbo].[proc_Upd_Dolznost__Trigger_Cursor2]    Script Date: 10/15/2020 10:44:56 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

Create procedure _1_proc_Upd_Dolznost__Trigger_Cursor
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

UPDATE  Клиенты3 SET Должность = 'Представитель2'
WHERE Должность = 'Представитель'
PRINT 'Представитель заменен на Представитель2';

fetch next from CC into @Должность
END

Close CC
-- Освободить память
DEALLOCATE CC

select * from Клиенты3