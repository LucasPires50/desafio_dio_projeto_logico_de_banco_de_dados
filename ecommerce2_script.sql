-- drop database ecommerce2;
create database ecommerce2;
use ecommerce2;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    typeClient enum('PJ', 'PF') not null,
    CNPJ char(15),
    CPF char(9),
    address varchar(45)
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

-- criar tabela de pagamento
create table payments(
	idPayment int auto_increment,
    idPayment_idClient int,
    typePayment enum('Boleto', 'Cartão', 'Dois cartões') not null,
    valuePayment float,
    primary key(idPayment, idPayment_idClient)
);

-- criar tabela boleto
create table bankSlips(
	idBankSlip int auto_increment primary key,
    idBankSlip_idPayment int,
    dueDate datetime,
    payDay datetime,
    barCode varchar(128),
    constraint fk_bank_slips_payment foreign key(idBankSlip_idPayment) references payments(idPayment)
);

-- criar tabela cartão
create table cards(
	idCard int auto_increment primary key,
    idCard_idPayment int,
    payDay datetime,
    holderName varchar(20),
    numberCard int,
    expiryMonth int,
    expiryYear int,
    constraint fk_idCard_payment foreign key(idCard_idPayment) references payments(idPayment)
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrder_idClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em Processamento') default 'Em Processamento',
    orderDescripition varchar(255),
    freightValue float default 10,
    idOrder_idPayment int, 
    constraint fk_orders_payment foreign key(idOrder_idPayment) references payments(idPayment),
    constraint fk_orders_client foreign key(idOrder_idClient) references clients(idClient)
		on update cascade
);
-- desc orders;
create table deliveryOrder(
	idDeliveryOrder int auto_increment primary key,
    idDeliveryOrder_idOrder int,
	deliveryStatus enum('Pedido em processamento', 'Cancelado', 'Concluido', 'Em trânsito', 'Saiu para entrega') default 'Pedido em processamento',
    cod int default 0,
    constraint fk_deliveryOrder_orders foreign key(idDeliveryOrder_idOrder) references orders(idOrder)
);

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    idProdStorage_product int,
	location varchar(45),
    quantity int default 0,
    constraint fk_prodStorage_product foreign key(idProdStorage_product) references product(idProduct)
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
    constraint fk_product_storage foreign key(idLstorage) references productStorage(idProdStorage)
); 
