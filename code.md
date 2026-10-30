```SQL
create database `gas_station`;
create table `fuels`(
`id` int unsigned not null AUTO_INCREMENT,
`type` enum('АИ-92','АИ-95','АИ-98') not null,
`amount` int unsigned not null,
`price` decimal(5,2) not null,
PRIMARY KEY(`id`)
);
create table `firms`(
`id` int unsigned not null AUTO_INCREMENT,
`name` varchar(100) not null,
`addresss` varchar(255) not null,
`telephone` varchar(16) not null,
PRIMARY KEY(`id`)
);
create table `stations`(
`id` int unsigned not null AUTO_INCREMENT,
`id_firma` int unsigned not null,
`addresss` varchar(255) not null,
PRIMARY KEY(`id`),
FOREIGN KEY (`id_firma`) REFERENCES `firms` (`id`)
);
CREATE TABLE `clients`(
`id` int unsigned NOT NULL AUTO_INCREMENT,
`name` varchar(64) NOT NULL,
`surname` varchar(64) NOT NULL,
`patronymic` varchar(64) NOT NULL,
`addresss` varchar(255) not null,
`telephone` varchar(16) not null,
PRIMARY KEY (`id`)
);
create table `cales`(
`id` int unsigned not null AUTO_INCREMENT,
`id_fuel` int unsigned not null,
`id_station` int unsigned not null,
`date` date not null,
`amount` int unsigned not null,
PRIMARY KEY(`id`),
FOREIGN KEY (`id_fuel`) REFERENCES `fuels` (`id`),
FOREIGN KEY (`id_station`) REFERENCES `stations` (`id`),
FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`)
);
create table `fuel_firm`(
`id_firm` int unsigned not null,
`id_fuel` int unsigned not null,
PRIMARY key(`id_firm`, `id_fuel`),
FOREIGN KEY (`id_firm`) REFERENCES `firms` (`id`),
FOREIGN KEY (`id_fuel`) REFERENCES `fuels` (`id`)
);


```