
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
  `cor_id` INT NOT NULL,
  `montadora_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_carro_1_idx` (`cor_id` ASC) VISIBLE,
  INDEX `fk_carro_2_idx` (`montadora_id` ASC) VISIBLE,
  INDEX `fk3_carro_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_carro_1`
    FOREIGN KEY (`cor_id`)
    REFERENCES `carloca`.`cor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carro_2`
    FOREIGN KEY (`montadora_id`)
    REFERENCES `carloca`.`montadora` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carro_3`
    FOREIGN KEY (`categoria_id`)
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
  `contato` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`franquia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk1_franquia_idx` (`endereco_id` ASC) VISIBLE,
  CONSTRAINT `fk_franquia_1`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `carloca`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`endereco_cliente` (
  `cliente_id` INT NOT NULL,
  `endereco_id` INT NOT NULL,
  INDEX `fk1_endereco_cliente_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk2_endereco_cliente_idx` (`endereco_id` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_cliente_1`
    FOREIGN KEY (`cliente_id`)
  `id_cliente` INT NOT NULL,
  `id_endereco` INT NOT NULL,
  INDEX `fk1_endereco_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk2_endereco_cliente_idx` (`id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk1_endereco_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `carloca`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_cliente_2`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `carloca`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`telefone_cliente` (
  `cliente_id` INT NOT NULL,
  `telefone_id` INT NOT NULL,
  INDEX `fk1_telefone_cliente_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk2_telefone_cliente_idx` (`telefone_id` ASC) VISIBLE,
  CONSTRAINT `fk_telefone_cliente_1`
    FOREIGN KEY (`cliente_id`)
  `id_cliente` INT NOT NULL,
  `id_telefone` INT NOT NULL,
  INDEX `fk1_telefone_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk2_telefone_cliente_idx` (`id_telefone` ASC) VISIBLE,
  CONSTRAINT `fk1_telefone_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `carloca`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefone_cliente_2`
    FOREIGN KEY (`telefone_id`)
    REFERENCES `carloca`.`telefone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`retirada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL,
  `quilometragem` INT NOT NULL,
  `franquia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk2_retirada_idx` (`franquia_id` ASC) VISIBLE,
  CONSTRAINT `fk_retirada_1`
    FOREIGN KEY (`franquia_id`)
    REFERENCES `carloca`.`franquia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`devolucao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL,
  `quilometragem` INT NOT NULL,
  `franquia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk2_devolucao_idx` (`franquia_id` ASC) VISIBLE,
  CONSTRAINT `fk_devolucao_1`
    FOREIGN KEY (`franquia_id`)
    REFERENCES `carloca`.`franquia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`locacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL,
  `cliente_id` INT NOT NULL,
  `carro_id` INT NOT NULL,
  `retirada_id` INT NOT NULL,
  `devolucao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk1_locacao_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk2_locacao_idx` (`carro_id` ASC) VISIBLE,
  INDEX `fk3_locacao_idx` (`retirada_id` ASC) VISIBLE,
  INDEX `fk4_locacao_idx` (`devolucao_id` ASC) VISIBLE,
  CONSTRAINT `fk_locacao_1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `carloca`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locacao_2`
    FOREIGN KEY (`carro_id`)
    REFERENCES `carloca`.`carro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locacao_3`
    FOREIGN KEY (`retirada_id`)
    REFERENCES `carloca`.`retirada` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locacao_4`
    FOREIGN KEY (`devolucao_id`)
    REFERENCES `carloca`.`devolucao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `carloca`.`estoque_carro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `disponivel` TINYINT NOT NULL,
  `carro_id` INT NOT NULL,
  `franquia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk1_estoque_carro_idx` (`franquia_id` ASC) VISIBLE,
  INDEX `fk2_estoque_carro_idx` (`carro_id` ASC) VISIBLE,
  CONSTRAINT `fk_estoque_carro_1`
    FOREIGN KEY (`franquia_id`)
    REFERENCES `carloca`.`franquia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estoque_carro_2`
    FOREIGN KEY (`carro_id`)
    REFERENCES `carloca`.`carro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
