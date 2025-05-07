select * from customer

select * from orders

select distinct dish,cusine from orders

create or replace function insert_customer(id int, cust_id int, chief int, waiter int, tableno int, dish varchar, qty int,restaurantid int)
returns varchar as $$
declare result varchar;

begin
	case
		when dish ='pasta' then 
			result ='italian';
		when dish ='pizza' then 
			result ='italian';
	    when dish ='lasagna' then 
			result ='italian';
	    when dish ='grilled chicken' then 
			result ='barbecue';
		when dish ='bbq ribs' then 
			result ='barbecue';
		when dish ='lobster' then 
			result ='seafood';
		when dish ='grilled salmon' then 
			result ='seafood';
		when dish ='nachos' then 
			result ='mexican';
		when dish ='tacos' then 
			result ='mexican';
		when dish ='spring rolls' then 
			result ='chinese';
		when dish ='fried rice' then 
			result ='chinese';
		when dish ='manchurian' then 
			result ='chinese';
		when dish ='biryani' then 
			result ='indian';
		when dish ='butter chicken' then 
			result ='indian';
		when dish ='panner tikka' then 
			result ='indian';
		when dish ='kofta curry' then 
			result ='indian';
		when dish ='dal makhani' then 
			result ='indian';
		when dish ='green curry' then 
			result ='thai';
		when dish ='ice cream' then 
			result ='dessert';
		when dish ='chocolate cake' then
			result ='dessert';
		
		else result='invalid input';
    end case;

	insert into orders (id,cust_id,chief,waiter,tableno,dish,qty,restaurantid,cusine)
	values (id,cust_id,chief,waiter,tableno,dish,qty,restaurantid,result);

	return result;

end;
$$ language plpgsql;

select * from orders

select insert_customer (5268,2,9,10,17,'grilled chicken',2,2);
select insert_customer (4589,1,3,4,14,'pasta',1,1);
select insert_customer (2357,1,5,2,18,'chocolate cake',2,1);
select insert_customer (1234,2,7,8,13,'nachos',4,2);
select insert_customer (8523,2,9,10,16,'lobster',3,2);
