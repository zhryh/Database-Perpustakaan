CREATE DATABASE tubes;

USE tubes;

CREATE TABLE author 
(
    nama_author	VARCHAR(512),
    email	VARCHAR(512),
    primary key (nama_author)
);

INSERT INTO author (nama_author, email) VALUES 
('Haji Abdul Malik Karim Amrullah', 'amkamutia@gmail.com'),
('Andrea Hirata', 'andreahirata@gmail.com'),
('Pramoedya Ananta Toer', 'pramoedya@gmail.com'),
('Tere Liye', 'darwisdarwis@yahoo.com'),
('Pidi Baiq', 'pidibaiq@gmail.com');

CREATE TABLE Buku 
(
    ISBN_buku	VARCHAR(512),
    Nama_author	VARCHAR(512),
    judul	VARCHAR(512),
    tahun_terbit	INT,
    jumlah_buku	INT,
    Primary key (ISBN_buku),
	CONSTRAINT FK_nama_author FOREIGN KEY (nama_author) REFERENCES author(nama_author)
);

INSERT INTO Buku (ISBN_buku, Nama_author, judul, tahun_terbit, jumlah_buku) VALUES 
('ISBN 234-287-389', 'Haji Abdul Malik Karim Amrullah', 'Tenggelammnya Kaal Van Der Wijck', '1938', '2'),
('ISBN 255-987-645', 'Andrea Hirata', 'Laskar Pelangi', '2005', '4'),
('ISBN 435-982-122', 'Pramoedya Ananta Toer', 'Bumi Manusia', '2011', '1'),
('ISBN 983-997-889', 'Tere Liye', 'Rindu', '2014', '3'),
('ISBN 987-344-657', 'Pidi Baiq', 'Dilan 1990', '2014', '3');

CREATE TABLE staff 
(
    id_staff	INT,
    alamat	VARCHAR(512),
    email	VARCHAR(512),
    nama	VARCHAR(512),
    primary key (id_staff)
);

INSERT INTO staff (id_staff, alamat, email, nama) VALUES 
('130564', 'Cycas Street, Number 87, Padalarang', 'antono324@yahoo.com', 'Antonio kusuma'),
('130566', 'Kusuma Street, Number 29, Cimahi', 'johan.alex@gmail.com', 'alex jhon'),
('130596', 'Wastu Haji Street, Number 99, Bekasi', 'yuniipuspitaa@gmail.com', 'yuni puspita'),
('130578', 'Bunga Raya Street, Number 102, Bekasi', 'kevinhermawank@yahoo.com', 'kevin hermawan'),
('130598', 'Kencana Street, Number 13, Bandung', 'jon.gplate@yahoo.com', 'jhonny G plate');

CREATE TABLE Member 
(
    id_member	INT,
    nama	VARCHAR(512),
    alamat	VARCHAR(512),
    email	VARCHAR(512),
    primary key (id_member)
);

INSERT INTO Member (id_member, nama, alamat, email) VALUES 
('1435', 'Eka', 'Jalan Melati no.9', 'ekawati1999@gmail.com'),
('1536', 'Farah', 'Jalan Mawar no.4', 'farahcantik@gmail.com'),
('1827', 'Arif', 'Bojongsoang', 'ariffaisal12@gmail.com'),
('2164', 'Sarip', 'Jalan Pisang no.2', 'sarip@gmail.com'),
('2331', 'Adiba', 'BTN Cabalu no.18', 'adibazahriyah03@gmail.com');

CREATE TABLE penerbit 
(
    id_penerbit	INT,
    nama_penerbit	VARCHAR(512),
    alamat_penerbit	VARCHAR(512),
    email_penerbit	VARCHAR(512),
    primary key (id_penerbit)
);

INSERT INTO penerbit (id_penerbit, nama_penerbit, alamat_penerbit, email_penerbit) VALUES 
('1204587632', 'GENTA', 'BSD Commercial Building No. 1098, Tangerang', 'Gentabukucemerlang@yahoo.com'),
('1207840365', 'LIGHT WORLD', 'Palasari Utara Street No. 2213, Bandung', 'lightworldutama@yahoo.co.id'),
('1203987630', 'PRASETYA MULYA', 'Ujung Genteng Commercial Building No. 902, West Jakarta', 'prasetyamulya@yahoo.com'),
('1204713908', 'WICAKSONO HOUSE', 'Binaraga Main Street No. 223, Bogor', 'wacaksonosumbergemilang@yahoo.co.id'),
('1204976301', 'BOOK RECOVER', 'Wastukencana Street No. 997, East Jakarta', 'bookrecover@yahoo.com');

CREATE TABLE pembelian 
(
    id_pembelian	INT,
    ISBN_buku	VARCHAR(512),
    id_penerbit	INT,
    tanggal_pembelian date,
    primary key(id_pembelian),
	CONSTRAINT FK_bukupembelian FOREIGN KEY (ISBN_buku) REFERENCES buku(ISBN_buku),
	CONSTRAINT FK_memberpembelian FOREIGN KEY (id_penerbit) REFERENCES penerbit(id_penerbit)
);

INSERT INTO pembelian (id_pembelian, ISBN_buku, id_penerbit, tanggal_pembelian) VALUES 
('65345', 'ISBN 234-287-389', '1204587632', '2022-04-10'),
('63452', 'ISBN 255-987-645', '1207840365', '2022-05-15'),
('62354', 'ISBN 435-982-122', '1203987630', '2022-08-24'),
('61423', 'ISBN 983-997-889', '1204713908', '2022-02-12'),
('61345', 'ISBN 987-344-657', '1204976301', '2022-07-30');

CREATE TABLE peminjaman
    (    id_peminjaman int,
        id_member int,
        constraint FK_id_member_peminjaman foreign KEY (id_member) REFERENCES member(id_member),
        ISBN_buku varchar(512),
        CONSTRAINT FK_bukupeminjaman FOREIGN KEY (ISBN_buku) REFERENCES buku(ISBN_buku),
		 id_staff int,
         constraint FK_id_staff_peminjaman foreign key (id_staff) references staff(id_staff),
         tanggal_peminjaman date,
         tanggal_kembali date,
         denda int,
         primary key(id_peminjaman)
     );
INSERT INTO peminjaman (id_peminjaman, id_member, ISBN_buku, id_staff, tanggal_peminjaman, tanggal_kembali, denda) VALUES
('0234','1435','ISBN 234-287-389','130564','2022-10-24','2022-10-30','0'),
('0235','1536','ISBN 255-987-645','130566','2022-10-26','2022-11-4','20000'),
('0236','1827','ISBN 435-982-122','130596','2022-11-15','2022-11-20','0'),
('0237','2164','ISBN 983-997-889','130578','2022-11-17','2022-11-27','30000'),
('0238','2331','ISBN 987-344-657','130598','2021-11-20','2022-11-28','10000');
