-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cafe
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cafe` ;

-- -----------------------------------------------------
-- Schema cafe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cafe` DEFAULT CHARACTER SET utf8 ;
USE `cafe` ;

-- -----------------------------------------------------
-- Table `menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `menu` ;

CREATE TABLE IF NOT EXISTS `menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `menu` (`id` ASC);


-- -----------------------------------------------------
-- Table `day`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `day` ;

CREATE TABLE IF NOT EXISTS `day` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menu_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `menu_item` ;

CREATE TABLE IF NOT EXISTS `menu_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `price` DECIMAL(4,2) NOT NULL DEFAULT 5.99,
  `description` VARCHAR(100) NOT NULL,
  `day_id` INT NULL DEFAULT NULL,
  `menu_id` INT NULL DEFAULT NULL,
  `special` TINYINT(1) NULL DEFAULT 0,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_menu_item_to_day`
    FOREIGN KEY (`day_id`)
    REFERENCES `day` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_item_to_menu`
    FOREIGN KEY (`menu_id`)
    REFERENCES `menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `menu_item` (`id` ASC);

CREATE INDEX `fk_menu_to_menu_item_idx` ON `menu_item` (`menu_id` ASC);

CREATE INDEX `fk_day_to_menu_item_idx` ON `menu_item` (`day_id` ASC);


-- -----------------------------------------------------
-- Table `user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_role` ;

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` INT NOT NULL DEFAULT 2,
  `permission` VARCHAR(45) NULL DEFAULT 'customer',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
PACK_KEYS = Default;

CREATE UNIQUE INDEX `id_UNIQUE` ON `user_role` (`id` ASC);


-- -----------------------------------------------------
-- Table `rewards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rewards` ;

CREATE TABLE IF NOT EXISTS `rewards` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `points` INT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `rewards` (`id` ASC);


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `user_role_id` INT NULL DEFAULT NULL,
  `rewards_id` INT NULL DEFAULT NULL,
  `email_address` VARCHAR(80) NULL DEFAULT NULL,
  `phone_number` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_to_user_role_id`
    FOREIGN KEY (`user_role_id`)
    REFERENCES `user_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_to_rewards_id`
    FOREIGN KEY (`rewards_id`)
    REFERENCES `rewards` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `user` (`id` ASC);

CREATE INDEX `fk_user_to_user_role_id_idx` ON `user` (`user_role_id` ASC);

CREATE INDEX `fk_user_to_rewards_id_idx` ON `user` (`rewards_id` ASC);


-- -----------------------------------------------------
-- Table `takeout_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `takeout_order` ;

CREATE TABLE IF NOT EXISTS `takeout_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_to_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_order_to_user` ON `takeout_order` (`user_id` ASC);


-- -----------------------------------------------------
-- Table `order_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `order_item` ;

