USE [406_�����_������������]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--��������� �������� �����, �� ����
Create proc _3_Proc_Tr__Upd_Tov
@code int
AS
Update ������2
SET ������������� = �������������+1
WHERE ��������� = @code