create database ss2_ba1;
use ss2_ba1;
create table PHIEUXUAT(
	SoPX int primary key,
    NgayXuat date
);
create table VATTU(
	MaVTU int primary key,
    TenVTU varchar(50)
);
create table PHIEUNHAP(
	SoPN int primary key,
    NgayNhap date
);
create table NHACC(
	MaNCC int primary key,
    TenNCC varchar(50),
    Diachi varchar(50),
    SoDT varchar(20)
);
create table DONDH(
	SoDH int primary key,
    NgayDH date,
    NHACC_MaNCC int ,
    foreign key (NHACC_MANCC) references NHACC(MaNCC)
);
create table ChiTietPhieuSanXuat(
	DGXuat int ,
    SLXuat int,
    PHIEUXUAT_SoPX int,
    VATTU_MaVTU int,
primary key (PHIEUXUAT_SoPX, VATTU_MaVTU), 
  foreign key(PHIEUXUAT_SoPX) references PHIEUXUAT(SoPX), 
  foreign key(VATTU_MaVTU) references VATTU(MaVTU)
);
create table ChiTieuPhieuNhap(
	DGNhap int ,
    SLNhap int ,
	VATTU_MAVTU int,
    PHIEUNHAP_SoPN int,
	primary key (VATTU_MaVTU, PHIEUNHAP_SoPN), 
	foreign key(VATTU_MaVTU) references VATTU(MaVTU), 
    foreign key(PHIEUNHAP_SoPN) references PHIEUNHAP(SoPN)
);
create table ChiTietDonDatHang(
  VATTU_MaVTU int,
  DONDH_SoDH int ,
  primary key (VATTU_MaVTU, DONDH_SoDH), 
  foreign key(VATTU_MaVTU) references VATTU(MaVTU), 
  foreign key(DONDH_SoDH) references DONDH(SoDH)
);
