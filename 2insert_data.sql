drop database learn_sql;
create database learn_sql;

use learn_sql;

create table products
(
    id          int          not null,
    name        varchar(30)  not null,
    description text,
    price       int unsigned not null,
    quantity    int unsigned not null default 0,
    created_at  timestamp    not null default current_timestamp
);

# measukan data ke tabel product
insert into products (id, name, price, quantity)
values (1, 'mie ayam', 10000, 100);

insert into products (id, name, description, price, quantity)
values (2, 'mie ayam bakso sapi', 'bakso kecil 3 buah', 13000, 80),
       (3, 'mie ayam bandung', 'menggunakan mie kriting', 15000, 80),
       (4, 'mie ayam bakso babi', 'bakso kecil babi 3 buah', 16000, 60);

# melihat semua data yang ada di tabel product
select *
from products;

# melihat semua data id, name, price quantity
select id, name, price, quantity
from products;

# melihat semua data dengan harga = 10000
select *
from products
where price = 10000;

# tambah field category tipe data enum, urutan setelah name
alter table products
    add column category enum ('makanan', 'minuman', 'lainnya') after name;

# ubah semua data pada field category menjadi bernilai makanan
UPDATE products
SET category = 'makanan';

insert into products (id, name, description, price, quantity)
values (5, 'es teh', 'teh sari wangi', 3000, 300),
       (6, 'es jeruk', 'nutrisari', 5000, 200);

insert into products (id, name, description, price, quantity)
values (7, 'es teh', 'teh sari wangi', 3000, 300);

# ubah data pada field category menjadi bernilai minuman
# pada data yg mempunyai id 5 dan 6
update products
set category = 'minuman'
where id = 5
  and 6;

# ubah data pada field price menjadi (harga + 1000 - 1000)
# pada data yg mempunyai id 6
update products
set price = price + 1000 - 1000
where id = 6;

# menghabus record yang ber id 6
delete
from products
where id = 7;

# alias pada column
select p.id       as 'kode',
       p.name     as 'nama',
       p.category as 'kategori',
       p.price    as 'harga',
       p.quantity as 'stok'
from products as p;

# melihat semua data yang categorynya tidak sama dengan makanan
select *
from products
where category != 'makanan';

# melihat semua data yang quantitynya lebih dari 80
select *
from products
where quantity > 80;

# melihat semua data yang categorynya = makanan
# dan harga kurang dari 12000
select *
from products
where category = 'makanan'
  and price < 12000;

# melihat semua data yang quantitinya lebih dari 80
# atau price lebih dari 15000
select *
from products
where quantity > 80
   or price > 15000;

# melihat semua data yang pricenya lebih dari (1000 + 1000) * 7
# kurung dikerjakan terlebih dahulu
select *
from products
where price > (1000 + 1000) * 7;

# melihat semua data yang namenya terdapat kata babi
select *
from products
where name like '%babi%';

# melihat semua data yang namenya berawalan kata e
select *
from products
where name like 'e%';

# melihat semua data yang namenya berakhiran kata k
select *
from products
where name like '%k';

# melihat semua data yang descriptionnya bernilai null
select *
from products
where description is null;

# melihat semua data yang descriptionnya tidak bernilai null
select *
from products
where description is not null;

# melihat semua data yang pricenya antara 14000 sampai 15000
select *
from products
where price between 14000 and 15000;

# melihat semua data yang pricenya tidak diantara 13000 sampai 15000
select *
from products
where price not between 13000 and 15000;

# melihat semua data yang categornya berisi makanan dan minuman
select *
from products
where category in ('makanan', 'minuman');

# melihat semua data yang categornya tidak berisi lainnya dan minuman
select *
from products
where category not in ('lainnya', 'minuman');

# melihat semua data dengan urutan berdasarkan category
select *
from products
order by category;

# melihat semua data dengan urutan berdasarkan kategori ascending, lalu price descending
select *
from products
order by category asc, price desc;

# melihat semua 5 data pertama
select *
from products
limit 5;

# melihat semua data tapi lewati 3 data pertama dan ambil 5 data setelahnya
select *
from products
limit 3,5;

# melihat data category dan hapus record yang duplikat
select distinct category
from products;

# tampilkan data 10, 20, dan 10 + 20
select 10, 20, 10 + 20 as hasil;

# tampilkan id, name, price, dan price dibage 1000 (hasil integer)
select id, name, price, price div 1000 as 'price in k'
from products;

# tampilkan nilai pi
select pi();

# tampilkan nilai cos, sin, tan dari price
select id, cos(price), sin(price), tan(price)
from products;

# tampilkan id, name, price yang pricenya
# ketika dibagi 1000 hasilnya lebih dari 15
select id, name, price
from products
where price div 1000 > 15;


