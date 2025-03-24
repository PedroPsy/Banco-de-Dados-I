

create procedure HospedesAno
@ano int as 
begin
	select h.nome
	from Hospedes h join Estadias e
	on h.CPF = e.hospede
	where datepart(yy, e.dataEntrada) = @ano
end

exec HospedesAno 2022

create procedure EstadiasHospede 
@nome varchar(50) as
begin 
	select count(*) as QuantidadeDeEstadias
	from Hospedes h join Estadias e
	on h.CPF = e.hospede
	where h.nome = @nome
end

declare @qtdEst int
exec EstadiasHospede4 'Ana Maria Pereira', @qtdEst output
select @qtdEst qtdEstadias



create procedure EstadiasHospede4
@nome varchar(50), @qtdEst int output as
begin 
	select @qtdEst = count(*)
	from Hospedes h join Estadias e
	on h.CPF = e.hospede
	where h.nome = @nome
end