-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2019 at 12:40 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2019_09_26_web_articles`
--
CREATE DATABASE IF NOT EXISTS `2019_09_26_web_articles` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `2019_09_26_web_articles`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(36, 'PHP'),
(37, 'Symfony'),
(38, 'Laravel'),
(39, 'Back End'),
(40, 'Security'),
(41, 'Front End'),
(42, 'Python');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191024083649', '2019-10-24 08:36:55');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` date NOT NULL,
  `published` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `category_id`, `user_id`, `title`, `content`, `image`, `created`, `published`) VALUES
(1, 36, 11, 'Pariatur iusto quia officiis rerum sed.', 'Et qui accusantium voluptatem minus soluta temporibus. Laudantium voluptas sint asperiores quae enim tenetur ab. Veniam ratione eveniet ut dignissimos beatae libero voluptas.\n\nNumquam reiciendis qui ut omnis ut odit. Provident non sapiente autem deserunt error omnis ipsa rem.\n\nSed unde dolores eius quas eligendi sed aut id. Architecto possimus pariatur ad cumque qui voluptas suscipit. In rerum doloribus quo ea delectus. Iste natus quisquam nulla eligendi.', '1.png', '2019-01-15', '1'),
(2, 42, 7, 'Vel impedit et et.', 'Eligendi laudantium assumenda sed dignissimos molestiae. Praesentium cum minus ut veritatis perferendis id. Omnis reiciendis a deleniti dolor enim. Excepturi consequuntur et qui temporibus.\n\nQuis nobis atque minus quisquam. Consequuntur quis tempora ad. Quibusdam ratione culpa sed consequuntur quo. Omnis quis blanditiis aut deserunt. Nihil repellat beatae blanditiis molestiae.\n\nDoloremque corporis itaque et nulla. Quo illum voluptas ut facilis.', '2.png', '2018-11-03', '1'),
(3, 36, 8, 'Nam quis minima labore dolorem at.', 'Qui suscipit facilis rem id at rerum eum. Dignissimos voluptatem dolorum omnis nulla rem harum. Voluptates autem praesentium nihil nemo. Dolorum beatae ratione tempore aut veritatis excepturi. Consectetur et fugit repellendus eum vero.\n\nSuscipit dolorem quis animi dolorem sunt. Harum similique cum ut qui pariatur laudantium. Voluptas voluptates voluptatum soluta laboriosam cum vitae sit totam. Accusamus iste atque molestiae fugiat quia itaque.\n\nQui nulla numquam voluptatibus fuga rerum adipisci. Officia dolorem vitae consequatur sit atque. Hic accusamus qui debitis facilis doloribus corporis. Minima provident sunt aliquam magnam.', '3.png', '2019-04-17', '1'),
(4, 40, 9, 'Deserunt illo occaecati et delectus.', 'Non ipsa occaecati et quo omnis. Ut cum sunt voluptatibus consequatur omnis sapiente. Minus molestiae quod veniam. Quisquam voluptatem vero nesciunt velit ratione nihil est.\n\nSoluta error labore quo qui odio excepturi. Accusantium facere nesciunt incidunt maiores error quo. Consequatur provident dignissimos expedita consequatur voluptatum eligendi molestiae.\n\nAut eos tenetur dolore repellat. Quisquam ut accusamus qui sed sed officiis. Cupiditate minus nam aut eveniet voluptatem at aspernatur.', '4.png', '2019-06-10', '1'),
(5, 42, 24, 'Sed voluptatem harum ipsam quia.', 'Eligendi at hic consequatur qui ut saepe soluta. Vel repellendus architecto earum ab id dolor qui. Facere facilis est voluptates consequatur fugit quis et. Ut possimus labore esse quo explicabo.\n\nMinima maxime quia maiores aspernatur sed modi quisquam. Velit vitae porro dolore. Consequatur neque tempore quam nam nihil molestias vel. Ut ratione quod sit a quae.\n\nVoluptates non vel eaque perferendis. Est aspernatur eum quo est eos. Veritatis harum impedit aut aut. Quaerat fugiat id est sed maiores alias a. Dolor impedit facilis doloremque optio molestiae voluptatum et.', '5.png', '2019-09-16', '1'),
(6, 42, 23, 'Dolores earum tempore aliquid ut laborum.', 'Quos assumenda qui autem. Est expedita deleniti consectetur ipsum. Totam blanditiis quos libero labore sed.\n\nUt sequi eaque vitae rerum fugit. Cumque pariatur cumque ut dolor. Sequi facere aperiam qui.\n\nOmnis sunt esse assumenda. Doloribus nobis provident odit fuga dolorem. Voluptatem et est molestias at eligendi illo quis.', '6.png', '2019-06-27', '1'),
(7, 37, 29, 'Eos blanditiis ut est dolores ad.', 'Temporibus nihil et non sit dolores dolores voluptatibus. Cum soluta temporibus eveniet et unde aut iste autem. Et maxime quaerat tempore quo. Voluptatem vel a nulla.\n\nRem ad consequatur voluptatem ea ad. Est est distinctio perferendis qui velit sit quidem. Voluptate molestiae amet et. Quia adipisci eos aut totam. Non corrupti accusantium quae placeat.\n\nAutem veritatis saepe est accusamus sed. Consequatur maxime autem laborum nihil itaque voluptatem dolorum. Occaecati sit aut ipsum et quia.', '7.png', '2019-06-01', '1'),
(8, 41, 10, 'Sed rerum repellendus consequuntur.', 'Facilis esse nisi sint. Dolore qui facilis inventore dolores dicta. Ipsam iure beatae accusantium ipsam dolorem incidunt necessitatibus vitae. Dignissimos veniam numquam sint quia deleniti.\n\nEt illum similique ipsum est est. Explicabo a aperiam nihil pariatur fugiat sit. Neque qui et laborum est nulla officia.\n\nNostrum tempora minus odit consequuntur non. Fugit cumque fugiat dolore id ex ad. Veritatis omnis eaque pariatur dolores maiores incidunt neque. Qui quis quod cumque quae modi.', '8.png', '2019-05-09', '1'),
(9, 37, 3, 'Labore nisi amet quisquam cumque.', 'Odit rerum cupiditate et corrupti est. Aut quia in quas. Harum sequi nulla quia repellendus rerum. Quo illum voluptas culpa nesciunt odit.\n\nAtque consectetur minima eos qui quia perferendis nisi qui. Dolorum dicta et quo temporibus exercitationem eum. Animi non saepe necessitatibus eveniet. Quod non nemo id nam.\n\nMinima quia aut nesciunt ducimus. Odio hic et sint placeat ratione voluptatem. Enim vel repellendus perspiciatis neque laboriosam rerum similique. Provident nisi iure sunt accusantium rem aut accusamus. Ut voluptas molestias omnis fugit quis et quibusdam beatae.', '9.png', '2019-08-22', '1'),
(10, 38, 5, 'Est nulla adipisci dolor non omnis.', 'Consequatur qui nemo sint esse ratione. Voluptatibus sapiente eos in quis suscipit minima totam.\n\nAccusamus error velit velit dolorem. Expedita accusantium sunt dolorem enim fugiat minima ut. Voluptas ut qui nobis neque nam cumque.\n\nFugiat repellat itaque aspernatur laborum doloremque reprehenderit doloribus. Dolore esse porro est quia id provident ut. Provident doloribus distinctio quasi voluptas quisquam maiores qui. Et ut animi veritatis sed. Praesentium amet corrupti architecto ab et labore voluptatem.', '10.png', '2019-06-20', '1'),
(11, 36, 30, 'Soluta labore eligendi.', 'Vel consequuntur vel cupiditate nobis. Odio explicabo a consequuntur excepturi. Enim provident nemo facilis nihil consequuntur vero facilis.\n\nFugiat est nobis quo libero sunt. Aspernatur et nihil ipsam non consequatur non. Beatae pariatur numquam doloremque veritatis temporibus animi beatae.\n\nDolorem eum aut distinctio quia ut ipsa. Natus voluptatum voluptas cupiditate voluptate magnam repellat. Non aut beatae ut similique et.', '11.png', '2019-04-06', '1'),
(12, 37, 19, 'Est et dolor nesciunt ea est.', 'Quia iusto quo unde soluta. Animi est maxime et architecto dolorem. Molestiae et ab et maxime in fugit enim. Exercitationem et numquam optio possimus nihil occaecati.\n\nRepellendus dolorem quod est error ea eos repellat vel. Qui sed aut tempore repellendus quasi pariatur aut. Omnis iure officiis perspiciatis veniam unde natus. Ipsa aperiam saepe accusantium aliquam.\n\nLabore esse odio atque rerum aspernatur optio. Non beatae sit nihil aut. Est aperiam aspernatur facilis ut facere dicta. Nemo est voluptatem et.', '12.png', '2018-12-15', '1'),
(13, 40, 2, 'Similique quo esse iste.', 'Inventore officiis quos libero omnis ad. Natus quam sit rerum. Est quo aliquam sed illo aut consequuntur.\n\nVoluptate ut molestias dicta eos. Nobis sed odit nesciunt necessitatibus eum. Est fugit rerum consequuntur modi.\n\nPariatur sequi quod rem corrupti aut quisquam magni. Velit blanditiis molestias id. Ut temporibus corporis voluptate rem est minus.', '13.png', '2019-10-23', '1'),
(14, 37, 17, 'Est itaque cum omnis ratione.', 'Dolor aut commodi quod aut quas. Voluptas eveniet nostrum et voluptate illum. Et sit quos optio. Dicta non enim molestiae totam nesciunt distinctio.\n\nEst tenetur id perspiciatis sit incidunt aperiam ea. Deleniti quaerat tempora assumenda placeat ratione qui. Nostrum accusantium dolorum suscipit maiores vero officia quia.\n\nHic sapiente consequatur tenetur deleniti voluptas praesentium voluptate. Iste eos ut qui necessitatibus aspernatur cum quod maiores. Eveniet at quas omnis.', '14.png', '2019-09-11', '1'),
(15, 40, 13, 'Quae harum ut qui quidem rerum.', 'Omnis ipsum ut ducimus minus repudiandae autem dolorem non. Facilis expedita error qui tempore consequuntur recusandae. Et quas odit reprehenderit eum sunt. Accusamus fugiat impedit nostrum aperiam.\n\nSit consequatur sit quia a. Error facilis unde aut fugit nulla recusandae. Et quidem rerum quisquam necessitatibus. Magni corrupti enim consequatur culpa autem delectus quis.\n\nRatione est eveniet perspiciatis alias iure sit labore. Et et molestiae eos sunt impedit eum nihil. Cum qui quibusdam quae sit. Sit accusamus accusamus sint tempore beatae.', '15.png', '2019-05-10', '1'),
(16, 39, 13, 'Tenetur enim repudiandae.', 'Reiciendis sunt dolorem laboriosam id impedit. Aut veniam et illum eius. Aliquam quis tempore nobis maiores non.\n\nNihil qui et velit fugiat aut minima praesentium similique. Cupiditate ducimus molestiae eos ipsa sit et commodi. Ut rem libero velit a sit accusamus. Omnis magni velit at deserunt nihil perspiciatis voluptas.\n\nNon molestias explicabo dolores voluptatem et. Ducimus nihil perspiciatis cum eaque et maxime.', '16.png', '2019-09-16', '1'),
(17, 41, 14, 'Facilis eos voluptatibus.', 'Dolor aperiam exercitationem aut incidunt perferendis atque. Ut tempore veniam molestiae sunt. Molestiae et aut nam molestias.\n\nArchitecto blanditiis adipisci placeat vero consequatur. Fuga quo quam delectus saepe quis veniam laborum. Accusantium ullam fugit aliquam pariatur facere nihil.\n\nVoluptatem voluptates ut explicabo ut beatae. Quo dolor quas velit eum et in et. Reprehenderit et dignissimos qui recusandae. Aperiam totam dolor rerum ut enim dolor necessitatibus.', '17.png', '2019-07-04', '1'),
(18, 40, 28, 'Exercitationem qui ut.', 'Dignissimos aperiam incidunt aliquam. Vel et tempora molestiae ad alias sequi. Sed voluptates rem perferendis reprehenderit. Harum laudantium dolor est cupiditate. Fugit repudiandae aut sit aut nihil.\n\nEst voluptas possimus omnis enim dolor sit. Quod expedita quia sint in quia doloremque. Libero autem repellendus accusamus est.\n\nSint aut voluptatem unde consequatur aspernatur sed possimus. Maxime voluptatem quidem qui unde voluptas voluptate tenetur quia.', '18.png', '2019-07-24', '1'),
(19, 39, 3, 'Error repellat aliquam sapiente.', 'Qui eum omnis veniam numquam sed suscipit. Sed occaecati ut voluptatem aspernatur ducimus nesciunt autem. Voluptas recusandae soluta modi sequi porro consectetur. Voluptatum laborum facilis molestiae non blanditiis quasi.\n\nEt et odit repellat mollitia omnis. Inventore eaque eligendi perspiciatis maxime cumque delectus. Sunt consectetur veniam omnis omnis quis debitis. Voluptas aut architecto cupiditate rerum dignissimos et.\n\nVoluptas rerum nostrum cupiditate nihil repudiandae sint. Enim quis explicabo et suscipit sequi animi. Aut eos labore eligendi totam. Praesentium explicabo nihil debitis a.', '19.png', '2019-07-20', '1'),
(20, 39, 26, 'Ea et similique ipsum omnis.', 'Est perferendis quo accusantium corporis velit. Modi autem dolores nemo. Et veritatis consectetur tempora.\n\nVel tempora ad reiciendis aut ut non reprehenderit doloribus. Illum cum aut quia delectus voluptas. Et maxime quo cumque et assumenda vitae qui. Praesentium doloribus impedit saepe odio.\n\nVoluptatem sequi nemo quia. Ut explicabo aut dolorum magni aperiam. Et vel deserunt consequatur et facilis delectus. Est ducimus earum iste debitis eligendi. Et necessitatibus inventore sit et est.', '20.png', '2019-03-15', '1'),
(21, 37, 31, 'Qui suis‑je ?', 'Test de vérification de nouvelle article avec le bon utilisateur.', 'default.png', '2019-10-25', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `user_name`, `email`, `password`) VALUES
(1, 'Gaz‑mên', 'Ari‑fi', 'Nemzag', 'nemzag@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$TmZRSzJvTFZDc1k5empwaQ$dWeE2EAcmkoG0NuJaoyuhpiXLvtwIi48gjQiD4j/tzQ'),
(2, 'Bertrand', 'Lemaitre', 'BertrandLemaitre', 'BertrandLemaitre@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$UFNtYXRGR3ROOVVobVNsaA$MM2YcoahEppCtpUsswl/BWxBEoJSI+0yVyU4g2mtp4U'),
(3, 'Bernadette', 'Navarro', 'BernadetteNavarro', 'BernadetteNavarro@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$L0tiS1ZJemtJMFBtRi9GQg$MjTgYTh/sAkl3dDTNrc5BoEdHG3XiqFgqj0g1WB0hXc'),
(4, 'Valérie', 'Pineau', 'ValériePineau', 'ValériePineau@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$dVJtSnZRL1VZelBZQ3Z4WQ$HjDqnax9M7/VRWoV9breDdF3xGbiijmaGEGTDYg0yIg'),
(5, 'Philippine', 'Blanc', 'PhilippineBlanc', 'PhilippineBlanc@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$dlpsdGFRZ0V4Tk1CN0hreQ$iw6PDg/gVYjVHD7lipfCSm99cNmzwebY+JW6kvmayak'),
(6, 'Rémy', 'Rossi', 'RémyRossi', 'RémyRossi@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$SHZ1bmttaVREN1p0L3k5NA$RCXp3CFzwK8pCJ3ZSGbOJpn/0zuGUCeXo4AQoa/kEWs'),
(7, 'Aimé', 'Breton', 'AiméBreton', 'AiméBreton@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$NVBnemNvbkxZQVFLZlVHNA$iYEehyL31qlo3OK28ci7fyEfph9cKHJgzgGzBxHhguA'),
(8, 'Patrick', 'Gallet', 'PatrickGallet', 'PatrickGallet@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$OXJ5S3pNZnFnaUduVWh3eA$dcCrDx2MKG6RKUBORCOniAyV6G87uTKIyQNnR4U4utk'),
(9, 'Édouard', 'Barbier', 'ÉdouardBarbier', 'ÉdouardBarbier@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$LmhXaVhlZmxrZ3NwYi9kTg$kLysJsk+ZabNACqc9pNjhTlUHrtzJIMqCBplNWPZLyw'),
(10, 'Laure', 'Barre', 'LaureBarre', 'LaureBarre@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$N0h2MWtRVkhhYkdHc1hMdg$lJE+GaL8nlkyxZEAwFmeJkpaCss4oZZqjlHZ8lAandI'),
(11, 'Éric', 'Bigot', 'ÉricBigot', 'ÉricBigot@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$MW5WRFl1SGNoQUd1YmI2RQ$G4cgJk65Z7dDYLsxUNh4V3WnLuXlOdAp3/nYQ0SNAVU'),
(12, 'Gabriel', 'Hubert', 'GabrielHubert', 'GabrielHubert@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$UlN1bHZSSzRMcDFlVnU1MA$3GQyPQX+gUchv/Ua+gl63+Ow3uVcy/H/8TbC6SBwcmE'),
(13, 'Charles', 'Barre', 'CharlesBarre', 'CharlesBarre@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$cjZCVzUzdVZyemtHbmpVSg$eyZhCKs2FUAQEqFazO1arzkb9zrcUXLs0cLOHZnCOCQ'),
(14, 'Gérard', 'De Sousa', 'GérardDe Sousa', 'GérardDe Sousa@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$VngzTnJmaXMvZG9ib3l5TQ$DQmEs2qZdizvMgmvH0Bt+shXO0jrVzi14x6xbS9Muz0'),
(15, 'David', 'Caron', 'DavidCaron', 'DavidCaron@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$UDBOdDROLlZ5WEs5WFp4dQ$xRh7DOqA66Egu6LBq2Yl5pj69gGD5jW/223g7JtujxU'),
(16, 'Marianne', 'Schneider', 'MarianneSchneider', 'MarianneSchneider@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$QmVmS1JhRWZFYUQwY0J6Zw$cHfQAp/pGLdzPQCQerQ7gsxeueqDg8K7ahQJM287z7Q'),
(17, 'Marc', 'Roger', 'MarcRoger', 'MarcRoger@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$RW1icHJ1cFVRa1gwa2ZCSA$ZuwGYYE+V1VFw+OKmyIWYVhZcQNSuOnIZcBiizxDc/I'),
(18, 'Xavier', 'Vincent', 'XavierVincent', 'XavierVincent@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$SGJGeVFVRmZKemI1WGp6Sw$CmMFlkOoJ51t8XnB2jWMgEvgbT/uwLd6N5FeqDAvWTI'),
(19, 'Adélaïde', 'Lefort', 'AdélaïdeLefort', 'AdélaïdeLefort@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$OGpwdHhqYXF3STRkU0l2Zw$skXAH42gjWZY+3KTYByTlpw1lrrPtjRdmbLQWqKERWI'),
(20, 'Roland', 'Descamps', 'RolandDescamps', 'RolandDescamps@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$WFRncHNHRlhmYjdvTW91bA$Ahc8aGEiCTMC9vFeMi2MwXTSmwW9ddDAe6qo3jRb2i4'),
(21, 'Aimé', 'Rousset', 'AiméRousset', 'AiméRousset@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$VXhuNjg2bTE1ZEEvbi5obQ$arEUmX8JL1bumIodbZM2JZ++xW0dow4dwFmxWngt2mo'),
(22, 'Gilbert', 'Courtois', 'GilbertCourtois', 'GilbertCourtois@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$ZzlVSjdUTEhDeUhzazFCVA$8oeqMP7CF2y5xNPrE/TA0caSPCfEB1t4G0L0LLp96hI'),
(23, 'Sébastien', 'Foucher', 'SébastienFoucher', 'SébastienFoucher@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$dG9HSmpoaFBNaHF3ZFM1NA$og048sl7Wdoo7EYjg7Ue3LPQPpNBm3VJq0iGJUqCVd0'),
(24, 'François', 'Boyer', 'FrançoisBoyer', 'FrançoisBoyer@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$WVBwOVBFSjRCMEdEdFFuQQ$76Ljygzz4KTTkHCOpQfCu4lAWCSRgBY3qSCX4bxi8c4'),
(25, 'Georges', 'Pinto', 'GeorgesPinto', 'GeorgesPinto@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$eVpOOXN3T2E5WDltNHNLMA$UhW+HHgkVdCOpJNKNLcluj9/i19T3AgH6Ch9kCSyqRs'),
(26, 'Alphonse', 'Pires', 'AlphonsePires', 'AlphonsePires@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$R0lqNlNVVk42bFVZLkVDdA$Q0KX/uXA94oLZgHe6M/0nPXGSQaGfvWgKPP+ld7rIGk'),
(27, 'Lucy', 'Legendre', 'LucyLegendre', 'LucyLegendre@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$Ni9GNEZ2Q2ZMbTIyMFoySg$spxgXHVmO8/jaxX45RZ09iritVZBrn2NEnnNam0rrb0'),
(28, 'Auguste', 'Perret', 'AugustePerret', 'AugustePerret@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$NUxSZXJEL05jcTdHZS44dA$NlGYAqXl6paoRkZPaKMDEeJiXFSNw7OlpW4zt0QcKFM'),
(29, 'Alice', 'Hubert', 'AliceHubert', 'AliceHubert@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$NElzQ0RGTzVKbC5lM1FsNw$mQuXl3LtLuuf7QLFkeYBsQOS63er9SCiErTMpwGGQk8'),
(30, 'Benoît', 'Boulay', 'BenoîtBoulay', 'BenoîtBoulay@domain.ext', '$argon2i$v=19$m=65536,t=4,p=1$RkEzc0pnQmVRWWt6OW5LZg$I1N1K7OQ6spbuuTBPnWICTBFJ6HyZ02xi919rzgAlP4'),
(31, 'John', 'Doe', 'doe', 'doe@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$c0wubTBIdzJsOVJUajczVQ$OSNo0G4BZuF10QBAIot39mBDJZ6GgG1aFIEmn5xZAe0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A8A6C8D12469DE2` (`category_id`),
  ADD KEY `IDX_5A8A6C8DA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
