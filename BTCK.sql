create DATABASE Nhom
go


-- Tao bang NHANVIEN
create table NHANVIEN
( MaNV       varchar(10) not null,
  TenNV		 nvarchar(50) not null,
  CCCD  varchar(15) not null,
  NgaySinh   date not null,
  GioiTinh   nvarchar(5) check (GioiTinh in (N'Nam',N'Nữ')),
  DiaChi     nvarchar(100),
  SDT varchar(10),
  constraint PK_NV primary key(MaNV),
 )
 go

 -- Tao bang KHACHHANG 
create table KHACHHANG
( MaKH     varchar(10) not null,
  TenKH    nvarchar(50) not null,
  SDT      varchar(10) not null,
  Diachi   nvarchar(100),
  constraint PK_KH primary key(MaKH)
)
go

-- Tao bang HOADON
create table HOADON
( MaHD    varchar(10) not null,
  MaNV    varchar(10) not null,
  MaKH    varchar(10),
  Ngay    date,
  Gio	  time,
  TongTien numeric(15,0),
  constraint PK_HD primary key(MaHD),
  constraint FK_HD_NV foreign key (MaNV) references NHANVIEN(MaNV),
  constraint FK_HD_KH foreign key (MaKH) references KHACHHANG(MaKH)
)
go

-- Tao bang MENU
create table MENU
( MaMon   varchar(10),
  TenMon  nvarchar(50),
  DonGia  numeric(15,0),
  constraint PK_MN primary key (MaMon),
 
)
-- Tao bang CHITIETHOADON
create table CHITIETHOADON
( MaHD      varchar(10),
  MaMon     varchar(10),
  SoLuong   int,
  ThanhTien numeric(15,0),
  constraint PK_CTHD PRIMARY KEY (MaHD, MaMon),
  constraint FK_CTHD_HD foreign key (MaHD) references HOADON(MaHD),
  constraint FK_CTHD_MN foreign key (MaMon) references MENU(MaMon)
)
go

-- Tao bang PHIEUNHAPHANG
create table PHIEUNHAPHANG
( MaNhapHang varchar(10),
  MaNV      varchar(10),
  TenHang	nvarchar(10),
  NgayNhap  date,
  GioNhap   time,
  SoLuong   int,
  DVT		nvarchar(10),
  TienNhap  numeric(15,0),
  constraint PK_PNH primary key (MaNhapHang),
  constraint FK_PNH_NV foreign key (MaNV) references NHANVIEN(MaNV)
)
go

-- Tao bang CHITIETNHAPHANG
create table CHITIETNHAPHANG
( MaHang     varchar(10),
  MaNhapHang varchar(10),
  SoLuong    int,
  ThanhTien numeric(15,0),
  constraint PK_CTNH PRIMARY KEY (MaHang, MaNhapHang),
  constraint FK_CTNH_PNH foreign key (MaNhapHang) references PHIEUNHAPHANG(MaNhapHang)
)
go

--BẢNG NHANVIEN :
	--Tạo dữ liệu cho bảng NHANVIEN :

		--Insert Data 
		insert into NHANVIEN values ('NV01',N'Nguyễn Thị Ngọc Lan','049302014398','2002/07/15',N'Nữ',N'Quảng Nam','0833574070')
		insert into NHANVIEN values ('NV02',N'Nguyễn Khánh Linh','056302010611','2001/03/16',N'Nữ',N'Khánh Hòa','0899378583')
		insert into NHANVIEN values ('NV03',N'Thái Hữu Anh Tuấn ','049302002905','2002/10/12',N'Nam',N'Quảng Nam','0941230862')
		go

