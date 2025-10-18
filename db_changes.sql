-- -- alter table categories add column slug text;

-- alter table orders add column is_guest boolean;

-- INSERT INTO `pages` (`id`, `type`, `slug`, `image`, `image1`, `image2`, `image3`, `image4`, `video`, `status`, `created_at`, `updated_at`) VALUES (NULL, 'return-policy', 'Privacy Policy', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2025-09-04 12:33:36', '2025-09-04 12:33:36'); 

-- UPDATE `pages` SET `type` = 'contact_us' WHERE `pages`.`id` = 7; 

-- UPDATE `pages` SET `type` = 'about-us' WHERE `pages`.`id` = 9; 

-- UPDATE `pages` SET `type` = 'terms-and-conditions' WHERE `pages`.`id` = 20; 

-- UPDATE `pages` SET `type` = 'privacy-policy' WHERE `pages`.`id` = 21; 

-- UPDATE `pages` SET `type` = 'return-policy' WHERE `pages`.`id` = 22



-- alter table orders add column razorpay_payment_id text after payment_status;

CREATE TABLE `admin_task_logs` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    `data` TEXT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `admin_task_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
