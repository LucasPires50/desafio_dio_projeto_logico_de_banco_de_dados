use ecommerce2;

-- Inserir dados na tabela cliente
insert into clients(Fname, Minit, Lname, typeClient, CNPJ, CPF, Address)
	VALUES
  ("Thane","M","Blair", "PF", "", 123456789,"7648 Suspendisse Avenue"),
  ("Pamela","O","Terry", "PJ", 35871107000190, "","1561 Volutpat St."),
  ("Jesse","F","Kinney", "PF", "", 741852963,"1607 Venenatis St."),
  ("Larissa","S","Burt", "PJ", 76983017000178, "","Ap #953-4194 Proin St."),
  ("Troy","G","Jensen", "PF", "", 789456123,"902-7656 Nec, Road");

-- Inserir dados na tabela cliente
insert into product(Pname, classification_kids, category, assessment, size)
	VALUES
    ("Papel",false,"Eletrônico","2","10"),
    ("PLástico",false,"Eletrônico","3","10"),
    ("Tomate",true,"Brinquedos","4","20"),
    ("Cerveja",false,"Alimentos","1","30"),
    ("Leite",true,"Alimentos","5","40"),
    ("Chocolate",true,"Alimentos","1","50");

-- Inserir dados na tabela cliente
insert into payments(idPayment_idClient, typePayment, valuePayment)
	VALUES
    ("1","Boleto","120"),
    ("2","Cartão","200"),
    ("3","Dois cartões","2500"),
    ("2","Boleto","540"),
    ("4","Cartão","158");

insert into bankSlips(idBankSlip_idPayment, dueDate, payDay, barCode)
	VALUES
    ("1","2023-09-10","2023-09-05", "641919195191951961651961"),
    ("4","2023-09-25","2023-09-20", "116654984651635489476565");

insert into cards(idCard_idPayment, payDay, holderName, numberCard, expiryMonth, expiryYear)
	VALUES
    ("2","2023-09-10","Marcos", "5299", "10", "2028"),
    ("3","2023-09-25","Fernanda", "0107", "11", "2029"),
    ("3","2023-09-25","Antonio", "3386", "02", "2040"),
    ("4","2023-09-25","Leticia", "6501", "04", "2025"),
    ("5","2023-09-25","Alberto", "7896", "09", "2024");

insert into orders(idOrder_idClient, orderStatus, orderDescripition, freightValue, idOrder_idPayment)
	VALUES
    ("1", "Em Processamento", "Compra do item 1", "10", "1"),
    ("4", "Confirmado", "Compra do item 2", "15", "2"),
    ("2", "Confirmado", "Compra do item 3", "10", "3"),
    ("3", "Em Processamento", "Compra do item 4", "20", "2"),
    ("5", "Cancelado", "Compra do item 5", "30", "4");

insert into deliveryOrder(idDeliveryOrder_idOrder, deliveryStatus, cod)
	VALUES
    ("1", "Pedido em processamento", "132132"),
    ("2", "Cancelado", "519651"),
    ("3", "Em trânsito", "654656"),
    ("4", "Pedido em processamento", "3165896"),
    ("5", "Saiu para entrega", "5465463");

insert into productStorage(idProdStorage_product, location, quantity)
	VALUES
    ("1", "Rua 1", "10"),
    ("2", "Rua 2", "20"),
    ("3", "Rua 3", "30"),
    ("4", "Rua 4", "40"),
    ("5", "Rua 5", "50");

insert into supplier(SocialName, CNPJ, contact)
	VALUES
    ("Non Hendrerit Id Company","72534842000134","(830-5855"),
    ("Justo Faucibus Lectus Company","35413824000178","544-4132"),
    ("Mi Duis Limited","73266638000142","397-9874"),
    ("Dolor Foundation","56663735000150","(2435-6695"),
    ("Velit Aliquam Nisl LLC","06918754000101","562-3913");

insert into seller(SocialName, AbstName, location, CNPJ, CPF)
	VALUES
    ("Sodales Nisi Magna Limited","Winter Villarreal","Ap #555-981 Dolor. Rd.",35413824000178,5),
    ("Nascetur Ridiculus Industries","Zephania Moon","9122 Iaculis Rd.",1,789456123),
    ("Iaculis Corp.","Scott Webster","Ap #707-2361 Rutrum Rd.",56663735000150,2),
    ("Nisi A Corporation","Bernard Avila","195-3212 Cum Rd.",3,321456987),
    ("Non Nisi Aenean Corp.","Anne Castro","529-7600 Eros Rd.",06918754000101,4);

insert into productSeller(idPseller, idProduct, prodQuantity)
	VALUES
    ("1","5","50"),
    ("2","4","35"),
    ("3","3","69"),
    ("4","2","85"),
    ("5","1","12");

insert into productOrder(idPOproduct, idPOorder, podQuantity, poStatus)
	VALUES
    ("1","5","50", "Disponível"),
    ("2","4","0", "Sem estoque"),
    ("3","3","69", "Disponível"),
    ("4","2","0", "Sem estoque"),
    ("5","1","12", "Disponível");

insert into storageLocation(idLproduct, idLstorage, location, poStatus)
	VALUES
    ("1","5","P.O. Box 397, 2744 Lobortis Rd.","Disponível"),
    ("2","4","805-1658 Phasellus Av.","Sem estoque"),
    ("3","3","4975 Sagittis Rd.","Sem estoque"),
    ("4","2","5829 Lobortis Ave","Disponível"),
    ("5","1","716-5791 Aliquam St.","Disponível");
