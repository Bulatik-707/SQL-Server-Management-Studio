--��������� ������� �����������, ������, �����, �����
--�� �_������� (��� ��� ����� �� �������)
Create proc _3_proc_Kl_France__Cursor__Message
AS
declare @���������� varchar(5), @����������� varchar(30),
 @������ varchar(20), @����� varchar(15), 
 @����� varchar(60), @Message varchar(100)
 
 --char(13) / Print '' - ������� ������
Print '������� �� �������:'+char(13)
Set nocount on -- ������ ����� ������� �������.
declare CC CURSOR
Local
scroll
for
--������, ��� �����
select �����������, ������, �����, ����� from �������3
WHERE  ������ = '�������' 
Order by �����������, ������, �����, �����

open CC
fetch next from CC into @�����������, @������, @�����, @�����

--���������� ������ � ������ ������
while @@FETCH_STATUS=0

BEGIN
--���� ������� ����, �� �������
----if object_id('�_������_�������') is not null drop table �_������_������� 
--����� ���� ������� �� �_�������
----SELECT ����������, ��������, ������, �����
--��� ����� ���� / ���� ����.
----INTO �_������_������� 
----From �������3

--����� ���� ������� �� �_�������
Select @Message = '������: '+@�����������+', �����: '+@�����+', �����: '+@�����+'.' 
Print @Message

fetch next from CC into @�����������, @������,@�����, @�����
END

Close CC
-- ���������� ������
DEALLOCATE CC
--char(13) / Print '' - ������� ������
Print char(13)+'������� �� �� �������:'+char(13)

declare CC2 CURSOR
Local
scroll
for
--������, ��� �����
select �����������, ������, �����, ����� from �������3

--���� �� <>  �������
WHERE  ������ <> '�������' 

Order by �����������, ������, �����, �����

open CC2
fetch next from CC2 into @�����������, @������, @�����, @�����
--���������� ������ � ������ ������
while @@FETCH_STATUS=0

BEGIN
--����� ���� ������� �� �_�������
Select @Message = '������: '+@������+', �����: '+@����� +
', ������: '+@�����������+', �����: '+@�����+'.'
Print @Message

fetch next from CC2 into @�����������, @������,@�����, @�����
END
Close CC2
-- ���������� ������
DEALLOCATE CC2