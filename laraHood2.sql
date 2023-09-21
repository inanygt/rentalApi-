-- -------------------------------------------------------------
-- TablePlus 5.4.0(504)
--
-- https://tableplus.com/
--
-- Database: laraHood2
-- Generation Time: 2023-09-21 11:26:16.2850
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `amount` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_date` datetime NOT NULL,
  `paid_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `price_per_day` decimal(10,2) NOT NULL,
  `price_per_extra_day` decimal(10,2) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `subcategory_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `subsubcategory_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `subcategories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `subsubcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `subcategory_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `image`) VALUES
(1, 'Beeld & Geluid', 'https://media.s-bol.com/ng19kBlA54N7/1111x1200.jpg'),
(2, 'Gaming & Speelgoed', 'https://media.direct.playstation.com/is/image/psdglobal/PS5-console-front?$Background_Large$'),
(3, 'Dieren & Toeberhoren', 'https://m.media-amazon.com/images/I/81FNABetDJL._SL1500_.jpg'),
(4, 'Verzorging, Welzijn & Baby', 'https://m.media-amazon.com/images/I/61bfPEx8nkS._AC_SX679_.jpg'),
(5, 'Kleding & Kostuums', 'https://palmnoosa.com.au/cdn/shop/products/Artboard5_8fe93ebe-f4aa-4efc-8544-dba6b0c07cfd_600x.png?v=1679535772'),
(6, 'Klussen & Gereedschap', 'https://superhandig.nl/media/catalog/product/cache/8ad1111b858550745ab0dffdb778011c/g/e/gereedschapsset_format_sanitair_50-delig.jpg'),
(7, 'Koken & Tafelen', 'https://www.bestsale.be/media/catalog/product/cache/603730aeb208edf15956b2bd11c77fa3/imp/ort/plastinox-productimages-4244303.jpg'),
(8, 'Huishouden & Schoonmaak', 'https://www.engelenfacility.nl/wp-content/uploads/2021/03/schoonmaak-Venlo-400x356.png'),
(9, 'Vakantie, Sport & Vrije tijd', 'https://www.yoursportplanner.com/assets/images/all_sports.svg'),
(10, 'Vervoer & Transport', 'https://www.mobiliteit.lu/wp-content/uploads/2020/01/Transports-publics_square-1024x1024.png'),
(11, 'Computers, Telefoons & Toebehoren', 'https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iphone_11-rosette-family-lineup-091019_big.jpg.large_2x.jpg'),
(12, 'Party, Event & Tuinfeest', 'https://www.rachelriley.co.uk/cdn/shop/products/HBMULTIDOT_1800x1800.jpg?v=1589289883');

INSERT INTO `items` (`id`, `title`, `city`, `region`, `price_per_day`, `price_per_extra_day`, `category_id`, `subcategory_id`, `user_id`, `image`, `subsubcategory_id`) VALUES
(1, 'Beatae asperiores repellendus eveniet.', 'South Furman', 'California', 65.36, 46.78, 7, 9, 5, 'Pariatur veritatis officiis et asperiores aut reiciendis.', 1),
(2, 'Assumenda reiciendis dolores quo sunt eos.', 'Purdychester', 'Delaware', 75.61, 89.13, 7, 4, 7, 'Provident commodi et voluptas et delectus sint.', 2),
(3, 'Cum quasi ab reprehenderit reprehenderit odit.', 'North Therese', 'Oklahoma', 178.39, 92.13, 9, 10, 7, 'Ex ut et sint.', 3),
(4, 'Quam nobis reiciendis dicta.', 'Baumbachfort', 'Colorado', 151.29, 37.47, 8, 7, 8, 'Enim magnam quisquam autem corporis unde.', 1),
(5, 'Sit vel sunt non sed voluptas ratione.', 'Lake Hester', 'Wisconsin', 129.21, 38.96, 4, 1, 4, 'Hic sint quod tempora ea odit minima similique.', 2),
(6, 'Porro sint voluptatem magnam veniam omnis nulla suscipit corporis.', 'Port Bustermouth', 'Oklahoma', 159.59, 49.89, 8, 8, 2, 'Perspiciatis doloremque ut aperiam deserunt pariatur.', 4),
(7, 'Culpa nisi pariatur et.', 'North Lou', 'Maryland', 185.99, 29.14, 7, 8, 6, 'Consequatur magnam veniam aut quaerat.', 2),
(8, 'A iste quo vel consequatur temporibus odio officiis.', 'West Kellimouth', 'Maine', 170.12, 58.78, 4, 7, 1, 'Ullam pariatur mollitia laudantium maiores.', 3),
(9, 'Praesentium nisi voluptatibus aspernatur vel ut aut.', 'New Melvinchester', 'Virginia', 121.60, 85.23, 5, 4, 1, 'Officiis perferendis quod placeat dolores exercitationem.', 1),
(10, 'Aut et laborum reprehenderit soluta inventore.', 'Orvilleview', 'Connecticut', 148.78, 43.29, 3, 4, 5, 'Placeat aut dolore nihil quisquam voluptatibus ipsum.', 2),
(11, 'Cum alias dolorem et voluptas alias vero sed.', 'Lake Helenamouth', 'California', 114.01, 25.47, 6, 2, 8, 'Rerum amet exercitationem sit voluptas qui.', 5),
(12, 'Voluptatum impedit maiores rerum quibusdam.', 'North Alexandreaton', 'Washington', 168.57, 84.41, 9, 3, 1, 'Fuga dolor accusantium qui.', 6),
(13, 'Alias id tenetur ducimus est vitae laborum.', 'New Carleyhaven', 'Michigan', 100.83, 94.30, 7, 1, 2, 'Porro expedita numquam veritatis mollitia accusantium placeat.', 1),
(14, 'Et quia dolorem delectus.', 'Kirlinfort', 'Nebraska', 111.37, 38.12, 2, 10, 4, 'Quo eos architecto odit voluptas.', 3),
(15, 'Animi iusto veniam veritatis minima repudiandae.', 'Blockfort', 'Washington', 191.73, 27.12, 3, 2, 10, 'Quisquam doloribus ipsa sunt distinctio voluptas.', 2),
(16, 'Fugit consequatur sunt aut illum ad.', 'Trompside', 'Massachusetts', 143.48, 53.63, 5, 9, 7, 'Voluptas quia alias aut aut delectus deleniti quo.', 6),
(17, 'Quae unde doloremque sunt consequatur.', 'Hammesburgh', 'Virginia', 52.97, 72.79, 1, 10, 9, 'Et harum similique vel itaque delectus.', 4),
(18, 'Voluptas est veniam aspernatur eum.', 'Lake Alexandrine', 'North Carolina', 69.52, 76.35, 2, 9, 1, 'Vitae est cum similique et velit.', 3),
(19, 'Necessitatibus minima quidem ex similique eum sint quam neque.', 'Port Heaven', 'North Dakota', 54.40, 72.61, 5, 6, 5, 'Est at dignissimos voluptate tempore et.', 2),
(20, 'Inventore voluptatem voluptas qui inventore velit facere dolorem.', 'Alfredville', 'Kansas', 163.11, 40.82, 3, 7, 5, 'Voluptatem sapiente voluptas eum amet est nam.', 4),
(21, 'Dolores sed sed qui.', 'New Eunice', 'Kentucky', 154.63, 65.74, 4, 5, 4, 'Et ut voluptatem sed nostrum maiores accusamus vero.', 1),
(22, 'Cumque beatae eum nobis impedit alias nemo ut.', 'Andersonchester', 'Connecticut', 107.95, 31.47, 8, 4, 8, 'Omnis sapiente asperiores cumque cumque hic quia.', 2),
(23, 'Sapiente eligendi unde temporibus labore ipsum.', 'Cletahaven', 'Florida', 167.44, 58.47, 5, 8, 9, 'Qui perferendis mollitia tenetur facilis quidem vel corrupti.', 2),
(24, 'Iste sequi numquam distinctio.', 'Martinetown', 'Massachusetts', 81.20, 74.14, 1, 1, 4, 'Laboriosam omnis repudiandae voluptatem est quisquam pariatur sed.', 3),
(25, 'Enim nam sunt mollitia doloribus adipisci.', 'Hodkiewiczport', 'Massachusetts', 196.63, 28.70, 1, 5, 9, 'Aut accusamus sit repudiandae impedit qui est.', 4);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_12_060207_create_customers_table', 2),
(6, '2023_09_12_060234_create_invoices_table', 2),
(9, '2023_09_19_135210_add_item_column_to_items_table', 3),
(10, '2023_09_20_081251_add_column_to_items_table', 4);

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Fotografie', 1, NULL, NULL, 'https://www.kamera-express.nl/media/b11f7b40-03ae-4c42-9b89-e18d44229a2f/12309814_5.jpg'),
(2, 'fotografie-accessoires', 1, NULL, NULL, 'https://www.kamera-express.nl/media/e8fc749f-41ee-4d64-8690-c051e7ec634a/12309814_3.jpg'),
(3, 'overig beeld & geluid', 1, NULL, NULL, 'https://www.kamera-express.nl/media/aff8a337-a7d1-4c86-a92c-91ed2d96bcd9/12228186_1.jpg'),
(12, 'Geluidsapparatuur', 1, NULL, NULL, 'https://www.officeeasy.be/media/catalog/product/cache/3196eb7b21231e4b09e2d558fb0613b4/z/o/zone-vibe-wireless-6_2.jpg'),
(13, 'Videocamera\'s', 1, NULL, NULL, 'https://www.kamera-express.nl/media/2d11544b-5511-46bb-931a-f85efa738db2/sony_hdr-cx405_1.jpg'),
(14, 'Muziekspelers', 1, NULL, NULL, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_53/537900/17017914_800.jpg'),
(15, 'Muziekinstrumenten', 1, NULL, NULL, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_53/538046/17098973_800.jpg'),
(16, 'Televisies', 1, NULL, NULL, 'https://aws-obg-image-lb-1.tcl.com/content/dam/brandsite/region/europe/products/tv/c-series/c845/id-image/65c845-awards.png'),
(17, 'Beamers & Toebehoren', 1, NULL, NULL, 'https://www.thenextshop.nl/resize/optoma-hd146x-vooraanzicht-links16945012607816.jpg/500/500/True/optoma-hd146x-beamer.webp'),
(18, 'Muziekaccessoires', 1, NULL, NULL, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_10/103186/10308344_800.jpg'),
(19, 'Consoles', 2, NULL, NULL, 'https://media.direct.playstation.com/is/image/psdglobal/PS5-console-front?$Background_Small$'),
(20, 'Bordspellen', 2, NULL, NULL, 'https://media.s-bol.com/rNpo1gNN1QZw/jDNrD5/1134x1200.jpg'),
(21, 'Virtual Reality', 2, NULL, NULL, 'https://image.coolblue.be/max/500x500/products/1822729'),
(22, 'Games', 2, NULL, NULL, 'https://m.media-amazon.com/images/I/51m-cKr8NBS._SX300_SY300_QL70_FMwebp_.jpg'),
(23, 'Buitenspeelgoed', 2, NULL, NULL, 'https://m.media-amazon.com/images/I/71BKIadEd6L._AC_SX679_.jpg'),
(24, 'Overig Speelgoed', 2, NULL, NULL, 'https://lolalifelines.be/19140-large_default/speelgoed-keuken-voor-kinderen-green-toys.jpg'),
(25, 'Schilderspullen', 2, NULL, NULL, 'https://www.goodstore.nl/media/catalog/product/cache/1/image/767x/9df78eab33525d08d6e5fb8d27136e95/a/t/atelier_schildersezel_180cm_zwart_1_1.jpg'),
(26, 'Drones', 2, NULL, NULL, 'https://image.coolblue.be/max/2048x1536/products/1964097'),
(27, 'Textiel & Handwerken', 2, NULL, NULL, 'https://www.cncworld.be/images/ZDJECIA/Prasy%20Termotransferowe/prasa%20automatyczna%2050x40/mini/500px_prasa%2050x40cm(2).jpg'),
(34, 'Overig dierenartikel', 3, NULL, NULL, 'https://m.media-amazon.com/images/I/81NOhvFQz1L._AC_SY879_.jpg'),
(35, 'Kattenartikelen', 3, NULL, NULL, 'https://www.tomandco.com/11040-pdt_540/kattenbak-top-cat-grijs-39x39x5850cm.jpg'),
(36, 'Hondenartikelen', 3, NULL, NULL, 'https://shop-cdn-m.mediazs.com/bilder/trixie/keramische/voerbak/met/pootafdruk/7/400/24641_pla_trixie_keramiknapf_mit_pfoten_braun_hs_03_7.jpg'),
(37, 'Knaagdierenartikelen', 3, NULL, NULL, 'https://shop-cdn-m.mediazs.com/bilder/konijnenkooi/piggy/basic/9/400/69453_pla_ferplast_kleintierk_fig_piggy_basic_hs_01_9.jpg');

INSERT INTO `subsubcategories` (`id`, `name`, `image`, `subcategory_id`) VALUES
(1, 'Diascanner', 'https://m.media-amazon.com/images/I/810EeidC4tL._AC_SX679_.jpg', 1),
(2, 'Onderwatercamera', 'https://www.kamera-express.nl/media/a3baf71d-4090-4ee8-9da0-58ec551e1fce/Kodak-Waterproof-WPZ2-geel-4x-zoom-WiFi-extra-accu-16GB-geheugenkaart_1.jpg', 1),
(3, 'Digitale fotocamera', 'https://cdn.webshopapp.com/shops/318496/files/414899825/1000x1000x2/canon-eos-r5-body-nieuw.jpg', 1),
(4, 'Analoge fotocamera', 'https://m.media-amazon.com/images/I/81U+yv+cj5L._AC_SX679_.jpg', 1),
(5, 'Spiegelreflexcamera', 'https://m.media-amazon.com/images/I/81-m-q6XGML._AC_SX679_.jpg', 1),
(6, 'Polaroidcamera', 'https://www.kamera-express.nl/media/31541c58-0cce-437d-a8d0-900791b3ab48/Polaroid-NowPlus-Black_1.jpg', 1),
(7, 'Compactcamera', 'https://cdn.webshopapp.com/shops/318496/files/414899825/1000x1000x2/canon-eos-r5-body-nieuw.jpg', 1),
(8, '360 graden camera', 'https://data.kommago.nl/img/products/large/78731_Ubiquiti-UniFi-AI-360-1.webp', 1);

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Estevan O\'Hara', 'lavada52@example.org', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jNPk2nTf2n', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(2, 'Dane Boehm', 'smarvin@example.org', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SLIBAtG5ZN', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(3, 'Maxie Spinka', 'crona.kiana@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VoDVdf3E7Y', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(4, 'Jaquelin Daugherty', 'oberbrunner.godfrey@example.com', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YvS9X4cfAV', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(5, 'Jeanette Rodriguez', 'virginia48@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'E0vndb4fQE', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(6, 'Lon Schimmel', 'jeremie99@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sQOix8R2mx', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(7, 'Mr. Cade Haley', 'uriah.kilback@example.org', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Xxwn2DiEKH', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(8, 'Miss Lavada Watsica V', 'lewis.mosciski@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5lSmdjJRbY', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(9, 'Ms. Jazmyne Hamill', 'johnson.buster@example.com', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'On3jZz9K2a', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(10, 'Fermin Sporer', 'rahsaan76@example.org', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'je3v06ALdC', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(11, 'Caleigh Windler', 'reid81@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UAMtRuQ41Q', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(12, 'Trinity Veum', 'jada.hills@example.org', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kaVXloXlCP', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(13, 'Harley Goldner', 'brodriguez@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'E4wZ8lSUX2', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(14, 'Wilford Batz', 'lavinia23@example.org', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4COPGd2c6l', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(15, 'Madisyn Nader II', 'xgutmann@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fd86DHQIK7', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(16, 'Noemi Eichmann', 'gordon38@example.com', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'x2BoOlC8UJ', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(17, 'Aubree Feeney', 'forrest.kessler@example.com', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DVGtbPnePp', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(18, 'Leila Smitham', 'spencer.cary@example.org', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lXn2mWG2zB', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(19, 'Elsie Rolfson', 'janessa.cartwright@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hjj86vkVjZ', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(20, 'Prof. Simone Pacocha', 'rahsaan.durgan@example.com', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BskpmVnbzq', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(21, 'Missouri Jacobi PhD', 'chaz90@example.org', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ANNBBgDHNr', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(22, 'Mrs. Jada Waelchi', 'julie34@example.com', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '95TYTvJKKt', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(23, 'Kenyon Powlowski', 'mgottlieb@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MmKAeAbXCx', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(24, 'Mrs. Nya Parker', 'trunolfsdottir@example.org', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sSPx3pVK9s', '2023-09-21 09:25:15', '2023-09-21 09:25:15'),
(25, 'Edmond Rau', 'heathcote.federico@example.net', '2023-09-21 09:25:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pI5b4zUK6x', '2023-09-21 09:25:15', '2023-09-21 09:25:15');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;