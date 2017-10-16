USE master
GO
IF DB_ID('QLHH') IS NOT NULL
BEGIN;
	DROP Database QLHH;
END;
GO
Create Database QLHH;
GO
USE QLHH
GO
Create Table NHA_CUNG_CAP
(
	Ma char(10) not null,
	Ten nvarchar(50),
	DiaChi nvarchar(100),
	DienThoai int,

	Constraint PK_NHA_CUNG_CAP
	Primary Key(Ma),
)
Create Table MAT_HANG
(
	Ma char(10) not null,
	Ten nvarchar(50),
	DonViTinh nvarchar(50),
	QuiCach nvarchar(10),
	SoLuongTon int,

	Constraint PK_MAT_HANG
	Primary Key(Ma),
)
Create Table CUNG_UNG
(
	MaNhaCungCap char(10),
	MaMatHang char(10),

	Constraint PK_CUNG_UNG
	Primary Key(MaNhaCungCap,MaMatHang),
)
Create Table DAT_HANG
(
	So int not null,
	Ngay datetime,
	MaNhaCungCap char(10),
	GhiChu nvarchar(50),
	SoMatHang int,
	ThanhTien int,

	Constraint PK_DAT_HANG
	Primary Key(So),
)
Create Table CHI_TIET_DAT_HANG
(
	SoDatHang int,
	MaMatHang char(10),
	SoLuongDat int,
	DonGiaDat int,
	ThanhTien int,

	Constraint PK_CHI_TIET_DAT_HANG
	Primary Key(SoDatHang,MaMatHang),
)
Create Table GIAO_HANG
(
	So int not null,
	Ngay datetime,
	SoDatHang int,

	Constraint PK_GIAO_HANG
	Primary Key(So),
)
Create Table CHI_TIET_GIAO_HANG
(
	SoGiaoHang int,
	MaMatHang char(10),
	SoLuongGiao int,

	Constraint PK_CHI_TIET_GIAO_HANG
	Primary Key(SoGiaoHang,MaMatHang),
)

Alter Table CUNG_UNG
ADD Constraint FK_CUNGUNG_NHACUNGCAP
Foreign Key(MaNhaCungCap)
References NHA_CUNG_CAP(Ma)

Alter Table CUNG_UNG
ADD Constraint FK_CUNGUNG_MATHANG
Foreign Key(MaMatHang)
References MAT_HANG(Ma)

Alter Table DAT_HANG
ADD Constraint FK_DATHANG_NHACUNGCAP
Foreign Key(MaNhaCungCap)
References NHA_CUNG_CAP(Ma)

Alter Table CHI_TIET_DAT_HANG
ADD Constraint FK_CHITIETDATHANG_DATHANG
Foreign Key(SoDatHang)
References DAT_HANG(So)

Alter Table CHI_TIET_DAT_HANG
ADD Constraint FK_CHITIETDATHANG_MATHANG
Foreign Key(MaMatHang)
References MAT_HANG(Ma)

Alter Table GIAO_HANG
ADD Constraint FK_GIAOHANG_DATHANG
Foreign Key(SoDatHang)
References DAT_HANG(So)

Alter Table CHI_TIET_GIAO_HANG
ADD Constraint FK_CHITIETGIAOHANG_GIAOHANG
Foreign Key(SoGiaoHang)
References GIAO_HANG(So)

Alter Table CHI_TIET_GIAO_HANG
ADD Constraint FK_CHITIETGIAOHANG_MATHANG
Foreign Key(MaMatHang)
References MAT_HANG(Ma)