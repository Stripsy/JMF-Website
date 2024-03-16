-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 02 mars 2022 à 09:26
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `website`
--

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `idevenement` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `dateevenement` datetime NOT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `resume` varchar(300) DEFAULT NULL,
  `groupe_idgroupe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`idevenement`, `nom`, `dateevenement`, `adresse`, `ville`, `cp`, `resume`, `groupe_idgroupe`) VALUES
(91, 'Chien Bleu', '2022-03-15 08:00:00', '5 Pl. Paul Cézanne', 'Le Mans', '72000', 'Seul en scène, Mounawar manie le son comme un pinceau, armé de ses voix multiples, de ses « mounaWii » (des manettes de jeu transformées en machine d’effets musicaux !) et d’un corps en mouvement incarnant tous les personnages. Tout est suggéré… puis tout s’évapore.', 13),
(92, 'À quoi tu joues ?', '2022-03-18 14:00:00', '5 Pl. Paul Cézanne', 'Le Mans', '72000', 'S\'inspirant librement de plusieurs albums jeunesse, À quoi tu joues ? a été créé comme un jeu d’enfant, effronté et espiègle. C’est une récréation, une partie de rires et de bagarres entre copines, pour aborder l’air de rien des thèmes forts. Balayant les idées reçues, ces trois filles nous touchent', 12),
(93, 'Crin blanc', '2022-03-18 17:30:00', '5 Pl. Paul Cézanne', 'Le Mans', '72000', 'Cette œuvre est redonnée à voir dans un ciné-concert aux compositions originales, dont la partition foisonnante, tantôt intimiste, tantôt rock, est traversée par des sons ethniques, le souffle du vent et le galop des troupeaux. Matthieu Dufrene étire son accordéon et Camille Saglio pose.', 15),
(94, 'Là d’dans Y’a', '2022-03-23 09:00:00', '239 Av. Rhin et Danube', 'Le Mans', '72100', 'Entre poésies rythmées et musiques colorées, les Trois Rêveurs ne se refusent rien et mettent leurs multiples bagages au service d’une escapade burlesque empreinte d’une légèreté et d’une bonne humeur contagieuses. Pour les voyageurs d’un jour et les voyageurs éternels !', 37);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `idgroupe` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `image` varchar(512) NOT NULL,
  `texte` varchar(800) NOT NULL,
  `duree` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`idgroupe`, `titre`, `image`, `texte`, `duree`, `type`) VALUES
(12, 'À quoi tu joues ?', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-09/2019-10-13_presentation_jm_france_2020-2021_thierry_guillaume-006.jpg?h=a21def44&itok=TkgCqevK', '« Essaye donc de me dire qui je suis, y’a que moi qui sait, y’a que moi qui sait ! ». Le spectacle s\'ouvre sur ces paroles, invitant chaque jeune spectateur à s\'interroger avec humour et finesse sur son caractère, ses goûts, son apparence, son identité.', '50', 'Théatre'),
(13, 'Chien Bleu', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-11/Chien%20Bleu%20Photo%202%20.jpg?h=697ebd55&itok=YA4e2v_J', 'Chien Bleu vient un jour à la rencontre de Charlotte. Dans sa solitude, la petite fille s’attache à lui mais sa maman ne veut pas de ce chien inconnu à la couleur étrange. Né sous la plume et le crayon de Nadja, Chien Bleu est un conte universel, un livre-source de l’enfance, dont le musicien Mounawar s’est emparé pour créer un spectacle à part. Nul acteur, nul décor ; le récit, confié à une (très belle) voix off, laisse toute la place à un voyage sonore hors du commun. ', '50', 'Littérature'),
(14, 'Boom Boom Kids', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-10/Boom%20Boom%20Kids%20%C2%A9%20Olivia%20Lorrain.JPG?h=b57e8e48&itok=N63xGobK', 'Qui a dit qu’une démonstration de batterie devait être sérieuse ? Dans le sillage de leur spectacle phénomène, l’Incredible Drum Show, les Fills Monkey ont imaginé une version rien que pour les enfants, encore plus dynamique, ludique et accessible… Ce sera Boom Boom Kids !', '50', 'Humour'),
(15, 'Crin blanc', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-10/Bandeau_Crin_Blanc_%C2%A9Fabien_Tijou.jpg?h=c1fa0b0b&itok=NN7nm6Ws', 'Crin blanc… Qui n’a pas de souvenir enfoui de ce cheval blanc, fougueux, galopant dans les marais de Camargue sous les yeux émerveillés de Folco, le jeune pêcheur ? Résolument actuel, ce film illustre parfaitement la relation de l’homme à la nature. Images et lumière mettent en valeur paysages et espèces sauvages, nous rappelant combien il est essentiel de les protéger, et urgent de préserver leur environnement.', '50', 'Ciné-concert'),
(16, 'Bavela et ses 7 vies d’aventures', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-10/Bavela_EP1_Frame%201_corrected_bd.jpg?h=b74ff891&itok=phqWrNvO', 'Au Mexique, c’est la veille du jour des morts, et Bavela rêve de pouvoir participer à cette grande fête. Mais c’est hors de question ! Il paraît que les chats portent malchance lors de cette célébration... Pour comprendre et surmonter cette superstition, Bavela va se plonger dans ses souvenirs et revisiter ses six anciennes vies, nous entraînant de l’Égypte à l’Argentine, du Canada à l’Italie, dans une trépidante quête de soi... et une incroyable découverte de la musique à travers le monde et l’Histoire.', '50', 'Conte'),
(20, 'DundunfolaZ', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2021-01/Photos_DundunfolaZ_2019%C2%A9JMFrance%20%283%29.jpg?h=d53e15ca&itok=Ldms2ius', 'Aux confins de l’espace, se frayant un chemin entre les étoiles, un vaisseau bien particulier… À son bord, tout se percute ! Un marimba, un vibraphone et une batterie trafiquée côtoient un attirail insolite, fait d’objets fabriqués ou récupérés. C’est à ces instruments, pardon, à cette technologie sonore aérospatiale de pointe qu’auront recours les trois « Bakanautes » pour sauver la planète. Bienvenue dans la mission DundunfolaZ ! Votre rôle : aider notre équipage à trouver la graine qui reconstituera les sons disparus sur terre…', '50', 'Musical'),
(21, 'Duo Berimba', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2021-09/duo_berimba_DR.jpg?h=61714578&itok=ZKGim6nA', 'Que cache ce nom fusionnant le berimbau (arc musical brésilien) et le marimba (instrument de percussion à clavier de l’Amérique latine) ?\r\n\r\nUn duo hors-norme formé par Béatrice Reuther (Premier prix du CNSMDP dans la classe d’Alexandre Lagoya) et Stéphane Grosjean (directeur artistique de TOUMBACK), qui donne à (re)découvrir un répertoire cosmopolite dans des arrangements originaux pour guitare et percussions  classiques ou corporelles.', '50', 'Baroque'),
(22, 'Duologie', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2021-06/duologie_%C2%A9_Nathan_Montillet.jpg?h=a1e1a043&itok=vyXIC553', 'Ouvrez l’œil : c’est parfois au coin d’une rue que l’on peut faire la rencontre la plus importante de sa vie ! Sous ses airs de mauvais garçon, Laurent est un virtuose de l’harmonica ; Émilie une flûtiste brillante et appliquée. La seule chose qu’ils ont en commun, c’est ce bout de trottoir sur lequel ils jouent pour les passants.', '50', 'Jazz'),
(23, 'Et après c\'est quoi ?', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-09/Et%20apre%E2%95%A0%C3%87s%20c%27est%20quoi%E2%94%AC%C2%AEDoume%E2%95%A0%C3%BC.jpg?h=c6980913&itok=cVvR-_0v', 'Qui a dit que la poésie était rébarbative et démodée ? Pas ces trois-là, en tout cas ! Pascal Peroteau et ses acolytes la célèbrent, et plutôt deux fois qu’une, avec ce nouveau spectacle construit autour d’une dizaine de poèmes classiques (Desnos, Carême, Fort, Eluard, La Fontaine…).', '50', 'Chanson'),
(24, 'Gainsbourg for kids', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-10/Gainsbourg%20For%20Kids%C2%A9St%C3%A9phane_Andrivot.jpg?h=9d178bbd&itok=Mf1RvlhS', 'Paris, rue de Verneuil… Devant la grille d’un hôtel très particulier, trois déménageurs viennent livrer un piano. Ils ont beau sonner, personne ! Que faire ? Les pieds dans La gadoue, le trio infernal se met à secouer les puces d’une vieille Remington qui peine à orthographier « Laëtitia », se remémore l’histoire abracadabrante de La Jambe de bois « Friedland », s’offre un hilarant voyage en Harley Davidson, taquine L’ami Caouette et ressuscite Le Poinçonneur des Lilas…, jusqu’à se convaincre que décidément, « mieux vaut ne penser à rien que ne pas penser du tout ! »', '50', 'Chanson'),
(25, 'Firmin et Hector', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2021-04/Firmin%20et%20Hector%C2%A9PaolaGuigou.jpg?h=5e840fa6&itok=gCjYl59j', 'Firmin et Hector sont frères. Dans leur enfance, quelques mots de leur grand-mère vont marquer leurs esprits : « Firmin, Hector, la musique, c’est la vie ! ». Il faut dire que c’étaient ses derniers mots… Depuis, ils y croient dur comme fer et ne se sont jamais arrêtés de chanter.', '50', 'Humour'),
(26, 'Granmèr Kal (GMK)', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-09/Granme%CC%80r%20Kal_PG.jpg?h=d7b24943&itok=8pgQQTam', 'Ils sont deux sur scène, ou plutôt trois : un musicien, une comédienne, un vibraphone. Mêlant les arts et les influences (conte, chant, musiques improvisées et musique de l’océan Indien), ils tissent une composition originale, où la langue créole et les instruments traditionnels, bobre et roulèr, viennent ponctuer un spectacle onirique et joyeux, à la découverte de la légende la plus connue de La Réunion. Qui est cette Granmèr Kal que tout le monde craint, femme-oiseau, sorcière aux pouvoirs extraordinaires ?', '50', 'Conte'),
(27, 'J\'ai dormi près d’un arbre', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2021-10/J-ai-dprmi-pres-d-un-arbre_%C2%A9%20Fabien%20Espinasse.jpg?h=740a8a7d&itok=cU7rSsHI', 'Après plus de deux ans de Tour de France à pied et en chansons, 10 000 km de marche et près de 400 concerts, Manu Galure a des histoires à chanter. Des aventures de troubadours, de sangliers qui vous mangent les pieds, d\'arbres qui courent, de siestes trop longues et de pingouins qui puent. Sur la scène, un piano à queue et un piano droit, mais bricolés et bancals, qu\'on visse, qu\'on cloue, qu\'on scotche, qu\'on remplit de ressorts et de ferraille, des pianos qu\'on joue avec les pieds, avec des marteaux, avec une meuleuse. Les histoires ressemblent aux musiques et aux sonorités qui les accompagnent, étranges et amusantes, grinçantes et pleines de malice.', '50', 'Chanson'),
(28, 'Je m\'appelle Solea', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-08/Solea%C2%A9Stephen%20Bedrossian.jpg?h=7fe4dbe7&itok=xKHEd37p', 'Tout y est : la danse, le chant et la guitare, trois piliers d’une culture musicale immense, pour faire connaître le flamenco sous son vrai visage, loin des clichés et au plus près du cœur. Dans le large éventail de palos (styles harmoniques et rythmiques) qui composent le flamenco, la solea est sans doute l’un des plus anciens et profonds. Elle prend ici les traits d’une femme andalouse, une femme dont le cœur bat… en douze temps et dont la voix guide le jeune spectateur dans un parcours riche en émotions, du recueillement à la fête.', '50', 'Danse'),
(29, 'Je m\'suis fait tout p\'tit', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-08/Tout%20p%27tit%C2%A9Ernesto%20Timor%282%29.jpg?h=90949a3c&itok=H3XBksR7', 'Jean et Stella se sont découverts bien des choses en commun avec « Tonton Georges » : des parents de nationalités mélangées et une enfance que rien ne prédestinait à la musique. Et comme ce dernier était un fervent défenseur de la liberté, ils font le choix de tout oser avec ses chansons, mais aussi avec l’Histoire..', '60', 'Théâtre'),
(30, 'Je viens d\'où tu vas', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-10/Je%20viens%20d%27o%C3%B9%20tu%20vas%20%C2%A9%20Aude%20Ortiz_recadrage.jpg?h=cb636ea6&itok=Cj5z7NBx', 'L’aventure nous mène sous les rayons d’un même soleil, dans un monde où la dureté du réel s’émousse avec la musique et les chants colorés qui rejoignent les rêves des enfants. Davy, né en France d’une mère espagnole et d’un père zaïrois s’en va vers l’Afrique retrouver ses racines. Samir, le Kabyle qui fuit la folie humaine, de guerre en naufrage, prend le chemin inverse. Deux destins bien différents qui les font se croiser, se reconnaître et se lier d’une amitié indéfectible.', '50', 'Chanson'),
(31, 'Jelly Jazz', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2021-10/Jelly_Jazz_pre_selection_OK.jpg?h=adab140d&itok=aSgWPzHc', 'La Nouvelle-Orléans a donné son nom au traditionnel jazz New Orleans. Au carrefour de plusieurs cultures, ce courant musical emblématique et intemporel s’est nourri d’influences caribéennes, africaines et européennes. Originaires de Grenoble, les frères Joseph et Léon Le Nair ont pris goût pour cette musique grâce à leur grand-père qui passait sur son phonographe les disques de Louis Armstrong, Billie Holiday, Bessie Smith ou encore Fats Waller.', '50', 'Conte'),
(32, 'Kosh', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-09/PDS_2019_%C2%A9_Meng_Phu%20%28168%29_0.jpg?h=fd95c715&itok=0PVvk5QB', 'Au-delà de la technique du beatbox qu’il maîtrise avec brio, Kosh nous conte avec humour la découverte de son art, sa quête de sons et son désir de succès… qui tarde à venir ! Au travers d’anecdotes nourries de musiques, bruitages et autres sons aussi surprenants que saisissants, Kosh nous propose un spectacle multiple, drôle et novateur empruntant aux codes du stand-up.', '55', 'Beatbox'),
(33, 'Kaïla Sisters', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2021-01/photo_2021_Kaila_sisters.jpg?h=aa210394&itok=XYFlg-ZJ', 'Inspirés par l’histoire vraie de Mme Rivière et de sa troupe hawaïenne, les Kaïla Sisters nous entraînent dans les pas d’une mystérieuse professeure de français et de ses musiciens, partis de Polynésie un jour de 1928 pour une tournée qui les mena aux quatre coins du monde. Mélodies traditionnelles de l’archipel hawaïen, standards du jazz hot et blues jalonnent ce voyage où la torpeur des îles du Pacifique se mêle à l’effervescence des comédies musicales new yorkaises, tandis que grondent les ravages de la Grande Dépression.', '45', 'Conte'),
(34, 'L’Histoire du vieux Black Joe', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2021-05/Hisoitre_du_vieux_Black_Joe_%C2%A9_DR.jpg?h=4f6fdf84&itok=OcBvS8e8', '« Hier, le vieux Black Joe a rendu l’âme. Il a grandi au rythme du jazz et a changé avec lui. Aujourd’hui il est peut-être mort, mais le jazz, lui, est toujours bien vivant ! ». Sur un rythme effréné, quatre musiciens multiinstrumentistes retracent avec humour la vie de ce personnage imaginaire.', '50', 'Jazz'),
(35, 'La Bête', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-08/La%20B%C3%AAte_%C2%A9_DR.jpg?h=5fc04ac5&itok=tAMbvpjz', 'Quelque part dans les forêts du centre de la France, au milieu du XVIIIe siècle, une suite d’attaques mortelles accable les paysans : c’est la panique en Gévaudan, la trouillasse sur la montagne ! Cette bête qui échappe aux armées du Roi, qui est-elle ? Un monstre fantastique, un chien dressé, un complot des uns et des autres ? Pour tenter d’y voir plus clair, deux colporteurs d’aujourd’hui, armés de leurs instruments à cordes, de leur bagou et d’une série de peintures édifiantes, livrent leur version des faits. On s’y perd, on s’y retrouve, on frissonne et on rit.', '50', 'Conte'),
(36, 'La Boucle est bouclée', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2020-08/LA_boucle_est_boucle_%C2%A9_Colas_Cavailles.jpg?h=0d27ee61&itok=dOEfgTAq', 'Depuis quelques années, c’est une boîte magique qui se faufile partout, pilotée par des musiciens de tout poil, du rap aux cordes classiques ; bijou de technologie, elle enregistre, répète et superpose n’importe quelle séquence musicale ; elle opère discrètement, en direct et de façon illimitée ! Elle, c’est la pédale de boucle, ou loop station.', '50', 'Looping'),
(37, 'Là d’dans Y’a', 'https://www.jmfrance.org/sites/default/files/styles/show_main/public/2021-10/Photo_La_dans_Ya.jpg?h=f214e3e9&itok=McoQSHeL', 'Échappés de la légendaire troupe du cirque Plume, les talentueux Laurent Tellier-Dell’Ova, Julien Chignier et Nicolas Boulet ont étoffé leur numéro de valises musicales pour, de fil en micro et de trombone en chansons, en faire un spectacle à part entière où la musique tient le premier rôle.', '50', 'Objets Sonores');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `idrole` int(11) NOT NULL,
  `nomrole` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`idrole`, `nomrole`) VALUES
(1, 'admin'),
(2, 'ecole'),
(3, 'citoyen'),
(4, 'attente');

-- --------------------------------------------------------

--
-- Structure de la table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20220125154501-website.js');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idutilisateur` int(11) NOT NULL,
  `mail` varchar(254) NOT NULL,
  `mdp` varchar(256) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `mail`, `mdp`, `nom`, `prenom`, `telephone`) VALUES
