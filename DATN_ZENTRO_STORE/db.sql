CREATE DATABASE  IF NOT EXISTS `shopping_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shopping_web`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping_web
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anh`
--

DROP TABLE IF EXISTS `anh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `SanPham` varchar(50) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `ViTriAnh` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Anh_SanPham_idx` (`SanPham`),
  CONSTRAINT `Anh_SanPham` FOREIGN KEY (`SanPham`) REFERENCES `sanpham` (`Ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK53pp80mhis4r7rno10wmv5q81` FOREIGN KEY (`SanPham`) REFERENCES `sanpham` (`Ma`)
) ENGINE=InnoDB AUTO_INCREMENT=809 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatlieu`
--

DROP TABLE IF EXISTS `chatlieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatlieu` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `Ten` varchar(200) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdonhang` (
  `id` varchar(255) NOT NULL,
  `DonHang` varchar(50) DEFAULT NULL,
  `ChiTietSanPham` varchar(36) DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  `dongia` decimal(38,2) DEFAULT NULL,
  `dongiasaugiam` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CTDH_DonHang_idx` (`DonHang`),
  KEY `CTDH_CTSP_idx` (`ChiTietSanPham`),
  CONSTRAINT `CTDH_CTSP` FOREIGN KEY (`ChiTietSanPham`) REFERENCES `chitietsanpham` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `CTDH_DonHang` FOREIGN KEY (`DonHang`) REFERENCES `donhang` (`Ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK3i3vxmpwi6lkhoodqw3w5wkuh` FOREIGN KEY (`DonHang`) REFERENCES `donhang` (`Ma`),
  CONSTRAINT `FK7nb6wcsi5thxc4m83myp6aa9r` FOREIGN KEY (`ChiTietSanPham`) REFERENCES `chitietsanpham` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chitietsanpham`
--

DROP TABLE IF EXISTS `chitietsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietsanpham` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `SanPham` varchar(36) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `SoLuong` bigint DEFAULT NULL,
  `TrangThai` bit(1) DEFAULT NULL,
  `ngaytao` datetime(6) DEFAULT NULL,
  `ngaycapnhap` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CTSP_SanPham_idx` (`SanPham`),
  KEY `CTSP_Size_idx` (`size`),
  CONSTRAINT `CTSP_SanPham` FOREIGN KEY (`SanPham`) REFERENCES `sanpham` (`Ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CTSP_Size` FOREIGN KEY (`size`) REFERENCES `size` (`Ma`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK22ehihg5i83q8ifbpp3gbj890` FOREIGN KEY (`SanPham`) REFERENCES `sanpham` (`Ma`) ON UPDATE CASCADE,
  CONSTRAINT `FK5k4j7pstdofbkd6lna7hs0qnd` FOREIGN KEY (`size`) REFERENCES `size` (`Ma`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `danhsachyeuthich`
--

DROP TABLE IF EXISTS `danhsachyeuthich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhsachyeuthich` (
  `id` varchar(255) NOT NULL,
  `SanPham` varchar(50) DEFAULT NULL,
  `KhachHang` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DSYT_SanPham_idx` (`SanPham`),
  KEY `DSYT_KhachHang_idx` (`KhachHang`),
  CONSTRAINT `DSYT_KhachHang` FOREIGN KEY (`KhachHang`) REFERENCES `khachhang` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DSYT_SanPham` FOREIGN KEY (`SanPham`) REFERENCES `sanpham` (`Ma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diachi`
--

DROP TABLE IF EXISTS `diachi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diachi` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `KhachHang` varchar(20) DEFAULT NULL,
  `ThanhPhoCode` int DEFAULT NULL,
  `QuanHuyenCode` int DEFAULT NULL,
  `xaphuongCode` varchar(255) DEFAULT NULL,
  `diachichitiet` varchar(255) DEFAULT NULL,
  `thanhphoname` varchar(255) DEFAULT NULL,
  `quanhuyenname` varchar(255) DEFAULT NULL,
  `xaphuongName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `tennguoinhan` varchar(255) DEFAULT NULL,
  `macDinh` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DiaChi_KhachHang_idx` (`KhachHang`),
  CONSTRAINT `DiaChi_KhachHang` FOREIGN KEY (`KhachHang`) REFERENCES `khachhang` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dongsanpham`
--

DROP TABLE IF EXISTS `dongsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dongsanpham` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `ten` varchar(255) DEFAULT NULL,
  `ThuongHieu` varchar(36) DEFAULT NULL,
  `ngaytao` datetime(6) DEFAULT NULL,
  `ngaycapnhat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2g9isxcw3ry0tpkusv9f7crsx` (`ThuongHieu`),
  CONSTRAINT `DongSP_ThuongHieu` FOREIGN KEY (`ThuongHieu`) REFERENCES `thuonghieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2g9isxcw3ry0tpkusv9f7crsx` FOREIGN KEY (`ThuongHieu`) REFERENCES `thuonghieu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `Ma` varchar(50) NOT NULL,
  `KhachHang` varchar(20) DEFAULT NULL,
  `Voucher` varchar(36) DEFAULT NULL,
  `tennguoinhan` varchar(255) DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `thanhpho_name` varchar(255) DEFAULT NULL,
  `ThanhPho_Code` int DEFAULT NULL,
  `quanhuyen_name` varchar(255) DEFAULT NULL,
  `QuanHuyen_Code` int DEFAULT NULL,
  `xaphuong_name` varchar(255) DEFAULT NULL,
  `xaphuong_Code` varchar(255) DEFAULT NULL,
  `diachichitiet` varchar(255) DEFAULT NULL,
  `ngaydathang` datetime(6) DEFAULT NULL,
  `trangthai` int DEFAULT NULL,
  `ghichu` varchar(255) DEFAULT NULL,
  `tiengiam` decimal(38,2) DEFAULT NULL,
  `phigiaohang` decimal(38,2) DEFAULT NULL,
  `phuongThucThanhToan` bit(1) DEFAULT NULL,
  `lyDoHuy` varchar(255) DEFAULT NULL,
  `maGiaoDich` varchar(45) DEFAULT NULL,
  `ngayxacnhan` datetime(6) DEFAULT NULL,
  `ngaygiaohang` datetime(6) DEFAULT NULL,
  `ngayhoanthanh` datetime(6) DEFAULT NULL,
  `ngayhuy` datetime(6) DEFAULT NULL,
  `loai` int NOT NULL DEFAULT '0',
  `nhanvien` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Ma`),
  KEY `DonHang_Voucher_idx` (`Voucher`),
  KEY `DonHang_KhachHang_idx` (`KhachHang`),
  KEY `DonHang_NhanVien_idx` (`nhanvien`),
  CONSTRAINT `DonHang_KhachHang` FOREIGN KEY (`KhachHang`) REFERENCES `khachhang` (`username`) ON UPDATE CASCADE,
  CONSTRAINT `DonHang_NhanVien` FOREIGN KEY (`nhanvien`) REFERENCES `nhanvien` (`username`),
  CONSTRAINT `DonHang_Voucher` FOREIGN KEY (`Voucher`) REFERENCES `voucher` (`Ma`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `giohang`
--

DROP TABLE IF EXISTS `giohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohang` (
  `id` varchar(255) NOT NULL,
  `ChiTietSanPham` varchar(36) DEFAULT NULL,
  `KhachHang` varchar(45) DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GioHang_ChiTietSanPham` (`ChiTietSanPham`),
  KEY `GioHang_KhachHang_idx` (`KhachHang`),
  CONSTRAINT `FK6hhf8rq2fut2nilncw53wep1e` FOREIGN KEY (`KhachHang`) REFERENCES `khachhang` (`username`),
  CONSTRAINT `FK974s80x4ir1j7ic37hvg19r4y` FOREIGN KEY (`ChiTietSanPham`) REFERENCES `chitietsanpham` (`id`),
  CONSTRAINT `GioHang_ChiTietSanPham` FOREIGN KEY (`ChiTietSanPham`) REFERENCES `chitietsanpham` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `GioHang_KhachHang` FOREIGN KEY (`KhachHang`) REFERENCES `khachhang` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `hovaten` varchar(255) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` bit(1) DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `anhdaidien` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `khuyenmai`
--

DROP TABLE IF EXISTS `khuyenmai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khuyenmai` (
  `Ma` varchar(36) NOT NULL,
  `Ten` varchar(200) DEFAULT NULL,
  `Loai` varchar(30) DEFAULT NULL,
  `MucGiam` double DEFAULT NULL,
  `NgayBatDau` datetime DEFAULT NULL,
  `NgayKetThuc` datetime DEFAULT NULL,
  `TrangThai` bit(1) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `khuyenmai_sanpham`
--

DROP TABLE IF EXISTS `khuyenmai_sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khuyenmai_sanpham` (
  `KhuyenMai` varchar(36) NOT NULL,
  `SanPham` varchar(50) NOT NULL,
  PRIMARY KEY (`KhuyenMai`,`SanPham`),
  KEY `KMSP_KhuyenMai_idx` (`KhuyenMai`),
  KEY `KMSP_SanPham_idx` (`SanPham`),
  CONSTRAINT `KMSP_KhuyenMai` FOREIGN KEY (`KhuyenMai`) REFERENCES `khuyenmai` (`Ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `KMSP_SanPham` FOREIGN KEY (`SanPham`) REFERENCES `sanpham` (`Ma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kieudang`
--

DROP TABLE IF EXISTS `kieudang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kieudang` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `Ten` varchar(200) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mausac`
--

DROP TABLE IF EXISTS `mausac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mausac` (
  `Ma` varchar(36) NOT NULL,
  `Ten` varchar(200) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `VaiTro` varchar(20) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `hovaten` varchar(255) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` bit(1) DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `anhdaidien` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `TaiKhoan_VaiTro_idx` (`VaiTro`),
  CONSTRAINT `FK45g6drt18h45qc84cr9w2fj2k` FOREIGN KEY (`VaiTro`) REFERENCES `vaitro` (`Ma`),
  CONSTRAINT `NhanVien_VaiTro` FOREIGN KEY (`VaiTro`) REFERENCES `vaitro` (`Ma`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nhanxet`
--

DROP TABLE IF EXISTS `nhanxet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanxet` (
  `id` varchar(255) NOT NULL,
  `rating` float DEFAULT NULL,
  `tieude` varchar(255) DEFAULT NULL,
  `noidung` varchar(255) DEFAULT NULL,
  `thoigian` datetime(6) DEFAULT NULL,
  `chiTietDonHang` varchar(50) DEFAULT NULL,
  `pheDuyet` bit(1) DEFAULT NULL,
  `daChinhSua` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NHANXET_CTDH_idx` (`chiTietDonHang`),
  CONSTRAINT `NHANXET_CTDH` FOREIGN KEY (`chiTietDonHang`) REFERENCES `chitietdonhang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `Ma` varchar(50) NOT NULL,
  `MauSac` varchar(36) DEFAULT NULL,
  `DongSP` varchar(36) DEFAULT NULL,
  `KieuDang` varchar(36) DEFAULT NULL,
  `ChatLieu` varchar(36) DEFAULT NULL,
  `XuatXu` varchar(36) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `gianhap` decimal(38,2) DEFAULT NULL,
  `giaban` decimal(38,2) DEFAULT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `ngaytao` datetime(6) DEFAULT NULL,
  `ngaycapnhat` datetime(6) DEFAULT NULL,
  `HienThi` bit(1) DEFAULT NULL,
  `TrangThai` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Ma`),
  KEY `SanPham_MauSac_idx` (`MauSac`),
  KEY `SanPham_ChatLieu` (`ChatLieu`),
  KEY `SanPham_DongSP` (`DongSP`),
  KEY `SanPham_KieuDang` (`KieuDang`),
  KEY `XuatXu_SP` (`XuatXu`),
  CONSTRAINT `FK9q3jk0g1tweclvobbe3scku93` FOREIGN KEY (`ChatLieu`) REFERENCES `chatlieu` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FKh931tv4r24r9c5u7x5uhetoka` FOREIGN KEY (`KieuDang`) REFERENCES `kieudang` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FKhi7eqmwh89442ymk9slsf2kqk` FOREIGN KEY (`MauSac`) REFERENCES `mausac` (`Ma`) ON DELETE SET NULL,
  CONSTRAINT `FKrw9eho1e1sbgpa5u3pb148hxg` FOREIGN KEY (`DongSP`) REFERENCES `dongsanpham` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SanPham_ChatLieu` FOREIGN KEY (`ChatLieu`) REFERENCES `chatlieu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `SanPham_DongSP` FOREIGN KEY (`DongSP`) REFERENCES `dongsanpham` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `SanPham_KieuDang` FOREIGN KEY (`KieuDang`) REFERENCES `kieudang` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `SanPham_MauSac` FOREIGN KEY (`MauSac`) REFERENCES `mausac` (`Ma`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `XuatXu_SP` FOREIGN KEY (`XuatXu`) REFERENCES `xuatxu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `Ma` float NOT NULL,
  `ChieuDai` float DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thongbao`
--

DROP TABLE IF EXISTS `thongbao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thongbao` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `NhanVien` varchar(20) DEFAULT NULL,
  `loaithongbao` varchar(255) DEFAULT NULL,
  `noidung` varchar(255) DEFAULT NULL,
  `thoigian` datetime(6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ThongBao_NhanVien_idx` (`NhanVien`),
  CONSTRAINT `ThongBao_NhanVien` FOREIGN KEY (`NhanVien`) REFERENCES `nhanvien` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thongbaonhan`
--

DROP TABLE IF EXISTS `thongbaonhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thongbaonhan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ThongBao` varchar(36) DEFAULT NULL,
  `TrangThai` bit(1) DEFAULT NULL,
  `NhanVien` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ThongBaoNhan_ThongBao` (`ThongBao`),
  KEY `ThongBaoNhan_NhanVien_idx` (`NhanVien`),
  CONSTRAINT `FK4x4ehsj7p04xay6phhl8w1y50` FOREIGN KEY (`ThongBao`) REFERENCES `thongbao` (`id`),
  CONSTRAINT `ThongBaoNhan_NhanVien` FOREIGN KEY (`NhanVien`) REFERENCES `nhanvien` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ThongBaoNhan_ThongBao` FOREIGN KEY (`ThongBao`) REFERENCES `thongbao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thuonghieu`
--

DROP TABLE IF EXISTS `thuonghieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuonghieu` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `Ten` varchar(200) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vaitro`
--

DROP TABLE IF EXISTS `vaitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaitro` (
  `Ma` varchar(20) NOT NULL,
  `Ten` varchar(50) NOT NULL,
  PRIMARY KEY (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `Ma` varchar(36) NOT NULL,
  `mota` varchar(200) DEFAULT NULL,
  `loaimucgiam` varchar(255) DEFAULT NULL,
  `MucGiam` double DEFAULT NULL,
  `GiaTriDonHang` decimal(12,2) DEFAULT NULL,
  `MucGiamToiDa` decimal(12,2) DEFAULT NULL,
  `NgayBatDau` datetime DEFAULT NULL,
  `NgayKetThuc` datetime DEFAULT NULL,
  `SoLuong` bigint DEFAULT NULL,
  `trangthaixoa` bit(1) DEFAULT NULL,
  `hinhthucthanhtoan` int DEFAULT NULL,
  `trangthai` int DEFAULT NULL,
  `doituongsudung` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucherkhachhang`
--

DROP TABLE IF EXISTS `voucherkhachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucherkhachhang` (
  `voucher` varchar(255) NOT NULL,
  `khachhang` varchar(255) NOT NULL,
  KEY `FK1b9344hc3h5u61oua5hdubxgy` (`khachhang`),
  KEY `FKo1k8oa0dyhw8e05ni9d4sy4r` (`voucher`),
  CONSTRAINT `FK1b9344hc3h5u61oua5hdubxgy` FOREIGN KEY (`khachhang`) REFERENCES `khachhang` (`username`),
  CONSTRAINT `FKo1k8oa0dyhw8e05ni9d4sy4r` FOREIGN KEY (`voucher`) REFERENCES `voucher` (`Ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xuatxu`
--

DROP TABLE IF EXISTS `xuatxu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xuatxu` (
  `id` varchar(36) NOT NULL DEFAULT (uuid()),
  `Ten` varchar(200) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-08 11:52:04
