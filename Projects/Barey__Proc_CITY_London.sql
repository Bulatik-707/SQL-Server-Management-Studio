Create proc Proc_CITY_London
AS
Declare @Firm varchar(10), @Fam varchar(20), @Message varchar(100)
-- KODEs
--������ �������� � �������
Select '������: ' +@Fam + '�����: '
Print @Message 
-- ��� � ����
Print '������ ��������'
DEclare Cursor_Klient cursor Local for
Select ��������, �����������
From �������
-- 
Where ����� = '������'
Order by ��������, �����������
Open Cursor_Klient fetch next from Cursor_Klient
into @Firm, @Fam
While @@FETCH_STATUS = 0
-- ��� � 100 ��������
BEGIN 
Select @Message = '������ ' +@Fam + ' �����: '+@Firm
Print @message
Fetch next from Cursor_Klient
into @Firm, @Fam
END
--�������� ������
Close Cursor_Klient 
deallocate Cursor_Klient