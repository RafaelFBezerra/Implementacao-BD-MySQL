create database imperio_alfaiataria;
use imperio_alfaiataria;

create table cliente
(
	id_cliente int primary key not null auto_increment,
	telefone varchar(11) not null,
    endereco varchar(50) not null
 );

create table pessoa_fisica(
cpf int not null primary key,
nome_completo varchar(50) not null,
id_cliente int,
constraint foreign key (id_cliente) references cliente(id_cliente)
on delete cascade on update cascade,
constraint id_cliente unique (id_cliente)
);

create table pessoa_juridica(
cnpj int not null primary key,
razao_social varchar(60) not null,
nome_fantasia varchar(60) not null,
id_cliente int,
constraint foreign key (id_cliente) references cliente(id_cliente)
on delete cascade on update cascade,
constraint id_cliente unique (id_cliente)
);


create table calca(
id_calca int,
gancho int not null,
joelho int not null,
comprimento int not null,
cintura int not null,
quadril int not null,
largura_joelho int not null,
largura_boca int not null,
constraint foreign key (id_calca) references cliente (id_cliente)
on delete cascade on update cascade
);

create table camisa(
id_camisa int,
comprimento int not null,
espadua int not null,
busto int not null,
cintura int not null,
quadril int not null,
manga int not null,
largura_manga int not null,
largura_punho int not null,
colarinho int not null,
ombro int not null,
constraint foreign key (id_camisa) references cliente (id_cliente)
on delete cascade on update cascade
);

create table pedido(
num_ordemservico int not null auto_increment primary key,
id_cliente int,
tipo_servico varchar(60) not null,
tipo_reparo varchar(60) not null,
data_pedido date not null,
quant_pedido double not null,
valor_unit double not null,
constraint foreign key (id_cliente) references cliente(id_cliente)
on delete cascade on update cascade
);

create table venda(
id_cliente int,
id_venda int primary key not null,
num_ordemservico int,
constraint foreign key (id_cliente) references cliente(id_cliente)
on delete cascade on update cascade,
constraint foreign key (num_ordemservico) references pedido(num_ordemservico)
on delete cascade on update cascade
);

create table fisica(
id_venda int,
id_vendafisica int primary key not null,
data_entrega date not null,
constraint foreign key (id_venda) references venda(id_venda)
on delete cascade on update cascade,
constraint id_venda unique (id_venda)
);

create table web(
id_venda int,
id_vendaweb int primary key not null,
prazo_entrega varchar(60) not null,
endereco_entrega varchar(60) not null,
valor_frete double not null,
transportadora varchar(60) not null,
dataent_prevista date not null,
constraint foreign key (id_venda) references venda(id_venda)
on delete cascade on update cascade,
constraint id_venda unique (id_venda)
);

create table pagamento(
id_cliente int,
id_venda int,
num_notafiscal int primary key not null,
forma_pgto varchar (25) not null,
valor_total double not null,
constraint foreign key (id_cliente) references cliente(id_cliente)
on delete cascade on update cascade,
foreign key (id_venda) references venda(id_venda)
);



