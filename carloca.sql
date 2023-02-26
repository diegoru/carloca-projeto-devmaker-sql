CREATE SCHEMA IF NOT EXISTS `carloca` DEFAULT CHARACTER SET utf8 ;
USE `carloca` ;

CREATE TABLE IF NOT EXISTS `carloca`.`cor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `carloca`.`montadora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor_diaria` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`carro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(90) NOT NULL,
  `versao` VARCHAR(45) NOT NULL,
  `quilometragem` INT NOT NULL,
  `id_cor` INT NOT NULL,
  `id_montadora` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_carro_1_idx` (`id_cor` ASC) VISIBLE,
  INDEX `fk_carro_2_idx` (`id_montadora` ASC) VISIBLE,
  INDEX `fk3_carro_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk1_carro`
    FOREIGN KEY (`id_cor`)
    REFERENCES `carloca`.`cor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk2_carro`
    FOREIGN KEY (`id_montadora`)
    REFERENCES `carloca`.`montadora` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk3_carro`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `carloca`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `cnh` VARCHAR(11) NOT NULL,
  `email` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(90) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `bairro` VARCHAR(9) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`telefone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `ddi` VARCHAR(3) NOT NULL,
  `ddd` VARCHAR(4) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`franquia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `id_endereco` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk1_franquia_idx` (`id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk1_franquia`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `carloca`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`endereco_cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `id_endereco` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk1_endereco_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk2_endereco_cliente_idx` (`id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk1_endereco_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `carloca`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk2_endereco_cliente`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `carloca`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`telefone_cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contato` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_telefone` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk1_telefone_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk2_telefone_cliente_idx` (`id_telefone` ASC) VISIBLE,
  CONSTRAINT `fk1_telefone_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `carloca`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk2_telefone_cliente`
    FOREIGN KEY (`id_telefone`)
    REFERENCES `carloca`.`telefone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`retirada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `quilometragem` INT NOT NULL,
  `id_franquia` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk2_retirada_idx` (`id_franquia` ASC) VISIBLE,
  CONSTRAINT `fk1_retirada`
    FOREIGN KEY (`id_franquia`)
    REFERENCES `carloca`.`franquia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`devolucao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `quilometragem` INT NOT NULL,
  `id_franquia` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk2_devolucao_idx` (`id_franquia` ASC) VISIBLE,
  CONSTRAINT `fk1_devolucao`
    FOREIGN KEY (`id_franquia`)
    REFERENCES `carloca`.`franquia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`locacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_carro` INT NOT NULL,
  `id_retirada` INT NOT NULL,
  `id_devolucao` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk1_locacao_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk2_locacao_idx` (`id_carro` ASC) VISIBLE,
  INDEX `fk3_locacao_idx` (`id_retirada` ASC) VISIBLE,
  INDEX `fk4_locacao_idx` (`id_devolucao` ASC) VISIBLE,
  CONSTRAINT `fk1_locacao`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `carloca`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk2_locacao`
    FOREIGN KEY (`id_carro`)
    REFERENCES `carloca`.`carro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk3_locacao`
    FOREIGN KEY (`id_retirada`)
    REFERENCES `carloca`.`retirada` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk4_locacao`
    FOREIGN KEY (`id_devolucao`)
    REFERENCES `carloca`.`devolucao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`estoque_carro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `disponivel` TINYINT NOT NULL,
  `id_franquia` INT NOT NULL,
  `id_carro` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk1_estoque_carro_idx` (`id_franquia` ASC) VISIBLE,
  INDEX `fk2_estoque_carro_idx` (`id_carro` ASC) VISIBLE,
  CONSTRAINT `fk1_estoque_carro`
    FOREIGN KEY (`id_franquia`)
    REFERENCES `carloca`.`franquia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk2_estoque_carro`
    FOREIGN KEY (`id_carro`)
    REFERENCES `carloca`.`carro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
