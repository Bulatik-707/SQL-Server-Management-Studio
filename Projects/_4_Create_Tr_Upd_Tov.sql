USE [406_�����_������������]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--����, ������ ������������� + 1
CREATE TRIGGER _4_Create_Tr_Upd_Tov
ON ������2 For Update
AS 
Declare @code int
Select @code = i.��������� From ������2 t, inserted i
Where t.��������� = i.���������
If(@code = 10)

BEGIN
Commit tran
Print '�������� ���������� ' +str(@code)

Update ������2
Set ������������� = �������������+1
END

Else
Begin
Rollback tran
Print ('���������� ����������!!!')
end