SELECT * FROM ecommerce2.cards;

select * from ecommerce2.clients;
select * from ecommerce2.clients where typeClient="PF";

select count(*) from ecommerce2.orders;

select * from ecommerce2.product order by size desc;

select * from clients c, orders o where c.idClient = idOrder_idClient;

select c.Fname, c.Lname, o.orderStatus, o.orderStatus from clients c, orders o where c.idClient = idOrder_idClient;
select concat(c.Fname, '',c.Lname) as Client, o.orderStatus, o.orderStatus from clients c, orders o where c.idClient = idOrder_idClient;

select count(*) from clients c, orders o where c.idClient = idOrder_idClient group by idOrder;

-- Recuperar pedidos associados ao cliente?
select * from clients left outer join orders on idClient = idOrder_idClient;

select * from productOrder;
select * from clients inner join orders on idClient = idOrder_idClient inner join product on idProduct;

-- Quantos pedidos foram feitos pelos Clientes?
select c.idClient, c.Fname ,count(*) as number_of_orders from clients c inner join orders o on c.idClient = o.idOrder_idClient inner join productOrder p on p.idPOorder = o.idOrder group by c.idClient;
