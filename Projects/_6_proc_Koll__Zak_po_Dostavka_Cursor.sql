USE [406_�����_������������]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure _6_proc_Koll__Zak_po_Dostavka_Cursor
AS
declare @���_�������� nvarchar(20), @���_�� varchar(10)
--����. ������
declare CC CURSOR
Local scroll for
--������ � ���-��  �� �������������
SELECT ���_��������, ���_�� FROM ���������_6_��������_�����
--SELECT ������, ����� FROM ���������_������_�����
--������� ������
open CC
fetch next from CC into @���_��������, @���_��
--���������� ������ � ������ ������
while @@FETCH_STATUS=0

BEGIN
--����� ���� ������� �� 
Print '��� ��������: '+@���_��������+' , ���-��: '+@���_��+'.'

fetch next from CC into @���_��������,  @���_��
END
--������� ������
Close CC
-- ���������� ������
DEALLOCATE CC