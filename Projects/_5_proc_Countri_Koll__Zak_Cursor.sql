USE [406_Борей_Мухаматуллин]
GO
/****** Object:  StoredProcedure [dbo].[_5_proc_Countri_Koll__Zak_Cursor]    Script Date: 11/30/2020 19:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[_5_proc_Countri_Koll__Zak_Cursor]
AS

declare @Страна nvarchar(20), @Колво int--, @Message varchar

Print '__________________________________'
Print '                '
Print '|   Страна      |   Кол-во       |'
Print '__________________________________'

--Созд. курсор
declare CC CURSOR
Local
scroll
for
--Страну и кол-во  из представления
SELECT Страна FROM Представл_Страны_КолВо
--SELECT Страна, Колво FROM Представл_Страны_КолВо
--Открыть курсор
open CC
fetch next from CC into @Страна

--установили курсор в первую запись
while @@FETCH_STATUS=0

BEGIN
--Какие поля ВЫБРАТЬ из . по Возрастанию
--TOP (100) исправить ошибку "...TOP или FOR XML"
Set @Колво = (Select TOP (100) Колво From  Представл_Страны_КолВо   Where (@Страна = Страна) ORDER BY  Колво) 


--Select @Message = 'Страна: '+@Страна+', Колво: '+@Колво+'.' 
--Print @Message
Print '| '+@Страна+' |   '+str(@Колво)+' |'


fetch next from CC into @Страна
END
--Закрыть курсор
Close CC
-- Освободить память
DEALLOCATE CC