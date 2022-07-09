

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hospital_Databaseb
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `Hospital_Databaseb` ;

USE `Hospital_Databaseb` ;

-- -----------------------------------------------------
-- Table `Hospital_Database`.`Hospital_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_Databaseb`.`Hospital_info` (
  `Hospital_Id` INT NOT NULL AUTO_INCREMENT,
  `Hospital_Name` VARCHAR(50) NULL,
  `Address` VARCHAR(100) NULL,
  `ContactNo1` VARCHAR(12) NULL,
  `ContactNo2` VARCHAR(12) NULL,
  `Fax` VARCHAR(15) NULL,
  `Website_URL` VARCHAR(45) NULL,
  PRIMARY KEY (`Hospital_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Department_info
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_Databaseb`.`Department_info` (
  `Department_Id` INT NOT NULL AUTO_INCREMENT,
  `Department_Name` VARCHAR(20) NULL,
  `Hospital_Id` INT NULL,
  PRIMARY KEY (`Department_Id`),
  INDEX `Fk_Hosptial_Id_idx` (`Hospital_Id` ASC) VISIBLE,
  CONSTRAINT `Fk_Hosptial_Id`
    FOREIGN KEY (`Hospital_Id`)
    REFERENCES `Hospital_Databaseb`.`Hospital_info` (`Hospital_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Nurse_info
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_Databaseb`.`Nurse_info` (
  `Nurse_Id` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(25) NULL,
  `Last_Name` VARCHAR(25) NULL,
  `Address` VARCHAR(50) NULL,
  `City` VARCHAR(40) NULL,
  `State` VARCHAR(40) NULL,
  `Zipcode` VARCHAR(6) NULL,
  `Gender` VARCHAR(1) NULL,
  `Date_Of_Birth` DATE NULL,
  `Contact_No` VARCHAR(12) NULL,
  `Email_id` VARCHAR(40) NULL,
  `Photo` BLOB NULL,
  `SIN` VARCHAR(9) NULL,
  `Department_Id` INT NULL,
  `IsActive` INT NULL,
  `Register_Date` DATE NULL,
  PRIMARY KEY (`Nurse_Id`),
  INDEX `Fk_Department_Id_idx` (`Department_Id` ASC) VISIBLE,
  CONSTRAINT `Fk_Department_Id`
    FOREIGN KEY (`Department_Id`)
    REFERENCES `Hospital_Databaseb`.`Department_info` (`Department_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Doctor_info
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_Databaseb`.`Doctor_info` (
  `Doctor_Id` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(25) NULL,
  `Last_Name` VARCHAR(25) NULL,
  `Address` VARCHAR(50) NULL,
  `City` VARCHAR(40) NULL,
  `State` VARCHAR(40) NULL,
  `Zipcode` VARCHAR(6) NULL,
  `Gender` CHAR(1) NULL,
  `Date_Of_Birth` DATE NULL,
  `Contact_No` VARCHAR(12) NULL,
  `Email_id` VARCHAR(40) NULL,
  `Photo` BLOB NULL,
  `SIN` VARCHAR(9) NULL,
  `Department_Id` INT NULL,
  `IsActive` INT NULL,
  `Register_Date` DATE NULL,
  PRIMARY KEY (`Doctor_Id`),
  INDEX `Fk_Department_Id_idx` (`Department_Id` ASC) VISIBLE,
  CONSTRAINT `Fk_Department_Id`
    FOREIGN KEY (`Department_Id`)
    REFERENCES `Hospital_Databaseb`.`Department_info` (`Department_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Room_info
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_Database`.`Room_info` (
  `Room_Id` INT NOT NULL AUTO_INCREMENT,
  `Room_Number` VARCHAR(10) NULL,
  `Department_Id` INT NULL,
  `Is_Occupied` CHAR(1) NULL,
  PRIMARY KEY (`Room_Id`),
  INDEX `Fk_Department_Id_idx` (`Department_Id` ASC) VISIBLE,
  CONSTRAINT `Fk_Department_Id`
    FOREIGN KEY (`Department_Id`)
    REFERENCES `Hospital_db`.`Department_tbl` (`Department_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Patient_info
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_Database`.`Patient_info` (
  `Patient_Id` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(25) NULL,
  `Last_Name` VARCHAR(25) NULL,
  `Address` VARCHAR(50) NULL,
  `City` VARCHAR(40) NULL,
  `State` VARCHAR(40) NULL,
  `Zipcode` VARCHAR(6) NULL,
  `Gender` CHAR(1) NULL,
  `Date_Of_Birth` DATE NULL,
  `Contact_No` VARCHAR(12) NULL,
  `Email_id` VARCHAR(50) NULL,
  `Photo` BLOB NULL,
  `SIN` VARCHAR(9) NULL,
  `IsActive` INT NULL,
  `Register_Date` DATE NULL,
  PRIMARY KEY (`Patient_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Room_responsiblity_Nurse
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_Database`.`Room_responsiblity_Nurse` (
  `Assign_Id` INT NOT NULL AUTO_INCREMENT,
  `Room_Id` INT NULL,
  `Nurse_Id` INT NULL,
  `Assign_Date` DATE NULL,
  `Leave_Date` DATE NULL,
  PRIMARY KEY (`Assign_Id`),
  INDEX `Fk_Nurse_Id_idx` (`Nurse_Id` ASC) VISIBLE,
  INDEX `Fk_Room_Id_idx` (`Room_Id` ASC) VISIBLE,
  CONSTRAINT `Fk_Nurse_Id`
    FOREIGN KEY (`Nurse_Id`)
    REFERENCES `Hospital_db`.`Nurse_tbl` (`Nurse_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Fk_Room_Id`
    FOREIGN KEY (`Room_Id`)
    REFERENCES `Hospital_Database`.`Room_info` (`Room_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Patient_Appointment
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_Database`.`Patient_Appointment` (
  `Appointment_Id` INT NOT NULL AUTO_INCREMENT,
  `Patient_Id` INT NULL,
  `Doctor_Id` INT NULL,
  `Appointment_Date` DATE NULL,
  `Appointment_Time` TIME NULL,
  `Patient_Left_Date` DATE NULL,
  `Patient_Left_Time` DATE NULL,
  `Appointment_Status` VARCHAR(10) NULL,
  `Added_Date` DATE NULL,
  PRIMARY KEY (`Appointment_Id`),
  INDEX `Fk_Patient_Id_idx` (`Patient_Id` ASC) VISIBLE,
  INDEX `Fk_Doctor_Id_idx` (`Doctor_Id` ASC) VISIBLE,
  CONSTRAINT `Fk_Patient_Id`
    FOREIGN KEY (`Patient_Id`)
    REFERENCES `Hospital_db`.`Patient_tbl` (`Patient_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_Doctor_Id`
    FOREIGN KEY (`Doctor_Id`)
    REFERENCES `Hospital_Database`.`Doctor_info` (`Doctor_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Patient_Treatment
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_Database`.`Patient_Treatment` (
  `Patient_Treatment_Id` INT NOT NULL AUTO_INCREMENT,
  `Appointment_Id` INT NULL,
  `Treatment_Start_Date` DATE NULL,
  `Treatment_Start_Time` TIME NULL,
  `Treatment_End_Date` DATE NULL,
  `Treatment_End_Time` TIME NULL,
  `Room_Id` INT NULL,
  `Treatment` VARCHAR(400) NULL,
  PRIMARY KEY (`Patient_Treatment_Id`),
  INDEX `Fk_Appointment_Id_idx` (`Appointment_Id` ASC) VISIBLE,
  INDEX `Fk_Room_Id_idx` (`Room_Id` ASC) VISIBLE,
  CONSTRAINT `Fk_Appointment_Id`
    FOREIGN KEY (`Appointment_Id`)
    REFERENCES `Hospital_Database`.`Patient_Appointment` (`Appointment_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Fk_Room_Id`
    FOREIGN KEY (`Room_Id`)
    REFERENCES `Hospital_Database`.`Room_info` (`Room_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
