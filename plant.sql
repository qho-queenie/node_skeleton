-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sessionID` VARCHAR(255) NULL,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NOT NULL,
  `permission_level` INT NULL,
  `money` MEDIUMTEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC));


-- -----------------------------------------------------
-- Table `mydb`.`plant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plant` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `stage` INT NULL,
  `user_id` INT NOT NULL,
  `guide` LONGTEXT NULL,
  `age_days` INT NULL,
  `seeds` INT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_plant_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_plant_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`plant_action`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plant_action` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(255) NULL,
  `health` INT NULL,
  `plant_id` INT NOT NULL,
  `seeds` INT NULL,
  `type` INT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`, `plant_id`),
  INDEX `fk_plant_action_plant1_idx` (`plant_id` ASC),
  CONSTRAINT `fk_plant_action_plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `mydb`.`plant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`offer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`offer` (
  `id` INT NOT NULL,
  `seeds` INT NULL,
  `user_id` INT NOT NULL,
  `plant_id` INT NOT NULL,
  `recipient_id` INT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`, `user_id`, `plant_id`),
  INDEX `fk_offer_user1_idx` (`user_id` ASC),
  INDEX `fk_offer_plant1_idx` (`plant_id` ASC),
  CONSTRAINT `fk_offer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_plant1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `mydb`.`plant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
