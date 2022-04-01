-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercicio_2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercicio_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercicio_2` DEFAULT CHARACTER SET utf8 ;
USE `exercicio_2` ;

-- -----------------------------------------------------
-- Table `exercicio_2`.`tipos_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_2`.`tipos_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_2`.`professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_2`.`professores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `telefone` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_2`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_2`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `id_tipos_produto` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foreignkey_1_idx` (`id_tipos_produto` ASC) VISIBLE,
  CONSTRAINT `fk_foreignkey_1`
    FOREIGN KEY (`id_tipos_produto`)
    REFERENCES `exercicio_2`.`tipos_produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_2`.`turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_2`.`turmas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `capacidade` INT NOT NULL,
  `id_professores` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foreignkey_2_idx` (`id_professores` ASC) VISIBLE,
  CONSTRAINT `fk_foreignkey_2`
    FOREIGN KEY (`id_professores`)
    REFERENCES `exercicio_2`.`professores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_2`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_2`.`pacientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `bairro` VARCHAR(20) NOT NULL,
  `cidade` VARCHAR(20) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
