create database hotel
use hotel

select * from Hospedes
select * from Quartos

-- a exibir nome dos hospedes
select nome from Hospedes

-- exibir todos os dados dos servicoes
select* from Servicos

--Mostre o tipo, o valor da di�ria, e o lucro mensal de cada quarto (valor da di�ria * 31). Renomeie
--esta �ltima coluna para Valor da Di�ria/M�s.
select tipo, ValorDiaria, ValorDiaria*31 'Diaria/Mes' from Quartos

--Mostre a soma e a m�dia dos pre�os de todos os servi�os.

select sum (preco) from Servicos

select avg(preco) from Servicos

--Mostre o valor da di�ria do quarto mais caro e do mais barato.

select min(ValorDiaria) MenorDiaria, max(ValorDiaria) MaiorDiaria from Quartos

--Exiba a data de nascimento do h�spede mais novo.
select max(dataNascimento) HospedeMaisNovo from Hospedes

--Mostre quantos servi�os foram solicitados pelo h�spede de CPF 922411035844.
select count(*) Solicitacoes from Solicitacoes
where hospede = 922411035844

--Mostre quantos h�spedes distintos j� tiveram estadias.

select distinct hospede from Solicitacoes

--Mostre a descri��o, pre�o e o pre�o com 35% de aumento, de todos os servi�os.
select descricao, preco, preco *1.35 'precoCom35%' from Servicos

--Quais os nomes dos h�spedes que nasceram no ano de 1990?

select nome from Hospedes
where dataNascimento <= '31/12/1990' and dataNascimento >= '01/01/1990'

--Quais os dados dos quartos que possuem valor de di�ria maior que R$ 300?
select * from Quartos 
where valorDiaria > 300

--Mostre os dados de todos os h�spedes que tiveram estadias no ano de 2018.
SELECT h.*
FROM Hospedes h , Estadias e
where e.dataEntrada between '01-01-2018' and '31-12-2018'
and h.cpf = e.hospede

--Exiba os nomes dos h�spedes e a hora da solicita��o do servi�o, para hospedes que solicitaram
--servi�os de Lavanderia ou de Bab�.
select h.nome, s.hora
from Hospedes h, Solicitacoes s, Servicos se
where h.cpf = s.hospede and 
se.codServico = s.servico and
se.descricao In ('Lavanderia', 'Bab�')
