--Bài 1
DECLARE @NgaySinh datetime, @Tuoi datetime
Set @NgaySinh = 1996
Set @Tuoi = year(getdate()) - @NgaySinh
print N'Tuổi của bạn là: ' + CAST(CAST(@Tuoi AS int) AS char(10))

--Bài 2
DECLARE @So1 int, @So2 int
SET @So1 = 22
SET @So2 = 21
IF (@So1 > @So2)
	BEGIN
		PRINT N'Số lớn nhất của [@So1] và [@So2] là ' + CAST(@So1 AS char(10))
	END
ELSE
	BEGIN
		PRINT N'Số lớn nhất của [@So1] và [@So2] là ' + CAST(@So2 AS char(10))
	END

--Bài 3
DECLARE @n int, @i INT, @kq int
SET @n = 9
SET @i = 1
SET @kq = 0
WHILE @i <= @n
	BEGIN
		SET @kq += @i
		SET @i += 1
	END
PRINT N'Tổng từ 1 đến [@n] là ' + CAST(@kq AS char(10))

--Bài 4
DECLARE @n int, @i int, @kq int
SET @n = 9
SET @i = 1
SET @kq = 0
WHILE @i <= @n
	BEGIN
		IF @i % 2 = 0
			BEGIN
				SET @kq += @i
				SET @i += 1
			END
		ELSE
			BEGIN
				SET @i += 1
			END
	END
PRINT N'Tổng các số chẵn từ 1 đến [@n] là ' + CAST(@kq AS char(10))
	
--Bài 5
DECLARE @n int, @i float, @kq float
SET @n = 5
SET @i = 1
SET @kq = 0
WHILE @i <= @n
	BEGIN
		SET @kq += 1/@i
		SET @i += 1
	END
PRINT N'Tổng từ 1/1 đến 1/[@n] là ' + CAST(@kq AS varchar(10))

--Bài 6
Create table Bai6
(
	ID int,
)
Insert Into Bai6 values (1)
Insert Into Bai6 values (2)
Insert Into Bai6 values (3)

Declare @ma cursor
Set @ma = cursor for select ID from Bai6
Open @ma
Declare @MaID int
Declare @Tong int
Set @Tong = 0
fetch next from @ma into @MaID
while @@FETCH_STATUS = 0
	Begin
		Set @Tong += @MaID
		fetch next from @Ma into @MaID
	End
Print N'Tổng các số trong bảng là ' + Cast(@Tong as char(100))
Close @ma
Deallocate @ma
GO

--Bài 7
Create table Bai7
(
	Ngaythang date,
)
Insert into Bai7 values ('19971001')
Insert into Bai7 values ('19961001')
Insert into Bai7 values ('20171001')
Insert into Bai7 values ('19941001')

Declare @NT cursor
Set @NT = cursor for Select Ngaythang From Bai7

Open @NT
Declare @NgayT date
Declare @NLN date
Fetch Next From @NT into @NgayT
Set @NLN = @NgayT
While @@FETCH_STATUS = 0
	Begin
		if @NLN < @NgayT
			Begin
				Set @NLN = @NgayT
			End
		Fetch Next From @NT into @NgayT
	End
Print N'Ngày lớn nhất là ' + Cast(@NLN as char(100))
Close @NT
Deallocate @NT
GO

--Bài 8
use QLSV
Declare @SV Cursor
Set @SV = Cursor for 
	Select S.maSinhVien, S.hoTen, M.tenMonHoc, K.diem
	From SINHVIEN S,KETQUA K,MONHOC M
	Where S.maSinhVien = K.maSinhVien And K.maMonHoc = M.maMonHoc And K.lanThi = 1 And K.diem < 5
Open @SV
Declare @MaSV char(10), @Hoten nvarchar(50), @TenMonHoc nvarchar(50), @DiemSV int
Fetch Next From @SV Into @MaSV,@Hoten,@TenMonHoc,@DiemSV
While @@FETCH_STATUS = 0
	Begin
		Print '======================================'
		Print N'Mã: ' + @MaSV
		Print N'Họ tên: ' + @Hoten
		Print N'Môn Học: ' + @TenMonHoc
		Print N'Ðiểm: ' + Cast(@DiemSV as char(10))
		Print '======================================'
		Fetch Next From @SV Into @MaSV,@Hoten,@TenMonHoc,@DiemSV
	End
Close @SV
Deallocate @SV
GO

--Bài 9
use QLSV
Declare @SV Cursor
Set @SV = Cursor for 
	Select S.maSinhVien, S.hoTen, S.maLop
	From (SINHVIEN S JOIN LOP L ON S.maLop = L.maLop) JOIN KHOA K ON K.maKhoa = L.maKhoa
	Where K.tenKhoa like N'Công nghệ thông tin'
Open @SV
Declare @MaSV char(10), @Hoten nvarchar(50), @MaLop char(10)
Fetch Next From @SV Into @MaSV,@Hoten,@MaLop
While @@FETCH_STATUS = 0
	Begin
		Print '======================================'
		Print N'Mã: ' + @MaSV
		Print N'Họ tên: ' + @Hoten
		Print N'Mã lớp: ' + @MaLop
		Print '======================================'
		Fetch Next From @SV Into @MaSV,@Hoten,@MaLop
	End
Close @SV
Deallocate @SV
GO

--Bài 10
use QLSV
Declare @SV Cursor
Set @SV = Cursor for 
	Select K.maMonHoc,M.tenMonHoc,Count(K.maSinhVien)
	From MONHOC M JOIN KETQUA K ON K.maMonHoc = M.maMonHoc
	Group By M.maMonHoc,M.tenMonHoc,k.maMonHoc
Open @SV
Declare @MaMH char(10), @TenMH nvarchar(50), @SL int
Fetch Next From @SV Into @MaMH,@TenMH,@SL
While @@FETCH_STATUS = 0
	Begin
		Print '======================================'
		Print N'Mã môn học: ' + @MaMH
		Print N'Tên Môn Học: ' + @TenMH
		Print N'Số lượng: ' + Cast(@SL as char(10))
		Print '======================================'
		Fetch Next From @SV Into @MaMH,@TenMH,@SL
	End
Close @SV
Deallocate @SV