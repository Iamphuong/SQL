USE quanlyhocsinh

                            -----------SELECT------------ 



--1 Với mỗi giáo viên, hãy cho biết tên môn học mà họ dạy
SELECT tengiaovien,tenmonhoc
FROM giaovien JOIN monhoc
ON giaovien.magiaovien=monhoc.magiaovien



--2 In ra danh sách môn học có họ tên giáo viên bắt đầu là "Pham"
SELECT mamonhoc,tenmonhoc FROM monhoc AS m 
JOIN giaovien AS g ON m.magiaovien = g.magiaovien
WHERE g.tengiaovien LIKE N'Pham%';



--3 In ra danh sách tên lớp và loại lớp học của nó:
SELECT malop, tenlop, tenloailop 
FROM lop JOIN loailophoc
ON lop.maloailophoc=loailophoc.maloailop



--4 Thời gian bắt đầu dạy của giáo viên trong kỳ này
SELECT tengiaovien, MIN(thoigianbatdau) min_thoigianbatdau
FROM giaovien, monhoc, thoigianday
WHERE giaovien.magiaovien=monhoc.magiaovien AND monhoc.mamonhoc=thoigianday.mamonhoc
GROUP BY tengiaovien; 



--5 In ra danh sách tên học sinh có điểm cuối kì lớn hơn 6
SELECT tenhocsinh, ketqua
FROM ketquahoctap B JOIN hocsinh A ON A.mahocsinh = B.mahocsinh
WHERE ketqua > 6 AND B.maloaiketqua =3



--6 Lọc ra những học sinh học offline

SELECT hocsinh.* FROM loailophoc, lop, hocsinh_lophoc, hocsinh
WHERE loailophoc.tenloailop = 'offline'
AND loailophoc.maloailop = lop.maloailophoc
AND lop.malop = hocsinh_lophoc.malophoc
AND hocsinh.mahocsinh = hocsinh_lophoc.mahocsinh




--7 Cho biết số lượng và in ra danh sách điểm trung bình của học sinh từng vùng miền
SELECT diachi, COUNT(*) AS SLHS, AVG(ketqua) DIEMTRUNGBINH
FROM hocsinh JOIN ketquahoctap 
ON hocsinh.mahocsinh=ketquahoctap.mahocsinh
GROUP BY diachi;



--8 Điểm MAX từng môn học lớn hơn hoặc bằng 7
SELECT tenmonhoc, MAX(ketqua) DIEM_MAX
FROM ketquahoctap A, monhoc B
WHERE A.mamonhoc = B.mamonhoc
GROUP BY tenmonhoc
HAVING MAX(ketqua)>=7;



--9 In ra danh sách học sinh có khen thưởng là hoc sinh khá
SELECT h.mahocsinh,tenhocsinh 
FROM hocsinh AS h JOIN khenthuong AS k ON h.mahocsinh = k.mahocsinh
WHERE khenthuong = N'hoc sinh kha';




--10 Đếm xem từng lớp học có bao nhiều học sinh,sắp xếm giảm dần
SELECT malophoc,COUNT(*) SOHOCSINH
FROM hocsinh_lophoc GROUP BY malophoc ORDER BY COUNT(*) DESC;





                               ------------VIEW -------------


--1 view xem tất cả học sinh được khen thưởng
GO
CREATE VIEW hocsinhkhenthuong AS
SELECT hocsinh.mahocsinh, hocsinh.tenhocsinh, monhoc.mamonhoc, monhoc.tenmonhoc, khenthuong.khenthuong 
FROM monhoc, khenthuong, hocsinh
WHERE monhoc.mamonhoc = khenthuong.mamonhoc
and hocsinh.mahocsinh = khenthuong.mahocsinh
GO
SELECT * FROM hocsinhkhenthuong




--2 View thời gian dậy các môn học
GO
CREATE VIEW thoigianhocmonhoc AS
SELECT monhoc.mamonhoc, monhoc.tenmonhoc, thoigianbatdau, thoigianketthuc
FROM monhoc, thoigianday
WHERE monhoc.mamonhoc = thoigianday.mamonhoc
GO
SELECT * FROM thoigianhocmonhoc




--3 view danh sách giáo viên dậy các môn học
GO
CREATE VIEW giaovienmonhoc AS
SELECT giaovien.magiaovien, giaovien.tengiaovien, monhoc.mamonhoc, monhoc.tenmonhoc
FROM giaovien, monhoc
WHERE monhoc.magiaovien = giaovien.magiaovien
GO
SELECT * FROM giaovienmonhoc




