
CREATE DATABASE quanlyhocsinh
GO
USE quanlyhocsinh
GO
ALTER TABLE [dbo].[thoigianday] DROP CONSTRAINT [FK_thoigianday_monhoc]
GO
ALTER TABLE [dbo].[monhoc_hocsinh] DROP CONSTRAINT [FK_monhoc_hocsinh_monhoc]
GO
ALTER TABLE [dbo].[monhoc_hocsinh] DROP CONSTRAINT [FK_monhoc_hocsinh_hocsinh]
GO
ALTER TABLE [dbo].[monhoc] DROP CONSTRAINT [FK_monhoc_phonghoc]
GO
ALTER TABLE [dbo].[monhoc] DROP CONSTRAINT [FK_monhoc_loaimonhoc]
GO
ALTER TABLE [dbo].[monhoc] DROP CONSTRAINT [FK_monhoc_giaovien]
GO
ALTER TABLE [dbo].[lop] DROP CONSTRAINT [FK_lop_loailophoc]
GO
ALTER TABLE [dbo].[khenthuong] DROP CONSTRAINT [FK_khenthuong_monhoc]
GO
ALTER TABLE [dbo].[khenthuong] DROP CONSTRAINT [FK_khenthuong_hocsinh]
GO
ALTER TABLE [dbo].[ketquahoctap] DROP CONSTRAINT [FK_ketquahoctap_monhoc]
GO
ALTER TABLE [dbo].[ketquahoctap] DROP CONSTRAINT [FK_ketquahoctap_loaiketqua]
GO
ALTER TABLE [dbo].[ketquahoctap] DROP CONSTRAINT [FK_ketquahoctap_hocsinh]
GO
ALTER TABLE [dbo].[hocsinh_lophoc] DROP CONSTRAINT [FK_hocsinh_lophoc_lop]
GO
ALTER TABLE [dbo].[hocsinh_lophoc] DROP CONSTRAINT [FK_hocsinh_lophoc_hocsinh]
GO
ALTER TABLE [dbo].[diemdanh] DROP CONSTRAINT [FK_diemdanh_monhoc]
GO
ALTER TABLE [dbo].[diemdanh] DROP CONSTRAINT [FK_diemdanh_hocsinh]
GO
/****** Object:  Table [dbo].[thoigianday]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[thoigianday]') AND type in (N'U'))
DROP TABLE [dbo].[thoigianday]
GO
/****** Object:  Table [dbo].[phonghoc]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[phonghoc]') AND type in (N'U'))
DROP TABLE [dbo].[phonghoc]
GO
/****** Object:  Table [dbo].[monhoc_hocsinh]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[monhoc_hocsinh]') AND type in (N'U'))
DROP TABLE [dbo].[monhoc_hocsinh]
GO
/****** Object:  Table [dbo].[monhoc]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[monhoc]') AND type in (N'U'))
DROP TABLE [dbo].[monhoc]
GO
/****** Object:  Table [dbo].[lop]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lop]') AND type in (N'U'))
DROP TABLE [dbo].[lop]
GO
/****** Object:  Table [dbo].[loaimonhoc]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loaimonhoc]') AND type in (N'U'))
DROP TABLE [dbo].[loaimonhoc]
GO
/****** Object:  Table [dbo].[loailophoc]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loailophoc]') AND type in (N'U'))
DROP TABLE [dbo].[loailophoc]
GO
/****** Object:  Table [dbo].[loaiketqua]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loaiketqua]') AND type in (N'U'))
DROP TABLE [dbo].[loaiketqua]
GO
/****** Object:  Table [dbo].[khenthuong]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[khenthuong]') AND type in (N'U'))
DROP TABLE [dbo].[khenthuong]
GO
/****** Object:  Table [dbo].[ketquahoctap]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ketquahoctap]') AND type in (N'U'))
DROP TABLE [dbo].[ketquahoctap]
GO
/****** Object:  Table [dbo].[hocsinh_lophoc]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hocsinh_lophoc]') AND type in (N'U'))
DROP TABLE [dbo].[hocsinh_lophoc]
GO
/****** Object:  Table [dbo].[hocsinh]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hocsinh]') AND type in (N'U'))
DROP TABLE [dbo].[hocsinh]
GO
/****** Object:  Table [dbo].[giaovien]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[giaovien]') AND type in (N'U'))
DROP TABLE [dbo].[giaovien]
GO
/****** Object:  Table [dbo].[diemdanh]    Script Date: 5/23/2021 4:41:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[diemdanh]') AND type in (N'U'))
DROP TABLE [dbo].[diemdanh]
GO
/****** Object:  Table [dbo].[diemdanh]    Script Date: 5/23/2021 4:41:30 PM ******/



