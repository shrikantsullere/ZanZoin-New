-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2026 at 11:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zanezion_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `module` varchar(191) NOT NULL,
  `action` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `oldValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`oldValue`)),
  `newValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`newValue`)),
  `performedBy` int(11) NOT NULL,
  `timestamp` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `module`, `action`, `description`, `oldValue`, `newValue`, `performedBy`, `timestamp`) VALUES
(1, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 07:27:16.725'),
(2, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 08:36:29.836'),
(3, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 09:06:51.975'),
(4, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:07:26.547'),
(5, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 09:23:30.905'),
(6, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:25:55.891'),
(7, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:28:10.116'),
(8, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:30:01.282'),
(9, 'ROLES', 'CREATE', 'Created role TEST_ROLE', 'null', '{\"id\":10,\"name\":\"TEST_ROLE\",\"description\":null,\"createdAt\":\"2026-06-05T09:30:01.395Z\",\"updatedAt\":\"2026-06-05T09:30:01.395Z\"}', 1, '2026-06-05 09:30:01.409'),
(10, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:30:13.740'),
(11, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:35:30.366'),
(12, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:35:55.519'),
(13, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:37:21.698'),
(14, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:37:51.639'),
(15, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 09:38:31.470'),
(16, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-05 09:53:13.394'),
(17, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 10:02:00.804'),
(18, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 10:19:45.665'),
(19, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 10:24:15.856'),
(20, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 10:24:15.958'),
(21, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 10:24:16.043'),
(22, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 10:24:16.132'),
(23, 'AUTH', 'LOGIN', 'User login: logistics@zanezion.com', 'null', 'null', 5, '2026-06-05 10:24:16.211'),
(24, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 10:24:16.288'),
(25, 'AUTH', 'LOGIN', 'User login: concierge@zanezion.com', 'null', 'null', 7, '2026-06-05 10:24:16.368'),
(26, 'AUTH', 'LOGIN', 'User login: businessclient@zanezion.com', 'null', 'null', 8, '2026-06-05 10:24:16.448'),
(27, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-05 10:24:16.530'),
(28, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 10:24:40.615'),
(29, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 10:24:40.723'),
(30, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 10:24:40.808'),
(31, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 10:24:40.887'),
(32, 'AUTH', 'LOGIN', 'User login: logistics@zanezion.com', 'null', 'null', 5, '2026-06-05 10:24:40.968'),
(33, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 10:24:41.050'),
(34, 'AUTH', 'LOGIN', 'User login: concierge@zanezion.com', 'null', 'null', 7, '2026-06-05 10:24:41.131'),
(35, 'AUTH', 'LOGIN', 'User login: businessclient@zanezion.com', 'null', 'null', 8, '2026-06-05 10:24:41.211'),
(36, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-05 10:24:41.294'),
(37, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 10:25:21.768'),
(38, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 10:25:21.889'),
(39, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 10:25:21.981'),
(40, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 10:25:22.069'),
(41, 'AUTH', 'LOGIN', 'User login: logistics@zanezion.com', 'null', 'null', 5, '2026-06-05 10:25:22.153'),
(42, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 10:25:22.238'),
(43, 'AUTH', 'LOGIN', 'User login: concierge@zanezion.com', 'null', 'null', 7, '2026-06-05 10:25:22.324'),
(44, 'AUTH', 'LOGIN', 'User login: businessclient@zanezion.com', 'null', 'null', 8, '2026-06-05 10:25:22.407'),
(45, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-05 10:25:22.492'),
(46, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 10:25:55.743'),
(47, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 10:25:55.880'),
(48, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 10:25:55.993'),
(49, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 10:25:56.112'),
(50, 'AUTH', 'LOGIN', 'User login: logistics@zanezion.com', 'null', 'null', 5, '2026-06-05 10:25:56.219'),
(51, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 10:25:56.321'),
(52, 'AUTH', 'LOGIN', 'User login: concierge@zanezion.com', 'null', 'null', 7, '2026-06-05 10:25:56.435'),
(53, 'AUTH', 'LOGIN', 'User login: businessclient@zanezion.com', 'null', 'null', 8, '2026-06-05 10:25:56.540'),
(54, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-05 10:25:56.644'),
(55, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 10:26:35.616'),
(56, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 10:26:35.720'),
(57, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 10:26:35.804'),
(58, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 10:26:35.888'),
(59, 'AUTH', 'LOGIN', 'User login: logistics@zanezion.com', 'null', 'null', 5, '2026-06-05 10:26:35.971'),
(60, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 10:26:36.050'),
(61, 'AUTH', 'LOGIN', 'User login: concierge@zanezion.com', 'null', 'null', 7, '2026-06-05 10:26:36.129'),
(62, 'AUTH', 'LOGIN', 'User login: businessclient@zanezion.com', 'null', 'null', 8, '2026-06-05 10:26:36.205'),
(63, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-05 10:26:36.285'),
(64, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 10:27:34.033'),
(65, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 10:38:11.912'),
(66, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 10:38:16.385'),
(67, 'AUTH', 'LOGIN', 'User login: logistics@zanezion.com', 'null', 'null', 5, '2026-06-05 10:38:23.399'),
(68, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 10:38:28.871'),
(69, 'AUTH', 'LOGIN', 'User login: concierge@zanezion.com', 'null', 'null', 7, '2026-06-05 10:38:35.730'),
(70, 'AUTH', 'LOGIN', 'User login: businessclient@zanezion.com', 'null', 'null', 8, '2026-06-05 10:38:42.600'),
(71, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-05 10:38:46.820'),
(72, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 10:55:57.140'),
(73, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 10:55:57.369'),
(74, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 11:07:27.672'),
(75, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 11:07:27.806'),
(76, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 11:07:27.911'),
(77, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 11:08:04.276'),
(78, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 11:08:04.424'),
(79, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 11:08:04.535'),
(80, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 11:18:19.604'),
(81, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 11:18:19.824'),
(82, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 11:18:19.986'),
(83, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 11:18:20.117'),
(84, 'AUTH', 'LOGIN', 'User login: logistics@zanezion.com', 'null', 'null', 5, '2026-06-05 11:18:20.363'),
(85, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 11:18:20.617'),
(86, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 11:27:11.123'),
(87, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 11:32:22.637'),
(88, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 11:40:03.727'),
(89, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 11:42:03.651'),
(90, 'ITEMS', 'CREATE', 'Created Item Rolex Daytona Real Test (SKU: SKU-1780659723687)', 'null', '{\"id\":1,\"tenantId\":1,\"categoryId\":1,\"unitId\":1,\"sku\":\"SKU-1780659723687\",\"name\":\"Rolex Daytona Real Test\",\"description\":\"A test watch\",\"reorderLevel\":0,\"inventoryType\":\"INTERNAL\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:42:03.728Z\",\"updatedAt\":\"2026-06-05T11:42:03.728Z\",\"category\":{\"id\":1,\"tenantId\":1,\"name\":\"General\",\"description\":null,\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.421Z\",\"updatedAt\":\"2026-06-05T11:41:46.421Z\"},\"unit\":{\"id\":1,\"tenantId\":1,\"name\":\"Pieces\",\"shortName\":\"pcs\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.428Z\",\"updatedAt\":\"2026-06-05T11:41:46.428Z\"}}', 2, '2026-06-05 11:42:03.745'),
(91, 'ITEMS', 'UPDATE', 'Updated Item Rolex Daytona Real Test', '{\"id\":1,\"tenantId\":1,\"categoryId\":1,\"unitId\":1,\"sku\":\"SKU-1780659723687\",\"name\":\"Rolex Daytona Real Test\",\"description\":\"A test watch\",\"reorderLevel\":0,\"inventoryType\":\"INTERNAL\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:42:03.728Z\",\"updatedAt\":\"2026-06-05T11:42:03.728Z\",\"category\":{\"id\":1,\"tenantId\":1,\"name\":\"General\",\"description\":null,\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.421Z\",\"updatedAt\":\"2026-06-05T11:41:46.421Z\"},\"unit\":{\"id\":1,\"tenantId\":1,\"name\":\"Pieces\",\"shortName\":\"pcs\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.428Z\",\"updatedAt\":\"2026-06-05T11:41:46.428Z\"}}', '{\"id\":1,\"tenantId\":1,\"categoryId\":1,\"unitId\":1,\"sku\":\"SKU-1780659723687\",\"name\":\"Rolex Daytona Real Updated\",\"description\":\"Updated test watch\",\"reorderLevel\":0,\"inventoryType\":\"INTERNAL\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:42:03.728Z\",\"updatedAt\":\"2026-06-05T11:42:03.787Z\",\"category\":{\"id\":1,\"tenantId\":1,\"name\":\"General\",\"description\":null,\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.421Z\",\"updatedAt\":\"2026-06-05T11:41:46.421Z\"},\"unit\":{\"id\":1,\"tenantId\":1,\"name\":\"Pieces\",\"shortName\":\"pcs\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.428Z\",\"updatedAt\":\"2026-06-05T11:41:46.428Z\"}}', 2, '2026-06-05 11:42:03.798'),
(92, 'ITEMS', 'DELETE', 'Deleted Item Rolex Daytona Real Updated', '{\"id\":1,\"tenantId\":1,\"categoryId\":1,\"unitId\":1,\"sku\":\"SKU-1780659723687\",\"name\":\"Rolex Daytona Real Updated\",\"description\":\"Updated test watch\",\"reorderLevel\":0,\"inventoryType\":\"INTERNAL\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:42:03.728Z\",\"updatedAt\":\"2026-06-05T11:42:03.787Z\",\"category\":{\"id\":1,\"tenantId\":1,\"name\":\"General\",\"description\":null,\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.421Z\",\"updatedAt\":\"2026-06-05T11:41:46.421Z\"},\"unit\":{\"id\":1,\"tenantId\":1,\"name\":\"Pieces\",\"shortName\":\"pcs\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.428Z\",\"updatedAt\":\"2026-06-05T11:41:46.428Z\"}}', 'null', 2, '2026-06-05 11:42:03.848'),
(93, 'VENDORS', 'CREATE', 'Created vendor Test Vendor SA', 'null', '{\"id\":1,\"tenantId\":1,\"vendorCode\":\"VND-723872\",\"companyName\":\"Test Vendor SA\",\"contactPerson\":\"John Doe\",\"email\":\"default@vendor.com\",\"phone\":\"1234567890\",\"address\":\"123 Test St\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:42:03.889Z\",\"updatedAt\":\"2026-06-05T11:42:03.889Z\"}', 2, '2026-06-05 11:42:03.897'),
(94, 'VENDORS', 'UPDATE', 'Updated vendor Test Vendor SA Updated', '{\"id\":1,\"tenantId\":1,\"vendorCode\":\"VND-723872\",\"companyName\":\"Test Vendor SA\",\"contactPerson\":\"John Doe\",\"email\":\"default@vendor.com\",\"phone\":\"1234567890\",\"address\":\"123 Test St\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:42:03.889Z\",\"updatedAt\":\"2026-06-05T11:42:03.889Z\"}', '{\"id\":1,\"tenantId\":1,\"vendorCode\":\"VND-723872\",\"companyName\":\"Test Vendor SA Updated\",\"contactPerson\":\"Jane Doe\",\"email\":\"default@vendor.com\",\"phone\":\"1234567890\",\"address\":\"123 Test St\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:42:03.889Z\",\"updatedAt\":\"2026-06-05T11:42:03.926Z\"}', 2, '2026-06-05 11:42:03.938'),
(95, 'VENDORS', 'DELETE', 'Deleted vendor Test Vendor SA Updated', '{\"id\":1,\"tenantId\":1,\"vendorCode\":\"VND-723872\",\"companyName\":\"Test Vendor SA Updated\",\"contactPerson\":\"Jane Doe\",\"email\":\"default@vendor.com\",\"phone\":\"1234567890\",\"address\":\"123 Test St\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:42:03.889Z\",\"updatedAt\":\"2026-06-05T11:42:03.926Z\"}', 'null', 2, '2026-06-05 11:42:03.983'),
(96, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 11:56:23.905'),
(97, 'ITEMS', 'CREATE', 'Created Item SKU Test Watch (SKU: SKU-58405650)', 'null', '{\"id\":2,\"tenantId\":1,\"categoryId\":1,\"unitId\":1,\"sku\":\"SKU-58405650\",\"name\":\"SKU Test Watch\",\"description\":null,\"reorderLevel\":0,\"inventoryType\":\"INTERNAL\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:56:24.070Z\",\"updatedAt\":\"2026-06-05T11:56:24.070Z\",\"category\":{\"id\":1,\"tenantId\":1,\"name\":\"General\",\"description\":null,\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.421Z\",\"updatedAt\":\"2026-06-05T11:41:46.421Z\"},\"unit\":{\"id\":1,\"tenantId\":1,\"name\":\"Pieces\",\"shortName\":\"pcs\",\"status\":\"active\",\"createdAt\":\"2026-06-05T11:41:46.428Z\",\"updatedAt\":\"2026-06-05T11:41:46.428Z\"}}', 2, '2026-06-05 11:56:24.109'),
(98, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 12:14:06.948'),
(99, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 12:14:17.270'),
(100, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:19:23.393'),
(101, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:26:58.110'),
(102, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:33:41.198'),
(103, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:37:22.078'),
(104, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0001', 'null', '{\"id\":1,\"tenantId\":1,\"prNumber\":\"PR-2026-0001\",\"title\":\"Test Migration PR\",\"description\":null,\"departmentId\":1,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T12:37:22.218Z\",\"updatedAt\":\"2026-06-05T12:37:22.218Z\",\"items\":[{\"id\":1,\"purchaseRequestId\":1,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":5,\"unit\":\"Pieces\",\"estimatedCost\":100,\"createdAt\":\"2026-06-05T12:37:22.218Z\",\"updatedAt\":\"2026-06-05T12:37:22.218Z\"}]}', 2, '2026-06-05 12:37:22.318'),
(105, 'AUTH', 'LOGOUT', NULL, 'null', 'null', 2, '2026-06-05 12:37:22.369'),
(106, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:37:49.646'),
(107, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:38:31.020'),
(108, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:38:53.189'),
(109, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:39:11.298'),
(110, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0002', 'null', '{\"id\":2,\"tenantId\":1,\"prNumber\":\"PR-2026-0002\",\"title\":\"Test Migration PR\",\"description\":null,\"departmentId\":1,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T12:39:11.370Z\",\"updatedAt\":\"2026-06-05T12:39:11.370Z\",\"items\":[{\"id\":2,\"purchaseRequestId\":2,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":5,\"unit\":\"Pieces\",\"estimatedCost\":100,\"createdAt\":\"2026-06-05T12:39:11.370Z\",\"updatedAt\":\"2026-06-05T12:39:11.370Z\"}]}', 2, '2026-06-05 12:39:11.398'),
(111, 'AUTH', 'LOGOUT', NULL, 'null', 'null', 2, '2026-06-05 12:39:11.468'),
(112, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:39:41.309'),
(113, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0003', 'null', '{\"id\":3,\"tenantId\":1,\"prNumber\":\"PR-2026-0003\",\"title\":\"Test Migration PR\",\"description\":null,\"departmentId\":1,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T12:39:41.372Z\",\"updatedAt\":\"2026-06-05T12:39:41.372Z\",\"items\":[{\"id\":3,\"purchaseRequestId\":3,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":5,\"unit\":\"Pieces\",\"estimatedCost\":100,\"createdAt\":\"2026-06-05T12:39:41.372Z\",\"updatedAt\":\"2026-06-05T12:39:41.372Z\"}]}', 2, '2026-06-05 12:39:41.389'),
(114, 'AUTH', 'LOGOUT', NULL, 'null', 'null', 2, '2026-06-05 12:39:41.445'),
(115, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:40:29.558'),
(116, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0004', 'null', '{\"id\":4,\"tenantId\":1,\"prNumber\":\"PR-2026-0004\",\"title\":\"Test Migration PR\",\"description\":null,\"departmentId\":1,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T12:40:29.650Z\",\"updatedAt\":\"2026-06-05T12:40:29.650Z\",\"items\":[{\"id\":4,\"purchaseRequestId\":4,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":5,\"unit\":\"Pieces\",\"estimatedCost\":100,\"createdAt\":\"2026-06-05T12:40:29.650Z\",\"updatedAt\":\"2026-06-05T12:40:29.650Z\"}]}', 2, '2026-06-05 12:40:29.685'),
(117, 'AUTH', 'LOGOUT', NULL, 'null', 'null', 2, '2026-06-05 12:40:29.736'),
(118, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:46:16.901'),
(119, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0005', 'null', '{\"id\":5,\"tenantId\":1,\"prNumber\":\"PR-2026-0005\",\"title\":\"UI Validation PR\",\"description\":null,\"departmentId\":1,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"medium\",\"createdAt\":\"2026-06-05T12:46:17.046Z\",\"updatedAt\":\"2026-06-05T12:46:17.046Z\",\"items\":[{\"id\":5,\"purchaseRequestId\":5,\"itemName\":\"Validation Asset\",\"description\":null,\"quantity\":10,\"unit\":\"Boxes\",\"estimatedCost\":50,\"createdAt\":\"2026-06-05T12:46:17.046Z\",\"updatedAt\":\"2026-06-05T12:46:17.046Z\"}]}', 2, '2026-06-05 12:46:17.151'),
(120, 'PURCHASE_REQUESTS', 'UPDATE', 'Updated PR PR-2026-0005', '{\"id\":5,\"tenantId\":1,\"prNumber\":\"PR-2026-0005\",\"title\":\"UI Validation PR\",\"description\":null,\"departmentId\":1,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"medium\",\"createdAt\":\"2026-06-05T12:46:17.046Z\",\"updatedAt\":\"2026-06-05T12:46:17.046Z\",\"items\":[{\"id\":5,\"purchaseRequestId\":5,\"itemName\":\"Validation Asset\",\"description\":null,\"quantity\":10,\"unit\":\"Boxes\",\"estimatedCost\":50,\"createdAt\":\"2026-06-05T12:46:17.046Z\",\"updatedAt\":\"2026-06-05T12:46:17.046Z\"}],\"department\":{\"id\":1,\"tenantId\":1,\"name\":\"Operations\",\"code\":\"OPS\",\"description\":\"Core business operations and mission control.\",\"status\":\"active\",\"createdAt\":\"2026-06-05T12:26:40.207Z\",\"updatedAt\":\"2026-06-05T12:26:40.207Z\"},\"requester\":{\"id\":1,\"firstName\":\"Admin\",\"lastName\":\"User\",\"employeeCode\":\"EMP-ADMIN\"}}', '{\"id\":5,\"tenantId\":1,\"prNumber\":\"PR-2026-0005\",\"title\":\"UI Validation PR - Updated\",\"description\":null,\"departmentId\":1,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T12:46:17.046Z\",\"updatedAt\":\"2026-06-05T12:46:17.549Z\",\"items\":[{\"id\":6,\"purchaseRequestId\":5,\"itemName\":\"Validation Asset Updated\",\"description\":null,\"quantity\":20,\"unit\":\"Boxes\",\"estimatedCost\":75,\"createdAt\":\"2026-06-05T12:46:17.549Z\",\"updatedAt\":\"2026-06-05T12:46:17.549Z\"}]}', 2, '2026-06-05 12:46:17.896'),
(121, 'PURCHASE_REQUESTS', 'DELETE', 'Deleted PR PR-2026-0005', '{\"id\":5,\"tenantId\":1,\"prNumber\":\"PR-2026-0005\",\"title\":\"UI Validation PR - Updated\",\"description\":null,\"departmentId\":1,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T12:46:17.046Z\",\"updatedAt\":\"2026-06-05T12:46:17.549Z\",\"items\":[{\"id\":6,\"purchaseRequestId\":5,\"itemName\":\"Validation Asset Updated\",\"description\":null,\"quantity\":20,\"unit\":\"Boxes\",\"estimatedCost\":75,\"createdAt\":\"2026-06-05T12:46:17.549Z\",\"updatedAt\":\"2026-06-05T12:46:17.549Z\"}],\"department\":{\"id\":1,\"tenantId\":1,\"name\":\"Operations\",\"code\":\"OPS\",\"description\":\"Core business operations and mission control.\",\"status\":\"active\",\"createdAt\":\"2026-06-05T12:26:40.207Z\",\"updatedAt\":\"2026-06-05T12:26:40.207Z\"},\"requester\":{\"id\":1,\"firstName\":\"Admin\",\"lastName\":\"User\",\"employeeCode\":\"EMP-ADMIN\"}}', 'null', 2, '2026-06-05 12:46:17.949'),
(122, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 12:52:05.296'),
(123, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:04:53.325'),
(124, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:09:28.173'),
(125, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:09:48.270'),
(126, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:10:24.429'),
(127, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:10:56.243'),
(128, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0005', 'null', '{\"id\":6,\"tenantId\":1,\"prNumber\":\"PR-2026-0005\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:10:56.308Z\",\"updatedAt\":\"2026-06-05T13:10:56.308Z\",\"items\":[{\"id\":7,\"purchaseRequestId\":6,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:10:56.308Z\",\"updatedAt\":\"2026-06-05T13:10:56.308Z\"}]}', 2, '2026-06-05 13:10:56.344'),
(129, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:11:17.160'),
(130, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0006', 'null', '{\"id\":7,\"tenantId\":1,\"prNumber\":\"PR-2026-0006\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:11:17.253Z\",\"updatedAt\":\"2026-06-05T13:11:17.253Z\",\"items\":[{\"id\":8,\"purchaseRequestId\":7,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:11:17.253Z\",\"updatedAt\":\"2026-06-05T13:11:17.253Z\"}]}', 2, '2026-06-05 13:11:17.303'),
(131, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:11:37.108'),
(132, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0007', 'null', '{\"id\":8,\"tenantId\":1,\"prNumber\":\"PR-2026-0007\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:11:37.174Z\",\"updatedAt\":\"2026-06-05T13:11:37.174Z\",\"items\":[{\"id\":9,\"purchaseRequestId\":8,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:11:37.174Z\",\"updatedAt\":\"2026-06-05T13:11:37.174Z\"}]}', 2, '2026-06-05 13:11:37.201'),
(133, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:11:56.484'),
(134, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0008', 'null', '{\"id\":9,\"tenantId\":1,\"prNumber\":\"PR-2026-0008\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:11:56.532Z\",\"updatedAt\":\"2026-06-05T13:11:56.532Z\",\"items\":[{\"id\":10,\"purchaseRequestId\":9,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:11:56.532Z\",\"updatedAt\":\"2026-06-05T13:11:56.532Z\"}]}', 2, '2026-06-05 13:11:56.549'),
(135, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:12:31.251'),
(136, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0009', 'null', '{\"id\":10,\"tenantId\":1,\"prNumber\":\"PR-2026-0009\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:12:31.370Z\",\"updatedAt\":\"2026-06-05T13:12:31.370Z\",\"items\":[{\"id\":11,\"purchaseRequestId\":10,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:12:31.370Z\",\"updatedAt\":\"2026-06-05T13:12:31.370Z\"}]}', 2, '2026-06-05 13:12:31.425'),
(137, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:13:24.463'),
(138, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0010', 'null', '{\"id\":11,\"tenantId\":1,\"prNumber\":\"PR-2026-0010\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:13:24.514Z\",\"updatedAt\":\"2026-06-05T13:13:24.514Z\",\"items\":[{\"id\":12,\"purchaseRequestId\":11,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:13:24.514Z\",\"updatedAt\":\"2026-06-05T13:13:24.514Z\"}]}', 2, '2026-06-05 13:13:24.530'),
(139, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:13:42.053'),
(140, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0011', 'null', '{\"id\":12,\"tenantId\":1,\"prNumber\":\"PR-2026-0011\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:13:42.130Z\",\"updatedAt\":\"2026-06-05T13:13:42.130Z\",\"items\":[{\"id\":13,\"purchaseRequestId\":12,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:13:42.130Z\",\"updatedAt\":\"2026-06-05T13:13:42.130Z\"}]}', 2, '2026-06-05 13:13:42.170'),
(141, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:14:01.617'),
(142, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0012', 'null', '{\"id\":13,\"tenantId\":1,\"prNumber\":\"PR-2026-0012\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:14:01.686Z\",\"updatedAt\":\"2026-06-05T13:14:01.686Z\",\"items\":[{\"id\":14,\"purchaseRequestId\":13,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:14:01.686Z\",\"updatedAt\":\"2026-06-05T13:14:01.686Z\"}]}', 2, '2026-06-05 13:14:01.711'),
(143, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:14:19.396'),
(144, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0013', 'null', '{\"id\":14,\"tenantId\":1,\"prNumber\":\"PR-2026-0013\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:14:19.480Z\",\"updatedAt\":\"2026-06-05T13:14:19.480Z\",\"items\":[{\"id\":15,\"purchaseRequestId\":14,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:14:19.480Z\",\"updatedAt\":\"2026-06-05T13:14:19.480Z\"}]}', 2, '2026-06-05 13:14:19.502'),
(145, 'RFQS', 'CREATE', 'Created RFQ RFQ-2026-0001 for Vendor Test Company', 'null', '{\"id\":1,\"tenantId\":1,\"rfqNumber\":\"RFQ-2026-0001\",\"purchaseRequestId\":14,\"vendorId\":2,\"status\":\"sent\",\"createdAt\":\"2026-06-05T13:14:19.591Z\",\"updatedAt\":\"2026-06-05T13:14:19.591Z\",\"vendor\":{\"id\":2,\"tenantId\":1,\"vendorCode\":\"VND-TEST-001\",\"companyName\":\"Test Company\",\"contactPerson\":null,\"email\":\"test@example.com\",\"phone\":\"1234567890\",\"address\":null,\"status\":\"approved\",\"createdAt\":\"2026-06-05T13:14:19.536Z\",\"updatedAt\":\"2026-06-05T13:14:19.536Z\"},\"purchaseRequest\":{\"id\":14,\"tenantId\":1,\"prNumber\":\"PR-2026-0013\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"approved\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:14:19.480Z\",\"updatedAt\":\"2026-06-05T13:14:19.524Z\"}}', 2, '2026-06-05 13:14:19.620'),
(146, 'QUOTATIONS', 'CREATE', 'Submitted quotation for RFQ RFQ-2026-0001', 'null', '{\"id\":1,\"tenantId\":1,\"rfqId\":1,\"vendorId\":2,\"amount\":4500,\"remarks\":\"Special Discount\",\"status\":\"pending\",\"createdAt\":\"2026-06-05T13:14:19.681Z\",\"updatedAt\":\"2026-06-05T13:14:19.681Z\",\"vendor\":{\"id\":2,\"tenantId\":1,\"vendorCode\":\"VND-TEST-001\",\"companyName\":\"Test Company\",\"contactPerson\":null,\"email\":\"test@example.com\",\"phone\":\"1234567890\",\"address\":null,\"status\":\"approved\",\"createdAt\":\"2026-06-05T13:14:19.536Z\",\"updatedAt\":\"2026-06-05T13:14:19.536Z\"},\"rfq\":{\"id\":1,\"tenantId\":1,\"rfqNumber\":\"RFQ-2026-0001\",\"purchaseRequestId\":14,\"vendorId\":2,\"status\":\"sent\",\"createdAt\":\"2026-06-05T13:14:19.591Z\",\"updatedAt\":\"2026-06-05T13:14:19.591Z\"}}', 2, '2026-06-05 13:14:19.714'),
(147, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:14:37.143'),
(148, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0014', 'null', '{\"id\":15,\"tenantId\":1,\"prNumber\":\"PR-2026-0014\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:14:37.198Z\",\"updatedAt\":\"2026-06-05T13:14:37.198Z\",\"items\":[{\"id\":16,\"purchaseRequestId\":15,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:14:37.198Z\",\"updatedAt\":\"2026-06-05T13:14:37.198Z\"}]}', 2, '2026-06-05 13:14:37.219'),
(149, 'RFQS', 'CREATE', 'Created RFQ RFQ-2026-0002 for Vendor Test Company', 'null', '{\"id\":2,\"tenantId\":1,\"rfqNumber\":\"RFQ-2026-0002\",\"purchaseRequestId\":15,\"vendorId\":2,\"status\":\"sent\",\"createdAt\":\"2026-06-05T13:14:37.267Z\",\"updatedAt\":\"2026-06-05T13:14:37.267Z\",\"vendor\":{\"id\":2,\"tenantId\":1,\"vendorCode\":\"VND-TEST-001\",\"companyName\":\"Test Company\",\"contactPerson\":null,\"email\":\"test@example.com\",\"phone\":\"1234567890\",\"address\":null,\"status\":\"approved\",\"createdAt\":\"2026-06-05T13:14:19.536Z\",\"updatedAt\":\"2026-06-05T13:14:19.536Z\"},\"purchaseRequest\":{\"id\":15,\"tenantId\":1,\"prNumber\":\"PR-2026-0014\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"approved\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:14:37.198Z\",\"updatedAt\":\"2026-06-05T13:14:37.234Z\"}}', 2, '2026-06-05 13:14:37.284'),
(150, 'QUOTATIONS', 'CREATE', 'Submitted quotation for RFQ RFQ-2026-0002', 'null', '{\"id\":2,\"tenantId\":1,\"rfqId\":2,\"vendorId\":2,\"amount\":4500,\"remarks\":\"Special Discount\",\"status\":\"pending\",\"createdAt\":\"2026-06-05T13:14:37.340Z\",\"updatedAt\":\"2026-06-05T13:14:37.340Z\",\"vendor\":{\"id\":2,\"tenantId\":1,\"vendorCode\":\"VND-TEST-001\",\"companyName\":\"Test Company\",\"contactPerson\":null,\"email\":\"test@example.com\",\"phone\":\"1234567890\",\"address\":null,\"status\":\"approved\",\"createdAt\":\"2026-06-05T13:14:19.536Z\",\"updatedAt\":\"2026-06-05T13:14:19.536Z\"},\"rfq\":{\"id\":2,\"tenantId\":1,\"rfqNumber\":\"RFQ-2026-0002\",\"purchaseRequestId\":15,\"vendorId\":2,\"status\":\"sent\",\"createdAt\":\"2026-06-05T13:14:37.267Z\",\"updatedAt\":\"2026-06-05T13:14:37.267Z\"}}', 2, '2026-06-05 13:14:37.361'),
(151, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 13:14:58.057'),
(152, 'PURCHASE_REQUESTS', 'CREATE', 'Created PR PR-2026-0015', 'null', '{\"id\":16,\"tenantId\":1,\"prNumber\":\"PR-2026-0015\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"draft\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:14:58.117Z\",\"updatedAt\":\"2026-06-05T13:14:58.117Z\",\"items\":[{\"id\":17,\"purchaseRequestId\":16,\"itemName\":\"Test Asset\",\"description\":null,\"quantity\":1,\"unit\":\"Pcs\",\"estimatedCost\":5000,\"createdAt\":\"2026-06-05T13:14:58.117Z\",\"updatedAt\":\"2026-06-05T13:14:58.117Z\"}]}', 2, '2026-06-05 13:14:58.139'),
(153, 'RFQS', 'CREATE', 'Created RFQ RFQ-2026-0003 for Vendor Test Company', 'null', '{\"id\":3,\"tenantId\":1,\"rfqNumber\":\"RFQ-2026-0003\",\"purchaseRequestId\":16,\"vendorId\":2,\"status\":\"sent\",\"createdAt\":\"2026-06-05T13:14:58.205Z\",\"updatedAt\":\"2026-06-05T13:14:58.205Z\",\"vendor\":{\"id\":2,\"tenantId\":1,\"vendorCode\":\"VND-TEST-001\",\"companyName\":\"Test Company\",\"contactPerson\":null,\"email\":\"test@example.com\",\"phone\":\"1234567890\",\"address\":null,\"status\":\"approved\",\"createdAt\":\"2026-06-05T13:14:19.536Z\",\"updatedAt\":\"2026-06-05T13:14:19.536Z\"},\"purchaseRequest\":{\"id\":16,\"tenantId\":1,\"prNumber\":\"PR-2026-0015\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"approved\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:14:58.117Z\",\"updatedAt\":\"2026-06-05T13:14:58.160Z\"}}', 2, '2026-06-05 13:14:58.229'),
(154, 'QUOTATIONS', 'CREATE', 'Submitted quotation for RFQ RFQ-2026-0003', 'null', '{\"id\":3,\"tenantId\":1,\"rfqId\":3,\"vendorId\":2,\"amount\":4500,\"remarks\":\"Special Discount\",\"status\":\"pending\",\"createdAt\":\"2026-06-05T13:14:58.282Z\",\"updatedAt\":\"2026-06-05T13:14:58.282Z\",\"vendor\":{\"id\":2,\"tenantId\":1,\"vendorCode\":\"VND-TEST-001\",\"companyName\":\"Test Company\",\"contactPerson\":null,\"email\":\"test@example.com\",\"phone\":\"1234567890\",\"address\":null,\"status\":\"approved\",\"createdAt\":\"2026-06-05T13:14:19.536Z\",\"updatedAt\":\"2026-06-05T13:14:19.536Z\"},\"rfq\":{\"id\":3,\"tenantId\":1,\"rfqNumber\":\"RFQ-2026-0003\",\"purchaseRequestId\":16,\"vendorId\":2,\"status\":\"sent\",\"createdAt\":\"2026-06-05T13:14:58.205Z\",\"updatedAt\":\"2026-06-05T13:14:58.205Z\"}}', 2, '2026-06-05 13:14:58.304'),
(155, 'PURCHASE_ORDERS', 'CREATE', 'Created PO PO-2026-0001 for Vendor Test Company', 'null', '{\"id\":1,\"tenantId\":1,\"poNumber\":\"PO-2026-0001\",\"vendorId\":2,\"purchaseRequestId\":16,\"quotationId\":3,\"totalAmount\":4500,\"status\":\"draft\",\"createdAt\":\"2026-06-05T13:14:58.373Z\",\"updatedAt\":\"2026-06-05T13:14:58.373Z\",\"vendor\":{\"id\":2,\"tenantId\":1,\"vendorCode\":\"VND-TEST-001\",\"companyName\":\"Test Company\",\"contactPerson\":null,\"email\":\"test@example.com\",\"phone\":\"1234567890\",\"address\":null,\"status\":\"approved\",\"createdAt\":\"2026-06-05T13:14:19.536Z\",\"updatedAt\":\"2026-06-05T13:14:19.536Z\"},\"purchaseRequest\":{\"id\":16,\"tenantId\":1,\"prNumber\":\"PR-2026-0015\",\"title\":\"Stage B Test Asset\",\"description\":\"Testing RFQ Flow\",\"departmentId\":2,\"requestedBy\":1,\"status\":\"rfq_created\",\"priority\":\"high\",\"createdAt\":\"2026-06-05T13:14:58.117Z\",\"updatedAt\":\"2026-06-05T13:14:58.216Z\"},\"quotation\":{\"id\":3,\"tenantId\":1,\"rfqId\":3,\"vendorId\":2,\"amount\":4500,\"remarks\":\"Special Discount\",\"status\":\"approved\",\"createdAt\":\"2026-06-05T13:14:58.282Z\",\"updatedAt\":\"2026-06-05T13:14:58.318Z\"}}', 2, '2026-06-05 13:14:58.388'),
(156, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 17:23:03.483'),
(157, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-05 17:26:52.605'),
(158, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 17:26:59.570'),
(159, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 17:33:25.413'),
(160, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-05 17:34:49.433'),
(161, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-05 17:37:21.251'),
(162, 'AUTH', 'LOGIN', 'User login: operations@zanezion.com', 'null', 'null', 3, '2026-06-05 17:37:39.170'),
(163, 'AUTH', 'LOGIN', 'User login: logistics@zanezion.com', 'null', 'null', 5, '2026-06-05 17:39:31.072'),
(164, 'AUTH', 'LOGIN', 'User login: inventory@zanezion.com', 'null', 'null', 6, '2026-06-05 17:39:59.782'),
(165, 'AUTH', 'LOGIN', 'User login: concierge@zanezion.com', 'null', 'null', 7, '2026-06-05 17:40:18.756'),
(166, 'AUTH', 'LOGIN', 'User login: businessclient@zanezion.com', 'null', 'null', 8, '2026-06-05 17:40:45.828'),
(167, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-05 17:41:44.039'),
(168, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-05 17:42:37.155'),
(169, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 05:22:21.799'),
(170, 'AUTH', 'LOGIN', 'User login: fieldstaff@zanezion.com', 'null', 'null', 9, '2026-06-06 05:37:18.630'),
(171, 'AUTH', 'LOGIN', 'User login: businessclient@zanezion.com', 'null', 'null', 8, '2026-06-06 05:37:27.110'),
(172, 'AUTH', 'LOGIN', 'User login: procurement@zanezion.com', 'null', 'null', 4, '2026-06-06 05:37:33.493'),
(173, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 05:37:38.255'),
(174, 'CLIENTS', 'CREATE', 'Created Client dzx (CLT-952985)', 'null', '{\"id\":1,\"tenantId\":1,\"clientCode\":\"CLT-952985\",\"companyName\":\"dzx\",\"contactPerson\":\"knjkndkjn\",\"email\":\"sacX@gmail.com\",\"phone\":\"123456789\",\"address\":\"knk\",\"city\":null,\"country\":null,\"status\":\"active\",\"clientType\":\"Personal\",\"billingCycle\":\"Monthly\",\"paymentMethod\":\"Wire Transfer\",\"plan\":\"Free\",\"logoUrl\":null,\"source\":\"Manual\",\"createdAt\":\"2026-06-06T05:49:13.001Z\",\"updatedAt\":\"2026-06-06T05:49:13.001Z\"}', 1, '2026-06-06 05:49:13.042'),
(175, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 05:57:32.466'),
(176, 'VENDORS', 'CREATE', 'Created vendor wSA', 'null', '{\"id\":3,\"tenantId\":1,\"vendorCode\":\"VND-805557\",\"companyName\":\"wSA\",\"contactPerson\":\"AS\",\"email\":\"wSA@gmail.com\",\"phone\":\"1234567890\",\"address\":\"njdnn\",\"status\":\"active\",\"createdAt\":\"2026-06-06T06:03:25.730Z\",\"updatedAt\":\"2026-06-06T06:03:25.730Z\"}', 1, '2026-06-06 06:03:25.793'),
(177, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 06:13:36.487'),
(178, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-06 06:27:46.742'),
(179, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 06:28:13.483'),
(180, 'USERS', 'CREATE', 'Created user asdfg@gmail.com', 'null', '{\"id\":10,\"email\":\"asdfg@gmail.com\",\"roleId\":2}', 1, '2026-06-06 06:32:33.592'),
(181, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 06:44:32.350'),
(182, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 07:03:06.518'),
(183, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-06 07:20:38.771'),
(184, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 07:22:03.664'),
(185, 'PLANS', 'CREATE', 'Created plan ddd', 'null', '{\"id\":1,\"name\":\"ddd\",\"description\":\"sffd\",\"price\":123,\"billingCycle\":\"MONTHLY\",\"maxUsers\":100,\"maxStorage\":1024,\"features\":{\"tier\":\"ds\",\"yearlyPrice\":1234,\"commitment\":\"Monthly or Yearly subscription.\",\"list\":[\"fdsc\"]},\"isActive\":true,\"createdAt\":\"2026-06-06T07:31:11.204Z\",\"updatedAt\":\"2026-06-06T07:31:11.204Z\"}', 1, '2026-06-06 07:31:11.297'),
(186, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 07:37:27.957'),
(187, 'AUTH', 'LOGIN', 'User login: admin@zanezion.com', 'null', 'null', 2, '2026-06-06 07:44:41.440'),
(188, 'AUTH', 'LOGIN', 'User login: superadmin@zanezion.com', 'null', 'null', 1, '2026-06-06 09:06:28.386');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `clientCode` varchar(191) NOT NULL,
  `companyName` varchar(191) NOT NULL,
  `contactPerson` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `billingCycle` varchar(191) DEFAULT NULL,
  `clientType` varchar(191) DEFAULT NULL,
  `logoUrl` text DEFAULT NULL,
  `paymentMethod` varchar(191) DEFAULT NULL,
  `plan` varchar(191) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `tenantId`, `clientCode`, `companyName`, `contactPerson`, `email`, `phone`, `address`, `city`, `country`, `status`, `createdAt`, `updatedAt`, `billingCycle`, `clientType`, `logoUrl`, `paymentMethod`, `plan`, `source`) VALUES
(1, 1, 'CLT-952985', 'dzx', 'knjkndkjn', 'sacX@gmail.com', '123456789', 'knk', NULL, NULL, 'active', '2026-06-06 05:49:13.001', '2026-06-06 05:49:13.001', 'Monthly', 'Personal', NULL, 'Wire Transfer', 'Free', 'Manual');

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

CREATE TABLE `client_contacts` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `isPrimary` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `deliveryNumber` varchar(191) NOT NULL,
  `orderId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `assignedTo` int(11) DEFAULT NULL,
  `warehouseId` int(11) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `dispatchDate` datetime(3) DEFAULT NULL,
  `deliveryDate` datetime(3) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_items`
--

CREATE TABLE `delivery_items` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `deliveryId` int(11) NOT NULL,
  `orderItemId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `tenantId`, `name`, `code`, `description`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Operations', 'OPS', 'Core business operations and mission control.', 'active', '2026-06-05 12:26:40.207', '2026-06-05 12:26:40.207'),
(2, 1, 'Procurement', 'PROC', 'Purchasing, vendor management, and sourcing.', 'active', '2026-06-05 12:26:40.207', '2026-06-05 12:26:40.207'),
(3, 1, 'Logistics', 'LOG', 'Fleet management, deliveries, and supply chain.', 'active', '2026-06-05 12:26:40.207', '2026-06-05 12:26:40.207'),
(4, 1, 'Finance', 'FIN', 'Accounts payable/receivable, invoicing, and treasury.', 'active', '2026-06-05 12:26:40.207', '2026-06-05 12:26:40.207'),
(5, 1, 'Human Resources', 'HR', 'Personnel management, payroll, and recruiting.', 'active', '2026-06-05 12:26:40.207', '2026-06-05 12:26:40.207'),
(6, 1, 'Information Technology', 'IT', 'Systems, infrastructure, and technical support.', 'active', '2026-06-05 12:26:40.207', '2026-06-05 12:26:40.207'),
(7, 1, 'Sales', 'SALES', 'Client acquisition and CRM management.', 'active', '2026-06-05 12:26:40.207', '2026-06-05 12:26:40.207'),
(8, 1, 'Administration', 'ADMIN', 'General management and executive functions.', 'active', '2026-06-05 12:26:40.207', '2026-06-05 12:26:40.207');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `tenantId`, `departmentId`, `name`, `description`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 'Admin Role', NULL, 'active', '2026-06-05 12:37:08.519', '2026-06-05 12:37:08.519');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `employeeCode` varchar(191) NOT NULL,
  `firstName` varchar(191) NOT NULL,
  `lastName` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  `designationId` int(11) NOT NULL,
  `joiningDate` datetime(3) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `vehicleModel` varchar(191) DEFAULT NULL,
  `vehiclePlate` varchar(191) DEFAULT NULL,
  `vehicleType` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `tenantId`, `userId`, `employeeCode`, `firstName`, `lastName`, `phone`, `departmentId`, `designationId`, `joiningDate`, `status`, `createdAt`, `updatedAt`, `vehicleModel`, `vehiclePlate`, `vehicleType`) VALUES
(1, 1, 2, 'EMP-ADMIN', 'Admin', 'User', NULL, 1, 1, '2026-06-05 12:37:08.605', 'active', '2026-06-05 12:37:08.617', '2026-06-05 12:37:08.617', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `documentType` varchar(191) NOT NULL,
  `documentNumber` varchar(191) DEFAULT NULL,
  `filePath` varchar(191) NOT NULL,
  `verificationStatus` varchar(191) NOT NULL DEFAULT 'pending',
  `verifiedBy` int(11) DEFAULT NULL,
  `verifiedAt` datetime(3) DEFAULT NULL,
  `expiryDate` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grns`
--

CREATE TABLE `grns` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `grnNumber` varchar(191) NOT NULL,
  `purchaseOrderId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `receivedById` int(11) NOT NULL,
  `deliveryChallan` varchar(191) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'draft',
  `receivedDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grn_items`
--

CREATE TABLE `grn_items` (
  `id` int(11) NOT NULL,
  `grnId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `orderedQuantity` double NOT NULL,
  `receivedQuantity` double NOT NULL,
  `acceptedQuantity` double NOT NULL,
  `rejectedQuantity` double NOT NULL DEFAULT 0,
  `unitPrice` double NOT NULL,
  `totalPrice` double NOT NULL,
  `remarks` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stock`
--

CREATE TABLE `inventory_stock` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `reservedQuantity` double NOT NULL DEFAULT 0,
  `lastUpdated` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `stockType` varchar(191) NOT NULL DEFAULT 'INTERNAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `invoiceNumber` varchar(191) NOT NULL,
  `clientId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `deliveryId` int(11) NOT NULL,
  `invoiceDate` datetime(3) NOT NULL,
  `dueDate` datetime(3) NOT NULL,
  `subtotal` double NOT NULL DEFAULT 0,
  `taxAmount` double NOT NULL DEFAULT 0,
  `discountAmount` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'draft',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `unitPrice` double NOT NULL,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `total` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `unitId` int(11) NOT NULL,
  `sku` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `reorderLevel` double NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `inventoryType` varchar(191) NOT NULL DEFAULT 'INTERNAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `tenantId`, `categoryId`, `unitId`, `sku`, `name`, `description`, `reorderLevel`, `status`, `createdAt`, `updatedAt`, `inventoryType`) VALUES
(2, 1, 1, 1, 'SKU-58405650', 'SKU Test Watch', NULL, 0, 'active', '2026-06-05 11:56:24.070', '2026-06-05 11:56:24.070', 'INTERNAL');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `tenantId`, `name`, `description`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'General', NULL, 'active', '2026-06-05 11:41:46.421', '2026-06-05 11:41:46.421');

-- --------------------------------------------------------

--
-- Table structure for table `item_units`
--

CREATE TABLE `item_units` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `shortName` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_units`
--

INSERT INTO `item_units` (`id`, `tenantId`, `name`, `shortName`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Pieces', 'pcs', 'active', '2026-06-05 11:41:46.428', '2026-06-05 11:41:46.428');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `icon` varchar(191) NOT NULL,
  `module` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `path`, `icon`, `module`) VALUES
(1, 'Dashboard', '/dashboard', 'LayoutDashboard', 'Core'),
(2, 'Analytics', '/dashboard/analytics', 'Activity', 'Core'),
(3, 'Clients', '/dashboard/clients', 'Users', 'CRM'),
(4, 'Vendors', '/dashboard/vendors', 'Store', 'Procurement'),
(5, 'Personnel', '/dashboard/users', 'UserCog', 'HR'),
(6, 'Audit Log', '/dashboard/audits', 'BarChart3', 'System'),
(7, 'Plans', '/dashboard/plans', 'Globe', 'Settings'),
(8, 'Settings', '/dashboard/settings', 'Settings', 'Settings'),
(9, 'Security', '/dashboard/roles-permissions', 'ShieldCheck', 'Settings'),
(10, 'Projects', '/dashboard/projects', 'Briefcase', 'Operations'),
(11, 'Orders', '/dashboard/orders', 'ShoppingCart', 'Operations'),
(12, 'Missions', '/dashboard/missions', 'Navigation', 'Logistics'),
(13, 'Deliveries', '/dashboard/deliveries', 'Truck', 'Logistics'),
(14, 'Invoices', '/dashboard/invoices', 'FileText', 'Finance'),
(15, 'Payments', '/dashboard/payments', 'CreditCard', 'Finance'),
(16, 'Purchase Requests', '/dashboard/purchase-requests', 'ClipboardList', 'Procurement'),
(17, 'Quotes', '/dashboard/quotes', 'Box', 'Procurement'),
(18, 'Purchase Orders', '/dashboard/purchase-orders', 'FileText', 'Procurement'),
(19, 'Fleet', '/dashboard/fleet', 'Truck', 'Logistics'),
(20, 'Routes', '/dashboard/logistics-routes', 'Navigation', 'Logistics'),
(21, 'Tracking', '/dashboard/logistics-tracking', 'Activity', 'Logistics'),
(22, 'Urgent', '/dashboard/logistics-urgent', 'AlertCircle', 'Logistics'),
(23, 'Inventory', '/dashboard/inventory', 'Package', 'Inventory'),
(24, 'Warehouses', '/dashboard/warehouses', 'Store', 'Inventory'),
(25, 'Alerts', '/dashboard/inventory-alerts', 'AlertCircle', 'Inventory'),
(26, 'Events', '/dashboard/events', 'Calendar', 'Concierge'),
(27, 'Guest Requests', '/dashboard/guest-requests', 'Heart', 'Concierge'),
(28, 'Luxury Items', '/dashboard/luxury-items', 'Gift', 'Concierge'),
(29, 'Access Plans', '/dashboard/vip-access', 'ShieldCheck', 'Concierge'),
(30, 'Chauffeur', '/dashboard/chauffeur', 'Car', 'Concierge'),
(31, 'Staff Terminal', '/dashboard/staff-terminal', 'Smartphone', 'Staff'),
(32, 'Assignments', '/dashboard?tab=assignments', 'Smartphone', 'Staff'),
(33, 'Field Map', '/dashboard?tab=map', 'Map', 'Staff'),
(34, 'Leave & Absence', '/dashboard?tab=leave', 'Calendar', 'HR'),
(35, 'Pay & Records', '/dashboard?tab=pay', 'History', 'HR'),
(36, 'Payroll', '/dashboard/payroll', 'CreditCard', 'HR'),
(37, 'Support', '/dashboard/support', 'Headphones', 'CRM'),
(38, 'Marketplace', '/dashboard/store', 'ShoppingBag', 'Client'),
(39, 'My Orders', '/dashboard/client-orders', 'ShoppingCart', 'Client'),
(40, 'Membership', '/dashboard/membership', 'Sparkles', 'Client');

-- --------------------------------------------------------

--
-- Table structure for table `missions`
--

CREATE TABLE `missions` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `missionNumber` varchar(191) NOT NULL,
  `deliveryId` int(11) DEFAULT NULL,
  `assignedEmployeeId` int(11) NOT NULL,
  `startDate` datetime(3) DEFAULT NULL,
  `endDate` datetime(3) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'assigned',
  `remarks` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `missionType` varchar(191) NOT NULL DEFAULT 'DELIVERY',
  `orderId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(191) NOT NULL,
  `userId` int(11) NOT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `orderNumber` varchar(191) NOT NULL,
  `clientId` int(11) NOT NULL,
  `createdById` int(11) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'draft',
  `priority` varchar(191) NOT NULL DEFAULT 'normal',
  `totalAmount` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `orderType` varchar(191) NOT NULL DEFAULT 'PRODUCT'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `unitPrice` double NOT NULL,
  `totalPrice` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `email`, `phone`, `address`, `country`, `timezone`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Zanezion Test Org', 'org@test.com', NULL, NULL, NULL, NULL, 'active', '2026-06-05 11:41:46.348', '2026-06-05 11:41:46.348');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `paymentDate` datetime(3) NOT NULL,
  `paymentMethod` varchar(191) NOT NULL,
  `referenceNumber` varchar(191) DEFAULT NULL,
  `amount` double NOT NULL,
  `remarks` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `module` varchar(191) NOT NULL,
  `action` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `price` double NOT NULL,
  `billingCycle` varchar(191) NOT NULL,
  `maxUsers` int(11) NOT NULL,
  `maxStorage` int(11) NOT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `description`, `price`, `billingCycle`, `maxUsers`, `maxStorage`, `features`, `isActive`, `createdAt`, `updatedAt`) VALUES
(1, 'ddd', 'sffd', 123, 'MONTHLY', 100, 1024, '{\"tier\":\"ds\",\"yearlyPrice\":1234,\"commitment\":\"Monthly or Yearly subscription.\",\"list\":[\"fdsc\"]}', 1, '2026-06-06 07:31:11.204', '2026-06-06 07:31:11.204');

-- --------------------------------------------------------

--
-- Table structure for table `proof_of_delivery`
--

CREATE TABLE `proof_of_delivery` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `deliveryId` int(11) NOT NULL,
  `receiverName` varchar(191) NOT NULL,
  `receiverPhone` varchar(191) DEFAULT NULL,
  `receiverSignature` text DEFAULT NULL,
  `deliveryPhoto` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `poNumber` varchar(191) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `purchaseRequestId` int(11) NOT NULL,
  `quotationId` int(11) DEFAULT NULL,
  `totalAmount` double NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'draft',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `tenantId`, `poNumber`, `vendorId`, `purchaseRequestId`, `quotationId`, `totalAmount`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'PO-2026-0001', 2, 16, 3, 4500, 'draft', '2026-06-05 13:14:58.373', '2026-06-05 13:14:58.373');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_requests`
--

CREATE TABLE `purchase_requests` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `prNumber` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  `requestedBy` int(11) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'draft',
  `priority` varchar(191) NOT NULL DEFAULT 'medium',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_requests`
--

INSERT INTO `purchase_requests` (`id`, `tenantId`, `prNumber`, `title`, `description`, `departmentId`, `requestedBy`, `status`, `priority`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'PR-2026-0001', 'Test Migration PR', NULL, 1, 1, 'draft', 'high', '2026-06-05 12:37:22.218', '2026-06-05 12:37:22.218'),
(2, 1, 'PR-2026-0002', 'Test Migration PR', NULL, 1, 1, 'draft', 'high', '2026-06-05 12:39:11.370', '2026-06-05 12:39:11.370'),
(3, 1, 'PR-2026-0003', 'Test Migration PR', NULL, 1, 1, 'draft', 'high', '2026-06-05 12:39:41.372', '2026-06-05 12:39:41.372'),
(4, 1, 'PR-2026-0004', 'Test Migration PR', NULL, 1, 1, 'draft', 'high', '2026-06-05 12:40:29.650', '2026-06-05 12:40:29.650'),
(6, 1, 'PR-2026-0005', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'draft', 'high', '2026-06-05 13:10:56.308', '2026-06-05 13:10:56.308'),
(7, 1, 'PR-2026-0006', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'draft', 'high', '2026-06-05 13:11:17.253', '2026-06-05 13:11:17.253'),
(8, 1, 'PR-2026-0007', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'approved', 'high', '2026-06-05 13:11:37.174', '2026-06-05 13:11:37.233'),
(9, 1, 'PR-2026-0008', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'approved', 'high', '2026-06-05 13:11:56.532', '2026-06-05 13:11:56.570'),
(10, 1, 'PR-2026-0009', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'approved', 'high', '2026-06-05 13:12:31.370', '2026-06-05 13:12:31.459'),
(11, 1, 'PR-2026-0010', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'approved', 'high', '2026-06-05 13:13:24.514', '2026-06-05 13:13:24.550'),
(12, 1, 'PR-2026-0011', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'approved', 'high', '2026-06-05 13:13:42.130', '2026-06-05 13:13:42.190'),
(13, 1, 'PR-2026-0012', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'approved', 'high', '2026-06-05 13:14:01.686', '2026-06-05 13:14:01.729'),
(14, 1, 'PR-2026-0013', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'rfq_created', 'high', '2026-06-05 13:14:19.480', '2026-06-05 13:14:19.603'),
(15, 1, 'PR-2026-0014', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'rfq_created', 'high', '2026-06-05 13:14:37.198', '2026-06-05 13:14:37.274'),
(16, 1, 'PR-2026-0015', 'Stage B Test Asset', 'Testing RFQ Flow', 2, 1, 'rfq_created', 'high', '2026-06-05 13:14:58.117', '2026-06-05 13:14:58.216');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request_items`
--

CREATE TABLE `purchase_request_items` (
  `id` int(11) NOT NULL,
  `purchaseRequestId` int(11) NOT NULL,
  `itemName` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(191) NOT NULL,
  `estimatedCost` double DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_request_items`
--

INSERT INTO `purchase_request_items` (`id`, `purchaseRequestId`, `itemName`, `description`, `quantity`, `unit`, `estimatedCost`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Test Asset', NULL, 5, 'Pieces', 100, '2026-06-05 12:37:22.218', '2026-06-05 12:37:22.218'),
(2, 2, 'Test Asset', NULL, 5, 'Pieces', 100, '2026-06-05 12:39:11.370', '2026-06-05 12:39:11.370'),
(3, 3, 'Test Asset', NULL, 5, 'Pieces', 100, '2026-06-05 12:39:41.372', '2026-06-05 12:39:41.372'),
(4, 4, 'Test Asset', NULL, 5, 'Pieces', 100, '2026-06-05 12:40:29.650', '2026-06-05 12:40:29.650'),
(7, 6, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:10:56.308', '2026-06-05 13:10:56.308'),
(8, 7, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:11:17.253', '2026-06-05 13:11:17.253'),
(9, 8, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:11:37.174', '2026-06-05 13:11:37.174'),
(10, 9, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:11:56.532', '2026-06-05 13:11:56.532'),
(11, 10, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:12:31.370', '2026-06-05 13:12:31.370'),
(12, 11, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:13:24.514', '2026-06-05 13:13:24.514'),
(13, 12, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:13:42.130', '2026-06-05 13:13:42.130'),
(14, 13, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:14:01.686', '2026-06-05 13:14:01.686'),
(15, 14, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:14:19.480', '2026-06-05 13:14:19.480'),
(16, 15, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:14:37.198', '2026-06-05 13:14:37.198'),
(17, 16, 'Test Asset', NULL, 1, 'Pcs', 5000, '2026-06-05 13:14:58.117', '2026-06-05 13:14:58.117');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `rfqId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `remarks` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `tenantId`, `rfqId`, `vendorId`, `amount`, `remarks`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 2, 4500, 'Special Discount', 'pending', '2026-06-05 13:14:19.681', '2026-06-05 13:14:19.681'),
(2, 1, 2, 2, 4500, 'Special Discount', 'pending', '2026-06-05 13:14:37.340', '2026-06-05 13:14:37.340'),
(3, 1, 3, 2, 4500, 'Special Discount', 'approved', '2026-06-05 13:14:58.282', '2026-06-05 13:14:58.318');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `receiptNumber` varchar(191) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `receiptDate` datetime(3) NOT NULL,
  `amount` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(191) NOT NULL,
  `userId` int(11) NOT NULL,
  `expiresAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `token`, `userId`, `expiresAt`, `createdAt`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjQ0NDM2LCJleHAiOjE3ODEyNDkyMzZ9.NNnaKR3UPgk3uXigMlPvAW1Bn7E4FpfjJfauqiVy2N8', 1, '2026-06-12 07:27:16.653', '2026-06-05 07:27:16.659'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjQ4NTg5LCJleHAiOjE3ODEyNTMzODl9.-gXK0GOI5DkcQiDAUxrMMM2tpC0tV_AKNEL72s-QPrM', 1, '2026-06-12 08:36:29.792', '2026-06-05 08:36:29.795'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjUwNDExLCJleHAiOjE3ODEyNTUyMTF9.THpEhji_u_9-SYZ9j-oI0N-mN-nbsocH2h4rUaV2y60', 2, '2026-06-12 09:06:51.933', '2026-06-05 09:06:51.937'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUwNDQ2LCJleHAiOjE3ODEyNTUyNDZ9.dRUsnsnKgk_8x9pIm1e7SRkKwLGKHK7CAzcy3paX8Ng', 1, '2026-06-12 09:07:26.536', '2026-06-05 09:07:26.538'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjUxNDEwLCJleHAiOjE3ODEyNTYyMTB9.cdo8uzDRgq2TrrNaONDH51ciBIMpmO2U4PejlKM4rwI', 2, '2026-06-12 09:23:30.861', '2026-06-05 09:23:30.864'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUxNTU1LCJleHAiOjE3ODEyNTYzNTV9.G4933THZhq9ujVGcFIuiVnxZ-u47O8pUsCuNt4YKT-U', 1, '2026-06-12 09:25:55.880', '2026-06-05 09:25:55.882'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUxNjkwLCJleHAiOjE3ODEyNTY0OTB9.6_SmH-95oT7ixsDFGimU3wvDumq9DiqidGYyFpOmz4U', 1, '2026-06-12 09:28:10.103', '2026-06-05 09:28:10.105'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUxODAxLCJleHAiOjE3ODEyNTY2MDF9.kXXJTGViISlXR0qkRnDwpEvNxbfylEajkhfkG1knEDo', 1, '2026-06-12 09:30:01.271', '2026-06-05 09:30:01.272'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUxODEzLCJleHAiOjE3ODEyNTY2MTN9.8Wd5-BaSuAt45Cg-TYnkkC3Ne4Aer6oSuN3xgzUpu7M', 1, '2026-06-12 09:30:13.733', '2026-06-05 09:30:13.733'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUyMTMwLCJleHAiOjE3ODEyNTY5MzB9.21N8ayYCwEM0qjvnd6tbRFr3hLcVikrVGIKYo4-708U', 1, '2026-06-12 09:35:30.332', '2026-06-05 09:35:30.335'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUyMTU1LCJleHAiOjE3ODEyNTY5NTV9.vcsav_7oC0QVgdR4eNStJ0Y-6dFgVmNmuUt6AHXYT90', 1, '2026-06-12 09:35:55.501', '2026-06-05 09:35:55.502'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUyMjQxLCJleHAiOjE3ODEyNTcwNDF9.aD_Vz2CVApdImSnuP1hcySfhpGq78dWscjg9ReHfImA', 1, '2026-06-12 09:37:21.688', '2026-06-05 09:37:21.690'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUyMjcxLCJleHAiOjE3ODEyNTcwNzF9.NsHyoQXIZO7lA30W-Dy2ldnXRdnBeQdNKhYzjvP6n7k', 1, '2026-06-12 09:37:51.629', '2026-06-05 09:37:51.631'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUyMzExLCJleHAiOjE3ODEyNTcxMTF9.LJd_83bQ4bQQE7JgvLpIE1KC6Az68BhVXKgHpyCC-Tg', 1, '2026-06-12 09:38:31.459', '2026-06-05 09:38:31.460'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNjUzMTkzLCJleHAiOjE3ODEyNTc5OTN9.4RM4IqNLx0FUPZSmNyxBDvZ0WzxG4Ve3NSHJ0iruZEY', 9, '2026-06-12 09:53:13.354', '2026-06-05 09:53:13.359'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjUzNzIwLCJleHAiOjE3ODEyNTg1MjB9.Cx8ojZqfVRXkMehpOBqwvIDzJq3bcm8q9rhJljEfvZQ', 1, '2026-06-12 10:02:00.741', '2026-06-05 10:02:00.748'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjU0Nzg1LCJleHAiOjE3ODEyNTk1ODV9.oVtnuPsb5Xf48VNcAb4pVT5fb69GNvA3iWu1tlU4Y14', 1, '2026-06-12 10:19:45.618', '2026-06-05 10:19:45.623'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjU1MDU1LCJleHAiOjE3ODEyNTk4NTV9.rM0FsYmuJ9b109EektOSPjGzYiymv2ueGNuv62wQ4wY', 1, '2026-06-12 10:24:15.847', '2026-06-05 10:24:15.848'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU1MDU1LCJleHAiOjE3ODEyNTk4NTV9.wnIqIEnCqgu7f5Aw1W3YcDQfvUHEWDmxCMySRrT_qY8', 2, '2026-06-12 10:24:15.954', '2026-06-05 10:24:15.954'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU1MDU2LCJleHAiOjE3ODEyNTk4NTZ9.6ziTFvvTQZ9N7hqIzGLtrpR16gVgj0yx7xk1tTb9_tM', 3, '2026-06-12 10:24:16.040', '2026-06-05 10:24:16.040'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjU1MDU2LCJleHAiOjE3ODEyNTk4NTZ9.FkhY08txZ57BtazQ9e2OgFMoXU01Gj3XN0wkV42DWxM', 4, '2026-06-12 10:24:16.124', '2026-06-05 10:24:16.124'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzgwNjU1MDU2LCJleHAiOjE3ODEyNTk4NTZ9.Qf5prNFYWTGxB8K7PHuZ86TMl_pT-5wN1ZkqqtVBXTk', 5, '2026-06-12 10:24:16.207', '2026-06-05 10:24:16.208'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU1MDU2LCJleHAiOjE3ODEyNTk4NTZ9.JltxZUFpTqZ5CKgf2D8N_NIawBNf28fLe24K_8x5P7E', 6, '2026-06-12 10:24:16.284', '2026-06-05 10:24:16.285'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzgwNjU1MDU2LCJleHAiOjE3ODEyNTk4NTZ9.FoaaPYz10prcZ40_DFcNmJMe0N3Xv8AqjZImsE8E9Ys', 7, '2026-06-12 10:24:16.365', '2026-06-05 10:24:16.365'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzgwNjU1MDU2LCJleHAiOjE3ODEyNTk4NTZ9.wDuyC0Kui-uLqFZGZ2vuYI5ebk1HnTSjPhG8umkbJ6Q', 8, '2026-06-12 10:24:16.443', '2026-06-05 10:24:16.444'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNjU1MDU2LCJleHAiOjE3ODEyNTk4NTZ9.XrePwnkUIQXX7nwduDQm8QG3mscHsfHuXmKwlcOjxbo', 9, '2026-06-12 10:24:16.527', '2026-06-05 10:24:16.527'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjU1MDgwLCJleHAiOjE3ODEyNTk4ODB9.-Zh_3mmCronqAfvUDVMhj_M98CxnZFl3ArZEUcA4uJU', 1, '2026-06-12 10:24:40.601', '2026-06-05 10:24:40.603'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU1MDgwLCJleHAiOjE3ODEyNTk4ODB9.9MSGcZBBUpje8ycK1B-QdTS3vV1GmQ_D-FRyjp3uaE8', 2, '2026-06-12 10:24:40.718', '2026-06-05 10:24:40.719'),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU1MDgwLCJleHAiOjE3ODEyNTk4ODB9.iNAiQNIdcrJ-7PmCqE9-5kgXlkkO0TVOx1OS9_11rdI', 3, '2026-06-12 10:24:40.803', '2026-06-05 10:24:40.805'),
(30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjU1MDgwLCJleHAiOjE3ODEyNTk4ODB9.zU1FnMdaJQrZ0dFqoeN15SYFYWuOhCl3FQ2pvOsYWBQ', 4, '2026-06-12 10:24:40.882', '2026-06-05 10:24:40.884'),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzgwNjU1MDgwLCJleHAiOjE3ODEyNTk4ODB9.mPbyBMGgpr6kQwvRIOLv-FrEgvqjYuJF84Jt9azeZRg', 5, '2026-06-12 10:24:40.960', '2026-06-05 10:24:40.961'),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU1MDgxLCJleHAiOjE3ODEyNTk4ODF9.TV68F6INe63yqFAGIX1Mie8HidKnx5joFsLxC_3qeYU', 6, '2026-06-12 10:24:41.046', '2026-06-05 10:24:41.047'),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzgwNjU1MDgxLCJleHAiOjE3ODEyNTk4ODF9.UIt5-jtWb2EhI-IS5uMjJpoh-H-yxxXCjc3mgWODbT4', 7, '2026-06-12 10:24:41.127', '2026-06-05 10:24:41.128'),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzgwNjU1MDgxLCJleHAiOjE3ODEyNTk4ODF9.WZ7cmPeli8CztPxLAcgjynHtsIRHyJ9zt7yJq6zBv90', 8, '2026-06-12 10:24:41.206', '2026-06-05 10:24:41.207'),
(35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNjU1MDgxLCJleHAiOjE3ODEyNTk4ODF9.1HMoPKWRItlmAHnhOs3kehD08jxTkKA_YDf1j6sjYK4', 9, '2026-06-12 10:24:41.287', '2026-06-05 10:24:41.289'),
(36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjU1MTIxLCJleHAiOjE3ODEyNTk5MjF9.UMO5tZqZ5Ye7VxwtPWPSLvQGiLcG-xapcodoZluP-zk', 1, '2026-06-12 10:25:21.758', '2026-06-05 10:25:21.760'),
(37, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU1MTIxLCJleHAiOjE3ODEyNTk5MjF9.I5xZVHJQ74p-ZxP5JAxA2tS4vL2TwQA9YwQeig_hls4', 2, '2026-06-12 10:25:21.882', '2026-06-05 10:25:21.884'),
(38, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU1MTIxLCJleHAiOjE3ODEyNTk5MjF9.jX_vPIVGGiVVuoYf_8BL6eXQotw4gWFByos5Xx9mKWU', 3, '2026-06-12 10:25:21.975', '2026-06-05 10:25:21.976'),
(39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjU1MTIyLCJleHAiOjE3ODEyNTk5MjJ9.D8XbigjjIzVhN0qSAWtmLFCPDMA1crVO0XhVCJMf8xs', 4, '2026-06-12 10:25:22.064', '2026-06-05 10:25:22.066'),
(40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzgwNjU1MTIyLCJleHAiOjE3ODEyNTk5MjJ9.MCpFQKurZaGi3nzwWbdFmWHJai8XZC9qaB36yoVBbl8', 5, '2026-06-12 10:25:22.149', '2026-06-05 10:25:22.150'),
(41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU1MTIyLCJleHAiOjE3ODEyNTk5MjJ9.c3bsH2a0MoAlhI2K5eMKqmfIv7K6mxaDcIn4AfJRVEU', 6, '2026-06-12 10:25:22.233', '2026-06-05 10:25:22.234'),
(42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzgwNjU1MTIyLCJleHAiOjE3ODEyNTk5MjJ9.h1vhbDr1I_14uHQKsHN2n8g4VVPptMjXALBnLV5J9ic', 7, '2026-06-12 10:25:22.320', '2026-06-05 10:25:22.321'),
(43, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzgwNjU1MTIyLCJleHAiOjE3ODEyNTk5MjJ9.R6ofXk9FKfYs88bhCID0tZ3So-z0OSFgszJqrQzvQCE', 8, '2026-06-12 10:25:22.402', '2026-06-05 10:25:22.403'),
(44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNjU1MTIyLCJleHAiOjE3ODEyNTk5MjJ9.NfFCVRNNsZp5UyAdGh_f0FF0MhI3Ij5E6G5c3iuTlGU', 9, '2026-06-12 10:25:22.487', '2026-06-05 10:25:22.488'),
(45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjU1MTU1LCJleHAiOjE3ODEyNTk5NTV9.pzrjJ8Ld5mGs1xTnx7mOJDQ79JRQeEiBx8o8SJYsFNA', 1, '2026-06-12 10:25:55.735', '2026-06-05 10:25:55.737'),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU1MTU1LCJleHAiOjE3ODEyNTk5NTV9.56V8EtLfTNBT4mjB6uRSRbp2knKuYaQqlmJk2uFiYeI', 2, '2026-06-12 10:25:55.874', '2026-06-05 10:25:55.876'),
(47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU1MTU1LCJleHAiOjE3ODEyNTk5NTV9.3lRFWOo8FnVPl8vysO4Mml0znOatwILb-o11YtWmFiE', 3, '2026-06-12 10:25:55.987', '2026-06-05 10:25:55.989'),
(48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjU1MTU2LCJleHAiOjE3ODEyNTk5NTZ9.q-i68uT_YHKXTNrNSWA2uO_1PLAOdQS3qY0BD5CA9OQ', 4, '2026-06-12 10:25:56.106', '2026-06-05 10:25:56.108'),
(49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzgwNjU1MTU2LCJleHAiOjE3ODEyNTk5NTZ9.RAKXYBAxLgjSjwocJJK0CLGe_d379ZOSIRg_dx5cogI', 5, '2026-06-12 10:25:56.212', '2026-06-05 10:25:56.214'),
(50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU1MTU2LCJleHAiOjE3ODEyNTk5NTZ9.ai-Wtg49urNWAOKV4UiIQC98Tz9DsFGvpvb5UFOCeng', 6, '2026-06-12 10:25:56.315', '2026-06-05 10:25:56.317'),
(51, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzgwNjU1MTU2LCJleHAiOjE3ODEyNTk5NTZ9.agyzCd5-8JgZdqSMBx5cAU4c0xJUqaCgkT13Q4DG1ng', 7, '2026-06-12 10:25:56.425', '2026-06-05 10:25:56.426'),
(52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzgwNjU1MTU2LCJleHAiOjE3ODEyNTk5NTZ9.VEORDs87n_omA2UhkGH0FXUcCzskK5otp4A0QvfBIJw', 8, '2026-06-12 10:25:56.533', '2026-06-05 10:25:56.535'),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNjU1MTU2LCJleHAiOjE3ODEyNTk5NTZ9.25C5rqaOjnqUu6LSQeEwojgYj6nvF7qy505FcodKitM', 9, '2026-06-12 10:25:56.638', '2026-06-05 10:25:56.640'),
(54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjU1MTk1LCJleHAiOjE3ODEyNTk5OTV9.BSaRgUDpnjv8ld-DYYBjZOrgRrHQKr5VInMXiCFXrfE', 1, '2026-06-12 10:26:35.609', '2026-06-05 10:26:35.610'),
(55, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU1MTk1LCJleHAiOjE3ODEyNTk5OTV9.q0r47Sd_hza7V3W_UR75l2TY_5b0gEdwfMZ3V8qIGq8', 2, '2026-06-12 10:26:35.714', '2026-06-05 10:26:35.715'),
(56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU1MTk1LCJleHAiOjE3ODEyNTk5OTV9.dme5kUi55MKWBLALDoz3JTLo-rgcLvXToLiClk9hXDo', 3, '2026-06-12 10:26:35.798', '2026-06-05 10:26:35.799'),
(57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjU1MTk1LCJleHAiOjE3ODEyNTk5OTV9.XAeTXBCsAnBGhkrdHbd3Vlfio8wa3mvZduSxobtPYHg', 4, '2026-06-12 10:26:35.881', '2026-06-05 10:26:35.882'),
(58, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzgwNjU1MTk1LCJleHAiOjE3ODEyNTk5OTV9.6ULkMwFXV8iYThmFOKXj2vw5ejgpGY1cJWzYP23N2Wo', 5, '2026-06-12 10:26:35.962', '2026-06-05 10:26:35.963'),
(59, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU1MTk2LCJleHAiOjE3ODEyNTk5OTZ9.QtVJDCYiu73B95ImedeQ6ZNcPnMZE--z4gbIYM3Fj4M', 6, '2026-06-12 10:26:36.046', '2026-06-05 10:26:36.047'),
(60, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzgwNjU1MTk2LCJleHAiOjE3ODEyNTk5OTZ9.SnrJDK0d62fz8sHUre-T8LIJyLnf0UAHh1FIkJsvTW8', 7, '2026-06-12 10:26:36.124', '2026-06-05 10:26:36.125'),
(61, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzgwNjU1MTk2LCJleHAiOjE3ODEyNTk5OTZ9.KGo9_pr-YocjryAGPyZ2Izahlsx-kP2dwYrGzgVDsTU', 8, '2026-06-12 10:26:36.201', '2026-06-05 10:26:36.202'),
(62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNjU1MTk2LCJleHAiOjE3ODEyNTk5OTZ9.gLE0Jo4U-BXqItgRwOUKe0ZY2bjbx2BkPJMDkpPOQwY', 9, '2026-06-12 10:26:36.279', '2026-06-05 10:26:36.280'),
(63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU1MjU0LCJleHAiOjE3ODEyNjAwNTR9.o3cRcwiXgbN9LpWU4ofzUDz3uuHi4rfn5UUw-i5kFAo', 2, '2026-06-12 10:27:34.025', '2026-06-05 10:27:34.026'),
(64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjU1ODkxLCJleHAiOjE3ODEyNjA2OTF9.D2a3bfLow4xQOoLSYrlgh2UrW5I0RbUILoeUjTHNBJw', 4, '2026-06-12 10:38:11.851', '2026-06-05 10:38:11.855'),
(65, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU1ODk2LCJleHAiOjE3ODEyNjA2OTZ9.5RAYiCwcQUpLs4C-yMskRnwsyiSG868irjyhBKUNbSw', 3, '2026-06-12 10:38:16.377', '2026-06-05 10:38:16.378'),
(66, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzgwNjU1OTAzLCJleHAiOjE3ODEyNjA3MDN9.RFfLQZ9A5wE2XGwqYE4Uxnug4FedtLGnowwLjcdaXMM', 5, '2026-06-12 10:38:23.391', '2026-06-05 10:38:23.392'),
(67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU1OTA4LCJleHAiOjE3ODEyNjA3MDh9.xirujuOrQDLwHmXXtwlvVVxdWCzzGqRrk0f3kB2812Y', 6, '2026-06-12 10:38:28.865', '2026-06-05 10:38:28.866'),
(68, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzgwNjU1OTE1LCJleHAiOjE3ODEyNjA3MTV9.fngPHEkjU-sBa4TtYCD1zJSLOcAttIhxB8gK-4qn4JU', 7, '2026-06-12 10:38:35.724', '2026-06-05 10:38:35.725'),
(69, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzgwNjU1OTIyLCJleHAiOjE3ODEyNjA3MjJ9.Na3d-2RsOMO0glWqaatLNTQP4sVaCSmcde5Yoqbqalg', 8, '2026-06-12 10:38:42.592', '2026-06-05 10:38:42.593'),
(70, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNjU1OTI2LCJleHAiOjE3ODEyNjA3MjZ9.QJJQsBG7Nnn4kF6sAFqK2pQg-hutQtAydbnJj8MllpM', 9, '2026-06-12 10:38:46.814', '2026-06-05 10:38:46.815'),
(71, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU2OTU3LCJleHAiOjE3ODEyNjE3NTd9.PCCGCta7RH3LThvZk4uKeNMQdpVFykW3Ayu6WyrxSzA', 3, '2026-06-12 10:55:57.002', '2026-06-05 10:55:57.004'),
(72, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU2OTU3LCJleHAiOjE3ODEyNjE3NTd9.qwykEGtefj7Nk1SkgKa8Faj3g6kY23FSIcgHAF2CaDQ', 6, '2026-06-12 10:55:57.355', '2026-06-05 10:55:57.356'),
(73, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU3NjQ3LCJleHAiOjE3ODEyNjI0NDd9.wzM_Ckv3kdPDN3PoysujVtmcOOSbtPjnMj-2JqioRSY', 3, '2026-06-12 11:07:27.643', '2026-06-05 11:07:27.645'),
(74, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU3NjQ3LCJleHAiOjE3ODEyNjI0NDd9.3-DshOPBBJnWIes6NdcWvRz4m6nU1UiS72lZTvsallY', 6, '2026-06-12 11:07:27.798', '2026-06-05 11:07:27.799'),
(75, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjU3NjQ3LCJleHAiOjE3ODEyNjI0NDd9.75HFJOyenF5C4jqYpwGgq5gDDNl5nMYrv0w-YEBz_AY', 4, '2026-06-12 11:07:27.905', '2026-06-05 11:07:27.906'),
(76, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU3Njg0LCJleHAiOjE3ODEyNjI0ODR9.tmLXmOaZP4VSBXKB1UwSl6co9E6YI_jLkljs3ve0qnA', 3, '2026-06-12 11:08:04.269', '2026-06-05 11:08:04.270'),
(77, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU3Njg0LCJleHAiOjE3ODEyNjI0ODR9.rCZ6cPgpMHDK65Lwr0KFBooaWg96HD438uc484EgJ20', 6, '2026-06-12 11:08:04.416', '2026-06-05 11:08:04.417'),
(78, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjU3Njg0LCJleHAiOjE3ODEyNjI0ODR9.Oaf2Wo0gfleGWU05bcbCzdFdDZwDOSCnf5rSO6aUra4', 4, '2026-06-12 11:08:04.529', '2026-06-05 11:08:04.530'),
(79, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU4Mjk5LCJleHAiOjE3ODEyNjMwOTl9.PYlKMHS0HR5GH7eli98uQscloKYJGUG5qDYce0dIi5U', 3, '2026-06-12 11:18:19.570', '2026-06-05 11:18:19.573'),
(81, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjU4Mjk5LCJleHAiOjE3ODEyNjMwOTl9.lrVeB7ph8m4KotLIIU51kX-ki0tecrVJvjguqjrTaMI', 4, '2026-06-12 11:18:19.817', '2026-06-05 11:18:19.819'),
(83, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU4Mjk5LCJleHAiOjE3ODEyNjMwOTl9.cBznB-TFtJm3TGYHrtOViSYw54-el03Q6-EdMT9tWZ4', 6, '2026-06-12 11:18:19.978', '2026-06-05 11:18:19.980'),
(84, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjU4MzAwLCJleHAiOjE3ODEyNjMxMDB9.rn2rL6VvLQWVqUN7ydNfQonAMxGthEaRcQg8g9zYTz0', 6, '2026-06-12 11:18:20.105', '2026-06-05 11:18:20.107'),
(87, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzgwNjU4MzAwLCJleHAiOjE3ODEyNjMxMDB9.BWyUYEEobiqOAwSwZyzlaKsAwEc7bQy24hshSgShz78', 5, '2026-06-12 11:18:20.358', '2026-06-05 11:18:20.360'),
(89, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjU4MzAwLCJleHAiOjE3ODEyNjMxMDB9.oGq4vLmApAVE0UTfX7ojGKmpR2T20ydoZui9CnLx7bc', 3, '2026-06-12 11:18:20.610', '2026-06-05 11:18:20.612'),
(91, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU4ODMxLCJleHAiOjE3ODEyNjM2MzF9.Axr1tVAov2vnPo9EhKbCDbHgCtsryHR2bnrG4K-3cOY', 2, '2026-06-12 11:27:11.088', '2026-06-05 11:27:11.090'),
(92, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU5MTQyLCJleHAiOjE3ODEyNjM5NDJ9.pOWrh4QGfOI2wDAuPCEt9tAF_r3UjHdVQeH3ZKhdgAw', 2, '2026-06-12 11:32:22.604', '2026-06-05 11:32:22.606'),
(93, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU5NjAzLCJleHAiOjE3ODEyNjQ0MDN9.X9M6it0a443Zoa7V5sNyYtRP9KO_0XljY9iKjf1rlOU', 2, '2026-06-12 11:40:03.690', '2026-06-05 11:40:03.692'),
(94, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjU5NzIzLCJleHAiOjE3ODEyNjQ1MjN9.s6nrKYCS38KkFd67W4AJmU9-uDrL0HgmWshxpdU-_rY', 2, '2026-06-12 11:42:03.640', '2026-06-05 11:42:03.644'),
(95, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYwNTgzLCJleHAiOjE3ODEyNjUzODN9.S4FlvNNyJ9WYlWWFP_Ez734hh6eftmji13eVO0D_Hcc', 2, '2026-06-12 11:56:23.797', '2026-06-05 11:56:23.800'),
(96, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjYxNjQ2LCJleHAiOjE3ODEyNjY0NDZ9.-H0q5vFC0zA98RDX6k2b3yX9l2NQZAdIqEVsPsiMIi8', 1, '2026-06-12 12:14:06.906', '2026-06-05 12:14:06.909'),
(97, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjYxNjU3LCJleHAiOjE3ODEyNjY0NTd9.AcrHvLcw3N-50shXRCGtxgttT9waR8tSvpKiyVkVa1c', 4, '2026-06-12 12:14:17.254', '2026-06-05 12:14:17.256'),
(98, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYxOTYzLCJleHAiOjE3ODEyNjY3NjN9.JDKnLtY_eQRqo7iivJd23VfDNi21j0jlW0rYTxr7pHQ', 2, '2026-06-12 12:19:23.317', '2026-06-05 12:19:23.326'),
(99, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYyNDE4LCJleHAiOjE3ODEyNjcyMTh9.oQaOxb8aGjVUhLch5K8y-EdjfFIYR1TZ3WdRoE9_B3E', 2, '2026-06-12 12:26:58.085', '2026-06-05 12:26:58.091'),
(100, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYyODIxLCJleHAiOjE3ODEyNjc2MjF9.JOfzCrvyVXEeNQmf3gjCz4hogXEHSzolixZyqG8fBhc', 2, '2026-06-12 12:33:41.135', '2026-06-05 12:33:41.143'),
(101, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYzMDQyLCJleHAiOjE3ODEyNjc4NDJ9.HHDyCh2moumKEVqTbm1fQJgclz-W5IPWZtFzHpHG8bQ', 2, '2026-06-12 12:37:22.059', '2026-06-05 12:37:22.062'),
(103, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYzMDY5LCJleHAiOjE3ODEyNjc4Njl9.EXPnVcSPaX8LwgvFoJ0S6EHuxEzVaIqC2rhdrQGYQiE', 2, '2026-06-12 12:37:49.633', '2026-06-05 12:37:49.635'),
(104, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYzMTExLCJleHAiOjE3ODEyNjc5MTF9.zhvCZhaKn-8JkzwbHr_etLytc_x_UMblpic7PJfZotI', 2, '2026-06-12 12:38:31.013', '2026-06-05 12:38:31.015'),
(105, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYzMTMzLCJleHAiOjE3ODEyNjc5MzN9.9gH-E22lsQ0OAtmbbA6uBWJueUMsiil0DCLFNc14kLc', 2, '2026-06-12 12:38:53.137', '2026-06-05 12:38:53.139'),
(106, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYzMTUxLCJleHAiOjE3ODEyNjc5NTF9.UjhWhXyc_h7al_F2fnffmxOGPRcx9Iy14q2Hm3nwSR8', 2, '2026-06-12 12:39:11.288', '2026-06-05 12:39:11.289'),
(108, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYzMTgxLCJleHAiOjE3ODEyNjc5ODF9.ROVMlcudnJrOAgeuLXVTEWhfWTJQByaGAs00EQhbrvk', 2, '2026-06-12 12:39:41.300', '2026-06-05 12:39:41.301'),
(110, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYzMjI5LCJleHAiOjE3ODEyNjgwMjl9.oC4N8dZXIz-g3219KDZYTodnYjTmbbm3YfcSOeVDHhI', 2, '2026-06-12 12:40:29.542', '2026-06-05 12:40:29.544'),
(112, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYzNTc2LCJleHAiOjE3ODEyNjgzNzZ9.iEnf_PhQ7FvRP-zLBvB8iOrwkNNQzqeCV_BidVPUlds', 2, '2026-06-12 12:46:16.846', '2026-06-05 12:46:16.850'),
(113, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjYzOTI1LCJleHAiOjE3ODEyNjg3MjV9.Zyvld6d0TDOMxWhHGUa9olofM_Dkt5W5Xfb8O0EMC-o', 2, '2026-06-12 12:52:05.251', '2026-06-05 12:52:05.255'),
(114, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY0NjkzLCJleHAiOjE3ODEyNjk0OTN9.4sJT19HGYufoa9J928RoRlcwIrFPyG15p8HVRdGQfkw', 2, '2026-06-12 13:04:53.286', '2026-06-05 13:04:53.290'),
(115, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY0OTY4LCJleHAiOjE3ODEyNjk3Njh9.IPKgYsL02MXJ5YpvPZP835XT1LUYMn6vru_wylDy8OE', 2, '2026-06-12 13:09:28.103', '2026-06-05 13:09:28.107'),
(116, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY0OTg4LCJleHAiOjE3ODEyNjk3ODh9.ctkSdSofOpVoNQJnlLzVxmhRyNOd7XXQUBVMcTOz3KQ', 2, '2026-06-12 13:09:48.259', '2026-06-05 13:09:48.260'),
(117, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MDI0LCJleHAiOjE3ODEyNjk4MjR9.lX3qftG_tWz4mk8YhSjRJWZlmqJr5TBAQ06Y_QaQ07w', 2, '2026-06-12 13:10:24.418', '2026-06-05 13:10:24.420'),
(118, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MDU2LCJleHAiOjE3ODEyNjk4NTZ9.pM1VL0kR03Knf0SswdtzeVNLyTHYsqR83InrroCB2NQ', 2, '2026-06-12 13:10:56.232', '2026-06-05 13:10:56.234'),
(119, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MDc3LCJleHAiOjE3ODEyNjk4Nzd9.DwA1HXyVXEEAPvVV8oeRLLlbs-7E5N3fFZWi0KPL2Lk', 2, '2026-06-12 13:11:17.147', '2026-06-05 13:11:17.149'),
(120, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MDk3LCJleHAiOjE3ODEyNjk4OTd9.aYdbY3GWwko5B4VqeM1c63_Um3W5LOEYIzNVdBguf8A', 2, '2026-06-12 13:11:37.095', '2026-06-05 13:11:37.097'),
(121, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MTE2LCJleHAiOjE3ODEyNjk5MTZ9.MEqaM6yrqUwyWfG5CIFoGrN8c2R9UJG9cj5l7MKK7lc', 2, '2026-06-12 13:11:56.475', '2026-06-05 13:11:56.478'),
(122, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MTUxLCJleHAiOjE3ODEyNjk5NTF9.c-H-LqncfzndrVbPjY4-hNxik2J0z6zFdCebcnC4bzI', 2, '2026-06-12 13:12:31.232', '2026-06-05 13:12:31.234'),
(123, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MjA0LCJleHAiOjE3ODEyNzAwMDR9.LvTiXMiCZZeqZnZn9rKm4Fzl-4Vw1ifv3Ryrm8NhGtk', 2, '2026-06-12 13:13:24.455', '2026-06-05 13:13:24.456'),
(124, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MjIyLCJleHAiOjE3ODEyNzAwMjJ9.Az-lltiPXRCwAp72eXo1WqL_8bNHDMH5bnitZTtWe0s', 2, '2026-06-12 13:13:42.043', '2026-06-05 13:13:42.045'),
(125, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MjQxLCJleHAiOjE3ODEyNzAwNDF9.6u3_NujSfHZr07ziWcRyQufKgDU9-9tloQJkuobmoSQ', 2, '2026-06-12 13:14:01.607', '2026-06-05 13:14:01.609'),
(126, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1MjU5LCJleHAiOjE3ODEyNzAwNTl9.CwmxINwInmcZTkgZqMo0fahWqAsGhJ-sTzag13QUcTE', 2, '2026-06-12 13:14:19.388', '2026-06-05 13:14:19.390'),
(127, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1Mjc3LCJleHAiOjE3ODEyNzAwNzd9.ZtaXNFSpuqa1HBph7ZpGjpl7n8AHmd7I7Dk0rc8-NGY', 2, '2026-06-12 13:14:37.135', '2026-06-05 13:14:37.136'),
(128, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjY1Mjk4LCJleHAiOjE3ODEyNzAwOTh9.oCwldQIBn0rPkxMUA4fpRoVJogdUYJrgDJ0P2fdTuL8', 2, '2026-06-12 13:14:58.046', '2026-06-05 13:14:58.048'),
(129, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjgwMTgzLCJleHAiOjE3ODEyODQ5ODN9.6DVwvzN0baNUCLJVYvOr6yqoL7x6oTzwBWfzuF8PWuM', 1, '2026-06-12 17:23:03.453', '2026-06-05 17:23:03.457'),
(130, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNjgwNDEyLCJleHAiOjE3ODEyODUyMTJ9.RLZRcEUvry23gs5EJDY2-QIYM0lDz2ZsqOmcm2_rIcg', 9, '2026-06-12 17:26:52.539', '2026-06-05 17:26:52.541'),
(131, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjgwNDE5LCJleHAiOjE3ODEyODUyMTl9.9L8GLsywYVzsVDLtHie_Lb79inm4qIdv1-eBtnwykl0', 2, '2026-06-12 17:26:59.552', '2026-06-05 17:26:59.555'),
(132, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjgwODA1LCJleHAiOjE3ODEyODU2MDV9.TwUjTjJVOYARVU34TSSkpwJLsfsbh056q9MErdurxWU', 1, '2026-06-12 17:33:25.345', '2026-06-05 17:33:25.354'),
(133, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNjgwODg5LCJleHAiOjE3ODEyODU2ODl9.iKFWs5iBPAYXxdvVqVmMym7BRJSJMBa25dbgd-K6t6Y', 2, '2026-06-12 17:34:49.423', '2026-06-05 17:34:49.425'),
(134, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNjgxMDQxLCJleHAiOjE3ODEyODU4NDF9.8WtZGfLIA3aPPDDIkIBCP4OD510Zb0SCx85hbOHakzk', 4, '2026-06-12 17:37:21.164', '2026-06-05 17:37:21.171'),
(135, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzgwNjgxMDU5LCJleHAiOjE3ODEyODU4NTl9.RAfDDTTu2ujE4gQRmEkRW0rT6TKmBvURlda8c60wM6A', 3, '2026-06-12 17:37:39.157', '2026-06-05 17:37:39.159'),
(136, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzgwNjgxMTcxLCJleHAiOjE3ODEyODU5NzF9.XLFXuBSdUP8i_-A_xfiHM_nDty_A0ATA1GXK0a9g9rk', 5, '2026-06-12 17:39:31.038', '2026-06-05 17:39:31.045'),
(137, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzgwNjgxMTk5LCJleHAiOjE3ODEyODU5OTl9.X3-QyKi7fo7f3G2AoFhb1H08_s1xn2llTDFzEPmaBDk', 6, '2026-06-12 17:39:59.772', '2026-06-05 17:39:59.774'),
(138, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzgwNjgxMjE4LCJleHAiOjE3ODEyODYwMTh9.JCAnhDpvKH1UI3C-SJZnxFkjSquDNG83zlvRZAd3kjg', 7, '2026-06-12 17:40:18.746', '2026-06-05 17:40:18.748'),
(139, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzgwNjgxMjQ1LCJleHAiOjE3ODEyODYwNDV9.vieGPmkQA8UxVUbD2pPBWmbOIErsGYyjHy-ENoP_0yw', 8, '2026-06-12 17:40:45.821', '2026-06-05 17:40:45.822'),
(140, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNjgxMzA0LCJleHAiOjE3ODEyODYxMDR9.7aASTGMPK6Zi7CWtsMefRPTCTQTbEv7jzhV5iQYuXn0', 9, '2026-06-12 17:41:44.022', '2026-06-05 17:41:44.024'),
(141, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNjgxMzU3LCJleHAiOjE3ODEyODYxNTd9.g9c81kMqSEkltpM3HHkAk4PvWUo9W7B6IUPt4zFFtww', 1, '2026-06-12 17:42:37.141', '2026-06-05 17:42:37.143'),
(142, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzIzMzQxLCJleHAiOjE3ODEzMjgxNDF9.wKVDEI7FW_NYcN1Ik0AAD4_mcAXN-hLfTolHHnL2fpM', 1, '2026-06-13 05:22:21.777', '2026-06-06 05:22:21.780'),
(143, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNzgwNzI0MjM4LCJleHAiOjE3ODEzMjkwMzh9.NitAkeHOsGO8gYswYavOwEHyy9AY4t2m3CtV7EIi5cc', 9, '2026-06-13 05:37:18.601', '2026-06-06 05:37:18.605'),
(144, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzgwNzI0MjQ3LCJleHAiOjE3ODEzMjkwNDd9.cV7MqOpM6DD_dGwrMnkqtKB2pulCojHoLnQ4HOWv070', 8, '2026-06-13 05:37:27.101', '2026-06-06 05:37:27.102'),
(145, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNzgwNzI0MjUzLCJleHAiOjE3ODEzMjkwNTN9.aRfY413KQIN_IUuSPx7SW1luReEGz98EVOXEKmC1Pjw', 4, '2026-06-13 05:37:33.486', '2026-06-06 05:37:33.488'),
(146, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzI0MjU4LCJleHAiOjE3ODEzMjkwNTh9.UBm7uhsS6ZeHn94UaEQl1nMwnSQo9hTg4pjEbYtU0OE', 1, '2026-06-13 05:37:38.241', '2026-06-06 05:37:38.242'),
(147, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzI1NDUyLCJleHAiOjE3ODEzMzAyNTJ9.tc5jydVNfaZAsQVyAtc-brz1wLg4qQJF2lDpyCdfisg', 1, '2026-06-13 05:57:32.430', '2026-06-06 05:57:32.433'),
(148, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzI2NDE2LCJleHAiOjE3ODEzMzEyMTZ9.8xv83XLxpO5eFXBeNCEOLTwu3t3w93QggAhPwMNF3-A', 1, '2026-06-13 06:13:36.421', '2026-06-06 06:13:36.426'),
(149, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNzI3MjY2LCJleHAiOjE3ODEzMzIwNjZ9.ZUByg_taYEQc9T8OSF03xATcnIXZCjtplojEACp6udk', 2, '2026-06-13 06:27:46.663', '2026-06-06 06:27:46.667'),
(150, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzI3MjkzLCJleHAiOjE3ODEzMzIwOTN9.cUYsKCR-f3LYBHbS6FtlIT7VEjucl6MwgO46CeG6qFg', 1, '2026-06-13 06:28:13.472', '2026-06-06 06:28:13.473'),
(151, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzI4MjcyLCJleHAiOjE3ODEzMzMwNzJ9.erBF8-XPavZXum3Poz2rgsfcz8tRwF-JG2eN0yGTzk8', 1, '2026-06-13 06:44:32.318', '2026-06-06 06:44:32.321'),
(152, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzI5Mzg2LCJleHAiOjE3ODEzMzQxODZ9.D2L1IK0_rpmVPQk2Dfd2BqH19Y72BwDJ2Po00ZxupAI', 1, '2026-06-13 07:03:06.477', '2026-06-06 07:03:06.481'),
(153, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNzMwNDM4LCJleHAiOjE3ODEzMzUyMzh9.cjD6aH9DHgMkc1lbp3CuiT9YClVPHnqgQpyV-KKCF0w', 2, '2026-06-13 07:20:38.698', '2026-06-06 07:20:38.706'),
(154, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzMwNTIzLCJleHAiOjE3ODEzMzUzMjN9.r3yKBjYPPHij2nGVeyMyEOse29Xv2m9giLLo8BTejFY', 1, '2026-06-13 07:22:03.637', '2026-06-06 07:22:03.638'),
(155, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzMxNDQ3LCJleHAiOjE3ODEzMzYyNDd9.d6o9zVCyUA29LVZ2f6CwNwG5Xw4IE8FzcBIiFh6jeTw', 1, '2026-06-13 07:37:27.879', '2026-06-06 07:37:27.888'),
(156, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzgwNzMxODgxLCJleHAiOjE3ODEzMzY2ODF9.CVVTz1fZ487xoXbrzIEX39i_pRJMDq0ajngljcuHS2I', 2, '2026-06-13 07:44:41.388', '2026-06-06 07:44:41.393'),
(157, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzgwNzM2Nzg4LCJleHAiOjE3ODEzNDE1ODh9.f6pSOh90cNNmsvmNt8IQ6U_pLt_tyBxBWmS6iWrPOi0', 1, '2026-06-13 09:06:28.334', '2026-06-06 09:06:28.338');

-- --------------------------------------------------------

--
-- Table structure for table `rfqs`
--

CREATE TABLE `rfqs` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `rfqNumber` varchar(191) NOT NULL,
  `purchaseRequestId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'sent',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rfqs`
--

INSERT INTO `rfqs` (`id`, `tenantId`, `rfqNumber`, `purchaseRequestId`, `vendorId`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'RFQ-2026-0001', 14, 2, 'received', '2026-06-05 13:14:19.591', '2026-06-05 13:14:19.693'),
(2, 1, 'RFQ-2026-0002', 15, 2, 'received', '2026-06-05 13:14:37.267', '2026-06-05 13:14:37.350'),
(3, 1, 'RFQ-2026-0003', 16, 2, 'received', '2026-06-05 13:14:58.205', '2026-06-05 13:14:58.291');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 'SUPER_ADMIN', 'SUPER_ADMIN Role', '2026-06-05 07:22:56.636', '2026-06-05 07:22:56.636'),
(2, 'ADMIN', 'ADMIN Role', '2026-06-05 07:22:56.762', '2026-06-05 07:22:56.762'),
(3, 'OPERATIONS', 'OPERATIONS Role', '2026-06-05 07:22:56.806', '2026-06-05 07:22:56.806'),
(4, 'PROCUREMENT', 'PROCUREMENT Role', '2026-06-05 07:22:56.827', '2026-06-05 07:22:56.827'),
(5, 'LOGISTICS', 'LOGISTICS Role', '2026-06-05 07:22:56.858', '2026-06-05 07:22:56.858'),
(6, 'INVENTORY', 'INVENTORY Role', '2026-06-05 07:22:56.873', '2026-06-05 07:22:56.873'),
(7, 'CONCIERGE', 'CONCIERGE Role', '2026-06-05 07:22:56.888', '2026-06-05 07:22:56.888'),
(8, 'BUSINESS_CLIENT', 'BUSINESS_CLIENT Role', '2026-06-05 07:22:56.904', '2026-06-05 07:22:56.904'),
(9, 'FIELD_STAFF', 'FIELD_STAFF Role', '2026-06-05 07:22:56.919', '2026-06-05 07:22:56.919'),
(10, 'TEST_ROLE', NULL, '2026-06-05 09:30:01.395', '2026-06-05 09:30:01.395');

-- --------------------------------------------------------

--
-- Table structure for table `role_menus`
--

CREATE TABLE `role_menus` (
  `id` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `can_view` tinyint(1) NOT NULL DEFAULT 0,
  `can_add` tinyint(1) NOT NULL DEFAULT 0,
  `can_edit` tinyint(1) NOT NULL DEFAULT 0,
  `can_delete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_menus`
--

INSERT INTO `role_menus` (`id`, `roleId`, `menuId`, `can_view`, `can_add`, `can_edit`, `can_delete`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1, 1),
(3, 1, 3, 1, 1, 1, 1),
(4, 1, 4, 1, 1, 1, 1),
(5, 1, 5, 1, 1, 1, 1),
(6, 1, 6, 1, 1, 1, 1),
(7, 1, 7, 1, 1, 1, 1),
(8, 1, 8, 1, 1, 1, 1),
(9, 1, 9, 1, 1, 1, 1),
(10, 1, 10, 1, 1, 1, 1),
(11, 1, 11, 1, 1, 1, 1),
(12, 1, 12, 1, 1, 1, 1),
(13, 1, 13, 1, 1, 1, 1),
(14, 1, 14, 1, 1, 1, 1),
(15, 1, 15, 1, 1, 1, 1),
(16, 1, 16, 1, 1, 1, 1),
(17, 1, 17, 1, 1, 1, 1),
(18, 1, 18, 1, 1, 1, 1),
(19, 1, 19, 1, 1, 1, 1),
(20, 1, 20, 1, 1, 1, 1),
(21, 1, 21, 1, 1, 1, 1),
(22, 1, 22, 1, 1, 1, 1),
(23, 1, 23, 1, 1, 1, 1),
(24, 1, 24, 1, 1, 1, 1),
(25, 1, 25, 1, 1, 1, 1),
(26, 1, 26, 1, 1, 1, 1),
(27, 1, 27, 1, 1, 1, 1),
(28, 1, 28, 1, 1, 1, 1),
(29, 1, 29, 1, 1, 1, 1),
(30, 1, 30, 1, 1, 1, 1),
(31, 1, 31, 1, 1, 1, 1),
(32, 1, 32, 1, 1, 1, 1),
(33, 1, 33, 1, 1, 1, 1),
(34, 1, 34, 1, 1, 1, 1),
(35, 1, 35, 1, 1, 1, 1),
(36, 1, 36, 1, 1, 1, 1),
(37, 1, 37, 1, 1, 1, 1),
(38, 1, 38, 1, 1, 1, 1),
(39, 1, 39, 1, 1, 1, 1),
(40, 1, 40, 1, 1, 1, 1),
(41, 2, 1, 1, 1, 1, 1),
(42, 2, 2, 1, 1, 1, 1),
(43, 2, 3, 1, 1, 1, 1),
(44, 2, 4, 1, 1, 1, 1),
(45, 2, 5, 1, 1, 1, 1),
(46, 2, 6, 1, 1, 1, 1),
(47, 2, 7, 1, 1, 1, 1),
(48, 2, 8, 1, 1, 1, 1),
(49, 2, 9, 1, 1, 1, 1),
(50, 2, 10, 1, 1, 1, 1),
(51, 2, 11, 1, 1, 1, 1),
(52, 2, 12, 1, 1, 1, 1),
(53, 2, 13, 1, 1, 1, 1),
(54, 2, 14, 1, 1, 1, 1),
(55, 2, 15, 1, 1, 1, 1),
(56, 2, 16, 1, 1, 1, 1),
(57, 2, 17, 1, 1, 1, 1),
(58, 2, 18, 1, 1, 1, 1),
(59, 2, 19, 1, 1, 1, 1),
(60, 2, 20, 1, 1, 1, 1),
(61, 2, 21, 1, 1, 1, 1),
(62, 2, 22, 1, 1, 1, 1),
(63, 2, 23, 1, 1, 1, 1),
(64, 2, 24, 1, 1, 1, 1),
(65, 2, 25, 1, 1, 1, 1),
(66, 2, 26, 1, 1, 1, 1),
(67, 2, 27, 1, 1, 1, 1),
(68, 2, 28, 1, 1, 1, 1),
(69, 2, 29, 1, 1, 1, 1),
(70, 2, 30, 1, 1, 1, 1),
(71, 2, 31, 1, 1, 1, 1),
(72, 2, 32, 1, 1, 1, 1),
(73, 2, 33, 1, 1, 1, 1),
(74, 2, 34, 1, 1, 1, 1),
(75, 2, 35, 1, 1, 1, 1),
(76, 2, 36, 1, 1, 1, 1),
(77, 2, 37, 1, 1, 1, 1),
(78, 2, 38, 1, 1, 1, 1),
(79, 2, 39, 1, 1, 1, 1),
(80, 2, 40, 1, 1, 1, 1),
(81, 3, 1, 1, 0, 0, 0),
(82, 3, 2, 1, 0, 0, 0),
(83, 3, 10, 1, 1, 1, 0),
(84, 3, 11, 1, 1, 1, 0),
(85, 3, 12, 1, 1, 1, 0),
(86, 3, 13, 1, 1, 1, 0),
(87, 3, 14, 1, 0, 0, 0),
(88, 3, 15, 1, 0, 0, 0),
(89, 3, 31, 1, 0, 0, 0),
(90, 3, 34, 1, 0, 0, 0),
(91, 3, 35, 1, 0, 0, 0),
(92, 4, 1, 1, 0, 0, 0),
(93, 4, 4, 1, 1, 1, 0),
(94, 4, 6, 1, 0, 0, 0),
(95, 4, 14, 1, 0, 0, 0),
(96, 4, 16, 1, 1, 1, 0),
(97, 4, 17, 1, 1, 1, 0),
(98, 4, 18, 1, 1, 1, 0),
(99, 4, 34, 1, 0, 0, 0),
(100, 4, 35, 1, 0, 0, 0),
(101, 5, 1, 1, 0, 0, 0),
(102, 5, 12, 1, 0, 1, 0),
(103, 5, 13, 1, 0, 1, 0),
(104, 5, 19, 1, 0, 1, 0),
(105, 5, 20, 1, 0, 1, 0),
(106, 5, 21, 1, 0, 1, 0),
(107, 5, 22, 1, 0, 1, 0),
(108, 5, 31, 1, 0, 0, 0),
(109, 5, 34, 1, 0, 0, 0),
(110, 5, 35, 1, 0, 0, 0),
(111, 6, 1, 1, 0, 0, 0),
(112, 6, 6, 1, 0, 0, 0),
(113, 6, 23, 1, 1, 1, 1),
(114, 6, 24, 1, 1, 1, 1),
(115, 6, 25, 1, 1, 1, 1),
(116, 6, 31, 1, 0, 0, 0),
(117, 6, 34, 1, 0, 0, 0),
(118, 6, 35, 1, 0, 0, 0),
(119, 7, 1, 1, 0, 0, 0),
(120, 7, 11, 1, 0, 0, 0),
(121, 7, 23, 1, 0, 0, 0),
(122, 7, 26, 1, 1, 1, 1),
(123, 7, 27, 1, 1, 1, 1),
(124, 7, 28, 1, 1, 1, 1),
(125, 7, 29, 1, 1, 1, 1),
(126, 7, 30, 1, 1, 1, 1),
(127, 7, 34, 1, 0, 0, 0),
(128, 7, 35, 1, 0, 0, 0),
(129, 8, 1, 1, 0, 0, 0),
(130, 8, 26, 0, 0, 0, 0),
(131, 8, 30, 0, 0, 0, 0),
(132, 8, 37, 0, 0, 0, 0),
(133, 8, 38, 1, 0, 0, 0),
(134, 8, 39, 1, 1, 0, 0),
(135, 9, 31, 1, 0, 0, 0),
(136, 9, 32, 1, 0, 1, 0),
(137, 9, 33, 1, 0, 1, 0),
(138, 9, 34, 0, 0, 0, 0),
(139, 9, 35, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `group` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `movementType` varchar(191) NOT NULL,
  `quantity` double NOT NULL,
  `referenceType` varchar(191) NOT NULL,
  `referenceId` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `planId` int(11) NOT NULL,
  `startDate` datetime(3) NOT NULL,
  `endDate` datetime(3) NOT NULL,
  `status` varchar(191) NOT NULL,
  `paymentStatus` varchar(191) NOT NULL,
  `autoRenew` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(11) NOT NULL,
  `organizationId` int(11) NOT NULL,
  `subscriptionId` int(11) DEFAULT NULL,
  `tenantCode` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `organizationId`, `subscriptionId`, `tenantCode`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, NULL, 'TEST-TN-1780659706407', 'active', '2026-06-05 11:41:46.408', '2026-06-05 11:41:46.408');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `tenantId` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `roleId` int(11) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `vacationBalance` int(11) NOT NULL DEFAULT 0,
  `lastLogin` datetime(3) DEFAULT NULL,
  `resetToken` varchar(191) DEFAULT NULL,
  `resetTokenExpiry` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `deletedAt` datetime(3) DEFAULT NULL,
  `bankingInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bankingInfo`)),
  `birthday` datetime(3) DEFAULT NULL,
  `employmentStatus` varchar(191) DEFAULT NULL,
  `hasLicense` tinyint(1) NOT NULL DEFAULT 0,
  `hasNIB` tinyint(1) NOT NULL DEFAULT 0,
  `hasPassport` tinyint(1) NOT NULL DEFAULT 0,
  `hasResume` tinyint(1) NOT NULL DEFAULT 0,
  `nibNumber` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `tenantId`, `name`, `email`, `phone`, `password`, `roleId`, `avatar`, `status`, `vacationBalance`, `lastLogin`, `resetToken`, `resetTokenExpiry`, `createdAt`, `updatedAt`, `deletedAt`, `bankingInfo`, `birthday`, `employmentStatus`, `hasLicense`, `hasNIB`, `hasPassport`, `hasResume`, `nibNumber`) VALUES
(1, '365d799c-63d4-4c0a-b839-d9aa965b9e8e', NULL, 'SUPER_ADMIN User', 'superadmin@zanezion.com', NULL, '$2b$10$jAfdMWP4paEcgH1gU8xgZO.FmPzUK90YLD5ApgwiVSycPuTYhTcPm', 1, NULL, 'active', 0, NULL, NULL, NULL, '2026-06-05 07:22:56.718', '2026-06-05 17:20:51.142', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(2, 'ba55de57-dbf9-417d-bdce-78c2d359b352', 1, 'ADMIN User', 'admin@zanezion.com', NULL, '$2b$10$jAfdMWP4paEcgH1gU8xgZO.FmPzUK90YLD5ApgwiVSycPuTYhTcPm', 2, NULL, 'active', 0, NULL, NULL, NULL, '2026-06-05 07:22:56.788', '2026-06-05 17:20:51.157', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(3, '476e2772-3596-4f87-974f-2c0bfa55c3be', NULL, 'OPERATIONS User', 'operations@zanezion.com', NULL, '$2b$10$jAfdMWP4paEcgH1gU8xgZO.FmPzUK90YLD5ApgwiVSycPuTYhTcPm', 3, NULL, 'active', 0, NULL, NULL, NULL, '2026-06-05 07:22:56.817', '2026-06-05 17:20:51.166', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(4, 'bbf01e92-06af-4078-a5b2-3ac2070c2e9f', NULL, 'PROCUREMENT User', 'procurement@zanezion.com', NULL, '$2b$10$jAfdMWP4paEcgH1gU8xgZO.FmPzUK90YLD5ApgwiVSycPuTYhTcPm', 4, NULL, 'active', 0, NULL, NULL, NULL, '2026-06-05 07:22:56.841', '2026-06-05 17:20:51.178', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(5, '322bc7f7-5506-4b9b-9d48-4d69f70f5d8b', NULL, 'LOGISTICS User', 'logistics@zanezion.com', NULL, '$2b$10$jAfdMWP4paEcgH1gU8xgZO.FmPzUK90YLD5ApgwiVSycPuTYhTcPm', 5, NULL, 'active', 0, NULL, NULL, NULL, '2026-06-05 07:22:56.865', '2026-06-05 17:20:51.188', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(6, 'deff0c08-4ca9-45ed-9244-16ec36f5f457', NULL, 'INVENTORY User', 'inventory@zanezion.com', NULL, '$2b$10$jAfdMWP4paEcgH1gU8xgZO.FmPzUK90YLD5ApgwiVSycPuTYhTcPm', 6, NULL, 'active', 0, NULL, NULL, NULL, '2026-06-05 07:22:56.881', '2026-06-05 17:20:51.197', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(7, '9d712391-f124-404b-8155-016171757704', NULL, 'CONCIERGE User', 'concierge@zanezion.com', NULL, '$2b$10$jAfdMWP4paEcgH1gU8xgZO.FmPzUK90YLD5ApgwiVSycPuTYhTcPm', 7, NULL, 'active', 0, NULL, NULL, NULL, '2026-06-05 07:22:56.896', '2026-06-05 17:20:51.206', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(8, '20db9f5e-a553-4250-bf02-39fbfd3c440e', NULL, 'BUSINESS_CLIENT User', 'businessclient@zanezion.com', NULL, '$2b$10$jAfdMWP4paEcgH1gU8xgZO.FmPzUK90YLD5ApgwiVSycPuTYhTcPm', 8, NULL, 'active', 0, NULL, NULL, NULL, '2026-06-05 07:22:56.911', '2026-06-05 17:20:51.217', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(9, 'ada337d8-ad55-4cff-baaa-7a997f153022', NULL, 'FIELD_STAFF User', 'fieldstaff@zanezion.com', NULL, '$2b$10$jAfdMWP4paEcgH1gU8xgZO.FmPzUK90YLD5ApgwiVSycPuTYhTcPm', 9, NULL, 'active', 0, NULL, NULL, NULL, '2026-06-05 07:22:56.927', '2026-06-05 17:20:51.229', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(10, '9f9860f4-af17-4501-94b8-8fcb0e68f1b4', 1, 'qdw', 'asdfg@gmail.com', '1234566789', '$2b$10$JKCfJbq98d.bTnQPVDXRRuKOt0wZD1kz/lcKrINns1oSczLlqSQPG', 2, NULL, 'Active', 11, NULL, NULL, NULL, '2026-06-06 06:32:33.519', '2026-06-06 06:32:33.519', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `vendorCode` varchar(191) NOT NULL,
  `companyName` varchar(191) NOT NULL,
  `contactPerson` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `tenantId`, `vendorCode`, `companyName`, `contactPerson`, `email`, `phone`, `address`, `status`, `createdAt`, `updatedAt`) VALUES
(2, 1, 'VND-TEST-001', 'Test Company', NULL, 'test@example.com', '1234567890', NULL, 'approved', '2026-06-05 13:14:19.536', '2026-06-05 13:14:19.536'),
(3, 1, 'VND-805557', 'wSA', 'AS', 'wSA@gmail.com', '1234567890', 'njdnn', 'active', '2026-06-06 06:03:25.730', '2026-06-06 06:03:25.730');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `location` text DEFAULT NULL,
  `managerId` int(11) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_performedBy_fkey` (`performedBy`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_clientCode_key` (`clientCode`),
  ADD KEY `clients_tenantId_idx` (`tenantId`),
  ADD KEY `clients_clientCode_idx` (`clientCode`);

--
-- Indexes for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_contacts_tenantId_idx` (`tenantId`),
  ADD KEY `client_contacts_clientId_idx` (`clientId`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveries_tenantId_idx` (`tenantId`),
  ADD KEY `deliveries_deliveryNumber_idx` (`deliveryNumber`),
  ADD KEY `deliveries_orderId_idx` (`orderId`),
  ADD KEY `deliveries_clientId_idx` (`clientId`),
  ADD KEY `deliveries_assignedTo_idx` (`assignedTo`),
  ADD KEY `deliveries_warehouseId_idx` (`warehouseId`),
  ADD KEY `deliveries_status_idx` (`status`);

--
-- Indexes for table `delivery_items`
--
ALTER TABLE `delivery_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_items_tenantId_idx` (`tenantId`),
  ADD KEY `delivery_items_deliveryId_idx` (`deliveryId`),
  ADD KEY `delivery_items_orderItemId_idx` (`orderItemId`),
  ADD KEY `delivery_items_itemId_idx` (`itemId`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_tenantId_idx` (`tenantId`),
  ADD KEY `departments_code_idx` (`code`),
  ADD KEY `departments_status_idx` (`status`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designations_tenantId_idx` (`tenantId`),
  ADD KEY `designations_departmentId_idx` (`departmentId`),
  ADD KEY `designations_status_idx` (`status`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_userId_key` (`userId`),
  ADD KEY `employees_tenantId_idx` (`tenantId`),
  ADD KEY `employees_employeeCode_idx` (`employeeCode`),
  ADD KEY `employees_departmentId_idx` (`departmentId`),
  ADD KEY `employees_designationId_idx` (`designationId`),
  ADD KEY `employees_status_idx` (`status`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_documents_tenantId_idx` (`tenantId`),
  ADD KEY `employee_documents_employeeId_idx` (`employeeId`),
  ADD KEY `employee_documents_verificationStatus_idx` (`verificationStatus`);

--
-- Indexes for table `grns`
--
ALTER TABLE `grns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grns_tenantId_idx` (`tenantId`),
  ADD KEY `grns_grnNumber_idx` (`grnNumber`),
  ADD KEY `grns_purchaseOrderId_idx` (`purchaseOrderId`),
  ADD KEY `grns_vendorId_idx` (`vendorId`),
  ADD KEY `grns_warehouseId_idx` (`warehouseId`),
  ADD KEY `grns_status_idx` (`status`),
  ADD KEY `grns_receivedById_fkey` (`receivedById`);

--
-- Indexes for table `grn_items`
--
ALTER TABLE `grn_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grn_items_grnId_idx` (`grnId`),
  ADD KEY `grn_items_itemId_idx` (`itemId`);

--
-- Indexes for table `inventory_stock`
--
ALTER TABLE `inventory_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_stock_warehouseId_itemId_key` (`warehouseId`,`itemId`),
  ADD KEY `inventory_stock_tenantId_idx` (`tenantId`),
  ADD KEY `inventory_stock_itemId_fkey` (`itemId`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_tenantId_idx` (`tenantId`),
  ADD KEY `invoices_invoiceNumber_idx` (`invoiceNumber`),
  ADD KEY `invoices_clientId_idx` (`clientId`),
  ADD KEY `invoices_orderId_idx` (`orderId`),
  ADD KEY `invoices_deliveryId_idx` (`deliveryId`),
  ADD KEY `invoices_status_idx` (`status`),
  ADD KEY `invoices_dueDate_idx` (`dueDate`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_tenantId_idx` (`tenantId`),
  ADD KEY `invoice_items_invoiceId_idx` (`invoiceId`),
  ADD KEY `invoice_items_itemId_idx` (`itemId`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_tenantId_idx` (`tenantId`),
  ADD KEY `items_categoryId_idx` (`categoryId`),
  ADD KEY `items_unitId_idx` (`unitId`),
  ADD KEY `items_sku_idx` (`sku`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_categories_tenantId_idx` (`tenantId`);

--
-- Indexes for table `item_units`
--
ALTER TABLE `item_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_units_tenantId_idx` (`tenantId`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `missions_tenantId_idx` (`tenantId`),
  ADD KEY `missions_missionNumber_idx` (`missionNumber`),
  ADD KEY `missions_deliveryId_idx` (`deliveryId`),
  ADD KEY `missions_assignedEmployeeId_idx` (`assignedEmployeeId`),
  ADD KEY `missions_status_idx` (`status`),
  ADD KEY `missions_orderId_fkey` (`orderId`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_userId_fkey` (`userId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_tenantId_idx` (`tenantId`),
  ADD KEY `orders_orderNumber_idx` (`orderNumber`),
  ADD KEY `orders_clientId_idx` (`clientId`),
  ADD KEY `orders_status_idx` (`status`),
  ADD KEY `orders_createdById_fkey` (`createdById`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_tenantId_idx` (`tenantId`),
  ADD KEY `order_items_orderId_idx` (`orderId`),
  ADD KEY `order_items_itemId_idx` (`itemId`),
  ADD KEY `order_items_warehouseId_idx` (`warehouseId`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizations_email_key` (`email`),
  ADD KEY `organizations_email_idx` (`email`),
  ADD KEY `organizations_status_idx` (`status`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_tenantId_idx` (`tenantId`),
  ADD KEY `payments_invoiceId_idx` (`invoiceId`),
  ADD KEY `payments_referenceNumber_idx` (`referenceNumber`),
  ADD KEY `payments_paymentMethod_idx` (`paymentMethod`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proof_of_delivery`
--
ALTER TABLE `proof_of_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proof_of_delivery_tenantId_idx` (`tenantId`),
  ADD KEY `proof_of_delivery_deliveryId_idx` (`deliveryId`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_orders_tenantId_idx` (`tenantId`),
  ADD KEY `purchase_orders_poNumber_idx` (`poNumber`),
  ADD KEY `purchase_orders_vendorId_idx` (`vendorId`),
  ADD KEY `purchase_orders_purchaseRequestId_idx` (`purchaseRequestId`),
  ADD KEY `purchase_orders_status_idx` (`status`),
  ADD KEY `purchase_orders_quotationId_fkey` (`quotationId`);

--
-- Indexes for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_requests_tenantId_idx` (`tenantId`),
  ADD KEY `purchase_requests_prNumber_idx` (`prNumber`),
  ADD KEY `purchase_requests_status_idx` (`status`),
  ADD KEY `purchase_requests_departmentId_idx` (`departmentId`),
  ADD KEY `purchase_requests_requestedBy_idx` (`requestedBy`);

--
-- Indexes for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_request_items_purchaseRequestId_idx` (`purchaseRequestId`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_tenantId_idx` (`tenantId`),
  ADD KEY `quotations_rfqId_idx` (`rfqId`),
  ADD KEY `quotations_vendorId_idx` (`vendorId`),
  ADD KEY `quotations_status_idx` (`status`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipts_tenantId_idx` (`tenantId`),
  ADD KEY `receipts_receiptNumber_idx` (`receiptNumber`),
  ADD KEY `receipts_paymentId_idx` (`paymentId`);

--
-- Indexes for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `refresh_tokens_token_key` (`token`),
  ADD KEY `refresh_tokens_userId_fkey` (`userId`);

--
-- Indexes for table `rfqs`
--
ALTER TABLE `rfqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rfqs_tenantId_idx` (`tenantId`),
  ADD KEY `rfqs_rfqNumber_idx` (`rfqNumber`),
  ADD KEY `rfqs_purchaseRequestId_idx` (`purchaseRequestId`),
  ADD KEY `rfqs_vendorId_idx` (`vendorId`),
  ADD KEY `rfqs_status_idx` (`status`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_key` (`name`);

--
-- Indexes for table `role_menus`
--
ALTER TABLE `role_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_menus_roleId_menuId_key` (`roleId`,`menuId`),
  ADD KEY `role_menus_menuId_fkey` (`menuId`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permissions_roleId_fkey` (`roleId`),
  ADD KEY `role_permissions_permissionId_fkey` (`permissionId`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_key` (`key`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_movements_tenantId_idx` (`tenantId`),
  ADD KEY `stock_movements_warehouseId_idx` (`warehouseId`),
  ADD KEY `stock_movements_itemId_idx` (`itemId`),
  ADD KEY `stock_movements_movementType_idx` (`movementType`),
  ADD KEY `stock_movement_grn_fk` (`referenceId`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_tenantId_idx` (`tenantId`),
  ADD KEY `subscriptions_planId_idx` (`planId`),
  ADD KEY `subscriptions_status_idx` (`status`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tenants_tenantCode_key` (`tenantCode`),
  ADD UNIQUE KEY `tenants_subscriptionId_key` (`subscriptionId`),
  ADD KEY `tenants_organizationId_idx` (`organizationId`),
  ADD KEY `tenants_subscriptionId_idx` (`subscriptionId`),
  ADD KEY `tenants_tenantCode_idx` (`tenantCode`),
  ADD KEY `tenants_status_idx` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_uuid_key` (`uuid`),
  ADD UNIQUE KEY `users_email_key` (`email`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_tenantId_idx` (`tenantId`),
  ADD KEY `users_roleId_idx` (`roleId`),
  ADD KEY `users_status_idx` (`status`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_userId_fkey` (`userId`),
  ADD KEY `user_roles_roleId_fkey` (`roleId`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendors_tenantId_idx` (`tenantId`),
  ADD KEY `vendors_vendorCode_idx` (`vendorCode`),
  ADD KEY `vendors_status_idx` (`status`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouses_tenantId_idx` (`tenantId`),
  ADD KEY `warehouses_managerId_idx` (`managerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_contacts`
--
ALTER TABLE `client_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_items`
--
ALTER TABLE `delivery_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grns`
--
ALTER TABLE `grns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grn_items`
--
ALTER TABLE `grn_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_stock`
--
ALTER TABLE `inventory_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_units`
--
ALTER TABLE `item_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `missions`
--
ALTER TABLE `missions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proof_of_delivery`
--
ALTER TABLE `proof_of_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `rfqs`
--
ALTER TABLE `rfqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role_menus`
--
ALTER TABLE `role_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_performedBy_fkey` FOREIGN KEY (`performedBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD CONSTRAINT `client_contacts_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_contacts_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_assignedTo_fkey` FOREIGN KEY (`assignedTo`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `delivery_items`
--
ALTER TABLE `delivery_items`
  ADD CONSTRAINT `delivery_items_deliveryId_fkey` FOREIGN KEY (`deliveryId`) REFERENCES `deliveries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_items_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_items_orderItemId_fkey` FOREIGN KEY (`orderItemId`) REFERENCES `order_items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_items_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `designations`
--
ALTER TABLE `designations`
  ADD CONSTRAINT `designations_departmentId_fkey` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `designations_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_departmentId_fkey` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_designationId_fkey` FOREIGN KEY (`designationId`) REFERENCES `designations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD CONSTRAINT `employee_documents_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_documents_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `grns`
--
ALTER TABLE `grns`
  ADD CONSTRAINT `grns_purchaseOrderId_fkey` FOREIGN KEY (`purchaseOrderId`) REFERENCES `purchase_orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `grns_receivedById_fkey` FOREIGN KEY (`receivedById`) REFERENCES `employees` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `grns_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `grns_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `grns_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `grn_items`
--
ALTER TABLE `grn_items`
  ADD CONSTRAINT `grn_items_grnId_fkey` FOREIGN KEY (`grnId`) REFERENCES `grns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grn_items_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `inventory_stock`
--
ALTER TABLE `inventory_stock`
  ADD CONSTRAINT `inventory_stock_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_stock_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_stock_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_deliveryId_fkey` FOREIGN KEY (`deliveryId`) REFERENCES `deliveries` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `item_categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `items_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `items_unitId_fkey` FOREIGN KEY (`unitId`) REFERENCES `item_units` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD CONSTRAINT `item_categories_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `item_units`
--
ALTER TABLE `item_units`
  ADD CONSTRAINT `item_units_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `missions`
--
ALTER TABLE `missions`
  ADD CONSTRAINT `missions_assignedEmployeeId_fkey` FOREIGN KEY (`assignedEmployeeId`) REFERENCES `employees` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `missions_deliveryId_fkey` FOREIGN KEY (`deliveryId`) REFERENCES `deliveries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `missions_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `missions_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_createdById_fkey` FOREIGN KEY (`createdById`) REFERENCES `employees` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `proof_of_delivery`
--
ALTER TABLE `proof_of_delivery`
  ADD CONSTRAINT `proof_of_delivery_deliveryId_fkey` FOREIGN KEY (`deliveryId`) REFERENCES `deliveries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proof_of_delivery_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_purchaseRequestId_fkey` FOREIGN KEY (`purchaseRequestId`) REFERENCES `purchase_requests` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_orders_quotationId_fkey` FOREIGN KEY (`quotationId`) REFERENCES `quotations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_orders_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_orders_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendors` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  ADD CONSTRAINT `purchase_requests_departmentId_fkey` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_requests_requestedBy_fkey` FOREIGN KEY (`requestedBy`) REFERENCES `employees` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_requests_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  ADD CONSTRAINT `purchase_request_items_purchaseRequestId_fkey` FOREIGN KEY (`purchaseRequestId`) REFERENCES `purchase_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_rfqId_fkey` FOREIGN KEY (`rfqId`) REFERENCES `rfqs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotations_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `quotations_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendors` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `receipts_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD CONSTRAINT `refresh_tokens_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rfqs`
--
ALTER TABLE `rfqs`
  ADD CONSTRAINT `rfqs_purchaseRequestId_fkey` FOREIGN KEY (`purchaseRequestId`) REFERENCES `purchase_requests` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rfqs_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rfqs_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendors` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `role_menus`
--
ALTER TABLE `role_menus`
  ADD CONSTRAINT `role_menus_menuId_fkey` FOREIGN KEY (`menuId`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_menus_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permissionId_fkey` FOREIGN KEY (`permissionId`) REFERENCES `permissions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD CONSTRAINT `stock_movement_grn_fk` FOREIGN KEY (`referenceId`) REFERENCES `grns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_movements_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_movements_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_movements_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_planId_fkey` FOREIGN KEY (`planId`) REFERENCES `plans` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `subscriptions_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tenants`
--
ALTER TABLE `tenants`
  ADD CONSTRAINT `tenants_organizationId_fkey` FOREIGN KEY (`organizationId`) REFERENCES `organizations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tenants_subscriptionId_fkey` FOREIGN KEY (`subscriptionId`) REFERENCES `subscriptions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendors_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_managerId_fkey` FOREIGN KEY (`managerId`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouses_tenantId_fkey` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
