create database Prova
use Prova

create table PAIS(
SiglaPais varchar(5) not null,
NomePais varchar(100),
primary key (SiglaPais)
)

create table EQUIPE(
CodEq int not null,
NomeEq varchar(50),
Pais varchar(5),
primary key (CodEq),
foreign key (Pais) references PAIS
)

create table PILOTO(
CodPil int not null,
NomePil varchar(50),
Equipe int,
Pais varchar(5),
primary key (CodPil),
foreign key (Equipe) references EQUIPE,
foreign key (Pais) references PAIS
)

CREATE TABLE CIRCUITO(
CodCirc int not null ,
NomeCirc varchar(10),
Pais varchar(5),
primary key (CodCirc),
foreign key (Pais) references PAIS
)

create table CLASSIFICACAO(
Circuito int,
Piloto int,
Data datetime,
Posicao int,
Pontuacao float,
foreign key (Circuito) references CIRCUITO,
FOREIGN KEY (Piloto) references PILOTO
)

-- 2
INSERT INTO PAIS
values('BR', 'BRASIL')

INSERT INTO EQUIPE
values(1, 'DETONA', 'BR')

--3
select Pontuacao+10
from CLASSIFICACAO
where Data between '01-01-2022' and '31-12-2022'



use VendaIngressos_PROVA2
--5
--a

select c.nome, c.CPF, c.dataNascim as DataNascimento
from Clientes c, Ingressos i, Vendas v
where c.idCliente = v.idCliente and i.idIngresso = v.idIngresso
and i.setor in ('Arquibancada', 'Camarote')
and v.data between'01-01-2022' and '31-12-2022'
order by c.nome

--b
select e.titulo, count(v.idIngresso) as QuantidadeIngressosVendidos
from Eventos e, Vendas v, Ingressos i
where v.idIngresso = i.idIngresso and i.idEvento = e.idEvento
and e.dataHora between '01-01-2023' and '31-12-2023'
group by e.titulo

--c 
select distinct(e.titulo), e.tipo
from Eventos e, Vendas v, Clientes c, Ingressos i
where v.idCliente = c.idCliente and v.idIngresso = i.idIngresso
and i.idEvento = e.idEvento and e.local not in ('Recife', 'Rio de Janeiro')
and c.sexo = 'M'

--d 
select c.nome, count(v.idIngresso) ingressosComprados, sum(i.valor ) valorTotal
from Clientes c, Vendas v, Ingressos i 
where c.idCliente = v.idCliente and i.idIngresso = v.idIngresso
and c.nome like 'M%'
group by c.nome

--e 

select e.titulo, s.artista, s.genero
from Eventos e, Shows s, Ingressos i
where e.idEvento = s.idShow and i.idEvento =e.idEvento
and i.situacao = 'Disponível'