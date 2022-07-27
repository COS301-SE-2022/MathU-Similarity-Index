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

CREATE TABLE `mathu_similarity_index_database`.`cached_simularity` (
  `primary_problem_id` INT NOT NULL,
  `secondary_problem_id` INT NOT NULL,
  `similarity` INT NOT NULL,
  PRIMARY KEY (`primary_problem_id`, `secondary_problem_id`),
  CONSTRAINT `cache_primary_pi`
    FOREIGN KEY (`primary_problem_id`)
    REFERENCES `mathu_similarity_index_database`.`problems` (`problem_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cached_secondary_pi`
    FOREIGN KEY (`secondary_problem_id`)
    REFERENCES `mathu_similarity_index_database`.`problems` (`problem_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

