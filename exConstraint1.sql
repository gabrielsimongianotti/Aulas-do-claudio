create database exConstraint1
go
use exConstraint
--1
create table TB_CLIENTE(
	codigo int constraint pk_codigo primary key identity(1,1)not null,
	nome varchar(50) not null,
	telefone varchar(20) not null,
	tipo_cliente varchar(20)check(tipo_cliente in ('Titular', 'Dependente')) not null,
	dt_cadastro time constraint DF_Dt_Cadastro default( GETDATE ( )) not null,
	nr_dependentes int check(nr_dependentes between 0 and 3) not null
)

--2
create table marca(
	id_marca int constraint pk_id_marca primary key identity(1,1),
	nome varchar(30)
)

create table produto(
	id_pro int constraint pk_id_pro primary key identity(1,1) check(id_pro between 0 and 9999),
	nome_produto varchar (30),
	estoque int check (estoque > 0),
	proco money
)

create table pedido(
	id_pedido int constraint pk_int_pedido primary  key identity(1,1),
	data time constraint DF_Dt_Cadastro default( GETDATE ( )),
	valor_desc money,
	valor_total money
)

create table itemPdido(
	id_pedido int foreign key references pedido(id_pedido),
	id_produto int foreign key references produto(id_pro),
	qtde int ,
	vl_unit int
)