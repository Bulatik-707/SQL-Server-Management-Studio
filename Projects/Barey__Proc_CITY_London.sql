Create proc Proc_CITY_London
AS
Declare @Firm varchar(10), @Fam varchar(20), @Message varchar(100)
-- KODEs
--Список клиентов в Лондоне
Select 'Клиент: ' +@Fam + 'Фирма: '
Print @Message 
-- ЭТО В ТАБЛ
Print 'Список клиентов'
DEclare Cursor_Klient cursor Local for
Select Название, ОбращатьсяК
From Клиенты
-- 
Where Город = 'Лондон'
Order by Название, ОбращатьсяК
Open Cursor_Klient fetch next from Cursor_Klient
into @Firm, @Fam
While @@FETCH_STATUS = 0
-- СМС в 100 символов
BEGIN 
Select @Message = 'Клиент ' +@Fam + ' Фирма: '+@Firm
Print @message
Fetch next from Cursor_Klient
into @Firm, @Fam
END
--Очистить память
Close Cursor_Klient 
deallocate Cursor_Klient