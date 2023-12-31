-- --------------------------------------------------------
-- Host:                         localhost
-- Wersja serwera:               10.4.21-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win64
-- HeidiSQL Wersja:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Zrzut struktury bazy danych budget_app
CREATE DATABASE IF NOT EXISTS `budget_app2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `budget_app2`;

-- Zrzut struktury tabela budget_app.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id_category` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_category`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `user_email` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli budget_app.categories: ~6 rows (około)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id_category`, `user_email`, `category_name`) VALUES
	('02d4a901-3c00-4539-b48d-b8f63776766a', 'demo@demo.pl', 'Konsumpcja'),
	('2250270c-ff52-4b48-9868-efa8a269e073', 'demo@demo.pl', 'Cele oszczędnościowe'),
	('2426107e-7560-47bd-81b4-8e9f33945933', 'demo@demo.pl', 'Przychody'),
	('607e322b-32a1-4b1d-be25-5b31cbeb1df1', 'demo@demo.pl', 'Rachunki'),
	('9878f8bf-1138-45e6-babd-532024570749', 'demo@demo.pl', 'Edukacja'),
	('9e92fac0-f980-4469-af1a-470be3180075', 'demo@demo.pl', 'Rozrywka');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Zrzut struktury tabela budget_app.financial_balance
CREATE TABLE IF NOT EXISTS `financial_balance` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `category` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `palnned` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_financial_balance_category` (`category`),
  KEY `FK_financial_balance_user_email` (`user_email`),
  KEY `FK_financial_balance_types` (`type`),
  CONSTRAINT `FK_financial_balance_category` FOREIGN KEY (`category`) REFERENCES `categories` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_financial_balance_types` FOREIGN KEY (`type`) REFERENCES `types` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_financial_balance_user_email` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli budget_app.financial_balance: ~17 rows (około)
/*!40000 ALTER TABLE `financial_balance` DISABLE KEYS */;
INSERT INTO `financial_balance` (`id`, `user_email`, `type`, `date`, `value`, `category`, `comment`, `palnned`) VALUES
	('19b8cb62-7a90-40da-8571-a34e2d1d8e51', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-16', 225.23, '9e92fac0-f980-4469-af1a-470be3180075', '', 0),
	('341d8528-5baf-4bf6-9874-4597bea90986', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-06', 75.00, '607e322b-32a1-4b1d-be25-5b31cbeb1df1', 'Telefon', 0),
	('3517ae8c-ed46-4e5c-b2c8-8da66f46d508', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-31', 800.00, '2250270c-ff52-4b48-9868-efa8a269e073', 'Na wakacje', 0),
	('377c758f-beca-4cf4-9931-6ac5117eec5f', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-07', 123.68, '02d4a901-3c00-4539-b48d-b8f63776766a', '', 0),
	('4a9d151d-34b3-47eb-9c43-49648e3b178a', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-26', 85.00, '9878f8bf-1138-45e6-babd-532024570749', '', 0),
	('4b046bfe-8a55-42af-bf8e-f979a40aa4ad', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-31', 1000.00, '2250270c-ff52-4b48-9868-efa8a269e073', 'Na samochód', 0),
	('666af9e5-ed05-496b-b714-0c56649d37cd', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-29', 567.00, '02d4a901-3c00-4539-b48d-b8f63776766a', '', 0),
	('6c810993-0d46-49df-8fe2-1d994e13e6d9', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-15', 120.00, '02d4a901-3c00-4539-b48d-b8f63776766a', 'TV', 0),
	('72779bdd-2f53-4d38-8d26-7733da4dadc1', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-08', 60.00, '607e322b-32a1-4b1d-be25-5b31cbeb1df1', 'Internet', 0),
	('8a7db40e-f017-4b75-b740-b7eab732343d', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-11', 350.00, '9878f8bf-1138-45e6-babd-532024570749', '', 0),
	('acddde37-e7b1-4ffd-8f44-235f4bce7bab', 'demo@demo.pl', '4e3b340e-5dee-11ee-9aec-9828a608d513', '2023-12-01', 5000.00, '2426107e-7560-47bd-81b4-8e9f33945933', 'Wypłata', 0),
	('af946118-bdfb-4f37-a2ae-58f536182aba', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-09', 500.00, '607e322b-32a1-4b1d-be25-5b31cbeb1df1', 'Mieszkanie', 0),
	('c35a32b4-8f43-421d-b52d-54f034b03348', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-23', 589.00, '02d4a901-3c00-4539-b48d-b8f63776766a', '', 0),
	('d2c93367-1386-4b44-9f69-f8fff5c36a64', 'demo@demo.pl', '4e3b340e-5dee-11ee-9aec-9828a608d513', '2023-12-27', 500.00, '2426107e-7560-47bd-81b4-8e9f33945933', '', 0),
	('d5a91cc2-62b4-4206-9878-05d901584d69', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-08', 58.98, '02d4a901-3c00-4539-b48d-b8f63776766a', '', 0),
	('dbdd0469-2f9f-4787-bb90-3d1460478b8e', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-31', 500.00, '2250270c-ff52-4b48-9868-efa8a269e073', 'Na urodziny', 0),
	('dd100652-ecb3-4dde-87de-e89b3a02707c', 'demo@demo.pl', '52595e0d-5dee-11ee-9aec-9828a608d513', '2023-12-31', 500.00, '2250270c-ff52-4b48-9868-efa8a269e073', 'Na emryturę', 0),
	('e69f2494-39f6-45d9-9a26-b6315c2c11e6', 'demo@demo.pl', '4e3b340e-5dee-11ee-9aec-9828a608d513', '2023-12-20', 153.68, '2426107e-7560-47bd-81b4-8e9f33945933', 'Zwrot kosztów', 0);
/*!40000 ALTER TABLE `financial_balance` ENABLE KEYS */;

-- Zrzut struktury tabela budget_app.goals
CREATE TABLE IF NOT EXISTS `goals` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(10) NOT NULL DEFAULT 0,
  `goal_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_goals_users` (`user_email`),
  CONSTRAINT `FK_goals_users` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli budget_app.goals: ~4 rows (około)
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` (`id`, `user_email`, `value`, `goal_name`, `date`) VALUES
	('67017b23-9746-419b-8154-365865eb6a4a', 'demo@demo.pl', 5000, 'Na wakacje', '2024-07-15'),
	('74041e98-8a6f-40db-b136-496a3eb88bd6', 'demo@demo.pl', 10000, 'Na emryturę', '2028-12-12'),
	('b9104dd4-3e2b-4418-8b6a-168aa75fbaa8', 'demo@demo.pl', 50000, 'Na samochód', '2025-12-31'),
	('d3ba716d-3f02-4a28-9575-f0626cb91029', 'demo@demo.pl', 500, 'Na urodziny', '2024-03-15');
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;

-- Zrzut struktury tabela budget_app.types
CREATE TABLE IF NOT EXISTS `types` (
  `id_type` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli budget_app.types: ~2 rows (około)
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` (`id_type`, `type_name`) VALUES
	('4e3b340e-5dee-11ee-9aec-9828a608d513', 'Przychód'),
	('52595e0d-5dee-11ee-9aec-9828a608d513', 'Koszt');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;

-- Zrzut struktury tabela budget_app.users
CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli budget_app.users: ~1 rows (około)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`email`, `password_hash`, `is_admin`, `name`) VALUES
	('demo@demo.pl', '$2b$10$OD60kd.dKyyC5bmEQqiNv.DxHqTA3dM45jt/2qBcQC3yBdy3c4mIm', 0, 'DEMO');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