-------------------CREATE TABLE---------------------
GO
CREATE TABLE [dbo].[diemdanh](
	[id] [int] NOT NULL,
	[mahocsinh] [int] NULL,
	[mamonhoc] [int] NULL,
	[thoigiandiemdanh] [datetime] NULL,
 CONSTRAINT [PK_diemdanh] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
/****** Object:  Table [dbo].[giaovien]    Script Date: 5/23/2021 4:41:30 PM ******/
GO
CREATE TABLE [dbo].[giaovien](
	[magiaovien] [int] NOT NULL,
	[tengiaovien] [nvarchar](255) NULL,
	[tuoi] [int] NULL,
	[diachi] [text] NULL,
	[sodienthoai] [nvarchar](255) NULL,
 CONSTRAINT [PK_giaovien] PRIMARY KEY CLUSTERED 
(
	[magiaovien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hocsinh]    Script Date: 5/23/2021 4:41:30 PM ******/

CREATE TABLE [dbo].[hocsinh](
	[mahocsinh] [int] NOT NULL,
	[tenhocsinh] [nvarchar](255) NULL,
	[diachi] [nvarchar](255) NULL,
	[sodienthoai] [nvarchar](255) NULL,
	[mota] [text] NULL,
 CONSTRAINT [PK_hocsinh] PRIMARY KEY CLUSTERED 
(
	[mahocsinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hocsinh_lophoc]    Script Date: 5/23/2021 4:41:30 PM ******/

CREATE TABLE [dbo].[hocsinh_lophoc](
	[id] [int] NOT NULL,
	[mahocsinh] [int] NULL,
	[malophoc] [int] NULL,
 CONSTRAINT [PK_hocsinh_lophoc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ketquahoctap]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[ketquahoctap](
	[id] [int] NOT NULL,
	[maloaiketqua] [int] NULL,
	[mahocsinh] [int] NULL,
	[mamonhoc] [int] NULL,
	[ketqua] [float] NULL,
 CONSTRAINT [PK_ketquahoctap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khenthuong]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[khenthuong](
	[id] [int] NOT NULL,
	[mahocsinh] [int] NULL,
	[mamonhoc] [int] NULL,
	[khenthuong] [nvarchar](255) NULL,
	[loaikhenthuong] [nvarchar](255) NULL,
 CONSTRAINT [PK_khenthuong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaiketqua]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[loaiketqua](
	[maloai] [int] NOT NULL,
	[tenloai] [nvarchar](255) NULL,
 CONSTRAINT [PK_loaiketqua] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loailophoc]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[loailophoc](
	[maloailop] [int] NOT NULL,
	[tenloailop] [nvarchar](255) NULL,
 CONSTRAINT [PK_loailophoc] PRIMARY KEY CLUSTERED 
(
	[maloailop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaimonhoc]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[loaimonhoc](
	[maloai] [int] NOT NULL,
	[tenloai] [nvarchar](255) NULL,
 CONSTRAINT [PK_loaimonhoc] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lop]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[lop](
	[malop] [int] NOT NULL,
	[tenlop] [nvarchar](255) NULL,
	[maloailophoc] [int] NULL,
 CONSTRAINT [PK_lop] PRIMARY KEY CLUSTERED 
(
	[malop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monhoc]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[monhoc](
	[mamonhoc] [int] NOT NULL,
	[tenmonhoc] [nvarchar](255) NULL,
	[magiaovien] [int] NULL,
	[maloaimon] [int] NULL,
	[maphong] [int] NULL,
	[mota] [text] NULL,
 CONSTRAINT [PK_monhoc] PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monhoc_hocsinh]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[monhoc_hocsinh](
	[id] [int] NOT NULL,
	[mahocsinh] [int] NULL,
	[mamonhoc] [int] NULL,
 CONSTRAINT [PK_monhoc_hocsinh] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phonghoc]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[phonghoc](
	[maphong] [int] NOT NULL,
	[tenphong] [nvarchar](255) NULL,
	[mota] [text] NULL,
 CONSTRAINT [PK_phonghoc] PRIMARY KEY CLUSTERED 
(
	[maphong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thoigianday]    Script Date: 5/23/2021 4:41:30 PM ******/

GO
CREATE TABLE [dbo].[thoigianday](
	[id] [int] NOT NULL,
	[thoigianbatdau] [datetime] NULL,
	[thoigianketthuc] [datetime] NULL,
	[mamonhoc] [int] NULL,
 CONSTRAINT [PK_thoigianday] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

-------INSERT DATA-------
GO
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (1, 13, 1, CAST(N'2021-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (2, 29, 2, CAST(N'2021-05-20T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (3, 30, 4, CAST(N'2021-05-20T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (4, 27, 3, CAST(N'2021-05-20T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (5, 20, 6, CAST(N'2021-05-19T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (6, 23, 5, CAST(N'2021-05-19T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (7, 22, 8, CAST(N'2021-05-19T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (8, 24, 7, CAST(N'2021-05-19T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (9, 18, 9, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (10, 19, 10, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (11, 17, 12, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (12, 15, 11, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (13, 16, 14, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (14, 14, 13, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (15, 12, 15, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (16, 13, 16, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (17, 10, 18, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (18, 10, 17, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (19, 11, 20, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (20, 2, 19, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (21, 1, 21, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (22, 8, 22, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (23, 9, 24, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (24, 7, 23, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (25, 6, 26, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (26, 4, 25, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (27, 5, 27, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (28, 2, 28, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (29, 3, 30, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
INSERT [dbo].[diemdanh] ([id], [mahocsinh], [mamonhoc], [thoigiandiemdanh]) VALUES (30, 1, 29, CAST(N'2021-05-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (1, N'Pham Thi Hoa', 34, N'Ha Noi', N'0973548296')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (2, N'Pham Anh Tuan', 34, N'Ha Noi', N'097354676')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (3, N'Nguyen Anh Quan', 29, N'Ha Noi', N'0937494035')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (4, N'Phan Thi Ly', 32, N'Ha Noi', N'023565432')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (5, N'Ly Thi Quynh', 33, N'Ha Noi', N'03543223456')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (6, N'Bui Anh Tuan', 32, N'Hung Yen', N'035676543')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (7, N'Chau Tinh Tri', 44, N'Hung Yen', N'0987654643')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (8, N'Phan Thi Cuc', 36, N'Ha Noi', N'087623543')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (9, N'Le Hong Quan', 43, N'Ha Noi', N'098765445')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (10, N'Bui Xuan Truong', 32, N'Ha Noi', N'032845678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (11, N'Dang Tu Ki', 32, N'Ha Noi', N'0335545678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (12, N'Bui Xuan Lan', 31, N'Ha Nam', N'0334425678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (13, N'Bui Huy Truong', 36, N'Quang Ngai', N'032745678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (14, N'Nguyen Xuan Mai', 37, N'Ha Nam', N'0345345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (15, N'Dang Van Sieu', 49, N'Thanh Hoa', N'047345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (16, N'Ton Thi Le', 34, N'Nam Dinh', N'094345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (17, N'Vuong Tuan Khai', 29, N'Ha Noi', N'096345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (18, N'Dich Duong Thien Ty', 29, N'Hai Duong', N'086345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (19, N'Dich Le Ba', 27, N'Son La', N'0974345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (20, N'Nguyen Hai Anh', 45, N'Ha Noi', N'073345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (21, N'Truong Tu Nghiem', 34, N'Quang Ngai', N'093345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (22, N'Nguyen Van Hai', 45, N'Ha Noi', N'094345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (23, N'Ma Van Long', 31, N'Ninh Binh', N'067345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (24, N'Mai Thi Hong', 30, N'Cao Bang', N'0638345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (25, N'Tran Van Nguyen', 31, N'Thai Binh', N'063345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (26, N'Nguyen Thanh Tung', 34, N'Nghe An', N'0364345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (27, N'Ninh Duong Lan Ngoc', 31, N'Long An', N'036345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (28, N'Mai Van Tuyen', 39, N'An Giang', N'084345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (29, N'Ma Minh Long', 37, N'Hue', N'093345678')
INSERT [dbo].[giaovien] ([magiaovien], [tengiaovien], [tuoi], [diachi], [sodienthoai]) VALUES (30, N'Nguyen Thi Na', 39, N'Hai Phong', N'093345678')

GO
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (1, N'Nguyen Van An', N'Hung Yen', N'0123456779', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (2, N'Nguyen Van Bang', N'Ha Noi', N'0649677899', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (3, N'Nguyen Thi Hoa', N'Ha Noi', N'0813456789', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (4, N'Hoang Van Phi', N'Bac Giang', N'093876543', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (5, N'Vu Thi Tuoi', N'Hung Yen', N'09876535', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (6, N'Dang Thanh Hoang', N'Hung Yen', N'098764554', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (7, N'Pham Thi Huong', N'Bac Giang', N'0987656633', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (8, N'Phan Van Hung', N'Vinh', N'0987654847', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (9, N'Tran Anh Tuan', N'Ninh Binh', N'0976635678', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (10, N'Tran Ba Trung', N'Quang Ninh', N'0987565434', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (11, N'Le Kim Oanh', N'Hai Phong', N'034567895', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (12, N'Pham Thi Hoa', N'Ha Noi', N'0345643235', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (13, N'Nguyen Quang Dat', N'Ha Noi', N'0876543456', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (14, N'Pham Thi Gam', N'Ha Noi', N'0345123443', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (15, N'Nguyen Thi Tho', N'Ha Noi', N'0234554328', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (16, N'Hoang Thi Lua', N'Ha Noi', N'0976538264', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (17, N'Phan Truong Giang', N'Ha Noi', N'0234543235', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (18, N'Nguyen Thi Hoa', N'Ha Noi', N'0934565432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (19, N'Cao Van Truong', N'Ha Noi', N'0945234432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (20, N'Cao Van Luc', N'Ha Noi', N'0924334432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (21, N'Nguyen Viet Hung', N'Ha Noi', N'092346432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (22, N'Nguyen Minh Hieu', N'Ha Noi', N'0978234432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (23, N'Lai Viet Hung', N'Ha Noi', N'0849234432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (24, N'Truong Van Ninh', N'Ha Noi', N'0849234432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (25, N'Mai Nguyen Linh', N'Ha Noi', N'092634432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (26, N'Lai Van Sinh', N'Ha Noi', N'09234432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (27, N'Nguyen Truong Giang', N'Ha Noi', N'0359234432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (28, N'Dao Thu Thao', N'Ha Noi', N'0329234432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (29, N'Nguyen Thi Lan Anh', N'Ha Noi', N'092434432', NULL)
INSERT [dbo].[hocsinh] ([mahocsinh], [tenhocsinh], [diachi], [sodienthoai], [mota]) VALUES (30, N'Nguyen Thi Thao Lan', N'Ha Noi', N'023455432', NULL)

GO
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (1, 1, 1)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (2, 3, 3)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (3, 2, 2)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (4, 5, 5)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (5, 4, 4)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (6, 6, 6)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (7, 7, 8)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (8, 9, 7)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (9, 8, 9)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (10, 11, 11)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (11, 10, 10)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (12, 13, 12)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (13, 12, 14)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (14, 15, 13)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (15, 14, 15)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (16, 17, 17)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (17, 16, 16)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (18, 18, 18)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (19, 20, 3)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (20, 19, 1)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (21, 22, 20)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (22,21, 22)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (23, 23, 21)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (24, 25, 24)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (25, 24, 15)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (26, 27, 26)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (27, 26, 28)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (28, 29, 18)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (29, 28, 30)
INSERT [dbo].[hocsinh_lophoc] ([id], [mahocsinh], [malophoc]) VALUES (30, 1, 27)

GO
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (1, 1, 1, 1, 10)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (2, 1, 2, 2, 10)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (3, 2, 2, 3, 5)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (4, 2, 1, 3, 7)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (5, 1, 3, 4, 4)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (6, 3, 3,5, 6)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (7, 3, 6, 3, 7)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (8, 2, 1, 2, 6)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (9, 2, 5, 1, 3)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (10, 1, 4, 1, 5)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (11, 2, 5, 4, 6)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (12, 1, 9, 3, 7)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (13, 1, 10, 5, 8)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (14, 1, 6, 4, 9)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (15, 2, 14, 2, 10)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (16, 2, 24, 1, 8)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (17, 1, 18, 3, 9)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (18, 2, 7, 11, 4)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (19, 3, 9, 14, 6)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (20, 3, 30, 23, 7)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (21, 3,23, 25, 8)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (22, 2, 15, 13, 9)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (23, 1, 19, 12, 10)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (24, 2, 23, 30, 5)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (25, 3, 26, 21, 3)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (26, 1, 24, 1, 5)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (27, 3, 18,19, 3)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (28, 1, 19, 3, 5)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (29, 2, 20, 26,4)
INSERT [dbo].[ketquahoctap] ([id], [maloaiketqua], [mahocsinh], [mamonhoc], [ketqua]) VALUES (30, 2, 11, 27, 3)

GO
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (1, 1,2, N'hoc sinh gioi', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (2, 2, 1,N'hoc sinh kha', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (3, 4, 4,N'hoc sinh gioi', N'hoc ky I ')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (4, 3,3, N'hoc sinh kha', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (5, 3,6, N'hoc sinh kha', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (6, 3,5,N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (7, 3,8, N'hoc sinh gioi', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (8, 4,7,N'hoc sinh kha', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (9, 5, 10,N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (10, 6, 9,N'hoc sinh kha', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (11, 7, 11,N'hoc sinh gioi', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (12, 2, 13,N'hoc sinh kha', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (13, 8, 12,N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (14,9, 14,N'hoc sinh gioi', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (15, 10, 16,N'hoc sinh kha', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (16, 11,15, N'hoc sinh gioi', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (17, 15, 18,N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (18, 16, 17,N'hoc sinh gioi', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (19, 17, 20,N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (20,  18, 19,N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (21, 1, 22,N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (22, 18, 21,N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (23,  21, 24,N'hoc sinh gioi', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (24, 19,23, N'hoc sinh gioi', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (25, 22,25, N'hoc sinh gioi', N'hoc ky I')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (26, 13,26, N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (27, 14,28, N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (28, 17, 27,N'hoc sinh gioi', N'hoc ky II ')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (29, 2, 29,N'hoc sinh gioi', N'hoc ky II')
INSERT [dbo].[khenthuong] ([id], [mahocsinh],[mamonhoc],[khenthuong], [loaikhenthuong]) VALUES (30, 3, 30,N'hoc sinh gioi', N'hoc ky I')

GO
INSERT [dbo].[loaiketqua] ([maloai], [tenloai]) VALUES (1, N'Bai giua ki so 1')
INSERT [dbo].[loaiketqua] ([maloai], [tenloai]) VALUES (2, N'Bai giua ki so 2')
INSERT [dbo].[loaiketqua] ([maloai], [tenloai]) VALUES (3, N'Cuoi ki')
GO
INSERT [dbo].[loailophoc] ([maloailop], [tenloailop]) VALUES (1, N'Offline')
INSERT [dbo].[loailophoc] ([maloailop], [tenloailop]) VALUES (2, N'Online')
GO
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (1, N'Cong nghe thong tin')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (2, N'Ke toan')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (3, N'Tu tuong Ho Chi Minh')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (4, N'Lap trinh can ban')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (5, N'Ung dung web')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (6, N'Vi xu ly')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (7, N'Ky thuat lap trinh')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (8, N'Kien truc may tinh')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (9, N'Toan co ban I')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (10, N'Toan co ban II')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (11, N'Kinh te co ban I')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (12, N'Kinh te co ban II')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (13, N'Marketing co ban')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (14, N'Marketing nang cao')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (15, N'Quan li nhan su tong hop')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (16, N'Tieng anh')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (17, N'Kinh te luong')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (18, N'Thong ke')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (19, N'Thiet ke mang co ban')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (20, N'Thiet ke mang nang cao')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (21, N'Toi uu hoa')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (22, N'Thiet ke do hoa co ban')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (23, N'Luat ')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (24, N'Toan tai chinh I')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (25, N'The duc')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (26, N'Co khi ')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (27, N'Tin hoc ')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (28, N'Lap trinh VBA')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (29, N'Phan tich kinh doanh')
INSERT [dbo].[loaimonhoc] ([maloai], [tenloai]) VALUES (30, N'Toan hoc nang cao')

GO
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (1, N'cong nghe thong tin', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (2, N'khoa hoc du lieu', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (3, N'Acturay', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (4, N'Marketing', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (5, N'Toan kinh te', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (6, N'Kinh te quoc te', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (7, N'kinh doanh quoc te', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (8, N'Logistics va Quan ly chuoi cung ung', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (9, N'Kiem toan', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (10, N'Tai chinh ngan hang', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (11, N'Tai chinh cong', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (12, N'Bao hiem',1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (13, N'Tai chinh doanh nghiep', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (14, N'Bat dong san', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (15, N'Quan tri khach san', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (16, N'Quan tri nhan luc', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (17, N'Quan tri kinh doanh', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (18, N'Luat kinh te', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (19, N'Thong ke kinh te', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (20, N'He thong quan li thong tin', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (21, N'Khoa hoc may tinh', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (22, N'Kinh te du tu', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (23, N'Kinh doanh so', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (24, N'Phan tich kinh doanh', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (25, N'Quan tri dieu hanh thong minh', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (26, N'Kinh te hoc tai chinh', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (27, N'Cong nghe tai chinh', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (28, N'Dau tu tai chinh', 2)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (29, N'Kinh doanh so', 1)
INSERT [dbo].[lop] ([malop], [tenlop], [maloailophoc]) VALUES (30, N'Ngon ngu anh', 1)

GO
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (1, N'Cong nghe phan mem', 1, 1, 1, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (2, N'Phuong phap tinh', 2, 2, 2, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (3, N'Giai tich', 4, 3, 3, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (4, N'Cong nghe thong tin', 3, 4, 4, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (5, N'Quan li nhan su cho doanh nghiep', 6, 6, 5, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (6, N'Cau truc du lieu',5, 5, 6, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (7, N'Lap trinh C', 8, 8, 7, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (8, N'Lap trinh python', 7,7, 8, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (9, N'The duc 1', 9, 9, 9, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (10, N'Thong ke suy dien', 10,10, 10, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (11, N'Lap trinh VBA', 12,12, 11, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (12, N'Kinh te vi mo', 11,11, 13, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (13, N'Kinh te luong hoi quy', 14,13, 14, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (14, N'Kinh te luong chuoi thoi gian ', 13,14, 15, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (15, N'Marketing can ban', 16,16, 16, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (16, N'Thiet ke mang', 15,15, 17, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (17, N'Ke toan co ban', 17,18, 18, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (18, N'The duc 2', 18,17, 19, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (19, N'Vi xu li 1', 20,20, 20, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (20, N'Vi xu li 2', 19,19, 21, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (21, N'Toi uu hoa', 21,21, 22, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (22, N'Lap trinh web ',22,23, 23, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (23, N'Tieng anh nghe-noi', 24,22, 24, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (24, N'Tieng anh doc-viet', 23,24, 25, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (25, N'Phat trien mo hinh', 25,26, 26, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (26, N'Toan tai chinh', 26,25, 27, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (27, N'An toan thong tin', 27,28, 28, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (28, N'Hoc may', 28,27, 29, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (29, N'Hoc sau', 29,30, 30, NULL)
INSERT [dbo].[monhoc] ([mamonhoc], [tenmonhoc], [magiaovien], [maloaimon], [maphong], [mota]) VALUES (30, N'Luat thuong mai', 30,29, 12, NULL)


GO
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (1, 1, 1)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (2, 2, 2)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (3, 3, 3)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (4, 4, 4)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (5, 5, 4)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (6, 6, 5)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (7, 7, 8)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (8, 8, 9)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (9, 1, 13)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (10, 1, 15)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (11, 2, 21)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (12, 3, 24)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (13, 4, 23)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (14, 5, 22)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (15, 6, 3)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (16, 7, 8)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (17, 8, 6)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (18, 9, 3)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (19, 10, 9)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (20, 15, 10)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (21, 11, 5)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (22, 25, 29)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (23, 16, 24)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (24, 18, 20)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (25, 19, 1)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (26, 21, 3)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (27, 22, 3)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (28, 14, 4)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (29, 20, 6)
INSERT [dbo].[monhoc_hocsinh] ([id], [mahocsinh], [mamonhoc]) VALUES (30, 23, 7)

GO
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (1, N'201', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (2, N'202', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (3, N'203', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (4, N'204', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (5, N'205', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (6, N'320', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (7, N'321', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (8, N'325', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (9, N'401', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (10, N'402', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (11, N'206', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (12, N'207', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (13, N'208', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (14, N'209', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (15, N'220', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (16, N'402', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (17, N'403', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (18, N'404', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (19, N'410', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (20, N'409', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (21, N'705', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (22, N'101', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (23, N'901', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (24, N'904', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (25, N'190', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (26, N'1009', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (27, N'1001', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (28, N'1002', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (29, N'1003', NULL)
INSERT [dbo].[phonghoc] ([maphong], [tenphong], [mota]) VALUES (30, N'1004', NULL)

GO
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (1, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (2, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (3, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (4, CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (5, CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (6, CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (7, CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (8, CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (9, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (10, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (11, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (12, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (13, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (14, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-11-23T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (15, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-11-23T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (16, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-11-23T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (17, CAST(N'2021-09-23T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (18, CAST(N'2021-09-23T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (19, CAST(N'2021-09-23T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (20, CAST(N'2021-10-23T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (21, CAST(N'2021-10-23T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), 24)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (22, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-10-23T00:00:00.000' AS DateTime), 23)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (23, CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2021-11-23T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (24, CAST(N'2021-07-22T00:00:00.000' AS DateTime), CAST(N'2021-11-23T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (25, CAST(N'2021-05-24T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 26)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (26, CAST(N'2021-07-24T00:00:00.000' AS DateTime), CAST(N'2021-10-23T00:00:00.000' AS DateTime), 25)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (27, CAST(N'2021-04-23T00:00:00.000' AS DateTime), CAST(N'2021-07-23T00:00:00.000' AS DateTime), 28)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (28, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-06-23T00:00:00.000' AS DateTime), 27)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (29, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-10-23T00:00:00.000' AS DateTime), 30)
INSERT [dbo].[thoigianday] ([id], [thoigianbatdau], [thoigianketthuc], [mamonhoc]) VALUES (30, CAST(N'2021-10-20T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), 29)
GO



ALTER TABLE [dbo].[diemdanh]  WITH CHECK ADD  CONSTRAINT [FK_diemdanh_hocsinh] FOREIGN KEY([mahocsinh])
REFERENCES [dbo].[hocsinh] ([mahocsinh])
GO
ALTER TABLE [dbo].[diemdanh] CHECK CONSTRAINT [FK_diemdanh_hocsinh]
GO
ALTER TABLE [dbo].[diemdanh]  WITH CHECK ADD  CONSTRAINT [FK_diemdanh_monhoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[monhoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[diemdanh] CHECK CONSTRAINT [FK_diemdanh_monhoc]
GO
ALTER TABLE [dbo].[hocsinh_lophoc]  WITH CHECK ADD  CONSTRAINT [FK_hocsinh_lophoc_hocsinh] FOREIGN KEY([mahocsinh])
REFERENCES [dbo].[hocsinh] ([mahocsinh])
GO
ALTER TABLE [dbo].[hocsinh_lophoc] CHECK CONSTRAINT [FK_hocsinh_lophoc_hocsinh]
GO
ALTER TABLE [dbo].[hocsinh_lophoc]  WITH CHECK ADD  CONSTRAINT [FK_hocsinh_lophoc_lop] FOREIGN KEY([malophoc])
REFERENCES [dbo].[lop] ([malop])
GO
ALTER TABLE [dbo].[hocsinh_lophoc] CHECK CONSTRAINT [FK_hocsinh_lophoc_lop]
GO
ALTER TABLE [dbo].[ketquahoctap]  WITH CHECK ADD  CONSTRAINT [FK_ketquahoctap_hocsinh] FOREIGN KEY([mahocsinh])
REFERENCES [dbo].[hocsinh] ([mahocsinh])
GO
ALTER TABLE [dbo].[ketquahoctap] CHECK CONSTRAINT [FK_ketquahoctap_hocsinh]
GO
ALTER TABLE [dbo].[ketquahoctap]  WITH CHECK ADD  CONSTRAINT [FK_ketquahoctap_loaiketqua] FOREIGN KEY([maloaiketqua])
REFERENCES [dbo].[loaiketqua] ([maloai])
GO
ALTER TABLE [dbo].[ketquahoctap] CHECK CONSTRAINT [FK_ketquahoctap_loaiketqua]
GO
ALTER TABLE [dbo].[ketquahoctap]  WITH CHECK ADD  CONSTRAINT [FK_ketquahoctap_monhoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[monhoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[ketquahoctap] CHECK CONSTRAINT [FK_ketquahoctap_monhoc]
GO
ALTER TABLE [dbo].[khenthuong]  WITH CHECK ADD  CONSTRAINT [FK_khenthuong_hocsinh] FOREIGN KEY([mahocsinh])
REFERENCES [dbo].[hocsinh] ([mahocsinh])
GO
ALTER TABLE [dbo].[khenthuong] CHECK CONSTRAINT [FK_khenthuong_hocsinh] 
GO
ALTER TABLE [dbo].[khenthuong]  WITH CHECK ADD  CONSTRAINT [FK_khenthuong_monhoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[monhoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[khenthuong] CHECK CONSTRAINT [FK_khenthuong_monhoc]
GO
ALTER TABLE [dbo].[lop]  WITH CHECK ADD  CONSTRAINT [FK_lop_loailophoc] FOREIGN KEY([maloailophoc])
REFERENCES [dbo].[loailophoc] ([maloailop])
GO
ALTER TABLE [dbo].[lop] CHECK CONSTRAINT [FK_lop_loailophoc]
GO
ALTER TABLE [dbo].[monhoc]  WITH CHECK ADD  CONSTRAINT [FK_monhoc_giaovien] FOREIGN KEY([magiaovien])
REFERENCES [dbo].[giaovien] ([magiaovien])
GO
ALTER TABLE [dbo].[monhoc] CHECK CONSTRAINT [FK_monhoc_giaovien]
GO
ALTER TABLE [dbo].[monhoc]  WITH CHECK ADD  CONSTRAINT [FK_monhoc_loaimonhoc] FOREIGN KEY([maloaimon])
REFERENCES [dbo].[loaimonhoc] ([maloai])
GO
ALTER TABLE [dbo].[monhoc] CHECK CONSTRAINT [FK_monhoc_loaimonhoc]
GO
ALTER TABLE [dbo].[monhoc]  WITH CHECK ADD  CONSTRAINT [FK_monhoc_phonghoc] FOREIGN KEY([maphong])
REFERENCES [dbo].[phonghoc] ([maphong])
GO
ALTER TABLE [dbo].[monhoc] CHECK CONSTRAINT [FK_monhoc_phonghoc]
GO
ALTER TABLE [dbo].[monhoc_hocsinh]  WITH CHECK ADD  CONSTRAINT [FK_monhoc_hocsinh_hocsinh] FOREIGN KEY([mahocsinh])
REFERENCES [dbo].[hocsinh] ([mahocsinh])
GO
ALTER TABLE [dbo].[monhoc_hocsinh] CHECK CONSTRAINT [FK_monhoc_hocsinh_hocsinh]
GO
ALTER TABLE [dbo].[monhoc_hocsinh]  WITH CHECK ADD  CONSTRAINT [FK_monhoc_hocsinh_monhoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[monhoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[monhoc_hocsinh] CHECK CONSTRAINT [FK_monhoc_hocsinh_monhoc]
GO
ALTER TABLE [dbo].[thoigianday]  WITH CHECK ADD  CONSTRAINT [FK_thoigianday_monhoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[monhoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[thoigianday] CHECK CONSTRAINT [FK_thoigianday_monhoc]
GO
