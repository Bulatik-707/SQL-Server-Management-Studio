--������� �_���� (�����_�����, ������, ������, �������, �������_�����, �������)
--��������� 50 ������� (�����_����� - ������)
--�� ���� ������� ������� �������� ����� ��� �����_����� * 1000
--�������_����� = [������ * %]
--��������� % �������_����� * 12%  (���� ������ > 1000 ���.)
--% �������_����� � ����� ���� �������,  � ������� ����� ����� ���� �������_����� (������� + ������).

USE [406_�����_������������]
GO
Create proc _7_Igzamen__Proc_T_Shet__50_Zap
@Proc int 
AS

--���� ������� ����, �� �������
if object_id('�_����') is not null drop table �_���� 

--����. ����, � ������
Create table �_����
(�����_����� int primary key identity(1,1),
������ money,
������ money,
������� money,
�������_����� money,
������� money)

Declare @id int,  @Prihod money, @Rashod money, @Ostatok money, @God_dohod money, @Procent money

Set @id = 1 -- ���� ���. ��
While (@id < 51) --��� 50 �������

--��������� ���� ����_
BEGIN
Set @Prihod = @id * 1000
SET @Rashod = 0
SET @Ostatok = 0--@Prihod - @Rashod

--���_�����
--Set @God_dohod = @Prihod + @Prihod  * 0.12  + @Procent
Set @God_dohod = @Prihod + @Prihod  * (@Proc / 100.0)  + @Procent

--�������
If(@Prihod > 1000) Set @Procent = (@God_dohod / 100.0)  --(@Proc / 100)  
ELSE SET @Procent = 0

--���. � ���� (���� - ��������)
insert into �_����(������, ������, �������, �������_�����, �������)
  values (@Prihod, @Rashod, @Ostatok, @God_dohod, @Procent)
 
 Set @id = @id+1 --Id_������ ������
 Continue
END

SELeCT * FROM �_����
