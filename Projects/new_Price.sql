-- Добавить в табл. столбец new_Price
Alter table TestTable Add new_Price money;
Update TestTable 
-- Увелич. стоим. на 25%
Set new_Price = Price * 1.25
Select * From TestTable