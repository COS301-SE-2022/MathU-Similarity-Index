CREATE SCHEMA `mathu_similarity_index_database` ;

CREATE TABLE `mathu_similarity_index_database`.`users` (
  `email` VARCHAR(60) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `password_salt` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE INDEX `users_table_UNIQUE` (`email` ASC) VISIBLE);

CREATE TABLE `mathu_similarity_index_database`.`temporary_access_key` (
  `user_email` VARCHAR(60) NOT NULL,
  `key` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`user_email`),
  CONSTRAINT `user_tak_email`
    FOREIGN KEY (`user_email`)
    REFERENCES `mathu_similarity_index_database`.`users` (`email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `mathu_similarity_index_database`.`history` (
  `user_email` VARCHAR(60) NOT NULL,
  `search_input` LONGTEXT NOT NULL,
  `date_time` DATETIME NOT NULL,
  PRIMARY KEY (`user_email`, `date_time`),
  CONSTRAINT `history_user_email`
    FOREIGN KEY (`user_email`)
    REFERENCES `mathu_similarity_index_database`.`users` (`email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `mathu_similarity_index_database`.`problems` (
  `problem_id` INT NOT NULL AUTO_INCREMENT,
  `problem` LONGTEXT NOT NULL,
  PRIMARY KEY (`problem_id`));

CREATE TABLE `mathu_similarity_index_database`.`problem_links` (
  `link_id` INT NOT NULL AUTO_INCREMENT,
  `problem_id` INT NOT NULL,
  `link` LONGTEXT NOT NULL,
  PRIMARY KEY (`link_id`, `problem_id`),
  INDEX `problem_links_id_idx` (`problem_id` ASC) VISIBLE,
  CONSTRAINT `problem_links_id`
    FOREIGN KEY (`problem_id`)
    REFERENCES `mathu_similarity_index_database`.`problems` (`problem_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ######### Old Cache Table ################
-- CREATE TABLE `mathu_similarity_index_database`.`cached_simularity` (
--   `primary_problem_id` INT NOT NULL,
--   `secondary_problem_id` INT NOT NULL,
--   `similarity` INT NOT NULL,
--   PRIMARY KEY (`primary_problem_id`, `secondary_problem_id`),
--   CONSTRAINT `cache_primary_pi`
--     FOREIGN KEY (`primary_problem_id`)
--     REFERENCES `mathu_similarity_index_database`.`problems` (`problem_id`)
--     ON DELETE CASCADE
--     ON UPDATE CASCADE,
--   CONSTRAINT `cached_secondary_pi`
--     FOREIGN KEY (`secondary_problem_id`)
--     REFERENCES `mathu_similarity_index_database`.`problems` (`problem_id`)
--     ON DELETE CASCADE
--     ON UPDATE CASCADE);

-- ######### New Cache Tables ###############
CREATE TABLE `mathu_similarity_index_database`.`cached_simularity` (
    `cs_id` INT NOT NULL AUTO_INCREMENT FIRST,
    `similarity` INT NOT NULL,
    PRIMARY KEY (`cs_id`));

CREATE TABLE `mathu_similarity_index_database`.`problems_cached_simularity` (
  `problem_id` INT NOT NULL,
  `cs_id` INT NOT NULL,
  PRIMARY KEY (`problem_id`, `cs_id`),
  INDEX `pcs_cs_id_idx` (`cs_id` ASC) VISIBLE,
  CONSTRAINT `pcs_problem_id`
    FOREIGN KEY (`problem_id`)
    REFERENCES `mathu_similarity_index_database`.`problems` (`problem_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pcs_cs_id`
    FOREIGN KEY (`cs_id`)
    REFERENCES `mathu_similarity_index_database`.`cached_simularity` (`cs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `mathu_similarity_index_database`.`comments` (
  `problem_id` INT NOT NULL,
  `date_time` DATETIME NOT NULL,
  `user_email` VARCHAR(60) NOT NULL,
  `comment` LONGTEXT NOT NULL,
  PRIMARY KEY (`problem_id`, `date_time`, `user_email`),
  INDEX `comments_user_email_idx` (`user_email` ASC) VISIBLE,
  CONSTRAINT `comments_problems_id`
    FOREIGN KEY (`problem_id`)
    REFERENCES `mathu_similarity_index_database`.`problems` (`problem_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comments_user_email`
    FOREIGN KEY (`user_email`)
    REFERENCES `mathu_similarity_index_database`.`users` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `mathu_similarity_index_database`.`tags` (
  `tag_id` INT NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`));

CREATE TABLE `mathu_similarity_index_database`.`problem_tags` (
  `tag_id` INT NOT NULL,
  `problem_id` INT NOT NULL,
  PRIMARY KEY (`tag_id`, `problem_id`),
  INDEX `problem_tags_problem_id_idx` (`problem_id` ASC) VISIBLE,
  CONSTRAINT `problem_tags_tag_id`
    FOREIGN KEY (`tag_id`)
    REFERENCES `mathu_similarity_index_database`.`tags` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `problem_tags_problem_id`
    FOREIGN KEY (`problem_id`)
    REFERENCES `mathu_similarity_index_database`.`problems` (`problem_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `mathu_similarity_index_database`.`favorites` (
  `user_email` VARCHAR(60) NOT NULL,
  `problem_id` INT NOT NULL,
  PRIMARY KEY (`user_email`, `problem_id`),
  INDEX `favorites_problem_id_idx` (`problem_id` ASC) VISIBLE,
  CONSTRAINT `favorites_user_email`
    FOREIGN KEY (`user_email`)
    REFERENCES `mathu_similarity_index_database`.`users` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `favorites_problem_id`
    FOREIGN KEY (`problem_id`)
    REFERENCES `mathu_similarity_index_database`.`problems` (`problem_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);