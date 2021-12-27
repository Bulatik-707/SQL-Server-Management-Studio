Create proc Proc_Create_T_Shet(

@SUM int) -- ������ ����� ��� ���. ���������
AS 
/*
-- ��������, ���� ����. / ���
If not exists (select * from SYSOBJECTS Where name = 'T_Shet' AND xtype = 'U')
Print '�������  ���'
Else 
Print '������� �������';
*/
Set NOCOUNT ON;
-- ���� ���� ������� ������ � ������� �����, ��� ���. ����� �����
IF(OBJECT_ID(N'dbo.T_Shet', N'U') is not NULL)
BEGIN 
Drop table T_Shet
END

--������� ����. (� ������)
create table T_Shet(
ID_Sheta__Sh int primary key,
Vhod_Sum__Sh int,
Prihod__Sh int,
Rashod__Sh int,
Ostatok__Sh int,)

Declare @a int, @Vhod_Sum int, @Prihod int, @Rashod int, @Ostatok int
Set @a = 1 -- ���� ���. ��
While (@a < 51) --��� 50 �������

BEGIN
Set @Vhod_Sum = @a * @SUM

--Update T_Shet Set Prihod__Sh = 5000 Where Vhod_Sum__Sh < 4000 
--��������� ���� ������
 If(@Vhod_Sum < 4000) Set @Prihod = 5000
Else Set @Prihod = 3000

--���. � ���� (���� - ��������)
insert into T_Shet(ID_Sheta__Sh, Vhod_Sum__Sh, Prihod__Sh, Rashod__Sh, Ostatok__Sh)
  values (@a, @Vhod_Sum, @Prihod, @Rashod, @Ostatok)
 
 
Set @a = @a+1 --Id_������ ������
Continue
END
