create database hotel
use hotel

select * from Hospedes
select * from Quartos

-- a exibir nome dos hospedes
select nome from Hospedes

-- exibir todos os dados dos servicoes
select* from Servicos

--Mostre o tipo, o valor da diária, e o lucro mensal de cada quarto (valor da diária * 31). Renomeie
--esta última coluna para Valor da Diária/Mês.
select tipo, ValorDiaria, ValorDiaria*31 'Diaria/Mes' from Quartos

--Mostre a soma e a média dos preços de todos os serviços.

select sum (preco) from Servicos

select avg(preco) from Servicos

--Mostre o valor da diária do quarto mais caro e do mais barato.

select min(ValorDiaria) MenorDiaria, max(ValorDiaria) MaiorDiaria from Quartos

--Exiba a data de nascimento do hóspede mais novo.
select max(dataNascimento) HospedeMaisNovo from Hospedes

--Mostre quantos serviços foram solicitados pelo hóspede de CPF 922411035844.
select count(*) Solicitacoes from Solicitacoes
where hospede = 922411035844

--Mostre quantos hóspedes distintos já tiveram estadias.

select distinct hospede from Solicitacoes

--Mostre a descrição, preço e o preço com 35% de aumento, de todos os serviços.
select descricao, preco, preco *1.35 'precoCom35%' from Servicos

--Quais os nomes dos hóspedes que nasceram no ano de 1990?

select nome from Hospedes
where dataNascimento <= '31/12/1990' and dataNascimento >= '01/01/1990'

--Quais os dados dos quartos que possuem valor de diária maior que R$ 300?
select * from Quartos 
where valorDiaria > 300

--Mostre os dados de todos os hóspedes que tiveram estadias no ano de 2018.
SELECT h.*
FROM Hospedes h , Estadias e
where e.dataEntrada between '01-01-2018' and '31-12-2018'
and h.cpf = e.hospede

--Exiba os nomes dos hóspedes e a hora da solicitação do serviço, para hospedes que solicitaram
--serviços de Lavanderia ou de Babá.
select h.nome, s.hora
from Hospedes h, Solicitacoes s, Servicos se
where h.cpf = s.hospede and 
se.codServico = s.servico and
se.descricao In ('Lavanderia', 'Babá')
