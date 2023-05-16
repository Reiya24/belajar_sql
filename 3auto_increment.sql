use learn_sql;
# auto increment membuat id auto generate ketika membuat recored baru
create table admin
(
    id         int          not null auto_increment,
    first_name varchar(100) not null,
    last_name  varchar(100) not null,
    primary key (id)
);

desc admin;

insert into admin (first_name, last_name)
values ('eko', 'kurniawan'),
       ('budi', 'nugraha'),
       ('joko', 'wee');

# id akan otomatis generate 1,2,3
select *
from admin;

# id generator akan generate dari generate + 1 sebelumnya
# tidak peduli ada data yg dihapus
delete
from admin
where id = 3;

insert into admin (first_name, last_name)
values ('joko', 'wee');

select *
from admin;

# melihat generate id terakhir
select last_insert_id();

# tampilkan id, field name lower, dan field name upper
select id, lower(name) as 'name lower', upper(name) as 'name upper'
from products;

# tampilkan id, tahun dari record created at, month dari record created at
select id, year(created_at), month(created_at)
from products;

# select id, category
# ketika record kategori = makanan, tampilkan enak
# ketika record kategori = minuman, tampilkan segar
# kalau tidak tampilkan apa tuch
select id,
       case category
           when 'makanan' then 'enak '
           when 'minuman' then 'segar'
           else 'apa tuch'
           end
from products;

# tampilkan id, price, dan price kedua
# ketika price kedua nilainya <= 13000, tampilkan murah
# jika tidak, tampilkan mahal
select id,
       price,
       if(price <= 13000, 'murah', 'mahal') as 'price kedua'
from products;

# tampilkan id, price, dan price kedua
# ketika price kedua nilainya <= 13000, tampilkan murah
# jika tidak, maka masuk kondisi if kedua
# jika price <= 1500, tampilkan mahal
# jika tidak, tampilkan mahal banget
select id,
       price,
       if(price <= 13000, 'murah', if(price <= 15000, 'mahal', 'mahal banget')) as 'price kedua'
from products;

# tampilkan id, name, descriptionw
# ketika record description bernilai null, maka tampilkan kosong
select id, name, ifnull(description, 'kosong')
from products;

# tampilkan total record id yang ada di tabel
select count(id) as 'total product'
from products;

# tampilkan record price termahal dari field price
select max(price) as 'product termahal'
from products;

# tampilkan recored price termurah dari field price
select min(price) as 'product termurah'
from products;

# tampilkan rata rata record price dari field price
select avg(price) as 'rata-rata harga'
from products;

# totalkan semua record dari field quantity
select sum(quantity) as 'total stock'
from products;


# --------------------------

# tampilkan total record id,category, berdasarkan masing masing record category
select count(id) as 'total product', category
from products
group by category;

# tampilkan record price termahal dari field price, category, berdasarkan masing masing record category
select max(price) as 'product termahal', category
from products
group by category;

# tampilkan recored price termurah dari field price, category, berdasarkan masing masing record category
select min(price) as 'product termurah', category
from products
group by category;

# tampilkan rata rata record price dari field price, category, berdasarkan masing masing record category
select avg(price) as 'rata-rata harga', category
from products
group by category;

# totalkan semua record dari field quantity, category, beerdasarkan masing masing record category
select sum(quantity) as 'total stock', category
from products
group by category;

# tampilkan ceategory, hitung id as total, urutkan berdasarkan category, yang mempunyai total >=1
select category, count(id) as 'total'
from products group by category having total >= 1;

