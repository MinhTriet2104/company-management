CREATE DATABASE QLCTY

GO

USE QLCTY

GO

CREATE TABLE NHANVIEN(
	MANV VARCHAR(10) NOT NULL,
	HOTEN NVARCHAR(30) NOT NULL,
	NGAYSINH DATE,
	PHAI NVARCHAR(10),
	MAPB VARCHAR(10),
	CONSTRAINT CK_PHAI CHECK(PHAI = N'NAM' OR PHAI = N'NỮ'),
	PRIMARY KEY(MANV)
)
GO

CREATE TABLE PHONGBAN(
	MAPB VARCHAR(10) NOT NULL,
	TENPB NVARCHAR(20) NOT NULL,
	PRIMARY KEY(MAPB)
)

GO

CREATE TABLE CONGTRINH(
	MACT VARCHAR(10) NOT NULL,
	TENCT NVARCHAR(30) NOT NULL,
	DIADIEM NVARCHAR(50),
	NGAYCAPGP DATE,
	NGAYKC DATE,
	NGAYHT DATE,
	PRIMARY KEY(MACT)
)

GO

CREATE TABLE PHANCONG(
	MANV VARCHAR(10),
	MACT VARCHAR(10),
	SLNGAYCONG INT,
	PRIMARY KEY(MANV, MACT)
)

GO

ALTER TABLE NHANVIEN ADD CONSTRAINT FK_MAPB_NV FOREIGN KEY(MAPB) REFERENCES PHONGBAN(MAPB)

GO

ALTER TABLE PHANCONG ADD CONSTRAINT FK_MANV_PC FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)

GO

ALTER TABLE PHANCONG ADD CONSTRAINT FK_MACT_PC FOREIGN KEY(MACT) REFERENCES CONGTRINH(MACT)

