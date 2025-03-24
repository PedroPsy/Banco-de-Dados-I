create database Hotel
use Hotel
select *from Hospedes

create view hospede_v as 
select cpf, nome
from Hospedes

select * from hospede_v

create view QtdEstadias as
select h.nome, count(*).QtdEstadias
from Hospedes h, Estadias e
where h.CPF = e.hospede
group by h.nome


select h.nome, count(*) as QTD
from Hospedes h join Estadias e on h.CPF = e.hospede
group by h.nome
having count(*) > 5

select GETDATE()

select datepart(DAY, getdate())  -- yy, mm, dd, 

 