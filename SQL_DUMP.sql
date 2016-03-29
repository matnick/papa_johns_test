-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 29 2016 г., 13:00
-- Версия сервера: 5.5.47-0+deb8u1
-- Версия PHP: 5.6.17-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `it77`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `parent_id`, `post_id`, `user_name`, `user_email`, `content`, `date`) VALUES
(1, 0, 1, 'adssad', 'sadasd', 'asdasd', '2016-03-28 02:52:50'),
(2, 1, 1, 'sadasd', 'sadasd', 'sadasd', '2016-03-28 02:52:50'),
(3, 2, 1, 'dsfsd', 'dsfsdfsdf', 'sdfsdfsdf', '2016-03-28 02:53:12'),
(4, 3, 1, 'dsfsdfsdfsd', 'fsdfsdfsdfsd', 'sdfsdfsdf', '2016-03-28 02:53:12'),
(5, 4, 1, 'sadasdasd', 'sadasda', 'sadasd', '2016-03-28 03:10:43'),
(6, 5, 1, 'sadasd', 'sadasd', 'sadasdasdsadsadsadas', '2016-03-28 04:25:09'),
(7, 3, 1, 'dsfsdfsdfsd', 'fsdfsdfsdfsd', 'sdfsdfsdf', '2016-03-28 02:53:12'),
(8, 5, 1, 'sadasd', 'sadasd', 'sadasdasdaaaaaaaaaaaaaa', '2016-03-28 04:25:15'),
(9, 0, 1, 'sadas', 'sadsaaaaa', 'aa3r21tfg13', '2016-03-28 04:25:42'),
(10, 0, 1, 'sadas', 'sadsaaaaa', 'WAEFVWEVSRVG', '2016-03-28 04:25:45'),
(11, 2, 1, 'Василий', 'mat@nick.ru', '1213123', '2016-03-28 07:13:15'),
(12, 0, 1, 'Василий', 'mat@nick.ru', 'Еще один комментарий 1 уровня', '2016-03-28 07:13:42'),
(13, 12, 1, 'Василий', 'mat@nick.ru', 'Коммент 2 уровня', '2016-03-28 07:13:50'),
(14, 13, 1, 'Василий', 'mat@nick.ru', 'Коммент 3 уровня', '2016-03-28 07:14:00'),
(15, 12, 1, 'Василий', 'mat@nick.ru', 'Коммент 4 уровня.', '2016-03-28 07:14:13'),
(16, 14, 1, 'Василий', 'mat@nick.ru', 'фывфыв', '2016-03-28 07:14:22'),
(17, 15, 1, 'Василий', 'mat@nick.ru', 'Комент 2 уровня.', '2016-03-28 07:14:30'),
(18, 17, 1, 'Василий', 'mat@nick.ru', 'Комент 4 уровня', '2016-03-28 07:14:37'),
(19, 0, 1, '', '', 'ывафва', '2016-03-28 07:22:40'),
(20, 6, 1, 'asdas', 'asdas', 'asdasd', '2016-03-28 13:41:18'),
(21, 20, 1, 'asdas', 'asdas', 'asdas', '2016-03-28 13:42:22'),
(22, 0, 1, 'asdasd', 'asdasdas', 'asdasd', '2016-03-28 13:43:08'),
(23, 0, 1, 'asdasd', 'asdasdas', 'asdasdasd', '2016-03-28 13:46:04'),
(24, 20, 1, 'asdasd', 'asdasdas', 'asdas', '2016-03-28 13:46:19'),
(25, 5, 1, 'asdasd', 'asdasdas', 'asdasd', '2016-03-28 13:49:23'),
(26, 3, 1, 'asdasd', 'asdasdas', 'asdasasd', '2016-03-28 13:49:58'),
(27, 0, 1, 'asdasd', 'asdasdas', 'dasdasdasd', '2016-03-28 14:14:29'),
(28, 5, 1, 'asdasd', 'asdasd', 'sadasd', '2016-03-28 14:27:50'),
(29, 0, 1, 'Николай', 'matuhin@adasd.dasd', '', '2016-03-28 14:49:24'),
(32, 23, 1, 'Петр', 'mama@mama.com', 'фывафывфыв', '2016-03-28 15:11:23'),
(33, 0, 1, 'Николай', 'madad@adssa', '32e4qwdwedawd', '2016-03-28 15:50:13'),
(34, 0, 1, 'Петр', 'matuhin86@gmail.com', 'asdasdasdasdas\nasd\nasd\nas\ndas\ndasdasdasadasd', '2016-03-29 08:56:52'),
(35, 34, 1, 'Петр', 'matuhin86@gmail.com', 'Ответ Петру! asdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdasasdfasdasdas', '2016-03-29 08:57:24'),
(36, 0, 1, 'Гарольд', '', '', '2016-03-29 08:59:30'),
(38, 0, 1, 'Гарольд', '', '', '2016-03-29 09:00:31'),
(39, 0, 1, 'Грольд', '', '', '2016-03-29 09:01:34'),
(40, 0, 1, 'фывацуац', 'test@mail.ru', 'выаываыва', '2016-03-29 09:02:03'),
(46, 0, 1, 'Николай', 'nick@matuhin.com', 'Ссылки работают.\n<a href="http://www.yandex.ru" target="_blank">http://www.yandex.ru</a>\n<a href="http://yandex.ru" target="_blank">http://yandex.ru</a>', '2016-03-29 09:54:05'),
(48, 35, 1, 'fgdhdg', 'hfghdhf', 'dfghfgh', '2016-03-29 09:56:15');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`) VALUES
(1, 2, 'Новость', 'В прошлом году Microsoft прекратила поддержку своего приложения Skype для Windows 8, а вместо универсального приложения решила выпустить для Windows 10 отдельные программы для отправки сообщений и видеозвонков. Теперь, услышав отзывы своей публики, компания решила изменить своё решение. «Поскольку размеры экранов становятся больше — например, большие планшеты, ПК «2-в-1» — и вы начинаете использовать приложения, ожидания смещаются, и люди хотят ограничить беспорядок в приложениях», — заявил представитель Skype.\r\n\r\nПоэтому в ближайшие недели Microsoft планирует выпустить универсальное приложение Skype для Windows 10. В нём будут собраны все функции сервиса, также оно получит упрощённый интерфейс. Изначально приложение будет поддерживать видеозвонки, текстовые сообщения и большую часть всей остальной базовой функциональности Skype. Позже в нём появятся такие возможности, как участие в групповых видеозвонках, демонстрация экрана и видеосообщения.\r\nТаким образом, у Microsoft будет уже три разных приложения Skype для Windows 10. Как заявил представитель компании, в будущем все они будут объединены в одну программу. Microsoft собирается делать это постепенно, собирая отзывы пользователей и тем самым убеждаясь, что приложение имеет полноценную функциональность.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'john', 'john@yandex.ru', 'pass_john'),
(2, 'nick', 'nick@matuhin.com', 'pass_nick'),
(3, 'alex', 'alex@ivanov.ru', 'pass_alex');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
