create database Furama;
use Furama;
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);
CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);
CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);
CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);
CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach),
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45)
);
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);
CREATE TABLE dich_vu (
    ma_dich_vu INT,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT NOT NULL,
    ma_loai_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu),
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT
);
create index index_ma_dich_vu on dich_vu(ma_dich_vu);
CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    ma_nhan_vien INT NOT NULL,
    ma_khach_hang INT NOT NULL,
    ma_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45)
);
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem),
    so_luong INT NOT NULL
);
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('1', '5', 'Nguyễn Thị Hào', '1970-11-07',0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('2', '3', 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('3', '1', 'Trương Đình Nghệ', '1990-02-27',1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('5', '4', 'Hoàng Trần Nhi Nhi', '1995-12-09',0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('6', '4', 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('9', '1', 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01',1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue, ma_loai_dich_vu) 
VALUES 
(1, 'villa beach front', 25000, 1000000, 10, 'vip', 'có hồ bơi', 500, 4, null, 3, 1),
(2, 'house princess 01', 14000, 5000000, 7, 'vip', 'có thêm bếp nướng', null, 3, null, 2, 2),
(3, 'room twin 01', 5000, 1000000, 2, 'normal', 'có tivi', null, null, '1 xe máy, 1 xe đạp', 4, 3),
(4, 'villa no beach front', 22000, 9000000, 8, 'normal', 'có hồ bơi', 300, 3, null, 3, 1),
(5, 'house princess 02', 10000, 4000000, 5, 'normal', 'có thêm bếp nướng', null, 2, null, 3, 2),
(6, 'room twin 02', 3000, 900000, 2, 'normal', 'có tivi', null, null, '1 xe máy', 4, 3);
-- cau2
select * 
from nhan_vien
where ho_ten like 'h%' or ho_ten like 't%' or ho_ten like 'k%' and length(ho_ten) <=15;
-- cau3
select *  
from khach_hang
where (DATEDIFF(curdate(),ngay_sinh)>=18*365 and DATEDIFF(curdate(),ngay_sinh) <=50*365) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');
-- cau4
SELECT h.ma_khach_hang ,k.ho_ten, COUNT(*) AS so_lan_dat_phong
FROM hop_dong h
join khach_hang k on h.ma_khach_hang=k.ma_khach_hang
join loai_khach l on k.ma_loai_khach=l.ma_loai_khach
WHERE l.ma_loai_khach = 1
GROUP BY h.ma_khach_hang
ORDER BY so_lan_dat_phong ASC;
-- cau5
select k.ma_khach_hang,
k.ho_ten,
l.ten_loai_khach,
h.ma_hop_dong,
d.ten_dich_vu,
h.ngay_lam_hop_dong,
h.ngay_ket_thuc,
(d.chi_phi_thue + hdct.so_luong*dvdk.gia) as tong_tien
from khach_hang k
left join loai_khach l on k.ma_loai_khach=l.ma_loai_khach
left join hop_dong h on k.ma_khach_hang=h.ma_khach_hang
left join hop_dong_chi_tiet hdct on h.ma_hop_dong=hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
left join dich_vu d on h.ma_dich_vu=d.ma_dich_vu;
-- cau6
select dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
from dich_vu
         join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_hop_dong
         join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_dich_vu
where dich_vu.ma_dich_vu not in
      (select dich_vu.ma_dich_vu
       from dich_vu
                join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_hop_dong
           between '2021-1-1' and '2021-4-1');
-- cau7
select dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from dich_vu
         join loai_dich_vu on dich_vu.ma_dich_vu = loai_dich_vu.ma_loai_dich_vu
         join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_hop_dong
where dich_vu.ma_dich_vu in (
    select dich_vu.ma_dich_vu
    from dich_vu
             join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
    where year (
    ngay_lam_hop_dong) = 2020
  and dich_vu.ma_dich_vu not in (
select dich_vu.ma_dich_vu
from dich_vu
    join hop_dong
on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where year (ngay_lam_hop_dong) = 2021
    )
    )
;
-- cau 8
-- c1
select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;

-- c2
select distinct khach_hang.ho_ten
from khach_hang;
-- c3
select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;
-- cau9
select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang;
-- cau 10
select hop_dong.ma_hop_dong,
       hop_dong.ngay_lam_hop_dong,
       hop_dong.ngay_ket_thuc,
       hop_dong.tien_dat_coc,
       SUM(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from hop_dong
         left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong; 
-- cau 11
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from khach_hang
         join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
         join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
         join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
         join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where (loai_khach.ten_loai_khach = 'Diamond')
  and (khach_hang.dia_chi like '%Vinh%' or khach_hang.dia_chi like '%Quảng Ngãi%');

-- cau12
select hop_dong.ma_hop_dong,
       nhan_vien.ho_ten,
       khach_hang.ho_ten,
       khach_hang.so_dien_thoai,
       dich_vu.ten_dich_vu,
       sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem,
       hop_dong.tien_dat_coc,
       hop_dong.ngay_lam_hop_dong
from hop_dong
         join nhan_vien on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
         join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
         join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
         left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where hop_dong.ma_hop_dong in
      (select ma_hop_dong from hop_dong where hop_dong.ngay_lam_hop_dong between '2020-10-31' and '2020-12-31')
  and hop_dong.ma_hop_dong not in
      (select ma_hop_dong from hop_dong where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-06-31')
group by hop_dong.ma_hop_dong,dich_vu.ten_dich_vu;
-- cau13
select ten_dich_vu_di_kem, sum(so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem
         join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having sum(so_luong) = (
    select max(so_luong_dich_vu_di_kem)
    from (
             select sum(so_luong) as so_luong_dich_vu_di_kem
             from hop_dong_chi_tiet
             group by ma_dich_vu_di_kem
         ) as ten_dich_vu_di_kem
);

-- cau14
select hop_dong.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(1) as so_lan_su_dung
from hop_dong
         join hop_dong_chi_tiet hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
         join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
         join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
         join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
where dich_vu_di_kem.ma_dich_vu_di_kem in (
    select dich_vu_di_kem.ma_dich_vu_di_kem
    from hop_dong_chi_tiet
             join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
    group by dich_vu_di_kem.ma_dich_vu_di_kem
    having count(1) = 1
)
group by hop_dong.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem;

-- cau15
select nv.ma_nhan_vien, ho_ten, td.ten_trinh_do, bp.ten_bo_phan, so_dien_thoai, dia_chi
from nhan_vien nv
         join hop_dong hd
              on hd.ma_nhan_vien = nv.ma_nhan_vien
         join trinh_do td
              on td.ma_trinh_do = nv.ma_trinh_do
         join bo_phan bp
              on bp.ma_bo_phan = nv.ma_bo_phan
where year (hd.ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <=3;
-- cau16.
set
sql_safe_updates = 0;
delete
from nhan_vien
where ma_nhan_vien not in
      (select ma_nhan_vien
       from hop_dong
       where year (
    hop_dong.ngay_lam_hop_dong) between 2019
  and 2021);
set
sql_safe_updates = 1;

