USE [406_�����_������������]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--����. ������� ������ �� ����
Create proc _3_Proc_Tr__Dell_Tov
--��������� ���
@code int
AS
Print '������� ����� � �����: ' +str(@code)
Delete From ������2
Where @code = ���������