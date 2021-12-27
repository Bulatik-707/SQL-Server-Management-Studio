USE [406_Борей_Мухаматуллин]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure _6_proc_Predstavl_Cursor__Zak_Sotr_Summ
AS
declare @Фам nvarchar(20), @Кол_во varchar(10), @Сумма varchar(10)
--Созд. курсор
declare CC CURSOR
Local scroll for
--Страну и кол-во  из представления
SELECT Фамилия, Кол_во, Сумма FROM Пр_6__Заказы_Сотрудников__Сумма
--SELECT Страна, Колво FROM Представл_Страны_КолВо
--Открыть курсор
open CC
fetch next from CC into @Фам, @Кол_во, @Сумма
--установили курсор в первую запись
while @@FETCH_STATUS=0

BEGIN
--Какие поля ВЫБРАТЬ из 
Print 'Сотрудник: '+@Фам+' ; Кол-во: '+@Кол_во+' Сумма = ' +@Сумма+'.'

fetch next from CC into @Фам, @Кол_во, @Сумма
END
--Закрыть курсор
Close CC
-- Освободить память
DEALLOCATE CC

