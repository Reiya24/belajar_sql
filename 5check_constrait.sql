select *
from products;

insert into products (id, name, category, price, quantity)
values (7, 'permen', 'lainnya', 500, 0);

update products
set price = 1000
where id = 7;

# ubah table product
# check tambahkan check ketika ingin menambah record, price harus >= 1000
alter table products
    add constraint price_check check ( price >= 1000 );

show create table products;


# ditolak karena pricenya !>= 1000
insert into products (id, name, category, price, quantity)
values (8, 'permen kopi', 'lainnya', 500, 500);
