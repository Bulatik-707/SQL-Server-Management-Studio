USE [406_�����_������������]
GO

--2 ������� ������� � �_������2

Create Trigger _22_tr_upd_Tovar
ON ������2 
For UPDATE
AS

DECLARE @Tov nvarchar(20), @Code int
SELECT @Tov = i.�����, @Code = i.��������� 
From ������2 t, inserted i
Where t.��������� = i.���������

IF @Tov = 'Pavlova'

BEGIN
Commit Tran
Update ������2 Set ������������� = ������������� + 7
Where ��������� = @Code

--Print concat('���������� ��������� � ������ ')
Print '���������� ��������� � ������ '
--, @Code)
END
ELSE
Begin

ROLLBACK Tran
--Print concat('ROLLBACK - ����� ���������� ')--, @Code)
Print 'ROLLBACK - ����� ���������� '
END
