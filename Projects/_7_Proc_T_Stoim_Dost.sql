USE [406_�����_������������]
GO


Create proc _7_Proc_T_Stoim_Dost

@Procent int 
AS
if object_id('T_Stoim_Dost') is not null drop table T_Stoim_Dost 

CREATE TABLE T_Stoim_Dost(
	���_������ int NOT NULL,
	���������_�������� money NULL,
	�����_��������� money NULL,)
	

Insert into T_Stoim_Dost(���_������, ���������_��������) 
Select ���������, ����������������� 
From ������2
--
DECLARE @id int, @StoimDost money, @NewStoim money


declare CC CURSOR
Local scroll for
SELECT ���_������, ���������_��������, �����_��������� FROM T_Stoim_Dost


open CC
fetch next from CC into @id, @StoimDost, @NewStoim
while @@FETCH_STATUS=0


BEGIN 
SET @StoimDost = (Select ���������_�������� From T_Stoim_Dost 
WHERE ���_������ = @id)

Update T_Stoim_Dost Set �����_��������� = @StoimDost + (@StoimDost / 100 * @Procent)

--Declare @Mes nvarchar(100) = '��������� �������� ' +str(@StoimDost) +''

--���������
fetch next from CC into @id, @StoimDost, @NewStoim
END
--Print @Mes
--������� ������
Close CC
-- �������� ������
DEALLOCATE CC


--������� ����. �� ����� ������
select * from T_Stoim_Dost
