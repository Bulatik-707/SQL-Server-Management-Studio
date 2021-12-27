USE [406_Борей_Мухаматуллин]
GO

--2 Создаем триггер в Т_Товары2

Create Trigger _22_tr_upd_Tovar
ON Товары2 
For UPDATE
AS

DECLARE @Tov nvarchar(20), @Code int
SELECT @Tov = i.Марка, @Code = i.КодТовара 
From Товары2 t, inserted i
Where t.КодТовара = i.КодТовара

IF @Tov = 'Pavlova'

BEGIN
Commit Tran
Update Товары2 Set КодПоставщика = КодПоставщика + 7
Where КодТовара = @Code

--Print concat('Транзакция выполнена в записи ')
Print 'Транзакция выполнена в записи '
--, @Code)
END
ELSE
Begin

ROLLBACK Tran
--Print concat('ROLLBACK - откат транзакции ')--, @Code)
Print 'ROLLBACK - откат транзакции '
END
