USE [406_�����_������������]
GO
--������� �_�����_������ � ����� new_Zak, ������ ��������� ���, 
--���� ��������� <100, �� + 5%, � �������� � ����� ���� ����.
-- ���������� ���� �, ����� »

Create proc _6_Proc_T_NEW_ZAK
AS
--���� ������� ����, �� �������
if object_id('T_new_Zak') is not null drop table T_new_Zak 

--����. �������, � ������
CREATE TABLE T_new_Zak(
	id int NOT NULL,
	����������������� money NULL,
	�������������� money NULL,)
	
--���. ����. (����), ������ �� ������� 	
Insert into T_new_Zak(id, �����������������) 
Select ���������, ����������������� 
From ������2
--
DECLARE @id int, @StoimDost money, @NewStoim money

--����. ������
declare CC CURSOR
Local scroll for
--���, ������
SELECT id, �����������������, �������������� FROM T_new_Zak

--������� ������
open CC
--���������
fetch next from CC into @id, @StoimDost, @NewStoim
--���������� ������ � ������ ������
while @@FETCH_STATUS=0


BEGIN 
SET @StoimDost = (Select ����������������� From T_new_Zak 
WHERE id = @id)

IF (@StoimDost < 100)
Begin 
--���� ��������� < 100, �� + 5%
--��������� ����, � ���. � ���� (��������������) ������, ���� ��� =
Update T_new_Zak Set �������������� = @StoimDost + (@StoimDost / 100 * 5)
 Where id = @id
End

ELSE
Begin
--��������� ����, �������������� �� �������� 
Update T_new_Zak Set �������������� = @StoimDost Where id = @id
--���
Declare @Mes nvarchar(100) = '��������� �������� ' +str(@StoimDost) +' > 100'
End
Print @Mes
--���������
fetch next from CC into @id, @StoimDost, @NewStoim
END

--������� ������
Close CC
-- �������� ������
DEALLOCATE CC


--������� ����. �� ����� ������
--select * from T_new_Zak

