--����. ����.
Create proc _00_Proc_Add_value_T_Klients
--�������� ��������� 
(@FIO varchar(70), 
@Adres varchar(99))
AS
BEGIN
SET @FIO  = LTRIM(RTRIM(@FIO))
SET @Adres = LTRIM(RTRIM(@Adres))
-- ��������� ����� ������
Insert into Klients (FIO__K, Adres__K) 
values (@FIO, @Adres) 
select * from Klients
END
