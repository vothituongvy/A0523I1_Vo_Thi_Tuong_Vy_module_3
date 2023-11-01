create database ss2_b2;
use ss2_b2;
create table customer(
cid int not null auto_increment primary key,
cname varchar(30),
cage varchar(30)
);
create table orders(
  oid INT NOT NULL,
  cid INT NOT NULL,
  odate DATETIME,
  ototalprice DOUBLE,
  PRIMARY KEY ( oid),  
  FOREIGN KEY (cid) REFERENCES customer(cid)
);
create table product(
pid int not null primary key auto_increment,
pname varchar(30),
pprice double
);
create table orderdetails(
odqty varchar(30),
pid int not null,
oid int not null,
primary key(pid,oid),
foreign key (pid) references product(pid),
foreign key (oid) references orders(oid)
);
