-- alter table categories add column slug text;

alter table orders add column is_guest boolean;

INSERT INTO `pages` (`id`, `type`, `slug`, `image`, `image1`, `image2`, `image3`, `image4`, `video`, `status`, `created_at`, `updated_at`) VALUES (NULL, 'return-policy', 'Privacy Policy', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2025-09-04 12:33:36', '2025-09-04 12:33:36'); 

UPDATE `pages` SET `type` = 'contact_us' WHERE `pages`.`id` = 7; 

UPDATE `pages` SET `type` = 'about-us' WHERE `pages`.`id` = 9; 

UPDATE `pages` SET `type` = 'terms-and-conditions' WHERE `pages`.`id` = 20; 

UPDATE `pages` SET `type` = 'privacy-policy' WHERE `pages`.`id` = 21; 

UPDATE `pages` SET `type` = 'return-policy' WHERE `pages`.`id` = 22