-- 4 view danh sach ket qua hoc tap cua hoc sinh
GO
CREATE VIEW ketquahoctaphocsinh AS
SELECT hocsinh.mahocsinh, hocsinh.tenhocsinh, monhoc.mamonhoc, monhoc.tenmonhoc, ketquahoctap.ketqua 
FROM ketquahoctap, hocsinh, monhoc
WHERE monhoc.mamonhoc = ketquahoctap.mamonhoc
AND hocsinh.mahocsinh = ketquahoctap.mahocsinh
GO
SELECT * FROM ketquahoctaphocsinh




-- 5 view học sinh học các môn học
GO
CREATE VIEW hocsinhhocmonhoc AS
SELECT hocsinh.mahocsinh, hocsinh.tenhocsinh, monhoc.mamonhoc, monhoc.tenmonhoc
FROM hocsinh, monhoc, monhoc_hocsinh
WHERE monhoc_hocsinh.mahocsinh = hocsinh.mahocsinh
and monhoc_hocsinh.mamonhoc = monhoc.mamonhoc
GO
SELECT * FROM hocsinhhocmonhoc 



                            ------------TRIGGER------------



-- 1 kiểm tra học sinh và môn học có tồn tại trong bản ghi không. Nếu có mới được insert khen thưởng
GO
CREATE TRIGGER khen_thuong
ON khenthuong 
AFTER INSERT 
AS
BEGIN
	DECLARE @mahocsinh INT = (SELECT mahocsinh FROM Inserted)
	DECLARE @mamonhoc INT = (SELECT mamonhoc FROM Inserted)
	DECLARE @counths INT = (SELECT count(*) FROM hocsinh WHERE mahocsinh = @mahocsinh)
	DECLARE @countmh INT = (SELECT count(*) FROM monhoc WHERE mamonhoc = @mamonhoc)
	IF(@counths = 0 OR @countmh = 0)
	BEGIN
		RAISERROR(N'ma hoc sinh hoac ma mon hoc khong ton tai',16,1)
		ROLLBACK TRANSACTION
	END 
	ELSE PRINT(N'Thêm mới thành công')
 END 



 -- Trigger update
 -- 2 Update lại giao viên với môn học. Kiểm tra giáo viên có tồn tại hay không, có tồn tại mới sửa được giáo viên với môn học
 GO
CREATE TRIGGER updategiaovienmon
ON monhoc 
AFTER UPDATE
AS 
BEGIN
	 DECLARE @magiaovien INT = (SELECT magiaovien FROM Inserted)
	 DECLARE @countgv INT = (SELECT count(*) FROM giaovien WHERE magiaovien = @magiaovien)
	IF(@countgv = 0)
	BEGIN
		RAISERROR(N'ma giao vien khong ton tai')
		ROLLBACK TRANSACTION
	END 
	ELSE PRINT(N'update mới thành công')
 END 



 -- Trigger delete
 -- 3 Xóa user giao viên ra khỏi hệ thống. Nếu giáo viên không dạy môn nào mới được xóa
 GO
 CREATE TRIGGER deletegiaovienmon
ON giaovien 
FOR DELETE 
AS
BEGIN
	DECLARE @magiaovien INT = (SELECT magiaovien FROM deleted)
	DECLARE @countgv INT = (SELECT count(*) FROM monhoc WHERE magiaovien = @magiaovien)
	IF(@countgv > 0)
	BEGIN
		RAISERROR(N'Van con giao vien day mon hoc',16,1)
		ROLLBACK TRANSACTION
	END 
	ELSE PRINT(N'xoa giao vien thành công')
 END
 


 --4 kiểm tra học sinh và môn học có tồn tại trong bản ghi không. Nếu có mới được inser học sinh học môn học
GO
CREATE TRIGGER hocsinh_monhoc
ON monhoc_hocsinh 
AFTER INSERT 
AS
BEGIN
	DECLARE @mahocsinh INT = (SELECT mahocsinh FROM Inserted)
	DECLARE @mamonhoc INT = (SELECT mamonhoc FROM Inserted)
	DECLARE @counths INT = (SELECT count(*) FROM hocsinh WHERE mahocsinh = @mahocsinh)
	DECLARE @countmh INT = (SELECT count(*) FROM monhoc WHERE mamonhoc = @mamonhoc)
	IF(@counths = 0 OR @countmh = 0)
	BEGIN
		RAISERROR(N'Ma hoc sinh hoac ma mon hoc khong ton tai',16,1)
		ROLLBACK TRANSACTION
	END 
	ELSE PRINT(N'Thêm mới thành công')
 END



  -- 5 Xóa lớp học ra khỏi hệ thống. Nếu lớp học không học sinh nào học mới được xóa
 GO
 CREATE TRIGGER deletelop
