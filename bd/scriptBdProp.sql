-- MySQL Script generated by MySQL Workbench
-- Sat Oct 15 22:48:52 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema propiedades
-- -----------------------------------------------------
-- 
-- 

-- -----------------------------------------------------
-- Schema propiedades
--
-- 
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `propiedades` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `propiedades` ;

-- -----------------------------------------------------
-- Table `propiedades`.`product_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `propiedades`.`product_types` ;

CREATE TABLE IF NOT EXISTS `propiedades`.`product_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `propiedades`.`product_lines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `propiedades`.`product_lines` ;

CREATE TABLE IF NOT EXISTS `propiedades`.`product_lines` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `propiedades`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `propiedades`.`products` ;

CREATE TABLE IF NOT EXISTS `propiedades`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_types_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `desc` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `value` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `zone` VARCHAR(45) NULL,
  `create_date` VARCHAR(45) NULL,
  `delete_date` VARCHAR(45) NULL,
  `sub_zone` VARCHAR(45) NULL,
  `product_lines_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_product_types_idx` (`product_types_id` ASC) VISIBLE,
  INDEX `fk_products_product_lines1_idx` (`product_lines_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_product_types`
    FOREIGN KEY (`product_types_id`)
    REFERENCES `propiedades`.`product_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_product_lines1`
    FOREIGN KEY (`product_lines_id`)
    REFERENCES `propiedades`.`product_lines` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `propiedades`.`product_resources`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `propiedades`.`product_resources` ;

CREATE TABLE IF NOT EXISTS `propiedades`.`product_resources` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(200) NULL,
  `user_id` INT NULL,
  `create_date` VARCHAR(45) NULL,
  `delete_date` VARCHAR(45) NULL,
  `product_id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_images_products1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_images_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `propiedades`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `propiedades`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `propiedades`.`clients` ;

CREATE TABLE IF NOT EXISTS `propiedades`.`clients` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `clientscol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `propiedades`.`owners`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `propiedades`.`owners` ;

CREATE TABLE IF NOT EXISTS `propiedades`.`owners` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `rut` VARCHAR(45) NULL,
  `cell` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `propiedades`.`oferts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `propiedades`.`oferts` ;

CREATE TABLE IF NOT EXISTS `propiedades`.`oferts` (
  `owners_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  `desc` VARCHAR(200) NULL,
  INDEX `fk_producs_has_owners_owners1_idx` (`owners_id` ASC) VISIBLE,
  INDEX `fk_producs_has_owners_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_producs_has_owners_owners1`
    FOREIGN KEY (`owners_id`)
    REFERENCES `propiedades`.`owners` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producs_has_owners_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `propiedades`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `propiedades`.`prospection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `propiedades`.`prospection` ;

CREATE TABLE IF NOT EXISTS `propiedades`.`prospection` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clients_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_prospection_clients1_idx` (`clients_id` ASC) VISIBLE,
  INDEX `fk_prospection_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_prospection_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `propiedades`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prospection_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `propiedades`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
