/* 
������� ���� (1� ������� �����, 2, 3, 4)
���� while �� 1-51 (50 �������) 2 � 3 = 2*2*2
*/

Create proc Proc_9
/*If OBJECT_ID (N'�_�������', 'U')IS null;  Print '������� ���'; Else Print '����';  */

AS 
-- ��������, ���� ����. / ���
If not exists (select * from SYSOBJECTS Where name = '�_�������' AND xtype = 'U')
Print '������� �_������� ���'
Else 
Print '������� �_������� �������';

create table �_�������(
����� int primary key,
������� int not null,
��� int not null,
����_�� int not null,)

Declare @a int, @������� int, @��� int, @����_�� int;
Set @a=1
While (@a < 51)
BEGIN
Set @������� = @a*@a; Set @��� = @a*@a*@a; Set @����_�� = @a*@a*@a*@a

insert into �_�������(�����, �������, ���, ����_��) values (@a, @�������, @���, @����_��)
Set @a = @a+1
Continue
END