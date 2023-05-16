/*
 membuat tabel data
 membuat unique key (record harus unik) pada field email,
 dengan alias email_unique

 */
create table customers
(
    id         int          not null auto_increment,
    email      varchar(100) not null,
    first_name varchar(100) not null,
    last_name  varchar(100),
    primary key (id),
    unique key email_unique (email)
);

desc customers;

# hapus unique key pada email_unique (field email masih ada)
alter table customers
    drop constraint email_unique;

# jadikan field email menjadi unique dengan alias email_unique
alter table customers
    add constraint email_unique unique (email);

insert into customers (email, first_name, last_name)
values ('tomkun@ex', 'tomkun', 'meow');

# akan error karena record dari field email akan terduplicate
insert into customers (email, first_name, last_name)
values ('tomkun@ex', 'tomkun', 'meow');

insert into customers (email, first_name, last_name)
values ('miki@ex', 'miki', 'miu');

# record miki akan memiliki id otomatis 3,
# karena auto increment akan generate +1 walaupun datanya akan ditolak
select *
from customers;


