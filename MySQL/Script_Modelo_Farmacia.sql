-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Farmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Farmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Farmacia` DEFAULT CHARACTER SET utf8 ;
USE `Farmacia` ;

-- -----------------------------------------------------
-- Table `Farmacia`.`Tipos_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`Tipos_produto` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`Tipos_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_produto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`Fabricantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`Fabricantes` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`Fabricantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fabricante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`Produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`Produtos` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`Produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `designacao` VARCHAR(200) NOT NULL,
  `composicao` VARCHAR(200) NOT NULL,
  `preco_venda` DECIMAL(8,2) NOT NULL,
  `id_Fabricantes` INT NOT NULL,
  `id_Tipos_Produtos` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `foreign_key_1_idx` (`id_Tipos_Produtos` ASC),
  INDEX `foreign_key_3_idx` (`id_Fabricantes` ASC),
  CONSTRAINT `foreign_key_1`
    FOREIGN KEY (`id_Tipos_Produtos`)
    REFERENCES `Farmacia`.`Tipos_produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `foreign_key_3`
    FOREIGN KEY (`id_Fabricantes`)
    REFERENCES `Farmacia`.`Fabricantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`Clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`Compras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`Compras` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`Compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_Cliente` INT NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `foreign_key_2_idx` (`id_Cliente` ASC),
  CONSTRAINT `foreign_key_2`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `Farmacia`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`Produtos_Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`Produtos_Compra` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`Produtos_Compra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `foreign_key_4_idx` (`id_compra` ASC),
  INDEX `foreign_key_5_idx` (`id_produto` ASC),
  CONSTRAINT `foreign_key_4`
    FOREIGN KEY (`id_compra`)
    REFERENCES `Farmacia`.`Compras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `foreign_key_5`
    FOREIGN KEY (`id_produto`)
    REFERENCES `Farmacia`.`Produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`Medicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`Medicos` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`Medicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `crm` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`Receitas_Medicas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`Receitas_Medicas` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`Receitas_Medicas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_Produtos_Compra` INT NOT NULL,
  `id_Medicos` INT NOT NULL,
  `receita` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `foreign_key_6_idx` (`id_Produtos_Compra` ASC),
  INDEX `foreign_key_7_idx` (`id_Medicos` ASC),
  CONSTRAINT `foreign_key_6`
    FOREIGN KEY (`id_Produtos_Compra`)
    REFERENCES `Farmacia`.`Produtos_Compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `foreign_key_7`
    FOREIGN KEY (`id_Medicos`)
    REFERENCES `Farmacia`.`Medicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
