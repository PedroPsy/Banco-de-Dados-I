create database Hotel
use Hotel

--A
select h.nome, s.descricao
from Hospedes h, Servicos s, Solicitacoes so
where h.cpf = so.hospede and s.codServico = so.servico
and so.data between '01-07-2023' and '31-12-2023'

select * from Solicitacoes
--B
select s.*
from Hospedes h, Servicos s, Solicitacoes so
where  h.cpf = so.hospede and s.codServico = so.servico
and h.nome like '%Santos%'

--c
select h.nome, e.dataEntrada, e.dataSaida
from Hospedes h, Estadias e, Quartos q
where h.CPF = e.hospede and q.numero = e.quarto
and q.tipo in('Standard', 'Luxo Superior')
and e.dataEntrada between '01-01-2012' and '31-12-2012'

--d

select e.dataEntrada, e.dataSaida
from Hospedes h, Estadias e
where h.dataNascimento is not null
and e.hospede = h.CPF
order by e.dataEntrada

-- e
select so.data, so.hora
from Hospedes h, Servicos s, Solicitacoes so
where h.cpf = so.hospede and s.codServico = so.servico
and h.sexo = 'f'

--f 
select sexo, count(*)
from Hospedes
group by sexo

-- g
select s.descricao, avg(s.preco) mediaPreco
from Servicos s, Solicitacoes so
where so.servico = s.codServico
and so.data Between '01-01-2015' and '31-12-2018'
group by s.descricao


--h
select distinct h.nome
from Hospedes h, Quartos q, Estadias e, Servicos s, Solicitacoes so
where h.cpf = e.hospede and h.CPF = so.hospede and q.numero = e.quarto
and s.codServico = so.servico
and q.valorDiaria > 500 and s.descricao in ('Lanchonete', 'Passadeira')

-- i
select q.tipo, q.valorDiaria, count(e.quarto)
from Quartos q, Estadias e
where q.numero = e.quarto 
group by q.tipo, q.valorDiaria
order by q.tipo

SELECT Quartos.tipo, Quartos.valorDiaria, COUNT(Estadias.quarto) AS quantidade_estadias
FROM Quartos
LEFT JOIN Estadias ON Quartos.numero = Estadias.quarto
GROUP BY Quartos.tipo, Quartos.valorDiaria
ORDER BY Quartos.tipo;