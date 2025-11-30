create database sistema_controle_estoque;

use sistema_controle_estoque;

create table fornecedores (
    fornecedorid int primary key auto_increment,
    nomefornecedor varchar(100),
    contatoFornecedor varchar(100),
    telefonefornecedor varchar(20)
);

create table produtos (
    produtoid int primary key auto_increment,
    nomeproduto varchar(100),
    quantidadeestoque int,
    precounitario decimal(10,2),
    fornecedorid int,
    foreign key (fornecedorid) references fornecedores(fornecedorid)
);

create table pedidosreposicao (
    pedidoid int primary key auto_increment,
    produtoid int,
    quantidadereposicao int,
    datapedido date,
    foreign key (produtoid) references produtos(produtoid)
);

-- inserts
insert into fornecedores (nomefornecedor, contatoFornecedor, telefonefornecedor)
values 
('Fornecedor A', 'FornecedorA@gmail.com', '1234-4321'),
('Fornecedor B', 'FornecedorB@gmail.com', '6789-9876');

insert into produtos (nomeproduto, quantidadeestoque, precounitario, fornecedorid)
values
('Produto Y', 50, 15.00, 1),
('Produto Z', 35, 20.00, 2);

insert into pedidosreposicao (produtoid, quantidadereposicao, datapedido)
values
(1, 20, '2024-09-10'),
(2, 30, '2024-09-13');

-- consultas
select * from produtos;

select p.nomeproduto, pr.quantidadereposicao, pr.datapedido
from pedidosreposicao pr
join produtos p on pr.produtoid = p.produtoid;

select p.nomeproduto, f.nomefornecedor
from produtos p
join fornecedores f on p.fornecedorid = f.fornecedorid;

-- atualização
update produtos
set quantidadeestoque = quantidadeestoque + 20
where produtoid = 1;

-- corrigindo foreign key com cascade
alter table produtos
drop foreign key produtos_ibfk_1;

alter table produtos
add constraint produtos_ibfk_1
foreign key (fornecedorid)
references fornecedores(fornecedorid)
on delete cascade;

alter table pedidosreposicao
drop foreign key pedidosreposicao_ibfk_1;

alter table pedidosreposicao
add constraint pedidosreposicao_ibfk_1
foreign key (produtoid)
references produtos(produtoid)
on delete cascade;

-- deletar
delete from fornecedores
where fornecedorid = 2;

delete from produtos
where produtoid = 2;
