DROP DATABASE IF EXISTS abonet;
CREATE DATABASE abonet;
USE abonet;

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `cedula` varchar(10) NOT NULL,
    `nombres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `apellidos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `telefono` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `direccion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password` varchar(191) NOT NULL,
    `role` int(1) NOT NULL,
	`createdAt` datetime DEFAULT NULL,
	`updatedAt` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `abogado`;
CREATE TABLE `abogado`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `id_usuario`int(11) NOT NULL,
    `linkedin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `especializacion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `bufete` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `imagen` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
	`createdAt` datetime DEFAULT NULL,
	`updatedAt` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `calificacion`;
CREATE TABLE `calificacion`(
    `id_usuario`int(11) NOT NULL,
    `id_abogado`int(11) NOT NULL,
    `estrellas` DECIMAL NOT NULL,
	`createdAt` datetime DEFAULT NULL,
    `updatedAt` datetime DEFAULT NULL,
    FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE,
    FOREIGN KEY (`id_abogado`) REFERENCES `abogado` (`id`) ON UPDATE CASCADE,
	PRIMARY KEY  (`id_usuario`,`id_abogado`)
);
