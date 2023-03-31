create DATABASE Nhom
go


-- Tao bang NHANVIEN 
create table NHANVIEN ( 
	MaNV       varchar(10) not null,
	TenNV		 nvarchar(50) not null,
	CCCD  varchar(15) not null,
	NgaySinh   date not null,
	GioiTinh   nvarchar(5) check (GioiTinh in (N'Nam',N'Nữ')),
	DiaChi     nvarchar(100),
	SĐT		varchar(10),
	constraint PK_NV primary key(MaNV),
)
go

 -- Tao bang KHACHHANG 
create table KHACHHANG( 
	MaKH     varchar(10) not null,
	TenKH    nvarchar(50) not null,
	SDT      varchar(10) not null,
	Diachi   nvarchar(100),
	constraint PK_KH primary key(MaKH)
)
go

-- Tao bang HOADON
create table HOADON(
	MaHD    varchar(10) not null,
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
create table MENU( 
	MaMon   varchar(10) not null,
	TenMon  nvarchar(50) not null,
	DonGia  numeric(15,0) not null,
	constraint PK_MN primary key (MaMon)
)
go

-- Tao bang CHITIETHOADON
create table CHITIETHOADON( 
	MaHD      varchar(10),
	MaMon     varchar(10),
	SoLuong   int,
	ThanhTien numeric(15,0),
	constraint PK_CTHD PRIMARY KEY (MaHD, MaMon),
	constraint FK_CTHD_HD foreign key (MaHD) references HOADON(MaHD),
	constraint FK_CTHD_MN foreign key (MaMon) references MENU(MaMon)
)
go

-- Tao bang PHIEUNHAPHANG
create table PHIEUNHAPHANG( 
	MaNhapHang varchar(10),
	MaNV      varchar(10),
	TenHang	nvarchar(10),
	NgayNhap  date,
	GioNhap   time,
	TongTienNhap  numeric(15,0),
	constraint PK_PNH primary key (MaNhapHang),
	constraint FK_PNH_NV foreign key (MaNV) references NHANVIEN(MaNV)
)
go

-- Tao bang CHITIETNHAPHANG
create table CHITIETNHAPHANG(
	MaHang     varchar(10),
	MaNhapHang varchar(10),
	DonGia numeric(15,0),
	DVT		nvarchar(10),
	SoLuong    int,
	ThanhTien numeric(15,0),
	constraint PK_CTNH PRIMARY KEY (MaHang, MaNhapHang),
	constraint FK_CTNH_PNH foreign key (MaNhapHang) references PHIEUNHAPHANG(MaNhapHang)
)  drop table CHITIETNHAPHANG
	drop table PHIEUNHAPHANG