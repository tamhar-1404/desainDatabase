-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 10.4.28-MariaDB - mariadb.org binary distribution
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk expinc
CREATE DATABASE IF NOT EXISTS `expinc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `expinc`;

-- membuang struktur untuk table expinc.histories
CREATE TABLE IF NOT EXISTS `histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `User_id` bigint(20) unsigned NOT NULL,
  `Invoice_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `histories_user_id_foreign` (`User_id`),
  KEY `Invoice_id` (`Invoice_id`),
  CONSTRAINT `histories_invoice_id_foreign` FOREIGN KEY (`Invoice_id`) REFERENCES `invoices` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `histories_user_id_foreign` FOREIGN KEY (`User_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Pengeluaran data tidak dipilih.

-- membuang struktur untuk table expinc.hospitals
CREATE TABLE IF NOT EXISTS `hospitals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `No` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alamat` longtext NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `Fax` varchar(50) NOT NULL,
  `Direktur` varchar(255) NOT NULL,
  `Tempat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Pengeluaran data tidak dipilih.

-- membuang struktur untuk table expinc.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `uuid` char(36) NOT NULL,
  `noBilling` varchar(255) NOT NULL,
  `User_id` bigint(20) unsigned NOT NULL,
  `Hospital_id` bigint(20) unsigned NOT NULL,
  `MRS` date NOT NULL,
  `KRS` date NOT NULL,
  `NoMava` varchar(255) NOT NULL,
  `BiayaLainya` double NOT NULL,
  `Total` double NOT NULL,
  `Diskon` double NOT NULL,
  `Deposit` double NOT NULL,
  `TotalAkhir` double NOT NULL,
  `Nama_kasir` varchar(255) NOT NULL,
  `statusBilling` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `invoices_user_id_foreign` (`User_id`),
  KEY `invoices_hospital_id_foreign` (`Hospital_id`),
  CONSTRAINT `invoices_hospital_id_foreign` FOREIGN KEY (`Hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`User_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Pengeluaran data tidak dipilih.

-- membuang struktur untuk table expinc.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_item` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Pengeluaran data tidak dipilih.

-- membuang struktur untuk table expinc.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tanggal_lahir` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Pengeluaran data tidak dipilih.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