(79, 'jmfrancewebsite@gmail.com', '$2b$10$MFsaMZz18k19LaTGhdOnFOIKbGK3DgmW2PBeQNJWaLNaPRFSZHpwO', 'Admin', 'JM', '0756884232'),
(80, 'sociis@icloud.couk', '$2b$10$SGZnz0fHjkiUtwt6Q3OPr.zkAkJzu0oYY1o1ehbW5Y3aahU8GwqiK', 'Katelyn', 'Jorden', '0661861101'),
(81, 'donec.sollicitudin@protonmail.edu', '$2b$10$SGZnz0fDjjiUtwt6Q4OPd.zkUkJze0oYY1O1ehbG5Y3aahI8GwqiK', 'Portia', 'Quinn', '0786411980'),
(82, 'mi@aol.ca', '$2b$10$SGZnz0fKjviUtwt6Q1OPy.zkEkJze0oYY1u1ehbQ4Y3aahE8GwqiK', 'Alfonso', 'Xandra', '0687364391'),
(83, 'risus.odio@outlook.net', '$2b$10$SGZnz0fQjpiUtwt6Q1OPf.zkIkJze0oYY1o1ehbW6Y3aahU8GwqiK', 'Connor', 'Nyssa', '0681707116'),
(84, 'proin@hotmail.org', '$2b$10$SGZnz0fDjyiUtwt6Q5OPZ.zkOkJzu0oYY1O1ehbH4Y3aahI8GwqiK', 'Dominique', 'Xantha', '0768079857'),
(85, 'sapien.cursus.in@google.ca', '$2b$10$SGZnz0fJjtiUtwt6Q2OPk.zkIkJzo0oYY1o1ehbV1Y3aahO8GwqiK', 'Adria', 'Anjolie', '0630739528'),
(86, 'ante.dictum.cursus@outlook.edu', '$2b$10$SGZnz0fMjkiUtwt6Q2OPt.zkUkJzi0oYY1u1ehbW4Y3aahE8GwqiK', 'Xanthus', 'Keaton', '0757504794'),
(87, 'aenean.gravida@aol.couk', '$2b$10$SGZnz0fLjviUtwt6Q1OPh.zkOkJza0oYY1o1ehbN8Y3aaha8GwqiK', 'Rahim', 'Yardley', '0781740632'),
(88, 'eget.ipsum@icloud.ca', '$2b$10$SGZnz0fWjbiUtwt6Q5OPR.zkEkJza0oYY1e1ehbQ7Y3aahe8GwqiK', 'Ila', 'Leigh', '0778251852'),
(89, 'eros.nec@aol.couk', '$2b$10$SGZnz0fXjkiUtwt6Q0OPl.zkEkJze0oYY1u1ehbR4Y3aaho8GwqiK', 'Nehru', 'Amery', '0756277821'),
(90, 'sodales.purus.in@protonmail.org', '$2b$10$SGZnz0fLjfiUtwt6Q8OPc.zkIkJzo0oYY1U1ehbX7Y3aaha8GwqiK', 'Thane', 'Phelan', '0643485428'),
(91, 'lacus.quisque.purus@aol.couk', '$2b$10$SGZnz0fKjtiUtwt6Q2OPT.zkIkJzi0oYY1a1ehbD0Y3aahU8GwqiK', 'Hilary', 'Macaulay', '0780481673'),
(92, 'amet.risus.donec@icloud.org', '$2b$10$SGZnz0fTjviUtwt6Q0OPb.zkEkJzi0oYY1A1ehbO7Y3aaho8GwqiK', 'Abbot', 'Vielka', '0705422869'),
(93, 'magna.lorem.ipsum@outlook.couk', '$2b$10$SGZnz0fZjriUtwt6Q8OPk.zkOkJzo0oYY1E1ehbC8Y3aahE8GwqiK', 'Indira', 'Beatrice', '0738383516'),
(94, 'cubilia@protonmail.edu', '$2b$10$SGZnz0fMjyiUtwt6Q8OPx.zkOkJze0oYY1i1ehbF1Y3aahe8GwqiK', 'Venus', 'Olga', '0715108321'),
(95, 'non.dui.nec@hotmail.com', '$2b$10$SGZnz0fQjfiUtwt6Q9OPJ.zkUkJzo0oYY1E1ehbM5Y3aahA8GwqiK', 'Aiko', 'Jackson', '0773627351'),
(96, 'nec.eleifend.non@icloud.org', '$2b$10$SGZnz0fXjtiUtwt6Q4OPg.zkOkJzi0oYY1U1ehbE4Y3aaha8GwqiK', 'Demetrius', 'Ferdinand', '0711282643'),
(97, 'nullam.lobortis@google.ca', '$2b$10$SGZnz0fWjjiUtwt6Q3OPs.zkEkJze0oYY1u1ehbG4Y3aaho8GwqiK', 'Tallulah', 'Byron', '0769560621'),
(98, 'nulla.cras.eu@icloud.org', '$2b$10$SGZnz0fQjpiUtwt6Q5OPs.zkIkJzu0oYY1a1ehbG1Y3aaha8GwqiK', 'Jane', 'Stella', '0770081582'),
(99, 'non.vestibulum@outlook.org', '$2b$10$SGZnz0fVjviUtwt6Q1OPd.zkEkJzo0oYY1e1ehbC8Y3aahe8GwqiK', 'Brynne', 'Larissa', '0692776734'),
(100, 'curabitur@protonmail.edu', '$2b$10$SGZnz0fDjyiUtwt6Q7OPD.zkEkJze0oYY1E1ehbC3Y3aaha8GwqiK', 'Harlan', 'Kyle', '0748737146'),
(101, 'blandit.enim@google.com', '$2b$10$SGZnz0fBjliUtwt6Q6OPQ.zkUkJzi0oYY1u1ehbV9Y3aahU8GwqiK', 'Neville', 'Justina', '0666296889'),
(102, 'lacinia@aol.edu', '$2b$10$SGZnz0fDjriUtwt6Q6OPp.zkOkJze0oYY1o1ehbP7Y3aahU8GwqiK', 'Priscilla', 'Abra', '0662529124'),
(103, 'integer.id.magna@aol.com', '$2b$10$SGZnz0fSjmiUtwt6Q4OPy.zkOkJze0oYY1i1ehbH9Y3aahe8GwqiK', 'Joy', 'Jonah', '0653427337'),
(104, 'tellus@yahoo.couk', '$2b$10$SGZnz0fWjdiUtwt6Q2OPS.zkEkJzo0oYY1O1ehbY4Y3aahi8GwqiK', 'Damon', 'Barry', '0792287671'),
(105, 'varius.et@icloud.org', '$2b$10$SGZnz0fVjdiUtwt6Q9OPt.zkOkJza0oYY1A1ehbD3Y3aaha8GwqiK', 'Byron', 'Claudia', '0723429218'),
(106, 'in.scelerisque@icloud.org', '$2b$10$SGZnz0fKjwiUtwt6Q0OPV.zkEkJzi0oYY1a1ehbL0Y3aahe8GwqiK', 'Paki', 'Paloma', '0724527445'),
(107, 'luctus@yahoo.com', '$2b$10$SGZnz0fNjjiUtwt6Q6OPC.zkEkJze0oYY1u1ehbE6Y3aaha8GwqiK', 'Dora', 'Joseph', '0635033323'),
(108, 'sed.pede.nec@protonmail.ca', '$2b$10$SGZnz0fRjjiUtwt6Q2OPP.zkUkJza0oYY1o1ehbD1Y3aahu8GwqiK', 'Shelley', 'Griffin', '0703794748'),
(109, 'nisl.sem@protonmail.couk', '$2b$10$SGZnz0fSjtiUtwt6Q5OPc.zkOkJze0oYY1e1ehbH8Y3aahi8GwqiK', 'Lionel', 'Rose', '0758060175'),
(110, 'facilisis.eget@yahoo.edu', '$2b$10$SGZnz0fRjgiUtwt6Q9OPn.zkOkJzi0oYY1e1ehbF1Y3aahu8GwqiK', 'Pamela', 'Ivy', '0752872627'),
(111, 'donec.egestas@yahoo.ca', '$2b$10$SGZnz0fKjbiUtwt6Q4OPQ.zkOkJzu0oYY1O1ehbL5Y3aahE8GwqiK', 'Blaze', 'Linda', '0732680643'),
(112, 'integer.mollis.integer@yahoo.org', '$2b$10$SGZnz0fKjfiUtwt6Q1OPg.zkIkJza0oYY1i1ehbB7Y3aahO8GwqiK', 'Griffin', 'Jelani', '0663635031'),
(113, 'nullam.nisl@protonmail.org', '$2b$10$SGZnz0fPjgiUtwt6Q8OPZ.zkIkJzi0oYY1a1ehbU5Y3aaho8GwqiK', 'Griffith', 'Hedley', '0729275369'),
(114, 'sed@icloud.ca', '$2b$10$SGZnz0fKjviUtwt6Q6OPZ.zkEkJze0oYY1a1ehbS2Y3aahU8GwqiK', 'Flynn', 'Martha', '0605889160');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_has_evenement`
--

CREATE TABLE `utilisateur_has_evenement` (
  `evenement_idevenement` int(11) NOT NULL,
  `utilisateur_idutilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_has_role`
--

CREATE TABLE `utilisateur_has_role` (
  `role_idrole` int(11) NOT NULL,
  `utilisateur_idutilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur_has_role`
--

INSERT INTO `utilisateur_has_role` (`role_idrole`, `utilisateur_idutilisateur`) VALUES
(1, 79),
(2, 81),
(2, 83),
(2, 86),
(2, 93),
(2, 95),
(2, 98),
(2, 102),
(2, 103),
(2, 104),
(2, 106),
(3, 82),
(3, 85),
(3, 88),
(3, 90),
(3, 92),
(3, 94),
(3, 97),
(3, 105),
(3, 107),
(3, 110),
(3, 111),
(3, 112),
(3, 113),
(4, 80),
(4, 84),
(4, 87),
(4, 89),
(4, 91),
(4, 96),
(4, 99),
(4, 100),
(4, 101),
(4, 108),
(4, 109),
(4, 114);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`idevenement`),
  ADD KEY `evenement_groupe_idgroupe_groupe_fk` (`groupe_idgroupe`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`idgroupe`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idrole`);

