create database Clinica
use Clinica
create table pacientes(
codP int not null identity,
nome varchar(80),
cpf varchar(12) not null,
sexo char(1),
idade int,
convenvio varchar(40),
unique (cpf),
primary key (codP),
check (sexo in('m', 'f'))
)

create table medicos(
codM int not null identity,
nome varchar(80),
especialidade varchar(60) default('Clinico Geral'),
turno varchar(50),
salario float,
primary key (codM),
check (turno in('matutino', 'vespertino', 'noturno'))
)

create table Consultas(
paciente int not null,
medico int not null,
data datetime,
diagnostico varchar(100),
preco float,
foreign key (paciente) references pacientes,
foreign key (medico) references medicos
)


select * from pacientes
select *from medicos
select * from Consultas

insert into pacientes(nome, cpf, sexo, idade, convenvio)
values('Pedrinho pressao', '77755545', 'm', 20, 'convio social')

insert into pacientes(nome, cpf, sexo, idade, convenvio)
values('Joao sujo', '55241235', 'm', 45, 'convio normal')

insert into medicos(nome, especialidade, turno, salario)
values('Maria Clara', 'Farmaceutica', 'matutino', 8500)

insert into medicos(nome, turno, salario)
values('Mrcelo macaco', 'matutino', 1500)

INSERT INTO Consultas(paciente, medico, data, diagnostico, preco)
values(1,1, '2024/03/06', 'doente de amor', 449.99)

INSERT INTO Consultas(paciente, medico, data, diagnostico, preco)
values(2,2, '2024/03/01', 'acidente de moto', 599.99)

insert into medicos(nome, especialidade, turno, salario)
values('renata', 'pediatra', 'matutino', 4500)

insert into medicos(nome, especialidade, turno, salario)
values('faustao', 'pediatra', 'noturno', 4500)

insert into medicos(nome, especialidade, turno, salario)
values('calabreso', 'ortopedista', 'noturno', 1000)


update medicos 
set salario = salario*2
where especialidade = 'pediatra'

delete from Consultas
where medico = 1

update Consultas
set preco = 120.45

delete from medicos
where salario<1500

insert into Consultas(paciente, medico, diagnostico, preco)
values(1, 4, 'fadiga', 50)

insert into Consultas(paciente, medico, diagnostico, preco)
values(2, 3, 'machucado', 70)

delete from Consultas
where preco <80


alter table Consultas
add horario time

alter table Consultas
drop column diagnostico

drop table Consultas

use master

drop database Clinica
