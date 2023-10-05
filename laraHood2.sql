-- -------------------------------------------------------------
-- TablePlus 5.4.2(506)
--
-- https://tableplus.com/
--
-- Database: laraHood2
-- Generation Time: 2023-10-05 10:54:46.9830
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
  `borrowed` bigint unsigned DEFAULT NULL,
  `description` text,
  `borrowable` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

INSERT INTO `items` (`id`, `title`, `city`, `region`, `price_per_day`, `price_per_extra_day`, `category_id`, `subcategory_id`, `user_id`, `image`, `subsubcategory_id`, `borrowed`, `description`, `borrowable`, `visible`) VALUES
(101, 'voluptas', 'Lake Laney', 'Alaska', 20.00, 15.00, 6, 19, 14, 'Suscipit modi fuga rerum cumque voluptatem temporibus.', 4, 3, 'Minus autem ut nulla nesciunt. Voluptatem quis sit omnis aut earum. Sapiente odit porro asperiores sequi quis velit. Aliquam ut voluptate qui.', 0, 0),
(102, 'laboriosam ea', 'New Lillastad', 'Vermont', 15.00, 5.00, 11, 3, 34, 'Adipisci autem officia doloremque labore voluptatum doloribus repellendus alias.', 29, 12, 'Laboriosam officiis modi labore illo dicta et. Quam saepe iure facere dicta saepe vitae eos. Qui porro harum unde fugit eum cumque laudantium.', 1, 1),
(103, 'quia', 'Cullenport', 'Oklahoma', 17.00, 15.00, 4, 14, 4, 'Est accusamus magni incidunt expedita reprehenderit.', 23, 13, 'Ut repudiandae quisquam cupiditate dignissimos eum non vel. Ullam sint molestiae natus iure. Enim voluptas delectus magnam voluptates quia enim.', 1, 0),
(104, 'id aut', 'Gustville', 'Idaho', 12.00, 15.00, 8, 17, 27, 'Suscipit laboriosam molestiae sunt vero in laborum.', 14, 19, 'Quia cum ipsa sequi iure dignissimos dolorem. Laudantium sed qui consequatur dolorem voluptatum. Possimus maiores id perferendis cum ut.', 1, 0),
(105, 'aut', 'Dorthashire', 'Georgia', 6.00, 10.00, 11, 5, 48, 'Voluptatum nihil dolorum dolores nisi qui aspernatur ratione perferendis.', 7, 7, 'Aut odit voluptatum sed similique id quasi occaecati maxime. Praesentium sint culpa a libero cumque. Placeat quisquam molestiae amet officia fuga consequuntur sed. Est non officiis perspiciatis dicta reiciendis laborum dignissimos.', 0, 0),
(106, 'et in', 'Rutherfordbury', 'Wyoming', 18.00, 6.00, 9, 8, 35, 'Deleniti praesentium repudiandae quaerat maxime rem omnis reprehenderit.', 24, 7, 'Odio reprehenderit est fuga numquam pariatur cum quisquam sequi. Cumque aspernatur dolorum corporis quam consequuntur molestias. Aut nostrum reiciendis velit non delectus eveniet blanditiis. Illum et non et et officiis sed.', 0, 1),
(107, 'voluptas', 'Harristown', 'Wisconsin', 14.00, 14.00, 1, 3, 45, 'Voluptas reiciendis nemo temporibus iste voluptas.', 10, 14, 'Deleniti consequatur ex dolorem corrupti nesciunt. Est sapiente laudantium aut id. Voluptas quis consequatur est omnis quas inventore sunt saepe. Dolores cumque sed dolorem sunt. Maxime est quasi eos odit.', 1, 1),
(108, 'earum', 'West Immanuel', 'Florida', 17.00, 15.00, 1, 15, 17, 'Qui in aut vel non.', 1, 2, 'Voluptatem voluptatem deleniti officia quia officia omnis. Consequatur et non quisquam nesciunt reprehenderit. Sapiente beatae et quo expedita perspiciatis at consectetur.', 0, 0),
(109, 'sit', 'North Mariettaside', 'Minnesota', 6.00, 17.00, 6, 25, 21, 'Ipsam sit tenetur sequi enim amet.', 12, 8, 'Quam dolor adipisci exercitationem et. Occaecati aut nulla sit quia. Ducimus quas ab consequatur animi sit optio aut. Magnam omnis delectus ipsa.', 1, 1),
(110, 'aut magni', 'North Clare', 'Minnesota', 12.00, 8.00, 7, 3, 45, 'Cumque mollitia optio temporibus natus aliquam.', 4, 11, 'Maiores molestias incidunt iste amet. Cum voluptas omnis in eveniet natus. Praesentium blanditiis animi est sit. Accusamus est beatae modi recusandae vitae autem.', 0, 0),
(111, 'velit earum', 'Zackview', 'Louisiana', 14.00, 11.00, 3, 14, 22, 'Debitis facilis consectetur soluta ut et.', 28, 4, 'Quis eius laborum esse praesentium voluptatem in. Facilis sed quaerat fugiat iusto dolore ipsam consectetur nostrum. Sed omnis laboriosam omnis perspiciatis ipsa exercitationem eius. Quia consequatur quo architecto doloremque minus.', 0, 1),
(112, 'ut', 'Bayerview', 'Iowa', 18.00, 17.00, 6, 25, 31, 'Dolorem consequatur doloribus magnam dicta voluptatem.', 4, 20, 'Non dicta minima itaque et non facilis dolore. A est omnis dignissimos voluptas eaque. Sequi quia ducimus et et eius aut. Qui odit qui qui adipisci aliquid alias et.', 0, 0),
(113, 'assumenda quas', 'East Bernardoside', 'Washington', 13.00, 19.00, 9, 25, 3, 'Necessitatibus ut saepe iste.', 22, 6, 'Similique placeat et earum aperiam minima beatae. Minus et laudantium nisi possimus provident. Voluptatum facere dolores velit deleniti facilis. Voluptas sit cupiditate alias aut repudiandae consequatur laborum atque.', 1, 1),
(114, 'atque sit', 'Vellatown', 'Ohio', 20.00, 6.00, 6, 19, 4, 'Ipsam officiis eligendi neque omnis.', 9, 4, 'Adipisci doloribus illo consequatur. Dolores delectus neque consectetur inventore culpa officiis quae. Minima quisquam sunt perferendis in pariatur voluptatem. Maiores distinctio dicta esse et voluptatem. Est sit magnam ad recusandae.', 0, 1),
(115, 'corporis velit', 'New Zolaland', 'Illinois', 5.00, 13.00, 2, 12, 12, 'Et a quia in consectetur.', 16, 15, 'Suscipit blanditiis reiciendis est deleniti delectus fuga. Sit aliquid facilis voluptatem nam. Nisi perspiciatis maxime est ad esse exercitationem minima. Id voluptatem quod provident ut numquam quibusdam.', 0, 0),
(116, 'est', 'East Rahsaan', 'Delaware', 5.00, 19.00, 11, 22, 32, 'Repudiandae nisi error fuga recusandae eum hic.', 5, 14, 'Inventore et nesciunt quo est in. Quisquam ut ducimus dolorem soluta.', 1, 1),
(117, 'beatae', 'Lake Enricostad', 'Georgia', 18.00, 19.00, 9, 10, 15, 'Cupiditate autem ratione consequatur exercitationem odio quia quia.', 15, 2, 'Nam ut vel quia. Similique reprehenderit cum eaque assumenda. Illum perspiciatis itaque quod. Porro error et consequatur ipsam molestias sint et distinctio.', 0, 0),
(118, 'soluta sapiente', 'East Patrickmouth', 'Minnesota', 7.00, 5.00, 8, 5, 15, 'Et mollitia incidunt voluptates autem et.', 12, 7, 'Est explicabo maxime iure. Ut molestias mollitia sequi maxime veniam qui nihil. Repellendus aut et dolores quia.', 0, 1),
(119, 'quia molestiae', 'West Eltaburgh', 'District of Columbia', 6.00, 9.00, 12, 4, 23, 'Ea nesciunt dolor natus assumenda reiciendis sit ea placeat.', 18, 20, 'Iure adipisci qui commodi deleniti eum porro placeat dicta. Aut nulla dolore quis. Et provident ducimus omnis dolorem consequatur nobis quia eos. Nulla sit sapiente veniam consectetur omnis quas. Quia nihil nam sit nisi.', 0, 1),
(120, 'maxime voluptas', 'Port Violafurt', 'Maryland', 15.00, 14.00, 5, 20, 45, 'Voluptatem est aut quia vitae atque rerum.', 25, 14, 'Et illo consequuntur id ipsam eius. Veritatis et modi sit ut totam fuga.', 0, 0),
(121, 'libero cupiditate', 'West Rashad', 'Connecticut', 8.00, 19.00, 6, 30, 25, 'Molestiae eos assumenda aut ut qui quia aut.', 5, 4, 'Qui non dolor inventore. Tempora quo facilis aut ut et. Dolorum velit iste sit nulla. Rerum quia voluptatem sunt eius.', 0, 1),
(122, 'dicta', 'North Jeramie', 'Virginia', 5.00, 17.00, 1, 12, 1, 'Quia eveniet accusamus hic sed.', 5, 10, 'Eaque excepturi rerum quia ullam dolores dolores id repellat. Ducimus sunt sapiente error laborum tempora. Aliquam et ea aut occaecati id nam officiis.', 0, 0),
(123, 'neque sit', 'Hackettfurt', 'Maine', 18.00, 15.00, 5, 21, 12, 'Nisi occaecati aperiam repellendus reprehenderit excepturi.', 29, 14, 'Consequatur alias vero dolorem incidunt praesentium quia ut. Totam voluptatum occaecati nam quo tenetur magnam. Ducimus iste quas ut odio aut omnis. Unde officiis tempora velit ut.', 0, 0),
(124, 'qui dolore', 'New Bartonview', 'Ohio', 20.00, 16.00, 3, 9, 9, 'Animi voluptate aut iste dolores et voluptatem consequuntur.', 17, 13, 'Qui saepe iure dolor laudantium consequatur laboriosam. Libero adipisci temporibus earum.', 0, 1),
(125, 'omnis et', 'South Harry', 'Oklahoma', 16.00, 15.00, 1, 7, 32, 'Iste quia in ipsum nobis aut maxime ipsum.', 12, 12, 'Quia nam tenetur officiis. Deserunt reiciendis non quas nostrum molestiae eius quia. Ut tenetur ipsa omnis provident qui similique. Et expedita facere tenetur vero.', 0, 0),
(126, 'ea non', 'North Vedastad', 'Indiana', 18.00, 19.00, 6, 7, 48, 'Totam ad laudantium aut error accusamus labore.', 29, 17, 'Et sit molestiae voluptatum inventore eos. Quaerat quaerat et ut id. Ullam veniam cum esse incidunt corporis dolor sit omnis. Quia eum quidem sunt eligendi provident nihil.', 0, 1),
(127, 'sit placeat', 'Roxanneview', 'Georgia', 18.00, 20.00, 8, 15, 49, 'Velit aut dolor quam eveniet quis quo qui.', 19, 16, 'Consectetur est sit voluptatem dolore. Optio magni officia incidunt dolorem fuga omnis qui. Eum non mollitia et accusantium facilis. Iure in provident aut labore cupiditate illum quia.', 0, 0),
(128, 'et', 'South Athenabury', 'Arkansas', 17.00, 15.00, 9, 25, 2, 'Neque sunt aut labore doloremque.', 6, 13, 'Consequatur alias sed odio sed. Sit veritatis sint quos modi minus mollitia. Officiis sint eaque quod pariatur impedit odit consequatur quo. Qui et ipsa quod odit.', 1, 0),
(129, 'dolores', 'Lake Marley', 'Oregon', 12.00, 5.00, 11, 15, 22, 'Consequatur non sunt voluptate inventore voluptate sint.', 13, 3, 'Magnam asperiores et ea accusamus totam fuga. Eius rem voluptates quis vero est praesentium eaque. Architecto error dicta qui est dolor quia.', 1, 0),
(130, 'quaerat', 'Kovacekview', 'Idaho', 12.00, 17.00, 9, 23, 26, 'Delectus qui cupiditate et itaque sequi.', 23, 1, 'Veniam molestias enim officiis omnis soluta ad. Ipsam nisi nostrum quis. Deleniti nihil rerum consequatur rerum excepturi eum ea. Reprehenderit nisi omnis impedit qui iusto atque impedit.', 0, 0),
(131, 'quo', 'Port Jonatanfort', 'Vermont', 14.00, 7.00, 1, 19, 45, 'Dicta in minus nesciunt deserunt.', 3, 17, 'Amet eos et ut quae error sapiente. Magnam maiores quaerat facilis hic odit quisquam. Et rerum rem similique ab architecto qui. Non magni occaecati similique neque eligendi est. Nihil cum debitis ut.', 0, 1),
(132, 'consequatur consectetur', 'Port Jaclyn', 'Connecticut', 9.00, 13.00, 11, 16, 30, 'Iure dolores odit saepe architecto consequatur dicta fuga.', 22, 9, 'Quisquam officia aut iste eligendi. Ut commodi alias ducimus totam quos autem tempora magnam. Quia quidem et cupiditate et aliquam officia dignissimos. Dolore eum sed magnam harum laboriosam.', 1, 1),
(133, 'sint ut', 'West Karli', 'Nevada', 16.00, 5.00, 12, 5, 3, 'Voluptate minus aperiam animi omnis voluptatem beatae.', 3, 19, 'Aspernatur laborum vero repellat quas voluptatem fugiat. Tempore itaque aut quo velit. Recusandae inventore esse soluta sint. Impedit et ut necessitatibus praesentium.', 0, 0),
(134, 'vitae', 'East Estebanside', 'Alaska', 14.00, 15.00, 2, 12, 4, 'Ut assumenda accusamus est dolorum.', 24, 6, 'Ut quisquam nesciunt exercitationem explicabo id. Dicta voluptatem et cupiditate. Hic vel odit consequatur iusto et nam. Et quia voluptatem omnis sunt et voluptatum.', 0, 0),
(135, 'amet', 'Jalenburgh', 'Connecticut', 14.00, 20.00, 12, 28, 32, 'Corporis molestias possimus autem sit est maiores.', 29, 7, 'Consequatur quo quibusdam non neque. Eaque a sequi quibusdam iste at voluptas nulla. Aspernatur perspiciatis et in itaque.', 0, 1),
(136, 'perferendis quae', 'Kuphalton', 'Massachusetts', 9.00, 5.00, 6, 5, 19, 'Iusto exercitationem aut eveniet dolorem quia itaque nisi.', 7, 3, 'Non nam quos quis sed voluptatibus. Quidem commodi error debitis enim voluptas blanditiis. Debitis ut hic provident autem aut nemo.', 0, 0),
(137, 'quaerat laboriosam', 'Abshireview', 'Iowa', 15.00, 14.00, 3, 1, 30, 'Omnis reprehenderit nemo eos odit.', 11, 11, 'Itaque sunt dolor sit iste quis est vel. Et adipisci dolor recusandae repellendus. Earum saepe nam velit aliquam deserunt eos quisquam. Quia enim facere est ut eaque. Illo esse corrupti temporibus officia.', 0, 1),
(138, 'magnam', 'West Jackeline', 'Idaho', 10.00, 18.00, 8, 12, 26, 'Laudantium hic molestiae deleniti maiores architecto.', 24, 7, 'Similique dolorem nam ut eius distinctio praesentium assumenda. Ipsa delectus voluptates eligendi qui expedita et inventore. Deserunt omnis sint omnis similique nihil et. Dolores doloribus voluptatem voluptatibus ipsam placeat nobis distinctio.', 0, 0),
(139, 'est deserunt', 'Blockland', 'North Dakota', 10.00, 6.00, 6, 24, 35, 'Perferendis id ratione quis.', 27, 6, 'Fugit magnam inventore fugiat animi. Vel nulla laudantium necessitatibus ut sit voluptatibus. Omnis id quis expedita.', 1, 0),
(140, 'cumque amet', 'South Fordfort', 'Tennessee', 12.00, 13.00, 12, 3, 47, 'Sit sint quasi atque tempore maiores.', 11, 1, 'Culpa tempora excepturi culpa nulla sapiente autem. Provident ullam repellat modi ex et labore. Error et debitis repellat voluptatem qui. Occaecati alias et at.', 0, 1),
(141, 'reprehenderit labore', 'West Marilyneview', 'Minnesota', 15.00, 16.00, 4, 27, 40, 'Est necessitatibus deserunt modi quo labore.', 17, 17, 'Ullam non ut consequuntur expedita id dolores facilis. Architecto voluptas adipisci dolor eius velit neque aut. In ratione voluptatem id ullam amet porro.', 1, 0),
(142, 'nesciunt omnis', 'North Jamil', 'New York', 7.00, 6.00, 5, 15, 20, 'Id est magni quo rerum maiores.', 22, 16, 'Eaque voluptate accusamus deserunt quasi aut quo eius. Quasi asperiores tenetur consequatur qui voluptatem et. Voluptatem autem dolor est omnis rerum iusto omnis enim.', 0, 0),
(143, 'eum repudiandae', 'Port Jermaine', 'Georgia', 5.00, 18.00, 6, 16, 10, 'Optio voluptate ab repellat reiciendis accusantium aliquam aut esse.', 8, 9, 'Veritatis est ea animi maxime voluptatem itaque. Illum qui aut ut saepe amet. Autem molestias ut enim ipsa ducimus molestias dolorem expedita.', 0, 1),
(144, 'vitae qui', 'New Zelmaville', 'South Carolina', 13.00, 19.00, 7, 27, 41, 'Rerum ipsa eius autem necessitatibus.', 1, 4, 'Vero et quibusdam sed illum sit. Natus hic aliquid amet suscipit harum dolorem. Molestias qui nihil autem ullam aut quibusdam. Error ad ad voluptas tempore.', 0, 0),
(145, 'mollitia dolorem', 'North Aniyahberg', 'Connecticut', 16.00, 6.00, 5, 18, 31, 'Quas itaque fugiat consectetur tenetur commodi.', 26, 18, 'Saepe ut impedit et. Debitis dolor quia sint inventore totam placeat. Iste amet sequi sit suscipit est quo quos explicabo. Cupiditate rerum quia adipisci occaecati minus.', 1, 1),
(146, 'voluptas', 'Cummerataborough', 'Mississippi', 5.00, 5.00, 9, 22, 32, 'Assumenda cum omnis dolorem numquam dolorem provident fugiat.', 18, 14, 'Non rerum corrupti sapiente quo voluptates aut. Corporis reprehenderit deleniti neque dolores voluptatibus omnis officia. Eum nulla error unde. Maiores dolorum accusantium voluptatem rem.', 1, 0),
(147, 'aperiam rerum', 'Tiannachester', 'Rhode Island', 13.00, 13.00, 1, 30, 34, 'Unde fugiat similique distinctio.', 13, 14, 'Aliquam quidem asperiores neque est cupiditate expedita id. Aut quibusdam error magni recusandae. Voluptas enim facilis illum unde aut ipsum. Velit voluptas esse cupiditate praesentium voluptatem.', 0, 0),
(148, 'incidunt', 'Odellbury', 'Alabama', 19.00, 8.00, 1, 19, 4, 'Odio tempora voluptas officiis ut laboriosam laudantium aut.', 7, 19, 'Illum dolores nulla deserunt. Quos voluptates eius deserunt maxime non est hic deserunt. Aliquam optio est corporis enim adipisci ut deleniti. In suscipit aperiam eligendi qui eos optio.', 0, 1),
(149, 'velit architecto', 'Danielborough', 'Arkansas', 9.00, 19.00, 7, 29, 8, 'Molestias autem at recusandae temporibus autem corrupti fugit nihil.', 2, 18, 'Dicta est dolores non recusandae. Culpa qui atque quos.', 0, 0),
(150, 'alias', 'Stiedemannside', 'Michigan', 17.00, 18.00, 6, 18, 40, 'Sed nihil voluptatem optio molestiae nesciunt nihil dolorum.', 9, 8, 'Nihil voluptatem quo earum sed quia esse. Aut deleniti possimus et et. Alias in vel quam et voluptatibus dolorum sit architecto.', 0, 0);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_12_060207_create_customers_table', 2),
(6, '2023_09_12_060234_create_invoices_table', 2),
(9, '2023_09_19_135210_add_item_column_to_items_table', 3),
(10, '2023_09_20_081251_add_column_to_items_table', 4),
(11, '2023_10_05_084136_add_columns_to_items_table', 5);

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
(8, '360 graden camera', 'https://data.kommago.nl/img/products/large/78731_Ubiquiti-UniFi-AI-360-1.webp', 1),
(9, 'CategoryTest', 'https://picsum.photos/200', 2),
(10, 'CategoryTest', 'https://picsum.photos/200', 2),
(11, 'CategoryTest', 'https://picsum.photos/200', 2),
(12, 'CategoryTest', 'https://picsum.photos/200', 2),
(13, 'CategoryTest', 'https://picsum.photos/200', 2),
(14, 'CategoryTest', 'https://picsum.photos/200', 2);

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