--
-- Index pour la table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idutilisateur`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Index pour la table `utilisateur_has_evenement`
--
ALTER TABLE `utilisateur_has_evenement`
  ADD PRIMARY KEY (`evenement_idevenement`,`utilisateur_idutilisateur`) USING BTREE,
  ADD KEY `utilisateur_has_evenement_evenement_idevenement` (`evenement_idevenement`),
  ADD KEY `utilisateur_has_evenement_utilisateur_idutilisateur` (`utilisateur_idutilisateur`) USING BTREE;

--
-- Index pour la table `utilisateur_has_role`
--
ALTER TABLE `utilisateur_has_role`
  ADD PRIMARY KEY (`role_idrole`,`utilisateur_idutilisateur`),
  ADD UNIQUE KEY `utilisateur_idutilisateur` (`utilisateur_idutilisateur`),
  ADD KEY `utilisateur_has_role_utilisateur_idutilisateur` (`utilisateur_idutilisateur`),
  ADD KEY `utilisateur_has_role_role_idrole` (`role_idrole`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `idevenement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `idgroupe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `idrole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `evenement_groupe_idgroupe_groupe_fk` FOREIGN KEY (`groupe_idgroupe`) REFERENCES `groupe` (`idgroupe`) ON DELETE CASCADE;

--
-- Contraintes pour la table `utilisateur_has_evenement`
--
ALTER TABLE `utilisateur_has_evenement`
  ADD CONSTRAINT `utilisateur_has_evenement_ibfk_1` FOREIGN KEY (`evenement_idevenement`) REFERENCES `evenement` (`idevenement`) ON DELETE CASCADE,
  ADD CONSTRAINT `utilisateur_has_evenement_ibfk_2` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE CASCADE;

--
-- Contraintes pour la table `utilisateur_has_role`
--
ALTER TABLE `utilisateur_has_role`
  ADD CONSTRAINT `utilisateur_has_role_ibfk_1` FOREIGN KEY (`role_idrole`) REFERENCES `role` (`idrole`),
  ADD CONSTRAINT `utilisateur_has_role_ibfk_2` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
