-- MySQL Script generated by MySQL Workbench
-- Ter 23 Jan 2018 21:16:46 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema uvents
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema uvents
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `uvents` DEFAULT CHARACTER SET utf8 ;
USE `uvents` ;

-- -----------------------------------------------------
-- Table `uvents`.`eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uvents`.`evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `foto_evento` VARCHAR(300) NULL,
  `nome_evento` VARCHAR(300) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_termino` DATE NOT NULL,
  `descricao_evento` LONGTEXT NOT NULL,
  `status` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uvents`.`atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uvents`.`atividade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_evento` INT NOT NULL,
  `id_orientador` INT NOT NULL,
  `nome_atividade` VARCHAR(100) NOT NULL,
  `orientador` VARCHAR(100) NOT NULL,
  `local` VARCHAR(100) NOT NULL,
  `data_atividade` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_termino` TIME NOT NULL,
  `descricao_atividade` LONGTEXT NULL,
  `observacao` LONGTEXT NULL,
  `limite` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_evento_idx` (`id_evento` ASC),
  CONSTRAINT `id_evento`
    FOREIGN KEY (`id_evento`)
    REFERENCES `uvents`.`evento` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uvents`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uvents`.`tipo_usuario` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uvents`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uvents`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `id_tipo_usuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_tipo_usuario1_idx` (`id_tipo_usuario` ASC),
  CONSTRAINT `fk_usuario_tipo_usuario1`
    FOREIGN KEY (`id_tipo_usuario`)
    REFERENCES `uvents`.`tipo_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uvents`.`usuario_has_atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uvents`.`usuario_has_atividade` (
  `id_usuario` INT NOT NULL,
  `id_atividade` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_atividade`),
  INDEX `fk_usuario_has_atividade_atividade1_idx` (`id_atividade` ASC),
  INDEX `fk_usuario_has_atividade_usuario1_idx` (`id_usuario` ASC),
  CONSTRAINT `fk_usuario_has_atividade_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `uvents`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_atividade_atividade1`
    FOREIGN KEY (`id_atividade`)
    REFERENCES `uvents`.`atividade` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO tipo_usuario (id, descricao) values(1, "convidado");
INSERT INTO tipo_usuario (id, descricao) values(2, "aluno");
INSERT INTO tipo_usuario (id, descricao) values(3, "professor");

-- Usuário ADM -- A senha é 123 ---
INSERT INTO `usuario` VALUES (1, 000.000.000-00, 'adm@gmail.com', 'Administrador', 'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 3);

INSERT INTO `evento` VALUES (1,null,"Missa Dominical",'2018-12-11','2018-12-11','Deus te abençoe','ativo'),
                            (2,NULL,'Semana de Tecnologia','2018-09-11','2018-09-18','Várias palestras','ativo');
                            
INSERT INTO `atividade` VALUES (1,1,1,'Oração Inicial','Edmarcos','Capela Ns. Senhora','2018-12-12','12:00:00','12:15:00','Benção na sua vida','Tudo certo',500),
							   (2,1,1,'Comunhão','Padre Bento','Capela Ns. Senhora','2018-12-12','12:15:00','12:50:00','Corpo de Cristo','Amém!',500),
							   (3,2,1,'Palestra - Arroz com feijão','Prof° Zé Doido','Sala 2','2018-02-27','11:00:00','12:00:00','Amanhã','kkk',45);
                               
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
