select khach_hang.ma_khach_hang,
       khach_hang.ho_ten,
       loai_khach.ten_loai_khach,
       hop_dong.ma_hop_dong,
       dich_vu.ten_dich_vu,
       hop_dong.ngay_lam_hop_dong,
       hop_dong.ngay_ket_thuc,
       (dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia) as tong_tien
from khach_hang
         left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong_chi_tiet = khach_hang.ma_khach_hang
         left join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_khach_hang
         left join hop_dong on hop_dong.ma_hop_dong = khach_hang.ma_khach_hang
         left join dich_vu on dich_vu.ma_dich_vu = khach_hang.ma_khach_hang
         left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = khach_hang.ma_khach_hang;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
from dich_vu
         join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_hop_dong
         join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_dich_vu
where dich_vu.ma_dich_vu not in
      (select dich_vu.ma_dich_vu
       from dich_vu
                join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_hop_dong
           between '2021-1-1' and '2021-4-1')
group by dich_vu.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
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
group by dich_vu.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select distinct khach_hang.ho_ten
from khach_hang;

select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;

select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten
having count(*) = 1;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month (ngay_lam_hop_dong) as thang, count (1) as so_luong_khach_hang
from hop_dong
where year (ngay_lam_hop_dong) = 2021
group by thang;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hop_dong.ma_hop_dong,
       hop_dong.ngay_lam_hop_dong,
       hop_dong.ngay_ket_thuc,
       hop_dong.tien_dat_coc,
       SUM(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from hop_dong
         join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong_chi_tiet
         join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong.ma_hop_dong
group by hop_dong.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from khach_hang
         join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
         join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
         join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
         join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where (loai_khach.ten_loai_khach = 'Diamond')
  and (khach_hang.dia_chi like '%Vinh%' or khach_hang.dia_chi like '%Quảng Ngãi%');

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021
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
group by hop_dong.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
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

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
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

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
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
having count (hd.ma_nhan_vien) <=3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
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

-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
select *
from khach_hang
         join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
         left join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
         left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where loai_khach.ten_loai_khach = 'Platinium'
group by khach_hang.ma_khach_hang
having thanh_tien >= 10000000;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set
sql_safe_updates = 0;
delete
from khach_hang
where ma_khach_hang in
      (select ma_khach_hang
       from hop_dong
       where year (
    ngay_lam_hop_dong)
    < 2021);
set
sql_safe_updates = 1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem
         join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
         join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where year (hop_dong.ngay_lam_hop_dong) = 2020
group by dich_vu_di_kem.ma_dich_vu_di_kem
having sum (hop_dong_chi_tiet.so_luong) > 10;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union all
select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, nhan_vien.so_dien_thoai, nhan_vien.ngay_sinh, nhan_vien.dia_chi
from nhan_vien
         join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where (nhan_vien.dia_chi = 'Hai Chau')
  and exists
    (select hop_dong.ma_hop_dong
     from hop_dong
     where hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
       and hop_dong.ngay_lam_hop_dong = '12/12/2019');

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update v_nhan_vien
set nhan_vien.dia_chi = 'Lien Chieu';

--  23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter
//
create procedure sp_xoa_khach_hang(in p_ma_khach_hang int)
begin
delete
from khach_hang
where ma_khach_hang = p_ma_khach_hang;
end;
// delimiter 

call sp_xoa_khach_hang(1) ;

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong  
-- yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan
delimiter
//
create procedure sp_them_moi_hop_dong(in p_ma_hop_dong int, in p_ngay_lam_hop_dong datetime,
                                      in p_ngay_ket_thuc datetime, in p_tien_dat_coc double, in p_ma_nhan_vien int,
                                      in p_ma_khach_hang int, in p_ma_dich_vu int, out result varchar (50))
begin
    if
exists (select distinct hop_dong.ma_hop_dong from hop_dong ) then
	set result = 'Hop dong da ton tai ';
end if;
    
    if
exists (select distinct nhan_vien.ma_nhan_vien from nhan_vien ) then
    set result = 'Nhan vien da co hop dong';
end if;
    
    if
exists (select distinct khach_hang.ma_khach_hang from khach_hang ) then
    set result = 'Khach hang da co hop dong ';
end if;
    
    if
exists (select distinct dich_vu.ma_dich_vu from dich_vu ) then
    set result = 'Dich vu da duoc su dung';
end if;
    
    if
exists (select distinct hop_dong_chi_tiet.ma_hop_dong_chi_tiet from hop_dong_chi_tiet) then
    set result = 'Hop dong nay da duoc su dung';
end if;


insert into hop_dong(ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang,
                     ma_dich_vu)
values (p_ma_hop_dong, p_ngay_lam_hop_dong, p_ngay_ket_thuc, p_tien_dat_coc, p_ma_nhan_vien, p_ma_khach_hang,
        p_ma_dich_vu);
end
//
 delimiter ;

call sp_them_moi_hop_dong(14,'2023-09-06','2023-09-12',200000,2,2,3,@result);
select @result;

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong
-- hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
// delimiter
create trigger tr_xoa_hop_dong
begin
    declare count int;
    delete from hop_dong;
    select count(*) into count from hop_dong;
    set @count = count;
end // delimiter

select @count;














19:39:21	select hop_dong.ma_hop_dong,        nhan_vien.ho_ten,        khach_hang.ho_ten,        khach_hang.so_dien_thoai,        dich_vu.ten_dich_vu,        sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem,        hop_dong.tien_dat_coc,        hop_dong.ngay_lam_hop_dong from hop_dong          join nhan_vien on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien          join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang          join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu          left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong where hop_dong.ma_hop_dong in       (select ma_hop_dong from hop_dong where hop_dong.ngay_lam_hop_dong between '2020-10-31' and '2020-12-31')   and hop_dong.ma_hop_dong not in       (select ma_hop_dong from hop_dong where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-06-31') group by hop_dong.ma_hop_dong LIMIT 0, 1000	Error Code: 1055. Expression #5 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'furama.dich_vu.ten_dich_vu' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.031 sec

    