--USE [406_�����_������������]
--GO
/****** Object:  StoredProcedure [dbo].[proc_Upd_Dolznost__Trigger_Cursor2]    Script Date: 10/15/2020 10:44:56 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

Create procedure _1_proc_Upd_Dolznost__Trigger_Cursor
AS
declare @���������� nvarchar(5), @�������� nvarchar(40), @��������� nvarchar(30)


--Set nocount on -- ������ ����� ������� �������.
declare CC CURSOR
Local
scroll
for
select @��������� from �������3
open CC
fetch next from CC into @��������� 

--���������� ������ � ������ ������
while @@FETCH_STATUS=0

BEGIN

UPDATE  �������3 SET ��������� = '�������������2'
WHERE ��������� = '�������������'
PRINT '������������� ������� �� �������������2';

fetch next from CC into @���������
END

Close CC
-- ���������� ������
DEALLOCATE CC

select * from �������3