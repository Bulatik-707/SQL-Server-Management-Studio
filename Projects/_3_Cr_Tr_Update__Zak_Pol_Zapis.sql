USE [406_�����_������������]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER _3_Cr_Tr_Update__Zak_Pol_Zapis
ON ������2 
AFTER Update
AS 
BEGIN
	Set NOCOUNT ON;
If(Select ����������������� FROM inserted) < 0
Print '!��������� ������ � ������������� ���������� ��������'
ROLLBACK
END