--Bảng PHIEUNHAPHANG
	--Tạo dữ liệu cho bảng PHIEUNHAPHANG:

		--Insert Data:
		insert into PHIEUNHAPHANG values ('MN01','NV01',N'Cà phê','2022/07/29','09:00',4,'gói',115000)
		insert into PHIEUNHAPHANG values ('MN02','NV02',N'Bột','2022/07/24','13:30',5,'gói',20000)
		insert into PHIEUNHAPHANG values ('MN03','NV03',N'Sữa','2022/07/26','15:00',10,'hộp',31500)
		insert into PHIEUNHAPHANG values ('MN04','NV03',N'Trứng','2022/07/15','16:00',10,'vỉ',29000)
		insert into PHIEUNHAPHANG values ('MN05','NV01',N'Trân Châu','2022/07/2','08:00',10,'bịch',25000)
		insert into PHIEUNHAPHANG values ('MN06','NV03',N'Kem Chee','2022/07/26','15:00',10,'hộp',65000)
		insert into PHIEUNHAPHANG values ('MN07','NV02',N'Rish','2022/07/13','15:00',10,'hộp',70000)
		go
--BẢNG CHITIETNHAPHANG :
	--Tạo dữ liệu cho bảng CHITIETNHAPHANG :

		--Insert Data 
		insert into CHITIETNHAPHANG values ('MH01','MN01',4,460000)
		insert into CHITIETNHAPHANG values ('MH02','MN02',5,100000)
		insert into CHITIETNHAPHANG values ('MH03','MN03',10,315000)
		insert into CHITIETNHAPHANG values ('MH04','MN04',10,290000)
		insert into CHITIETNHAPHANG values ('MH05','MN05',10,250000)
		insert into CHITIETNHAPHANG values ('MH06','MN06',10,650000)
		insert into CHITIETNHAPHANG values ('MH07','MN07',10,700000)

		go
--BẢNG KHACHHANG :
	--Tạo dữ liệu cho bảng KHACHHANG :

		--Insert Data 
		insert into KHACHHANG values ('KH01',N'Nguyễn Khánh Vy','0586209928',N'K482/71A Hoàng Diệu, Đà Nẵng')
		insert into KHACHHANG values ('KH02',N'Nguyễn Thị Hoàng Linh','0384595660',N'100 Bà Huyện Thanh Quan, Đà Nẵng')
		insert into KHACHHANG values ('KH03',N'Nguyễn Thị Ngọc Giàu','0935235697',N'14 Doãn Uẩn, Đà Nẵng')
		go
--BẢNG HOADON :
	--Tạo dữ liệu cho bảng HOADON :

		--Insert Data 
		insert into HOADON values ('HD01','NV01','KH01','2022/08/16','09:02',95000)
		insert into HOADON values ('HD02','NV02','KH02','2022/08/15','09:49',184000)
		insert into HOADON values ('HD03','NV03','KH03','2022/08/20','15:02',99000)
		go
--BẢNG MENU :
	--Tạo dữ liệu cho bảng MENU :
	
	--Insert Data 
		insert into MENU values ('MM1',N'Bông lan trứng muối',35000)
		insert into MENU values ('MM2',N'Tiramisu Cake',25000)
		insert into MENU values ('MM3',N'Bento Cake',65000)
		insert into MENU values ('MM4',N'Quẩy',15000)
		insert into MENU values ('MM5',N'Cà phê sữa',20000)
		insert into MENU values ('MM6',N'Cà phê muối',29000)
		insert into MENU values ('MM7',N'Trà Sữa Trân Châu Đường Đen',27000)
		insert into MENU values ('MM8',N'Trà Sữa Hoa Nhài',29000)
		insert into MENU values ('MM9',N'Trà Sữa Thái Xanh',29000)
		go
--BẢNG CHITIETHOADON :
	--Tạo dữ liệu cho bảng CHITIETHOADON :

	--Insert Data 
		insert into CHITIETHOADON values ('HD01','MM1',2,70000)
		insert into CHITIETHOADON values ('HD01','MM2',1,25000)
		insert into CHITIETHOADON values ('HD02','MM1',1,35000)
		insert into CHITIETHOADON values ('HD02','MM3',1,65000)
		insert into CHITIETHOADON values ('HD02','MM4',1,15000)
		insert into CHITIETHOADON values ('HD02','MM5',2,40000)
		insert into CHITIETHOADON values ('HD02','MM6',1,29000)
		insert into CHITIETHOADON values ('HD03','MM1',2,70000)
		insert into CHITIETHOADON values ('HD03','MM9',1,29000)
		go


