SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `{#db_database_name#}` ;
CREATE SCHEMA IF NOT EXISTS `{#db_database_name#}` DEFAULT CHARACTER SET utf8 ;
USE `{#db_database_name#}` ;


-- -----------------------------------------------------
-- Table `oms_com_code`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oms_com_code` ;

CREATE TABLE IF NOT EXISTS `oms_com_code` (
  `codeGroup` INT NOT NULL,
  `code` INT NOT NULL,
  `codeTitle` VARCHAR(255) NOT NULL,
  `codeValue` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`codeGroup`, `code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oms_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oms_member` ;

CREATE TABLE IF NOT EXISTS `oms_member` (
  `memberId` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `passwordFailCnt` INT NOT NULL DEFAULT 0,
  `memberName` VARCHAR(255) NOT NULL,
  `gradeCodeGroup` INT NOT NULL,
  `gradeCode` INT NOT NULL,
  `corpCardLimit` INT,
  `registeredDate` DATETIME NOT NULL,
  `modifiedDate` DATETIME NOT NULL,
  `lastLoginDate` DATETIME NOT NULL,
  PRIMARY KEY (`memberId`),
  INDEX `fk_oms_member_oms_com_code1_idx` (`gradeCodeGroup` ASC, `gradeCode` ASC),
  CONSTRAINT `fk_oms_member_oms_com_code1`
    FOREIGN KEY (`gradeCodeGroup` , `gradeCode`)
    REFERENCES `oms_com_code` (`codeGroup` , `code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oms_persitent_login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oms_persitent_login` ;

CREATE TABLE IF NOT EXISTS `oms_persitent_login` (
  `memberId` VARCHAR(255) NOT NULL,
  `series` VARCHAR(64) NOT NULL,
  `token` VARCHAR(64) NOT NULL,
  `lastUsed` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`memberId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oms_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oms_role` ;

CREATE TABLE IF NOT EXISTS `oms_role` (
  `roleId` INT NOT NULL,
  `roleName` VARCHAR(255) NOT NULL,
  `registeredDate` DATETIME NOT NULL,
  `modifiedDate` DATETIME NOT NULL,
  PRIMARY KEY (`roleId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oms_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oms_service` ;

CREATE TABLE IF NOT EXISTS `oms_service` (
  `serviceId` INT NOT NULL,
  `roleId` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `sliderImage` VARCHAR(255) NOT NULL,
  `iconImage` VARCHAR(255) NOT NULL,
  `pageName` VARCHAR(255) NOT NULL,
  `pageUrl` VARCHAR(255) NOT NULL,
  `registeredDate` DATETIME NOT NULL,
  `modifiedDate` DATETIME NOT NULL,
  PRIMARY KEY (`serviceId`),
  INDEX `fk_oms_service_oms_role1_idx` (`roleId` ASC),
  CONSTRAINT `fk_oms_service_oms_role1`
    FOREIGN KEY (`roleId`)
    REFERENCES `oms_role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oms_corp_moneybook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oms_corp_moneybook` ;

CREATE TABLE IF NOT EXISTS `oms_corp_moneybook` (
  `seq` INT NOT NULL,
  `usedDate` VARCHAR(10) NOT NULL,
  `category` VARCHAR(255) NOT NULL,
  `customer` VARCHAR(255) NULL,
  `usedPlace` VARCHAR(255) NOT NULL,
  `price` INT NOT NULL,
  `note` VARCHAR(255) NOT NULL,
  `memberId` VARCHAR(255) NOT NULL,
  `registeredDate` DATETIME NOT NULL,
  `modifiedDate` DATETIME NOT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oms_person_moneybook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oms_person_moneybook` ;

CREATE TABLE IF NOT EXISTS `oms_person_moneybook` (
  `seq` INT NOT NULL,
  `usedDate` VARCHAR(10) NOT NULL,
  `summary` VARCHAR(255) NOT NULL,
  `price` INT NOT NULL,
  `usedPlace` VARCHAR(255) NULL,
  `note` VARCHAR(255) NULL,
  `memberId` VARCHAR(255) NOT NULL,
  `registeredDate` DATETIME NOT NULL,
  `modifiedDate` DATETIME NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_oms_person_moneybook_oms_member1_idx` (`memberId` ASC),
  CONSTRAINT `fk_oms_person_moneybook_oms_member1`
    FOREIGN KEY (`memberId`)
    REFERENCES `oms_member` (`memberId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oms_person_moneybook_approval`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oms_person_moneybook_approval` ;

CREATE TABLE IF NOT EXISTS `oms_person_moneybook_approval` (
  `seq` INT NOT NULL,
  `sentMemberId` VARCHAR(255) NOT NULL,
  `receivedMemberId` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `sentMemberSign` BLOB NULL,
  `receivedMemberSign` BLOB NULL,
  `statusCodeGroup` INT NOT NULL,
  `statusCode` INT NOT NULL,
  `startDate` DATETIME NOT NULL,
  `endDate` DATETIME NOT NULL,
  `completedDate` DATETIME NULL,
  `registeredDate` DATETIME NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_oms_person_moneybook_approval_oms_member1_idx` (`requestMemberId` ASC),
  INDEX `fk_oms_person_moneybook_approval_oms_com_code1_idx` (`statusCodeGroup` ASC, `statusCode` ASC),
  CONSTRAINT `fk_oms_person_moneybook_approval_oms_member1`
    FOREIGN KEY (`requestMemberId`)
    REFERENCES `oms_member` (`memberId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_oms_person_moneybook_approval_oms_com_code1`
    FOREIGN KEY (`statusCodeGroup` , `statusCode`)
    REFERENCES `oms_com_code` (`codeGroup` , `code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oms_role_member_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oms_role_member_map` ;

CREATE TABLE IF NOT EXISTS `oms_role_member_map` (
  `roleId` INT NOT NULL,
  `memberId` VARCHAR(255) NOT NULL,
  INDEX `fk_oms_role_member_map_oms_role1_idx` (`roleId` ASC),
  INDEX `fk_oms_role_member_map_oms_member1_idx` (`memberId` ASC),
  PRIMARY KEY (`roleId`, `memberId`),
  CONSTRAINT `fk_oms_role_member_map_oms_role1`
    FOREIGN KEY (`roleId`)
    REFERENCES `oms_role` (`roleId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_oms_role_member_map_oms_member1`
    FOREIGN KEY (`memberId`)
    REFERENCES `oms_member` (`memberId`)
    ON DELETE CASCADE
  	ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
