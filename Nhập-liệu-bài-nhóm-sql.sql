--BẢNG NHANVIEN :
	--Tạo dữ liệu cho bảng NHANVIEN :

		--Insert Data 
		insert into NHANVIEN
		values 
		('NV01',N'Nguyễn Thị Ngọc Lan','049302014398','2002/07/15',N'Nữ',N'Quảng Nam','0833574070'),
		('NV02',N'Nguyễn Khánh Linh','056302010611','2001/03/16',N'Nữ',N'Khánh Hòa','0899378583'),
		('NV03',N'Thái Hữu Anh Tuấn ','049302002905','2002/10/12',N'Nam',N'Quảng Nam','0941230862')
		go

--Bảng PHIEUNHAPHANG
	--Tạo dữ liệu cho bảng PHIEUNHAPHANG:

		--Insert Data:
		insert into PHIEUNHAPHANG (MaNhapHang, MaNV, TenHang, NgayNhap, GioNhap)
		values 
		('MN01','NV01',N'Cà phê','2022/07/29','09:00'),
		('MN02','NV02',N'Bột','2022/07/24','13:30'),
		('MN03','NV03',N'Sữa','2022/07/26','15:00')
		go

--BẢNG CHITIETNHAPHANG :
	--Tạo dữ liệu cho bảng CHITIETNHAPHANG :

		--Insert Data 
		insert into CHITIETNHAPHANG(MaHang, MaNhapHang, DonGia, DVT, SoLuong) 
		values ('MH01','MN01',460000,N'gói',4)
		insert into CHITIETNHAPHANG(MaHang, MaNhapHang, DonGia, DVT, SoLuong) 
		values ('MH02','MN02',100000,N'gói',5)
		insert into CHITIETNHAPHANG(MaHang, MaNhapHang, DonGia, DVT, SoLuong) 
		values ('MH03','MN03',315000,N'hộp',10)
		go

create trigger tgInsertCTNH
on CHITIETNHAPHANG
for insert
as
begin
	update CHITIETNHAPHANG
	set ThanhTien = DonGia * SoLuong

	Update PHIEUNHAPHANG
	set TongTienNhap = (select sum(ThanhTien)
						from CHITIETNHAPHANG
						where MaNhapHang = (select MaNhapHang from inserted)
						group by MaNhapHang)
	where MaNhapHang = (select MaNhapHang from inserted) 
end

--BẢNG KHACHHANG :
	--Tạo dữ liệu cho bảng KHACHHANG :

		--Insert Data 
		insert into KHACHHANG  
		values 
		('KH01',N'Nguyễn Khánh Vy','0586209928',N'K482/71A Hoàng Diệu, Đà Nẵng'),
		('KH02',N'Nguyễn Thị Hoàng Linh','0384595660',N'100 Bà Huyện Thanh Quan, Đà Nẵng'),
		('KH03',N'Nguyễn Thị Ngọc Giàu','0935235697',N'14 Doãn Uẩn, Đà Nẵng')
		go

--BẢNG HOADON :
	--Tạo dữ liệu cho bảng HOADON :

		--Insert Data 
		insert into HOADON (MaHD, MaNV, MaKH, Ngay, Gio)
		values 
		('HD01','NV01','KH01','2022/08/16','09:02'),
		('HD02','NV02','KH02','2022/08/15','09:49'),
		('HD03','NV03','KH03','2022/08/20','15:02')
		go 

--BẢNG MENU :
	--Tạo dữ liệu cho bảng MENU :
	
	--Insert Data 
		insert into MENU 
		values 
		('MM1',N'Bông lan trứng muối',35000),
		('MM2',N'Tiramisu Cake',25000),
		('MM3',N'Bento Cake',65000),
		('MM4',N'Quẩy',15000),
		('MM5',N'Cà phê sữa',20000),
		('MM6',N'Cà phê muối',29000)
		go

--BẢNG CHITIETHOADON :
	--Tạo dữ liệu cho bảng CHITIETHOADON :

	--Insert Data 
		insert into CHITIETHOADON (MaHD, MaMon, SoLuong)
		values ('HD01','MM1',2)
		insert into CHITIETHOADON (MaHD, MaMon, SoLuong)
		values ('HD01','MM2',1)
		insert into CHITIETHOADON (MaHD, MaMon, SoLuong)
		values ('HD02','MM1',1)
		insert into CHITIETHOADON (MaHD, MaMon, SoLuong)
		values ('HD02','MM3',1)
		insert into CHITIETHOADON (MaHD, MaMon, SoLuong)
		values ('HD02','MM4',1)
		insert into CHITIETHOADON (MaHD, MaMon, SoLuong)
		values ('HD02','MM5',2)
		insert into CHITIETHOADON (MaHD, MaMon, SoLuong)
		values ('HD02','MM6',1)
		insert into CHITIETHOADON (MaHD, MaMon, SoLuong)
		values ('HD03','MM1',2)
		go
	create trigger tgInsertCTHD
	on CHITIETHOADON
	for insert
	as
	begin
		declare @dongia numeric(15,0)
		set @dongia = (select DonGia 
						from MENU 
						where MaMon = (select MaMon from inserted)) 
		Update CHITIETHOADON
		set ThanhTien = SoLuong * @dongia
		where MaHD = (select MaHD from inserted) and MaMon = (select MaMon from inserted)

		Update HOADON
		set TongTien = (select sum(ThanhTien)
						from CHITIETHOADON
						where MaHD = (select MaHD from inserted)
						group by MaHD)
		where MaHD = (select MaHD from inserted)

	end

	drop trigger tgInsertCTHD

