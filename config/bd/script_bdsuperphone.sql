-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_superphone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_superphone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_superphone` DEFAULT CHARACTER SET utf8 ;
USE `bd_superphone` ;

-- -----------------------------------------------------
-- Table `bd_superphone`.`tipoProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_superphone`.`tipoProduto` (
  `idtipoProduto` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipoProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_superphone`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_superphone`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `preco` FLOAT NULL,
  `marca` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `idtipoProduto` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_Produto_tipoProduto1_idx` (`idtipoProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_tipoProduto1`
    FOREIGN KEY (`idtipoProduto`)
    REFERENCES `bd_superphone`.`tipoProduto` (`idtipoProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_superphone`.`Comprador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_superphone`.`Comprador` (
  `idPessoa` INT NOT NULL AUTO_INCREMENT,
  `cpf` INT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idPessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_superphone`.`formaPagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_superphone`.`formaPagamento` (
  `idformaPagamento` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idformaPagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_superphone`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_superphone`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NULL,
  `valorTotal` FLOAT NULL,
  `idPessoa` INT NOT NULL,
  `idformaPagamento` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
  INDEX `fk_Venda_Comprador1_idx` (`idPessoa` ASC) VISIBLE,
  INDEX `fk_Venda_formaPagamento1_idx` (`idformaPagamento` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Comprador1`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `bd_superphone`.`Comprador` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_formaPagamento1`
    FOREIGN KEY (`idformaPagamento`)
    REFERENCES `bd_superphone`.`formaPagamento` (`idformaPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_superphone`.`Venda_has_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_superphone`.`Venda_has_Produto` (
  `idVenda` INT NOT NULL,
  `idProduto` INT NOT NULL,
  PRIMARY KEY (`idVenda`, `idProduto`),
  INDEX `fk_Venda_has_Produto_Produto1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_Venda_has_Produto_Venda1_idx` (`idVenda` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_has_Produto_Venda1`
    FOREIGN KEY (`idVenda`)
    REFERENCES `bd_superphone`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_has_Produto_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `bd_superphone`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
