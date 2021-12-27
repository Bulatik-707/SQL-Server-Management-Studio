USE [406_Борей_Мухаматуллин]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure _6_proc_Koll__Zak_po_Dostavka_Cursor
AS
declare @Тип_Доставки nvarchar(20), @Кол_во varchar(10)
--Созд. курсор
declare CC CURSOR
Local scroll for
--Страну и кол-во  из представления
SELECT Тип_Доставки, Кол_во FROM Представл_6_Доставка_КолВо
--SELECT Страна, Колво FROM Представл_Страны_КолВо
--Открыть курсор
open CC
fetch next from CC into @Тип_Доставки, @Кол_во
--установили курсор в первую запись
while @@FETCH_STATUS=0

BEGIN
--Какие поля ВЫБРАТЬ из 
Print 'Тип доставки: '+@Тип_Доставки+' , Кол-во: '+@Кол_во+'.'

fetch next from CC into @Тип_Доставки,  @Кол_во
END
--Закрыть курсор
Close CC
-- Освободить память
DEALLOCATE CC