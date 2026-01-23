-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 23 jan. 2026 à 11:53
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `smart_recipe_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_global` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recipes`
--

INSERT INTO `recipes` (`id`, `user_id`, `title`, `description`, `image_url`, `created_at`, `is_global`) VALUES
(13, 4, 'flngrog', 'fngojgrlg', 'https://www.bing.com/images/search?view=detailV2&ccid=WaUrRgAI&id=65E8562C78F912B085566A90807F74374894F1D9&thid=OIP.WaUrRgAI_usCcs25m-_J-AHaE7&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.59a52b460008feeb0272cdb99befc9f8%3frik%3d2fGUSDd0f4CQag%26riu%3', '2026-01-21 10:31:02', 0),
(14, 4, 'djfnjezf', 'qnflenfej', 'https://www.bing.com/images/search?view=detailV2&ccid=WaUrRgAI&id=65E8562C78F912B085566A90807F74374894F1D9&thid=OIP.WaUrRgAI_usCcs25m-_J-AHaE7&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.59a52b460008feeb0272cdb99befc9f8%3frik%3d2fGUSDd0f4CQag%26riu%3', '2026-01-21 10:36:28', 0),
(15, 4, 'fnzef', 'ndfzejlfze', 'https://th.bing.com/th/id/R.59a52b460008feeb0272cdb99befc9f8?rik=...&pid=ImgRaw&r=0', '2026-01-21 10:47:14', 0),
(16, 4, 'djnsuisf', 'dflnzeufozef', 'https://www.buenprovecho.hn/wp-content/uploads/2020/09/tomate-1024x680-1.jpg', '2026-01-21 11:02:59', 0),
(17, 5, 'sd fjfzfz', 'ldkfolf fr', 'https://images.herzindagi.info/image/2019/Jul/tomato-for-diabetes-main.jpg', '2026-01-21 11:14:21', 0),
(28, 1, 'Pancakes moelleux', 'Ingrédients par personne :\n\n200 g farine, 250 ml lait, 1 œuf, 2 cueille à soupe de sucre, 1 cueille à soupe de levure, 50 g beurre fondu.\n\nPréparation :\n\nMélange secs + liquides (grumeaux ok).\n\nCuire à la poêle 2-3 min chaque côté.\n\nServir chaud avec ce que tu veux.', 'https://missudetteandco.com/wp-content/uploads/2021/09/recette_pancake-scaled.jpeg', '2026-01-21 11:45:51', 1),
(29, 1, 'Salade de quinoa', 'Ingrédients par personne :\n\n150 g quinoa\n\n1 tomate, ½ concombre, 1 carotte râpée\n\n1 cueille à soupe d\'huile d’olive, jus de citron, sel, poivre\n\nHerbes au choix (persil, menthe…).\n\nPréparation :\n\nCuire le quinoa 12 min, laisser refroidir.\n\nMélanger légumes + quinoa.\n\nAssaisonner avec huile, citron, sel, poivre et herbes.\n\nServir frais.', 'https://m1.quebecormedia.com/emp/rqc_prod/recettes_du_quebec-_-94e3e4b9959e9d1bfe33035e73bf6428d848e70b-_-La-salade-de-quinoa.jpg?impolicy=resize&width=1500&height=1500', '2026-01-21 11:45:51', 1),
(30, 1, 'Smoothie fruits rouges', 'Ingrédients par personne  :\n\n150 g fruits rouges (frais ou surgelés)\n\n1 banane\n\n200 ml lait ou jus\n\n1 cueille à soupe de miel (optionnel)\n\nPréparation :\n\nMettre tous les ingrédients dans un blender.\n\nMixer jusqu’à consistance lisse.\n\nServir frais.', 'https://fr.frije.com/content/recipes/21219/800-1.jpg?cc=316758', '2026-01-21 11:45:51', 1),
(31, 1, 'Spaghetti carbonara', 'Ingrédients par personne :\n\n200 g spaghetti\n\n100 g lardons ou pancetta\n\n2 œufs\n\n50 g parmesan râpé\n\nSel, poivre. \n\nPréparation :\n\nCuire les spaghetti al dente.\n\nFaire revenir les lardons à la poêle.\n\nMélanger œufs + parmesan.\n\nÉgoutter pâtes, mélanger avec lardons puis ajouter le mélange œufs/parmesan hors du feu.\n\nPoivrer et servir chaud.', 'https://www.usdairy.com/getmedia/1a9efa87-5f85-4392-8a67-3836755be069/creamy_carbonara.jpg?width=1500&height=1001&ext=.jpg', '2026-01-21 11:45:51', 1),
(32, 1, 'Soupe de légumes', 'Ingrédients par personne :\n\n2 carottes, 2 pommes de terre, 1 courgette, 1 oignon\n\n1 L d’eau ou bouillon\n\nSel, poivre, herbes au choix. \n\nPréparation :\n\nCouper les légumes en morceaux.\n\nFaire cuire 20 min dans l’eau ou le bouillon.\n\nMixer ou laisser en morceaux.\n\nAssaisonner et servir chaud.', 'https://assets.afcdn.com/recipe/20161219/55047_w1296h828c1cx2328cy1425.jpg', '2026-01-21 11:45:51', 1),
(33, 1, 'Omelette aux herbes', 'Ingrédients par personne :\n\n2 œufs\n\n1 cueille à soupe de lait ou crème (optionnel, pour plus de moelleux)\n\nSel, poivre\n\n1 petite poignée d’herbes fraîches hachées (persil, ciboulette, basilic…)\n\n1 cueille à café de beurre ou huile pour la poêle.  \n\nPréparation :\n\nBattre les œufs avec le lait, sel, poivre et herbes.\n\nChauffer beurre/huile dans une poêle.\n\nVerser les œufs battus, cuire 2-3 min à feu moyen.\n\nReplier l’omelette et servir chaud', 'https://www.ilgustoitaliano.fr/wp-content/uploads/2025/10/Recette-classique-omelette-moelleuse-aux-herbes-fraiches-1200x686.jpg', '2026-01-21 11:45:51', 1),
(34, 1, 'Poulet rôti', 'Ingrédients par personne :\n\n1/2 poulet (ou 1 petit poulet pour 2 personnes)\n\n1 c. à s. huile d’olive ou beurre\n\nSel, poivre\n\nHerbes au choix (thym, romarin, ail)\n\nExemple : pour 4 personnes → 2 poulets moyens.  \n\nPréparation :\n\nPréchauffer le four à 200°C.\n\nBadigeonner le poulet avec huile/beurre, saler, poivrer et ajouter herbes/ail.\n\nPlacer dans un plat et cuire 45-60 min (selon la taille), jusqu’à ce que la peau soit dorée et que le jus soit clair.\n\nLaisser reposer 5 min avant de servir', 'https://ffcuisine.fr/wp-content/uploads/2025/01/1735460473-poulet-roti-au-four-recette-croustillante-et-savoureuse.jpg', '2026-01-21 11:45:51', 1),
(35, 1, 'Tarte aux pommes', 'Ingrédients par personne :\n\n1 pomme\n\n1 pâte brisée (compter 1 petite portion de pâte par personne ou 1 pâte entière pour 4-6 personnes)\n\n1 cueille à soupe de sucre\n\n5 g beurre\n\nCannelle (optionnel)\n\nExemple : pour 4 personnes → 4 pommes + 1 pâte brisée entière.\n\nPréparation :\n\nPréchauffer le four à 180°C.\n\nÉtaler la pâte dans un moule.\n\nCouper les pommes en tranches et disposer sur la pâte.\n\nSaupoudrer sucre, cannelle et ajouter quelques noisettes de beurre.\n\nCuire 25-30 min jusqu’à ce que la pâte soit dorée.\n\nServir tiède ou froid.', 'https://www.lecristaldesel.fr/wp-content/uploads/2025/09/1756854734-tarte-croustillante-aux-pommes-decouvrez-la-recette-parfaite.jpg', '2026-01-21 11:45:51', 1),
(36, 1, 'Guacamole', 'Ingrédients par personne :\n\n1 avocat mûr\n\n½ tomate (optionnel)\n\n½ c. à café jus de citron\n\nSel, poivre\n\n1 petite pincée de piment ou coriandre (optionnel)\n\nExemple : pour 4 personnes → 4 avocats, 2 tomates, etc.\n\nPréparation :\n\nÉcraser l’avocat dans un bol.\n\nAjouter tomate coupée, jus de citron, sel, poivre, piment/herbes.\n\nMélanger et servir avec des chips ou légumes.', 'https://www.cuisineactuelle.fr/imgre/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2018.2F09.2F25.2F3a6505ef-7003-4f3f-94a5-32cc8f548a16.2Ejpeg/300x225/quality/80/crop-from/center/poulet-farci-au-guacamole.jpeg', '2026-01-21 11:45:51', 1),
(37, 1, 'Brownies au chocolat', 'Ingrédients par personne :\n\n25 g de beurre\n\n25 g de chocolat noir\n\n20 g de sucre\n\n1 petit œuf\n\n15 g de farine\n\nExemple : pour 4 personnes → 100 g beurre, 100 g chocolat, 80 g sucre, 4 œufs, 60 g farine.\n\nPréparation :\n\nPréchauffer le four à 180°C.\n\nFaire fondre beurre + chocolat.\n\nAjouter sucre, œuf, puis farine, mélanger rapidement.\n\nVerser dans un moule beurré et cuire 15-20 min (fondant au centre).\n\nLaisser refroidir 5 min, couper et servir', 'https://static1.hervecuisine.com/wp-content/uploads/2015/10/brownies.jpg?x89858', '2026-01-21 11:45:51', 1),
(38, 6, 'GKFD', 'FGKFDJGLDG', 'https://m1.quebecormedia.com/emp/rqc_prod/recettes_du_quebec-_-64eef18e822245a0818c321433fb0beb0fa6c83d-_-AdobeStock-227620743.jpeg', '2026-01-21 11:48:52', 0),
(39, 6, 'salade de choux', 'salade de choux blanc', 'https://www.bouvrette.ca/wp-content/uploads/2021/03/salade-chou.jpg', '2026-01-21 15:35:42', 0),
(43, 8, 'patate douce', 'patate douce roti', 'https://larecette.net/wp-content/uploads/2020/04/iStock-1188822882-1152x768.jpg', '2026-01-22 11:23:35', 0),
(55, 9, 'Ndolé Miondo', 'Ingrédients par personne :\n\n50 g feuilles de ndolé\n\n50 g arachides (pâte)\n\n50 g viande ou crevettes\n\n½ oignon\n\n1 c. à s. huile\n\nSel, piment\n\n2 miondo.\n\nPréparation :\n\nCuire la viande avec sel.\n\nAjouter la pâte d’arachide + un peu d’eau, laisser épaissir.\n\nAjouter le ndolé, l’oignon, l’huile, cuire 10 min.\n\nRectifier sel/piment et servir chaud', 'https://douala-guide.com/wp-content/uploads/2023/12/miondo-ndole.jpeg', '2026-01-23 09:19:13', 0),
(56, 9, 'Riz Jollof', 'Ingrédients par personne :\n\n80 g riz\n\n½ oignon\n\n½ tomate\n\n2 c. à s. sauce tomate\n\n1 c. à s. huile\n\nSel, piment, épices.\n\nPréparation :\n\nFaire revenir oignon + tomate + sauce + épices.\n\nAjouter riz + eau + sel, couvrir.\n\nCuire 15–20 min jusqu’à absorption.', 'https://cdn-images-1.medium.com/v2/resize:fit:1024/1*_6Q-7J70koMeNkm4_3nt1A.jpeg', '2026-01-23 09:20:54', 0),
(57, 9, 'ceviche', 'Ingrédients par personne :\n\n100 g poisson cru frais (type cabillaud, tilapia, bar)\n\n½ citron vert (jus)\n\n¼ oignon rouge\n\n½ tomate (optionnel)\n\n1 c. à c. huile d’olive\n\nSel, poivre\n\nPiment ou coriandre (facultatif)\n\nExemple : pour 4 personnes → 400 g poisson, 2 citrons verts, 1 oignon, 2 tomates…\n\nPréparation rapide :\n\nCouper le poisson en petits dés.\n\nAjouter jus de citron, sel, poivre, piment.\n\nLaisser mariner 10–15 min au frais.\n\nAjouter oignon, tomate, huile d’olive, coriandre.\n\nServir frais, en entrée ou léger repas', 'https://myaichef.com/wp-content/uploads/2022/12/ceviche2.png', '2026-01-23 09:23:38', 0),
(58, 9, 'Lasagne allegée au fromage blanc', 'Ingrédients par personne :\n\n2 feuilles de lasagne\n\n100 g fromage blanc 0%\n\n50 g viande hachée (ou légumes pour version végétarienne)\n\n50 g tomates concassées\n\n20 g fromage râpé\n\nSel, poivre, herbes (basilic, origan)\n\nExemple : pour 4 personnes → 8 feuilles de lasagne, 400 g fromage blanc, 200 g viande, 200 g tomates…\n\nPréparation rapide :\n\nPréchauffer le four à 180°C.\n\nCuire la viande avec sel, poivre, tomates et herbes.\n\nMonter les lasagnes : feuille → viande/tomates → fromage blanc → répéter → finir avec fromage râpé.\n\nCuire 25–30 min jusqu’à doré.\n\nServir chaud.', 'https://www.platetrecette.fr/wp-content/uploads/2021/01/Lasagnes-allegees-au-fromage-blanc.jpg', '2026-01-23 09:28:53', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `reset_token`, `reset_expires`) VALUES
(1, 'Admin', 'admin@example.com', '<mot_de_passe_hashé>', NULL, NULL),
(3, NULL, 'testeur@example.com', '$2b$12$q/irS8jaD2iReYoIqzhW/.CSvKlhUh98runqxv7OduDSS/kMsGdPe', 'VaKE7BW_5KNHtFWOd2CDvnQuG3u2xUXtbyh-bR23gLY', '2026-01-21 10:18:55'),
(4, NULL, 'testeuse@example.com', '$2b$12$ky3gpOl/XzRXwqgufX.CnO4xFkou6TGdYfsmpXqVlVACxjMoz4whG', NULL, NULL),
(5, NULL, 'tester@example.com', '$2b$12$ebJYbOCDI8SiEP4aoUwyT.R2U/OLVfJAaHWG.ioIltQb8eDTQtgsG', NULL, NULL),
(6, 'mama12', 'tesr@example.com', '$2b$12$wAFsm6y.aGZ7FJc0t0eVQu6GfYVQ86sjICpZPcPzddtz6IpykSZdy', NULL, NULL),
(7, 'mama123', 'ter@example.com', '$2b$12$AOb47MTfNEhm6mnwLDGYAOYLA3J4II8FD0TYnd/cWYiYaxDDTfRfW', NULL, NULL),
(8, 'aurelie', 'aurelie@example.com', '$2b$12$O3pniqIoNw9h3Yv9o/yAmeQEsChlyjJ.vMBsmpLOWda.jg/Mv/bxe', NULL, NULL),
(9, 'joel', 'joel@example.com', '$2b$12$.QkFMF/Ukd.RZd9vZeOYcuSloP02O7pYRjHuMPF81Xq/fS4jr3PQu', NULL, NULL),
(10, 'alain', 'alain@example.com', '$2b$12$JOjNYWWq8qiLO0jhStD8OOhSgLsRcYD.0fmeQVbZ.qv42lsrqiewq', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
