create database Biblioteca
use Biblioteca
-- comentario
create table Usuarios(
idUsuario int not null identity,
nome Varchar(80) not null,
RG char(6) not null,
sexo char(1),
tipo varchar(11) default 'discente',
primary key (idUsuario),
unique (RG),
check (sexo in('m','f')),
check (tipo in('docente', 'discente', 'funcionario'))
)

create table Livros(
idLivro int not null identity,
titulo varchar(40) not null,
genero varchar(40) not null,
ano int,
situacao varchar(30) default 'disponivel',
precoCusto numeric(6,2),
primary key (idLivro),
check (situacao in('disponivel', 'indisponivel')),
--check (precoCusto > 0)
)
create table Emprestimos(
idEmprestimo int not null,
idUsuario int not null,
idLivro int not null,
dataSaida datetime,
dataDevolucao datetime,
primary key (idEmprestimo),
foreign key (idUsuario) references Usuarios,
foreign key (idLivro) references Livros
)
SELECT * from Usuarios
select * from Livros
select * from Emprestimos

insert into Usuarios(nome, RG, sexo) 
values('Pedro', '12222', 'm')

insert into Usuarios(nome, RG, sexo)
values('Clara minha vida', '1111', 'f')

insert into Livros(titulo, genero, ano, precoCusto)
values('homem-aranha', 'açao', '2021', 25.50)

insert into Emprestimos
values(1,1,1, '10-02-2024', '22-02-2024')