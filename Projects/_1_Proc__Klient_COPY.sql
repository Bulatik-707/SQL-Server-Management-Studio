
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE _1_Proc__Klient_COPY
--Процедура копирует Т Клинты под именем КЛИЕНТЫ2
AS
Select * 
into Клиенты2
from Клиенты 

	
