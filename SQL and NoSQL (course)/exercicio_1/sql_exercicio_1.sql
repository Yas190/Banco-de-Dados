-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercicio_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercicio_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercicio_1` DEFAULT CHARACTER SET utf8 ;
USE `exercicio_1` ;

-- -----------------------------------------------------
-- Table `exercicio_1`.`revendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`revendedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(14) NOT NULL,
  `razao_social` VARCHAR(50) NOT NULL,
  `contato` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`notas_fiscais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`notas_fiscais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `numero_de_serie` VARCHAR(15) NOT NULL,
  `decricao` VARCHAR(100) NOT NULL,
  `id_revendedor` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foreignkey_13_idx` (`id_revendedor` ASC) VISIBLE,
  CONSTRAINT `fk_foreignkey_13`
    FOREIGN KEY (`id_revendedor`)
    REFERENCES `exercicio_1`.`revendedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`sabores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`sabores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`tipo_da_embalagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`tipo_da_embalagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`tipos_de_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`tipos_de_picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`picoles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`picoles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `preco` DECIMAL(3,2) NOT NULL,
  `id_sabores` INT NOT NULL,
  `id_tipo_da_embalagem` INT NOT NULL,
  `id_tipo_de_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foreignkey_1_idx` (`id_sabores` ASC) VISIBLE,
  INDEX `fk_foreignkey_2_idx` (`id_tipo_da_embalagem` ASC) VISIBLE,
  INDEX `fk_foreignkey_3_idx` (`id_tipo_de_picole` ASC) VISIBLE,
  CONSTRAINT `fk_foreignkey_1`
    FOREIGN KEY (`id_sabores`)
    REFERENCES `exercicio_1`.`sabores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_foreignkey_2`
    FOREIGN KEY (`id_tipo_da_embalagem`)
    REFERENCES `exercicio_1`.`tipo_da_embalagem` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_foreignkey_3`
    FOREIGN KEY (`id_tipo_de_picole`)
    REFERENCES `exercicio_1`.`tipos_de_picole` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`aditivos_quimicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`aditivos_quimicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `formula_quimica` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`picole_aditivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`picole_aditivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_picoles` INT NOT NULL,
  `id_aditivos_quimicos` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foreignkey_8_idx` (`id_picoles` ASC) VISIBLE,
  INDEX `fk_foreignkey_9_idx` (`id_aditivos_quimicos` ASC) VISIBLE,
  CONSTRAINT `fk_foreignkey_8`
    FOREIGN KEY (`id_picoles`)
    REFERENCES `exercicio_1`.`picoles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_foreignkey_9`
    FOREIGN KEY (`id_aditivos_quimicos`)
    REFERENCES `exercicio_1`.`aditivos_quimicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`conservantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`conservantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`picole_conservante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`picole_conservante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_picoles` INT NOT NULL,
  `id_conservante` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foreignkey_6_idx` (`id_picoles` ASC) VISIBLE,
  INDEX `fk_foreignkey_7_idx` (`id_conservante` ASC) VISIBLE,
  CONSTRAINT `fk_foreignkey_6`
    FOREIGN KEY (`id_picoles`)
    REFERENCES `exercicio_1`.`picoles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_foreignkey_7`
    FOREIGN KEY (`id_conservante`)
    REFERENCES `exercicio_1`.`conservantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`ingredientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`ingredientes_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`ingredientes_picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_picoles` INT NOT NULL,
  `id_ingredientes` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foreignkey_4_idx` (`id_picoles` ASC) VISIBLE,
  INDEX `fk_foreignkey_5_idx` (`id_ingredientes` ASC) VISIBLE,
  CONSTRAINT `fk_foreignkey_4`
    FOREIGN KEY (`id_picoles`)
    REFERENCES `exercicio_1`.`picoles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_foreignkey_5`
    FOREIGN KEY (`id_ingredientes`)
    REFERENCES `exercicio_1`.`ingredientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`lote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_picole` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foreignkey_10_idx` (`id_tipo_picole` ASC) VISIBLE,
  CONSTRAINT `fk_foreignkey_10`
    FOREIGN KEY (`id_tipo_picole`)
    REFERENCES `exercicio_1`.`tipos_de_picole` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercicio_1`.`lote_nota_fiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercicio_1`.`lote_nota_fiscal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_notas_fiscais` INT NOT NULL,
  `id_lote` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foreignkey_11_idx` (`id_notas_fiscais` ASC) VISIBLE,
  INDEX `fk_foreignkey_12_idx` (`id_lote` ASC) VISIBLE,
  CONSTRAINT `fk_foreignkey_11`
    FOREIGN KEY (`id_notas_fiscais`)
    REFERENCES `exercicio_1`.`notas_fiscais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_foreignkey_12`
    FOREIGN KEY (`id_lote`)
    REFERENCES `exercicio_1`.`lote` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
