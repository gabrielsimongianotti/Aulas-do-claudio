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
