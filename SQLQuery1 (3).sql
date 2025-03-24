create database Hotel
use Hotel

select * from Hospedes
select * from Quartos
select * from Estadias
where dataEntrada Between '01-01-2020' and '31-12-2020'
SELECT * FROM hospedes
WHERE dataNascimento IS NULL

SELECT * FROM hospedes
WHERE dataNascimento IS  not NULL
order by nome, endereco 

select * from Estadias
where quarto in(220, 310, 320)

select * from Hospedes
where nome LIKE '%santos%'

--mostre a quantidade de hospedes que tiveram estadias
select count(*)
from Estadias 

select h.nome, count(*) estadiasPorHospedes
from Estadias e, Hospedes h
where h.cpf = e.hospede
group by h.nome 