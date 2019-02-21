create database ex2
go 
use ex2  

create table banda(
	codBanda int primary key identity(1,1),
	nome varchar (20),
	dtCriacao date
)

create table show(
	codShow int primary key identity(1,1),
	valorCobrado money,
	data date,
	localShow varchar(40), 
	codBanda int foreign key references banda(codBanda)
)

create table musico(
	codMusico int primary key identity (1,1),
	nome varchar (20),
	nomeArtistico varchar (20),
	dtNascimento date
) 
create table cancao(
	codCancao int primary key identity (1,1),
	nome varchar (20),
	letra varchar(30),
	dtComposicao date 
)
create table disco(
	codDisco int primary key identity(1,1),
	titulo varchar(20),
	produto varchar(30),
	ano int,
	estudio varchar(40),
	codBanda int foreign key references banda(codBanda)
)
create table compoe(
	codCompoe int primary key identity(1,1),
	codCancao int foreign key references cancao(codCancao),
	codMusico int foreign key references musico(codMusico)
)

create table possui(
	codPossui int primary key identity(1,1),
	codDisco int foreign key references disco(codDisco),
	codCancao int foreign key references cancao(codCancao)
)

create table participa(
	codParticipa int primary key identity(1,1),
	participa varchar(20),
	codBanda int foreign key references banda(codBanda),
	codMusico int foreign key references musico(codMusico)
)
--3.	Cadastre 5 músicos e 3 bandas.
set dateformat dmy
insert into banda values
	('Metallica','07/02/2001'),
	('AC/DC','08/02/1973'),
	('the queen','12/03/1960')

insert into musico values 
	('gabriel','gatão','26/06/1998'),
	('aleticiana','le','12/12/1970'),
	('ze','blablabla','11/12/1997'),
	('veronica','veroni','01/02/1999'),
	('arnando','ar','02/10/1950')
	
--4.	Cadastre 5 discos para diferentes bandas.

insert into disco values
	('blablabla','disco',2019,'fatec',1),
	('Acabou Chorare','disco',1979,'Studio Andrade',2),
	('Construção','disco',1971,'Stúdio FP',3),
	('Cartola','disco',1972,'Audio7 Produtora',2),
	('Transa','disco',1968,'Digiaudio Studio',1)
	
--5.	Cadastre 8 canções.

insert into cancao values
	('papa é pop',' letra o papa é pop','01/02/1989'),
	('terra','letra terra','02/01/2000'),
	('piano bar','letra piano bar','19/05/1991'),
	('Ate o fim','letra ate o fim','18/02/1983'),
	('3x4','letra 3x4','05/03/1999'),
	('vida real', 'letra vida real','15/09/2003'),
	('mapas','letra mapas','01/02/2013'),
	('montanha','letra montanha','23/01/1996')
	
--6.	Vincule cada canção aos seus compositores (lembre-se que uma canção pode ser composta por mais de um músico).

insert into compoe values
	(1,2),
	(1,1),
	(1,3),
	(2,4),
	(2,5),
	(3,2),
	(3,1),
	(4,3),
	(5,4),
	(5,5),
	(6,2),
	(6,1),
	(7,3),
	(7,4),
	(7,5),
	(8,1),
	(8,3),
	(8,4),
	(8,5)

select * from cancao
select * from musico	
select * from compoe

--7.	Cadastre os papéis de cada músico nas bandas que eles participam.
select * from banda
select * from musico

insert into participa values
	('baterista',1,1),
	('gitara',1,2),
	('gitara',2,3),
	('baterista',2,4),
	('gitara',3,2),
	('baixo',3,3),
	('baterista',3,1)

--8.	Cadastre as músicas que fazem parte de cada disco já cadastrado.
select * from cancao
select * from disco

insert into possui values 
	(1,1),
	(1,2),
	(2,3),
	(2,4),
	(3,5),
	(4,6),
	(4,7),
	(5,8)
	
select * from possui

dbcc checkident(banda,reseed,0)
delete from banda
select * from banda
