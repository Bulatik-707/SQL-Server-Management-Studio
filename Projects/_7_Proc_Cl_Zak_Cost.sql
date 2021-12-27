USE [406_�����_������������]
GO
--Create proc _7_Proc_Cl_Zak_Cost
--AS
--���� ������� ����, �� �������
if object_id('T_Cl_Zak_Cost') is not null drop table T_Cl_Zak_Cost

--����. �������, � ������
CREATE TABLE T_Cl_Zak_Cost(
	id_Zak int NOT NULL,
	id_Kl nvarchar(5) NOT NULL,
	StoimDost money NULL,
	Adres_Pol nvarchar(60) NULL,)
	
--���. ����. (����), ������ �� ������� 	
Insert into T_Cl_Zak_Cost(id_Zak, id_Kl,  StoimDost, Adres_Pol) 
Select ���������, ����������, �����������������, ��������������� From ������2 
--
DECLARE @id_Zak int, @id_Kl nvarchar(5), @StoimDost money, @Adres_Pol nvarchar(60)

--����. ������
declare CC CURSOR
Local scroll for
--���, ������
SELECT id_Zak, id_Kl, StoimDost, Adres_Pol FROM T_Cl_Zak_Cost

--������� ������
open CC
--���������
fetch next from CC into @id_Zak, @id_Kl, @StoimDost, @Adres_Pol
--���������� ������ � ������ ������
while @@FETCH_STATUS=0

BEGIN 

Print '��� �������: '+str(@id_Zak) +'; ��� ������: '+@id_Kl +';'+char(13)+
' �����. ��������: '+str(@StoimDost)+'; ����� ����������: '+@Adres_Pol +'.'+char(13)

fetch next from CC into @id_Zak, @id_Kl, @StoimDost, @Adres_Pol
END
--������� ������
Close CC
-- �������� ������
DEALLOCATE CC

--������� ����. �� ����� ������
select * from T_Cl_Zak_Cost
