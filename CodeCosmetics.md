```SQL
create database `Cosmetics`;
create table `бренд`(
`код_бренда` int unsigned not null AUTO_INCREMENT,
`наименование_бренда` varchar(128) not null,
PRIMARY KEY(`код_бренда`)
);
create table `товар`(
`код_товара` int unsigned not null AUTO_INCREMENT,
`код_бренда` int unsigned not null,
`наименование_товара` varchar(128) not null,
`единица_измерения` varchar(10) not null,
`цена` decimal(10,2) DEFAULT null,
PRIMARY KEY(`код_товара`),
FOREIGN KEY (`код_бренда`) REFERENCES `бренд` (`код_бренда`)
);
create table `передприятие`(
`код_передприятия` int unsigned not null AUTO_INCREMENT,
`наименование` varchar(100) not null,
`адрес` varchar(255) not null,
`телефон` varchar(16) not null,
PRIMARY KEY(`код_передприятия`)
);
create table `заказ`(
`код_заказа` int unsigned not null AUTO_INCREMENT,
`код_товара` int unsigned not null,
`код_передприятия` int unsigned not null,
`колво_товара` int not null,
`дата_заказа` date not null,
`дата_исполнения` date not null,
PRIMARY KEY(`код_заказа`),
FOREIGN KEY (`код_товара`) REFERENCES `товар` (`код_товара`),
FOREIGN KEY (`код_передприятия`) REFERENCES `передприятие` (`код_передприятия`)
);
create table `доставка`(
`код_доставки` int unsigned not null AUTO_INCREMENT,
`код_заказа` int unsigned not null,
`колво_товара` int not null,
`дата_фактического_исполнения` date not null,
PRIMARY KEY(`код_доставки`),
FOREIGN KEY (`код_заказа`) REFERENCES `заказ` (`код_заказа`)
);
```