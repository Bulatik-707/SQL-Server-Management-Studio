USE [406_�����_������������]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--����. ���������� ������ 
Create proc _3_Proc_Tr__Insert_Tov
--������ ���, �����, ����
@code int, @name varchar(50), @price money
AS
Insert into ������2(���������, �����, ����) values(@code, @name, @price)