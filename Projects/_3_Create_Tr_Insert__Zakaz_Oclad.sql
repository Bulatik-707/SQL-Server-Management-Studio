USE [406_�����_������������]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--��������� ��������� ������ � ���������� � �_������ ���� ����������������� < 20�
Create TRIGGER _3_Create_Tr_Insert__Zakaz_Oclad 
ON ������2
After insert
AS
BEGIN                              
Set NOCOUNT ON;
If(Select ����������������� from inserted) > '20000'
ROLLBACK
Print '������ ��������� ������ � ���������� � ������� < 20�'
END
