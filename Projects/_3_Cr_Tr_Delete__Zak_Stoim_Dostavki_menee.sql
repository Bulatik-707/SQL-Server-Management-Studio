USE [406_�����_������������]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER _3_Cr_Tr_Delete__Zak_Stoim_Dostavki_menee
ON ������2 
AFTER Delete
AS 
BEGIN
	Set NOCOUNT ON;
If(Select ����������������� FROM deleted) >='50000'
Print '������ ������� ������,��������� �������� ������� > 50�'
ROLLBACK
END
