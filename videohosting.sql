-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 21 2022 г., 21:45
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `videohosting`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` bigint UNSIGNED NOT NULL,
  `category` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `category`, `created_at`, `updated_at`) VALUES
(3, 'Дота 2', '2022-02-21 11:15:15', '2022-02-21 11:15:15');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `text_comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `video_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int NOT NULL,
  `video_id` bigint UNSIGNED NOT NULL,
  `likes` int DEFAULT NULL,
  `dislikes` int DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `video_id`, `likes`, `dislikes`, `user_id`) VALUES
(3, 13, 1, 0, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2022_02_14_150943_roles_migration', 1),
(7, '2022_02_14_151017_category_video_migration', 1),
(8, '2022_02_14_150911_user_migration', 2),
(9, '2022_02_14_150927_video_migration', 2),
(10, '2022_02_14_164611_commetns_migration', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `nickname`, `avatar`, `email`, `password`, `roles`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Kir4ick', 'C:\\OpenServer\\userdata\\temp\\upload\\php485B.tmp', 'Kir4ick@mail.ru', '$2y$10$VLaju8XnJZ43YV9rUDXdNu2iXnz48b.yIHnoWnMP/EBe/nMLZZisa', 'user', NULL, '2022-02-21 11:10:06', '2022-02-21 11:10:06');

-- --------------------------------------------------------

--
-- Структура таблицы `video`
--

CREATE TABLE `video` (
  `id` bigint UNSIGNED NOT NULL,
  `title_video` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_video` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `verificy` int NOT NULL DEFAULT '1',
  `user_id` bigint UNSIGNED NOT NULL,
  `category` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `video`
--

INSERT INTO `video` (`id`, `title_video`, `description_video`, `path`, `preview`, `views`, `verificy`, `user_id`, `category`, `created_at`, `updated_at`) VALUES
(13, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/XsPHGf0qKCfjzeoabbOiQ2eh0nB7Zbkg5AxQsB6U.mp4', 'upload/users_video/previews/dgOBZ3mOnc9omT2gwqRbY4w3YilComTVLGL3iYIl.png', 0, 1, 3, 3, '2022-02-21 11:21:37', '2022-02-21 11:21:37'),
(14, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/HTsK1gmZfUPdUQiXgtLrY4ypuXgUtM0Rk2VL1z7H.mp4', 'upload/users_video/previews/nwWBIfdcf3yLuR5i5oKXl97UBCibsfMqWMeLE6B4.png', 0, 1, 3, 3, '2022-02-21 11:21:47', '2022-02-21 11:21:47'),
(15, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/94Deu8pJAxvDZqYkQPFAPI3iPwZ9HF0kT3xxMW7h.mp4', 'upload/users_video/previews/JBej6SnKKjdlX8ERRgQo3mny2XG9z5I4k2ahPmZY.png', 0, 1, 3, 3, '2022-02-21 11:21:49', '2022-02-21 11:21:49'),
(16, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/AWbNWmpG2BSgoHiliXuj2CKIwP01rbaN5dPWqXVD.mp4', 'upload/users_video/previews/YGoJMWCt4U5Tz3CbUj2XbRFtuc0hu7h29rVMBzP2.png', 0, 1, 3, 3, '2022-02-21 11:21:51', '2022-02-21 11:21:51'),
(17, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/Ng0VDbkq9y85VB2cJNYGfqbApeMiCEehKVCWduKd.mp4', 'upload/users_video/previews/sEE2tmwSbDnJW9nXqZPmkaOxTkDQnjDzNToKKPfr.png', 0, 1, 3, 3, '2022-02-21 11:21:52', '2022-02-21 11:21:52'),
(18, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/Qzxt2HzGOpTfE9GzheiMPol7aNQeKz6N3SJQNwAf.mp4', 'upload/users_video/previews/EAnyS6f0rj0xJc747rjGzJNObbbQwlLKb9HsM6YX.png', 0, 1, 3, 3, '2022-02-21 11:21:54', '2022-02-21 11:21:54'),
(19, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/okOE6OAIjI3l2bPSR1rIYxvG1OxdImyFEuDxDXKV.mp4', 'upload/users_video/previews/zsyNaqMqrK1y8fdGsZFbvvag1f3ZHzpurUP0P0q9.png', 0, 1, 3, 3, '2022-02-21 11:21:55', '2022-02-21 11:21:55'),
(20, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/1s6L74lRjmFzIOE1xBRpJ6YSL0T6QQVDojO8nsUq.mp4', 'upload/users_video/previews/nrRexE2OyPyHyHgkvxz3enKFUM5Twbc0e9xAVhXQ.png', 0, 1, 3, 3, '2022-02-21 11:21:57', '2022-02-21 11:21:57'),
(21, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/G5jbDMwquMQFREQJTl4Ess5L5MuHc4Q6Ur7gzkoa.mp4', 'upload/users_video/previews/TvCPq7K3GEnHaETDeZq3lUTLCplonuBPjwj24cD8.png', 0, 1, 3, 3, '2022-02-21 11:22:30', '2022-02-21 11:22:30'),
(22, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/eaPAFkHQ3nLWTmN76GPspbErQivNZQGQ9gVAq2qU.mp4', 'upload/users_video/previews/BUogncarB5g5YZi28EAMDIMcE0FytZ0h3AlhIret.png', 0, 1, 3, 3, '2022-02-21 11:22:32', '2022-02-21 11:22:32'),
(23, 'Что то про доту', 'Не знаю зачем, но нужно', 'uploads/users_video/TWbPh3tbmcsfGk2Ysr5b0dkUdQPIG5XoCMwmdgbd.mp4', 'upload/users_video/previews/sQnaw57SzRoYfRUKeJnrGrIbmBUr9xE1D8PpVfUh.png', 0, 1, 3, 3, '2022-02-21 11:22:33', '2022-02-21 11:22:33');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_video_id_foreign` (`video_id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_nickname_unique` (`nickname`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_user_id_foreign` (`user_id`),
  ADD KEY `video_category_foreign` (`category`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `video`
--
ALTER TABLE `video`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
