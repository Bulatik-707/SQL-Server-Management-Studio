USE [406_�����_������������]
GO
/****** Object:  Trigger [dbo].[_3_Tr_Upd_Tovar]    Script Date: 10/23/2020 12:01:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create TRIGGER _3_Create_Tr_Upd_Tovar
ON ������2 
For Update
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