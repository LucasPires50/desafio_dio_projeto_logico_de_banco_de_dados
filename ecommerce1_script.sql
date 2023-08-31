drop database ecommerce1;
create database ecommerce1;
use ecommerce1;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    address varchar(45),
    constraint unique_cpf_client unique(CPF)
);

alter table clients auto_increment = 1;
-- criar tabela produto
-- size equivale a dimenção do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vistuário', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    assessment float default 0,
    size varchar(10)
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrder_idClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em Processamento') default 'Em Processamento',
    orderDescripition varchar(255),
    freightValue float default 10,
    idPayment int, 
    constraint fk_orders_client foreign key(idOrder_idClient) references clients(idClient)
		on update cascade
);
-- desc orders;

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
	location varchar(45),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
	SocialName varchar(45) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique(CNPJ)
); 

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
	SocialName varchar(45) not null,
    AbstName varchar(255),
    location varchar(45),
    CNPJ char(15),
    CPF char(9),
    constraint unique_cnpj_supplier unique(CNPJ),
    constraint unique_cpf_supplier unique(CPF)
); 

create table productSeller(
	idPseller int,
	idProduct int,
	prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
    constraint fk_product_product foreign key(idProduct) references product(idProduct)
);

create table productOrder(
	idPOproduct int,
	idPOorder int,
	podQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_product_order_product foreign key(idPOproduct) references product(idProduct),
    constraint fk_product_order_order foreign key(idPOorder) references orders(idOrder)
);  

create table storageLocation(
	idLproduct int,
	idLstorage int,
	location varchar(255) not null,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idLproduct, idLstorage),
    constraint fk_product_storage_product foreign key(idLproduct) references product(idProduct),
    constraint fk_product_storage_product_seller foreign key(idLstorage) references productSeller(idPseller)
); 
