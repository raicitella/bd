-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 30 2026 г., 14:08
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Cosmetics`
--

-- --------------------------------------------------------

--
-- Структура таблицы `бренд`
--

CREATE TABLE `бренд` (
  `код_бренда` int(10) UNSIGNED NOT NULL,
  `наименование_бренда` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `доставка`
--

CREATE TABLE `доставка` (
  `код_доставки` int(10) UNSIGNED NOT NULL,
  `код_заказа` int(10) UNSIGNED NOT NULL,
  `колво_товара` int(11) NOT NULL,
  `дата_фактического_исполнения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `заказ`
--

CREATE TABLE `заказ` (
  `код_заказа` int(10) UNSIGNED NOT NULL,
  `код_товара` int(10) UNSIGNED NOT NULL,
  `код_передприятия` int(10) UNSIGNED NOT NULL,
  `колво_товара` int(11) NOT NULL,
  `дата_заказа` date NOT NULL,
  `дата_исполнения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `передприятие`
--

CREATE TABLE `передприятие` (
  `код_передприятия` int(10) UNSIGNED NOT NULL,
  `наименование` varchar(100) NOT NULL,
  `адрес` varchar(255) NOT NULL,
  `телефон` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `товар`
--

CREATE TABLE `товар` (
  `код_товара` int(10) UNSIGNED NOT NULL,
  `код_бренда` int(10) UNSIGNED NOT NULL,
  `наименование_товара` varchar(128) NOT NULL,
  `единица_измерения` varchar(10) NOT NULL,
  `цена` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `бренд`
--
ALTER TABLE `бренд`
  ADD PRIMARY KEY (`код_бренда`);

--
-- Индексы таблицы `доставка`
--
ALTER TABLE `доставка`
  ADD PRIMARY KEY (`код_доставки`),
  ADD KEY `код_заказа` (`код_заказа`);

--
-- Индексы таблицы `заказ`
--
ALTER TABLE `заказ`
  ADD PRIMARY KEY (`код_заказа`),
  ADD KEY `код_товара` (`код_товара`),
  ADD KEY `код_передприятия` (`код_передприятия`);

--
-- Индексы таблицы `передприятие`
--
ALTER TABLE `передприятие`
  ADD PRIMARY KEY (`код_передприятия`);

--
-- Индексы таблицы `товар`
--
ALTER TABLE `товар`
  ADD PRIMARY KEY (`код_товара`),
  ADD KEY `код_бренда` (`код_бренда`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `бренд`
--
ALTER TABLE `бренд`
  MODIFY `код_бренда` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `доставка`
--
ALTER TABLE `доставка`
  MODIFY `код_доставки` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `заказ`
--
ALTER TABLE `заказ`
  MODIFY `код_заказа` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `передприятие`
--
ALTER TABLE `передприятие`
  MODIFY `код_передприятия` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `товар`
--
ALTER TABLE `товар`
  MODIFY `код_товара` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `доставка`
--
ALTER TABLE `доставка`
  ADD CONSTRAINT `доставка_ibfk_1` FOREIGN KEY (`код_заказа`) REFERENCES `заказ` (`код_заказа`);

--
-- Ограничения внешнего ключа таблицы `заказ`
--
ALTER TABLE `заказ`
  ADD CONSTRAINT `заказ_ibfk_1` FOREIGN KEY (`код_товара`) REFERENCES `товар` (`код_товара`),
  ADD CONSTRAINT `заказ_ibfk_2` FOREIGN KEY (`код_передприятия`) REFERENCES `передприятие` (`код_передприятия`);

--
-- Ограничения внешнего ключа таблицы `товар`
--
ALTER TABLE `товар`
  ADD CONSTRAINT `товар_ibfk_1` FOREIGN KEY (`код_бренда`) REFERENCES `бренд` (`код_бренда`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
