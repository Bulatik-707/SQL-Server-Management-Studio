USE [406_�����_������������]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure _6_proc_Predstavl_Cursor__Zak_Sotr_Summ
AS
declare @��� nvarchar(20), @���_�� varchar(10), @����� varchar(10)
--����. ������
declare CC CURSOR
Local scroll for
--������ � ���-��  �� �������������
SELECT �������, ���_��, ����� FROM ��_6__������_�����������__�����
--SELECT ������, ����� FROM ���������_������_�����
--������� ������
open CC
fetch next from CC into @���, @���_��, @�����
--���������� ������ � ������ ������
while @@FETCH_STATUS=0

BEGIN
--����� ���� ������� �� 
Print '���������: '+@���+' ; ���-��: '+@���_��+' ����� = ' +@�����+'.'

fetch next from CC into @���, @���_��, @�����
END
--������� ������
Close CC
-- ���������� ������
DEALLOCATE CC