ON lop 
FOR DELETE 
AS 
BEGIN
	DECLARE @malop INT = (SELECT malop FROM deleted)
	DECLARE @counths INT = (SELECT count(*) FROM hocsinh_lophoc WHERE malophoc = @malop)
	IF(@counths > 0)
	BEGIN
		RAISERROR(N'Vẫn còn học sinh học trong lớp')
		ROLLBACK TRANSACTION
	END 
	ELSE PRINT(N'xóa lớp học thành công')
 END



                            ---------- PROCEDURE------------ 



--1 Kiểm tra sĩ số hoc của lớp
GO
CREATE PROCEDURE kiemtrasohocsinhlop(@tenlop INT)
AS
BEGIN
	DECLARE @malh INT = (SELECT malop FROM lop WHERE tenlop = @tenlop)
	IF (@malh > 0)
		BEGIN
			DECLARE @sohs INT = (SELECT count(*) FROM hocsinh_lophoc WHERE malophoc = @malh)
			PRINT(N'Số học sinh lớp '+ @tenlop +' la ' + @sohs)
		END 
	ELSE PRINT(N'mã hàng '+@tenlop+' không tồn tại')
END



--2 Thêm học sinh giỏi vào bảng khen thưởng học kỳ
GO
CREATE PROCEDURE themhocsinhgioi(@mahs INT, @mamh INT)
AS
BEGIN
	DECLARE @mahs1 INT = (SELECT mahocsinh FROM hocsinh WHERE mahocsinh = @mahs)
	DECLARE @mamh1 INT = (SELECT mamonhoc FROM monhoc WHERE mamonhoc = @mamh)
	IF (@mahs1 > 0 and @mamh1 > 0)
		BEGIN
			INSERT INTO khenthuong(mahocsinh, mamonhoc, loaikhenthuong, khenthuong) VALUES ( @mahs, @mamh, 'hoc ky', 'hoc sinh gioi');
		END 
	ELSE PRINT(N'hoc sinh hoặc môn học không tồn tại')
END



--3 chỉnh sửa phòng học của môn học
GO
CREATE PROCEDURE suaphongcuamonhoc(@maphong INT, @mamon INT)
AS
BEGIN
	DECLARE @maphong1 INT = (SELECT count(*) FROM phonghoc WHERE maphong = @maphong)
	declare @mamon1 INT = (SELECT count(*) FROM monhoc WHERE mamonhoc = @mamon)
	IF (@maphong1 > 0 and @mamon1 > 0)
		BEGIN
			UPDATE monhoc SET maphong = @maphong WHERE mamonhoc = @mamon
		END 
	ELSE PRINT(N'phòng học hoặc môn học không tồn tại')
END



-- 4 Thêm học sinh mới vào lớp học
GO
CREATE PROCEDURE themhocsinhlop(@mahocsinh INT, @malop INT)
AS
BEGIN
	DECLARE @malop1 INT = (SELECT count(*) FROM lop WHERE malop = @malop)
	DECLARE @mahocsinh1 INT = (SELECT count(*) FROM hocsinh WHERE mahocsinh = @mahocsinh)
	DECLARE @id INT = (SELECT max(id) FROM hocsinh_lophoc)
	IF (@malop1 > 0 and @mahocsinh1 > 0)
		BEGIN
			INSERT INTO hocsinh_lophoc (id, malophoc, mahocsinh) VALUES ( @id +1 ,@malop1, @mahocsinh1);
		END 
	ELSE PRINT(N'hoc sinh hoặc lớp học không tồn tại')
END



-- 5 update giáo viên vào môn giảng dạy
GO
CREATE PROCEDURE updategiaovienmonhoc(@magiaovien INT, @mamonhoc INT)
AS
BEGIN
	DECLARE @magiaovien1 INT = (SELECT count(*) FROM giaovien WHERE magiaovien = @magiaovien)
	DECLARE @mamonhoc1 INT = (select count(*) from monhoc WHERE mamonhoc = @mamonhoc)
	IF (@magiaovien1 > 0 and @mamonhoc1 > 0)
		BEGIN
			UPDATE monhoc SET magiaovien = @magiaovien WHERE mamonhoc = @mamonhoc
		END 
	ELSE PRINT(N'Giao vien hoặc môn học không tồn tại')
END
 
      -----------------THANK YOU FOR CHECKING QUERY FILE OF GROUP 6!----------------------