CREATE TABLE IF NOT EXISTS `order_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NULL DEFAULT NULL,
  `menu_item_id` INT NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_item_to_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `takeout_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_to_menu_item`
    FOREIGN KEY (`menu_item_id`)
    REFERENCES `menu_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_orer_to_menu_item_idx` ON `order_item` (`menu_item_id` ASC);

CREATE INDEX `fk_order_item_to_order_idx` ON `order_item` (`order_id` ASC);

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin@localhost;
 DROP USER admin@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO customer@localhost;
 DROP USER customer@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'customer'@'localhost' IDENTIFIED BY 'customer';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'customer'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `menu`
-- -----------------------------------------------------
START TRANSACTION;
USE `cafe`;
INSERT INTO `menu` (`id`, `name`) VALUES (1, 'Monday');
INSERT INTO `menu` (`id`, `name`) VALUES (2, 'Tuesday');
INSERT INTO `menu` (`id`, `name`) VALUES (3, 'Wednesday');
INSERT INTO `menu` (`id`, `name`) VALUES (4, 'Thursday');
INSERT INTO `menu` (`id`, `name`) VALUES (5, 'Friday');

COMMIT;


-- -----------------------------------------------------
-- Data for table `day`
-- -----------------------------------------------------
START TRANSACTION;
USE `cafe`;
INSERT INTO `day` (`id`, `name`) VALUES (1, 'breakfast');
INSERT INTO `day` (`id`, `name`) VALUES (2, 'lunch');

COMMIT;


-- -----------------------------------------------------
-- Data for table `menu_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `cafe`;
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (1, 'Croissant Breakfast', 4.25, 'Egg, Cheese, and Choice of Meat', 1, NULL, NULL, 'Breakfast');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (2, 'English Muffin Breakfast', 3.99, 'Egg, Cheese, and Choice of Meat', 1, NULL, NULL, 'Breakfast');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (3, 'Bagel Breakfast', 4.25, 'Egg, Cheese, and Choice of Meat', 1, NULL, NULL, 'Breakfast');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (4, 'Breakfast Burritos', 4.75, 'Egg, Cheese, Green Chili, Potato, Salsa, and Choice of Meat', 1, NULL, NULL, 'Breakfast');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (5, 'Omelet With Toasted Bread', 6.25, 'Tomatoes, Onions, Cheese, Ham, Bacon, Egg, Mushroom, Bell Peppers, and Salsa', 1, NULL, NULL, 'Breakfast');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (6, 'Bagel With Butter', 1.99, 'Bagel and Butter', 1, NULL, NULL, 'Breakfast');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (7, 'Bagel With Cream Cheese', 2.45, 'Bagel and Cream Cheese', 1, NULL, NULL, 'Breakfast');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (8, 'Vegetable Wrap', 6.50, 'Spinach Wrap, Lettuce, Tomato, Bell Pepper, Avocado, Cucumber, Mushroom, Ranch Dressing, and Cheese', 2, NULL, NULL, 'Wrap');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (9, 'Turkey Wrap', 6.99, 'Spinach Wrap, Turkey, Lettuce, Tomato, Bell Pepper, Avocado, Cucumber, Mushroom, Ranch Dressing, and Bacon', 2, NULL, NULL, 'Wrap');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (10, 'Tuna Wrap', 7.25, 'Tuna Wrap', 2, NULL, NULL, 'Wrap');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (11, 'Chicken Teriyaki Wrap', 7.25, 'Chicken Breast, Mushroom, Bell Pepper, Onion, Avocado, Cheese, Teriyaki Sauce, Lettuce, Tomato, Spinach, and Tortilla', 2, NULL, NULL, 'Wrap');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (12, 'Chicken and Bacon Wrap', 7.50, 'Chicken Breast, Lettuce, Cheese, Bacon, Tomato, Cucumber, Ranch, and Honey Mustard', 2, NULL, NULL, 'Wrap');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (13, 'Ham Sandwich', 6.25, 'Ham, American Cheese, Lettuce, Tomato, Mustard, and Mayo', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (14, 'Turkey Sandwich', 6.35, 'Turkey, Swiss Cheese, Lettuce, Tomato, Mustard, and Mayo', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (15, 'California Croissant Sandwich ', 6.75, 'Croissant Bread, Turkey, Provolone Cheese, Lettuce, Tomato, Mayo, and Avocado', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (16, 'Club Sandwich', 6.75, 'Ham, Turkey, Swiss Cheese, Bacon, Lettuce, Tomato, Mayo, and Mustard', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (17, 'BLT Sandwich', 6.99, 'Bacon, Lettuce, Tomato, Mayo, and Avocado', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (18, 'Grilled Cheese Sandwich', 5.99, 'Toasted Bread and American Cheese ', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (19, 'Vegetarian Sandwich', 6.25, 'Lettuce, Tomato, Avocado, Swiss Cheese, Cucumber, and Mayo', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (20, 'Ruben Sandwich', 6.75, 'Turkey Pastarmi, Sauerkraut, Swiss Cheese, Rye Bread, and Thousand Island Dressing ', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (21, 'Tuna Melt', 6.50, 'Homemade Tuna, Celery, Mayo, Pepper, Salt, and American Cheese', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (22, 'Tuna Salad Sandwich', 6.50, 'Homemade Tuna, Celery, Mayo, Pepper, Salt, Lettuce, and Tomato', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (23, 'Chicken Salad Sandwich', 6.99, 'Chicken Breast, Mayo, Pepper, Salt, Celery, Onion, Lettuce, and Tomato', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (24, 'Egg Salad Sandwich', 6.25, 'Egg, Mayo, Sugar, Mustard, Lettuce, and Tomato', 2, NULL, NULL, 'Sandwich');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (25, 'Chicken Cordon Blue', 6.75, 'Ham, Chicken Breast, Swiss Cheese, Lettuce, Tomato, Mayo, and Mustard', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (26, 'Avocado Turkey', 6.65, 'Turkey, Swiss Cheese, Avocado, Lettuce, Tomato, Mustard, and Mushrooms', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (27, 'Philly Steak ', 7.25, 'Roast Beef, Mushroom, Pepper Jack Cheese, Onion, and Bell Pepper', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (28, 'French Dip', 6.99, 'Roast Beef, Provolone Cheese, and Aju Sauce', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (29, 'Italian Sub', 6.50, 'Ham, Salami, Mozzarella Cheese, Italian Dressing, Lettuce, and Tomato', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (30, 'New York Sub', 6.75, 'Ham, Turkey, Roast Beef, Swiss Cheese, Lettuce, Tomato, Mayo, and Mustard', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (31, 'Meatball Sub', 6.50, 'Meatballs, Marinara Sauce, and Mozarella Cheese', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (32, 'Chicken Breast Turkey', 6.99, 'Chicken Breast, Turkey, Swiss Cheese, Avocado, Mushroom, Lettuce, Tomato, Mayo, and Mustard', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (33, 'Chicken BBQ', 6.75, 'Teriyaki Chicken, BBQ Sauce, and Swiss Cheese', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (34, 'Chicken Breast Sub', 6.75, 'Chicken Breast, Cheese, Bell Pepper, Onion, Mushroom, Lettuce, Tomato, and Ranch Dressing', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (35, 'Chicken Artichoke Sub', 7.50, 'Chicken Breast, Pepperjack Cheese, Bell Pepper, Spinach Dip, Artichoke, and Pesto Red Pepper', 2, NULL, NULL, 'Hot Subs');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (36, 'Cheeseburger with Chips', 5.99, 'American Cheese, Lettuce, Tomato, Ketchup, Mustard, and Onion', 2, NULL, NULL, 'Burgers');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (37, 'Chicken Burger with Chips', 6.99, 'Grilled Chicken Breast, Pepper Jack Cheese, Lettuce, Tomato, and Mayo', 2, NULL, NULL, 'Burgers');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (38, 'Taco Salad', 6.50, 'Beef, Beans, Lettuce, Tomato, Cheddar Cheese, Onions, Sour Cream, Tortilla Chips, and Salsa', 2, NULL, NULL, 'Mexican');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (39, 'Ham and Cheese Quesadilla', 6.50, 'Sliced Grilled Chicken, Green Chili, Pepper Jack Cheese, and Salsa', 2, NULL, NULL, 'Mexican');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (40, 'Cheese Quesadilla', 5.99, 'American Cheese, Pepper Jack Cheese, Green Chili, and Salsa', 2, NULL, NULL, 'Mexican');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (41, 'House Garden Salad', 5.99, 'Lettuce, Tomato, Cucumber, Egg, and Shredded Cheese', 2, NULL, NULL, 'Salad');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (42, 'Chef Salad', 6.50, 'Lettuce, Tomato, Cucumber, Egg, Shredded Cheese, Choice of Dressing, Ham, and Turkey', 2, NULL, NULL, 'Salad');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (43, 'Greek Salad', 6.25, 'Lettuce, Tomato, Cucumber, Olives, Onions, Feta Cheese, and Choice of Dressing', 2, NULL, NULL, 'Salad');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (44, 'Chicken Caesar Salad', 6.50, 'Chicken, Lettuce, Parmesan Cheese, and Caesar Dressing', 2, NULL, NULL, 'Salad');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (45, 'Tuna Garden Salad', 6.50, 'Lettuce, Tomato, Cucumber, Olives, Tuna, and Choice of Dressing', 2, NULL, NULL, 'Salad');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (46, 'Chicken Bowl', 7.25, 'Rice, Grilled Chicken Breast, and Teriyaki Sauce', 2, NULL, NULL, 'Rice Bowl');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (47, 'Vegetable Bowl', 6.50, 'Rice, Vegetables, and Teriyaki Sauce', 2, NULL, NULL, 'Rice Bowl');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (48, 'Chicken and Vegetable Combo Bowl', 8.25, 'Rice, Mixed Vegetables, Grilled Chicken Breast, and Teriyaki Sauce', 2, NULL, NULL, 'Rice Bowl');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (49, 'Beef Bowl', 7.99, 'Sliced Beef on Rice', 2, NULL, NULL, 'Rice Bowl');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (50, 'Beef and Vegetable Combo Bowl', 8.99, 'Beef, Vegetable, and Rice', 2, NULL, NULL, 'Rice Bowl');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (51, 'Small Drink Cup', 2.25, 'Fountain Soda', 2, NULL, NULL, 'Drinks');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (52, 'Large Drink Cup', 1.95, 'Fountain Soda ', 2, NULL, NULL, 'Drinks');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (53, 'Small Soup Cup', 3.99, 'Soup', 1, NULL, NULL, 'Soups');
INSERT INTO `menu_item` (`id`, `name`, `price`, `description`, `day_id`, `menu_id`, `special`, `category`) VALUES (54, 'Large Soup Cup', 4.99, 'Soup', 1, NULL, NULL, 'Soups');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `cafe`;
INSERT INTO `user_role` (`id`, `permission`) VALUES (1, 'admin');
INSERT INTO `user_role` (`id`, `permission`) VALUES (2, 'customer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rewards`
-- -----------------------------------------------------
START TRANSACTION;
USE `cafe`;
INSERT INTO `rewards` (`id`, `points`) VALUES (1, 10);
INSERT INTO `rewards` (`id`, `points`) VALUES (2, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `cafe`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_role_id`, `rewards_id`, `email_address`, `phone_number`) VALUES (1, 'Brian', 'Thomas', 'admin', 'admin', 1, 1, 'brianthomas@gmail.com', 1234567891);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_role_id`, `rewards_id`, `email_address`, `phone_number`) VALUES (2, 'Stan', 'V', 'customer', 'customer', 2, 2, 'stanv@gmail.com', 1123456789);

COMMIT;


-- -----------------------------------------------------
-- Data for table `takeout_order`
-- -----------------------------------------------------
START TRANSACTION;
USE `cafe`;
INSERT INTO `takeout_order` (`id`, `time`, `user_id`) VALUES (1, '12:00', 1);
INSERT INTO `takeout_order` (`id`, `time`, `user_id`) VALUES (2, '14:00', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `order_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `cafe`;
INSERT INTO `order_item` (`id`, `order_id`, `menu_item_id`, `quantity`) VALUES (2, 2, 1, 1);
INSERT INTO `order_item` (`id`, `order_id`, `menu_item_id`, `quantity`) VALUES (1, 1, 2, 1);

COMMIT;

