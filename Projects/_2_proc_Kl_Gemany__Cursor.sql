USE [406_�����_������������]
GO
/****** Object:  StoredProcedure [dbo].[_1_proc_Kl_Gemany_Berlin__Trigger_Cursor]    Script Date: 10/16/2020 13:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc _2_proc_Kl_Gemany__Cursor
AS
declare @���������� nvarchar(5), @�������� nvarchar(40), @������ nvarchar(20), @����� nvarchar(15)

Set nocount on -- ������ ����� ������� �������.
declare CC CURSOR
Local
scroll
for
select @������ from �������3
open CC
fetch next from CC into @������

--���������� ������ � ������ ������
while @@FETCH_STATUS=0

BEGIN
--���� ������� ����, �� �������
if object_id('�_������_��������') is not null drop table �_������_�������� 

--����� ���� ������� �� �_�������
SELECT ����������, ��������, ������, �����
--��� ����� ���� / ���� ����.
INTO �_������_�������� 
From �������3
--������� ����� ������ � �����
WHERE  ������ = '��������'
fetch next from CC into @������

END

Close CC
-- ���������� ������
DEALLOCATE CC

--������� ����. �� ����� ������
select * from �_������_��������
