create database vy;
use vy;
-- Tạo bảng vi_tri
CREATE TABLE vi_tri (
    id INT PRIMARY KEY,
    ten_vi_tri VARCHAR(255)
);

-- Tạo bảng trinh_do
CREATE TABLE trinh_do (
    id INT PRIMARY KEY,
    ten_trinh_do VARCHAR(255)
);

-- Tạo bảng bo_phan
CREATE TABLE bo_phan (
    id INT PRIMARY KEY,
    ten_bo_phan VARCHAR(255)
);

-- Tạo bảng nhan_vien
CREATE TABLE nhan_vien (
    id INT PRIMARY KEY,
    ho_ten VARCHAR(255),
    ngay_sinh DATE,
    so_cmnd VARCHAR(255),
    so_dien_thoai VARCHAR(255),
    email VARCHAR(255),
    vi_tri_id INT,
    trinh_do_id INT,
    bo_phan_id INT,
    FOREIGN KEY (vi_tri_id) REFERENCES vi_tri(id),
    FOREIGN KEY (trinh_do_id) REFERENCES trinh_do(id),
    FOREIGN KEY (bo_phan_id) REFERENCES bo_phan(id)
);

-- Tạo bảng loai_khach
CREATE TABLE loai_khach (
    id INT PRIMARY KEY,
    ten_loai_khach VARCHAR(255)
);

-- Tạo bảng khach_hang
CREATE TABLE khach_hang (
    id INT PRIMARY KEY,
    ho_ten VARCHAR(255),
    ngay_sinh DATE,
    gioi_tinh VARCHAR(255),
    so_cmnd VARCHAR(255),
    so_dien_thoai VARCHAR(255),
    email VARCHAR(255),
    loai_khach_id INT,
    dia_chi VARCHAR(255),
    FOREIGN KEY (loai_khach_id) REFERENCES loai_khach(id)
);

-- Tạo bảng hop_dong
CREATE TABLE hop_dong (
    id INT PRIMARY KEY,
    so_hop_dong VARCHAR(255),
    ngay_bat_dau DATE,
    ngay_ket_thuc DATE,
    so_tien_coc DECIMAL(18,2),
    tong_so_tien_thanh_toan DECIMAL(18,2),
    khach_hang_id INT,
    FOREIGN KEY (khach_hang_id) REFERENCES khach_hang(id)
);
-- Tạo bảng dich_vu_di_kem
CREATE TABLE dich_vu_di_kem (
    id INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(255),
    don_vi VARCHAR(255),
    gia_tien DECIMAL(18,2)
);

-- Tạo bảng hop_dong_chi_tiet
CREATE TABLE hop_dong_chi_tiet (
    id INT PRIMARY KEY,
    hop_dong_id INT,
    dich_vu_di_kem_id INT,
    FOREIGN KEY (hop_dong_id) REFERENCES hop_dong(id),
    FOREIGN KEY (dich_vu_di_kem_id) REFERENCES dich_vu_di_kem(id)
);


-- Tạo bảng loai_dich_vu
CREATE TABLE loai_dich_vu (
    id INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(255)
);

-- Tạo bảng kieu_thue
CREATE TABLE kieu_thue (
    id INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(255)
);

-- Tạo bảng dich_vu
CREATE TABLE dich_vu (
    id INT PRIMARY KEY,
    ten_dich_vu VARCHAR(255),
    loai_dich_vu_id INT,
    FOREIGN KEY (loai_dich_vu_id) REFERENCES loai_dich_vu(id)
);
INSERT INTO vi_tri (ma_vi_tri, ten_vi_tri) VALUES
(1, 'Lễ tân'),
(2, 'Phục vụ'),
(3, 'Chuyên viên'),
(4, 'Giám sát'),
(5, 'Quản lý'),
(6, 'Giám đốc');

-- Thêm dữ liệu vào bảng trinh_do
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES
(1, 'Trung cấp'),
(2, 'Cao đẳng'),
(3, 'Đại học'),
(4, 'Sau đại học');

-- Thêm dữ liệu vào bảng bo_phan
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES
(1, 'Sale - Marketing'),
(2, 'Hành chính'),
(3, 'Phục vụ'),
(4, 'Quản lý');

-- Thêm dữ liệu vào bảng loai_khach
INSERT INTO loai_khach (ma_, ten_loai_khach) VALUES
(1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');

-- Thêm dữ liệu vào bảng loai_dich_vu
INSERT INTO loai_dich_vu (id, ten_loai_dich_vu) VALUES
(1, 'Massage'),
(2, 'Karaoke'),
(3, 'Thức ăn'),
(4, 'Nước uống'),
(5, 'Thuê xe');

-- Thêm dữ liệu vào bảng kieu_thue
INSERT INTO kieu_thue (id, ten_kieu_thue) VALUES
(1, 'Theo giờ'),
(2, 'Theo ngày'),
(3, 'Theo tháng'),
(4, 'Theo năm');
-- ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem