CREATE TABLE IF NOT EXISTS `messzylinder`.`knowledge_comment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `knowledge_id` INT UNSIGNED NOT NULL,
  `message` MEDIUMTEXT NULL,
  `create_at` DATETIME NULL,
  `update_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_knowledge_comment_knowledge_id_idx` (`knowledge_id` ASC),
  CONSTRAINT `fk_knowledge_comment_knowledge_id`
    FOREIGN KEY (`knowledge_id`)
    REFERENCES `messzylinder`.`knowledge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
