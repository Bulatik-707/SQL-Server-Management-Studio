-- ����. ����. ����.
Create proc _00_Proc_Create_Table
AS
--  ��� ���� � ���� ���
Create table Klients(
ID_Klient__K int primary key identity(1,1),
FIO__K varchar(70),
Adres__K varchar(99))
