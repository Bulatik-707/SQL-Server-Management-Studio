--Create Proc Proc_Exe
--AS
--������� ���������
--Execute proc_Exe_Dolznost__Tr_Cursor

Create procedure _1_proc_Exe_Dolznost__Tr_Cursor
--"�������� ���������" �������������2 -> �������������
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

UPDATE  �������3 SET ��������� = '�������������'
WHERE ��������� = '�������������2'
PRINT '�������������2 ������� �� �������������';

fetch next from CC into @���������
END

Close CC
-- ���������� ������
DEALLOCATE CC
select * from �������3