create database relaçaonton;
use relaçaonton;

create table endereço (
idEnd int primary key auto_increment,
CEP char(9),
Bairro varchar(45),
Cidade varchar(45)
) auto_increment = 100;

create table pessoa (
idPessoa int primary key auto_increment,
Nome varchar(45),
Salario decimal(10,2)
);

-- criar a nossa tabela associativa

create table endCompleto (
fkEnd int,
foreign key (fkEnd) references endereço(idEnd),
fkPessoa int,
foreign key (fkPessoa) references pessoa(idPessoa),
primary key (fkEnd, fkPessoa),
Numero int,
Complemento varchar(45)
);

insert into pessoa values
(null, 'Vivian', 1.99),
(null, 'Paulo', 1.59),
(null, 'Nison', 0.99);

insert into endereço values
(null, '01414-905', 'Cerqueira Cesar', 'São Paulo'),
(null, '04253-000', 'Sacomã', 'São Paulo'),
(null, '88050-000', 'Centro', 'Florianópolis');

insert into endCompleto values
(101, 1, 1500, 'apto 100'),
(100, 2, 595, '10 andar'),
(100, 3, 595, '6 andar');

select * from pessoa
join endCompleto on idPessoa = fkPessoa
join endereço on fkEnd = idEnd;

select pessoa.nome as Nome,
endereço.bairro as Bairro
from pessoa
join endCompleto on idPessoa = fkPessoa
join endereço on fkEnd = idEnd;

select * from pessoa
right join endCompleto on idPessoa = fkPessoa
right join endereço on fkEnd = idEnd;

insert into pessoa values
(null, 'Murilo', 0.99);

select nome,
bairro from pessoa
join endCompleto on idPessoa = fkPessoa
join endereço on fkEnd = idEnd;

select nome,
bairro from pessoa
right join endCompleto on idPessoa = fkPessoa
right join endereço on fkEnd = idEnd;

select nome, bairro from pessoa
left join endCompleto on idPessoa = fkPessoa
left join endereço on fkEnd = idEnd;

select nome,
bairro from pessoa
right join endCompleto on idPessoa = fkPessoa
right join endereço on fkEnd = idEnd
union
select nome, bairro from pessoa
left join endCompleto on idPessoa = fkPessoa
left join endereço on fkEnd = idEnd;

select nome,
bairro from pessoa
right join endCompleto on idPessoa = fkPessoa
right join endereço on fkEnd = idEnd
where fkEnd is null
union
select nome, bairro from pessoa
left join endCompleto on idPessoa = fkPessoa
left join endereço on fkEnd = idEnd
where fkPessoa is null;

-- novo conteudo FUNÇOES MATEMATICAS

select count(*) from pessoa;
select * from pessoa;

insert into pessoa values
(null, 'Estela', null);

select count(Salario) 'salário' from pessoa;

-- LIMIT
select nome from pessoa limit 1;
select nome from pessoa limit 3,2;

-- Max e Min
select max(Salario) 'Maior salario',
min(Salario) 'Menor salario' from pessoa;

-- Sum
select sum(Salario) from pessoa; 

-- AVG
select avg(Salario) from pessoa;

-- ROUND
select round(avg(Salario),2) from pessoa;

insert into pessoa values
(null, 'Nauana', 1.09);

insert into pessoa values
(null, 'Thiago', 5199);

-- truncate
select truncate(avg(Salario),2) from pessoa;

insert into pessoa values
(null, 'Marcus', 1.09);

select * from pessoa;

-- DISTINCT

select avg(distinct Salario) from pessoa;
select sum(distinct Salario) from pessoa;
select sum(Salario) from pessoa;

select distinct Salario from pessoa;

-- GROUP BY

select bairro,
	avg(Salario) from pessoa
    join endCompleto on idPessoa = fkPessoa
    join endereço on idEnd = fkEnd
    group by bairro;
    
select nome, salario from pessoa
where salario = (select min(salario) from pessoa); 

select nome, salario from pessoa
where salario = (select max(salario) from pessoa);

select nome, salario from pessoa
where salario = (select min(salario) from pessoa)
union 
select nome, salario from pessoa
where salario = (select max(salario) from pessoa);

select nome, salario from pessoa
where salario <= (select avg(salario) from pessoa);







 