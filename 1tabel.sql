# membuat database
create database learn_mysql;

# melihat semua database
show databases;

# masuk ke database
use learn_mysql;

# buat tabel dengan nama barang
create table barang
(
    id     int not null,
    nama   varchar(30),
    harga  int,
    jumlah int
);

# melihat semua tabel
show tables;

# descripsi barang
desc barang;
describe barang;

# melihat query pembuatan tabel barang
show create table barang;

# menambah tabel deskripsi(text) di urutan terakhir
alter table barang
    add column deskripsi text;

# menambah field salah, dan menghapusnya kembali
alter table barang
    add column salah text;

alter table barang
    drop column salah;

# mengubah field nama di urutan setelah deskripsi
alter table barang
    modify nama varchar(30) after deskripsi;

# mengubah field nama di urutan pertama
alter table barang
    modify nama varchar(30) first;

/*
 mengubah id, nama, jumlah, harga menjadi not null,
 membuat jumlah, harga otomatis diisi 0 jika tidak dimasukan, dan tidak boleh minus
 */
alter table barang
    modify id int not null,
    modify nama varchar(30) not null,
    modify jumlah int unsigned not null default 0,
    modify harga int unsigned not null default 0;

/*
 menambah field waktu_dibuat tipe data timestamp not null d
 an akan diisi waktu saat ini bila tidak dimasukan
 */
alter table barang
    add waktu_dibuat timestamp not null default current_timestamp;

# mengisi data pada tabel barang
insert into barang (id, nama)
values (1, 'apel');

# melihat semua isi data pada tabel barang
select *
from barang;

# menghapus semua data pada barang
truncate barang;

# menghapus tabel barang
drop table barang;

# menghapus databse
drop database learn_mysql;

