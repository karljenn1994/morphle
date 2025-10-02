-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (x86_64)
--
-- Host: localhost    Database: policy_index
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `name` varchar(45) NOT NULL,
  `api_key` varchar(36) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branch_contract`
--

DROP TABLE IF EXISTS `branch_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_contract` (
  `branch` varchar(45) NOT NULL,
  `contract_number` varchar(45) NOT NULL,
  PRIMARY KEY (`branch`,`contract_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branch_policy`
--

DROP TABLE IF EXISTS `branch_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_policy` (
  `branch` varchar(45) NOT NULL,
  `policy_number` varchar(60) NOT NULL,
  `company` varchar(20) NOT NULL,
  `lob` varchar(5) NOT NULL,
  PRIMARY KEY (`branch`,`policy_number`,`company`,`lob`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign` (
  `id` varchar(36) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `reply_to` varchar(255) DEFAULT NULL,
  `template_id` varchar(36) NOT NULL,
  `form_id` varchar(36) DEFAULT NULL,
  `scheduled` tinyint NOT NULL DEFAULT '0',
  `trigger_event` varchar(20) DEFAULT NULL,
  `rules` json DEFAULT NULL,
  `approval` tinyint NOT NULL DEFAULT '1',
  `active` tinyint NOT NULL DEFAULT '0',
  `marketing` tinyint NOT NULL DEFAULT '0',
  `permanent` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_form`
--

DROP TABLE IF EXISTS `campaign_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_form` (
  `id` varchar(36) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_form_content`
--

DROP TABLE IF EXISTS `campaign_form_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_form_content` (
  `form_id` varchar(36) NOT NULL,
  `locale` varchar(10) NOT NULL,
  `form` json NOT NULL,
  PRIMARY KEY (`form_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_form_data`
--

DROP TABLE IF EXISTS `campaign_form_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_form_data` (
  `form_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `policy_id` varchar(36) DEFAULT NULL,
  `form_data` json DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`form_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_template`
--

DROP TABLE IF EXISTS `campaign_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_template` (
  `id` varchar(36) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permanent` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_template_content`
--

DROP TABLE IF EXISTS `campaign_template_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_template_content` (
  `template_id` varchar(36) NOT NULL,
  `locale` varchar(10) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` mediumblob NOT NULL,
  PRIMARY KEY (`template_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `celery_clockedschedule`
--

DROP TABLE IF EXISTS `celery_clockedschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celery_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `celery_crontabschedule`
--

DROP TABLE IF EXISTS `celery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celery_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL COMMENT 'Cron Minutes to Run. Use "*" for "all". (Example: "0,30")',
  `hour` varchar(96) NOT NULL COMMENT 'Cron Hours to Run. Use "*" for "all". (Example: "8,20")',
  `day_of_week` varchar(64) NOT NULL COMMENT 'Cron Days Of The Week to Run. Use "*" for "all", Sunday is 0 or 7, Monday is 1. (Example: "0,5")',
  `day_of_month` varchar(124) NOT NULL COMMENT 'Cron Days Of The Month to Run. Use "*" for "all". (Example: "1,15")',
  `month_of_year` varchar(64) NOT NULL COMMENT 'Cron Months (1-12) Of The Year to Run. Use "*" for "all". (Example: "1,12")',
  `timezone` varchar(64) NOT NULL COMMENT 'Timezone to Run the Cron Schedule on. Default is UTC.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `celery_intervalschedule`
--

DROP TABLE IF EXISTS `celery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celery_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL COMMENT 'Number of interval periods to wait before running the task again',
  `period` enum('days','hours','minutes','seconds','microseconds') NOT NULL COMMENT 'The type of period between task runs (Example: days)',
  PRIMARY KEY (`id`),
  CONSTRAINT `celery_intervalschedule_chk_1` CHECK ((`every` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `celery_periodictask`
--

DROP TABLE IF EXISTS `celery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celery_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Short Description For This Task',
  `task` varchar(255) NOT NULL COMMENT 'The Name of the Celery Task that Should be Run.  (Example: "proj.tasks.import_contacts")',
  `args` text NOT NULL COMMENT 'JSON encoded positional arguments (Example: ["arg1", "arg2"])',
  `kwargs` text NOT NULL COMMENT 'JSON encoded keyword arguments (Example: {"argument": "value"})',
  `queue` varchar(255) DEFAULT NULL COMMENT 'Queue defined in CELERY_TASK_QUEUES. Leave None for default queuing.',
  `exchange` varchar(255) DEFAULT NULL COMMENT 'Override Exchange for low-level AMQP routing',
  `routing_key` varchar(255) DEFAULT NULL COMMENT 'Override Routing Key for low-level AMQP routing',
  `headers` text COMMENT 'JSON encoded message headers for the AMQP message.',
  `priority` int DEFAULT NULL COMMENT 'Priority Number between 0 and 255. Supported by: RabbitMQ, Redis (priority reversed, 0 is highest).',
  `expires` datetime DEFAULT NULL COMMENT 'Datetime after which the schedule will no longer trigger the task to run',
  `expire_seconds` int DEFAULT NULL COMMENT 'Timedelta with seconds which the schedule will no longer trigger the task to run',
  `one_off` tinyint(1) NOT NULL COMMENT 'If True, the schedule will only run the task a single time',
  `start_time` datetime DEFAULT NULL COMMENT 'Datetime when the schedule should begin triggering the task to run',
  `enabled` tinyint(1) NOT NULL COMMENT 'Set to False to disable the schedule',
  `last_run_at` datetime DEFAULT NULL COMMENT 'Datetime that the schedule last triggered the task to run. ',
  `total_run_count` int NOT NULL COMMENT 'Running count of how many times the schedule has triggered the task',
  `date_changed` datetime DEFAULT NULL COMMENT 'Datetime that this PeriodicTask was last modified',
  `description` text COMMENT 'Detailed description about the details of this Periodic Task',
  `discriminator` varchar(20) NOT NULL COMMENT 'Lower case name of the schedule class. ',
  `schedule_id` int NOT NULL COMMENT 'ID of the schedule model object. ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `celery_periodictask_chk_1` CHECK ((`priority` between 0 and 255))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `celery_periodictaskchanged`
--

DROP TABLE IF EXISTS `celery_periodictaskchanged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celery_periodictaskchanged` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `celery_solarschedule`
--

DROP TABLE IF EXISTS `celery_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celery_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` enum('dawn_astronomical','dawn_nautical','dawn_civil','sunrise','solar_noon','sunset','dusk_civil','dusk_nautical','dusk_astronomical') NOT NULL COMMENT 'The type of solar event when the job should run',
  `latitude` decimal(9,6) NOT NULL COMMENT 'Run the task when the event happens at this latitude',
  `longitude` decimal(9,6) NOT NULL COMMENT 'Run the task when the event happens at this longitude',
  PRIMARY KEY (`id`),
  UNIQUE KEY `event` (`event`,`latitude`,`longitude`),
  CONSTRAINT `celery_solarschedule_chk_1` CHECK ((`latitude` between -(90) and 90)),
  CONSTRAINT `celery_solarschedule_chk_2` CHECK ((`longitude` between -(180) and 180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claim`
--

DROP TABLE IF EXISTS `claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim` (
  `id` varchar(36) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `received_date` date NOT NULL,
  `modified_date` date DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `policy_number` varchar(60) DEFAULT NULL,
  `company` varchar(20) NOT NULL,
  `lob` varchar(5) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collector`
--

DROP TABLE IF EXISTS `collector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collector` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `failed` tinyint NOT NULL DEFAULT '0',
  `message` varchar(255) DEFAULT NULL,
  `code` int DEFAULT NULL,
  `scheduled_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collector_auto`
--

DROP TABLE IF EXISTS `collector_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collector_auto` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `source` varchar(4) NOT NULL,
  `collected_date` date NOT NULL,
  `vehicle_year` varchar(4) DEFAULT NULL,
  `vehicle_make` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(40) DEFAULT NULL,
  `vehicle_vin` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collector_card`
--

DROP TABLE IF EXISTS `collector_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collector_card` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `source` varchar(4) NOT NULL,
  `collected_date` date NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collector_lead`
--

DROP TABLE IF EXISTS `collector_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collector_lead` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `collector_id` varchar(36) NOT NULL,
  `collector_type` varchar(10) NOT NULL,
  `lead_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collector_property`
--

DROP TABLE IF EXISTS `collector_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collector_property` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `source` varchar(4) NOT NULL,
  `collected_date` date NOT NULL,
  `address` varchar(110) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `postal_code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `code` varchar(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_code`
--

DROP TABLE IF EXISTS `company_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_code` (
  `code` varchar(20) NOT NULL,
  `company_code` varchar(20) NOT NULL,
  PRIMARY KEY (`code`,`company_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_contact`
--

DROP TABLE IF EXISTS `company_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_contact` (
  `code` varchar(20) NOT NULL,
  `region` varchar(40) NOT NULL,
  `phone_claims` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`code`,`region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indexer`
--

DROP TABLE IF EXISTS `indexer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indexer` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `failed` int NOT NULL,
  `hold` tinyint NOT NULL DEFAULT '0',
  `block` tinyint NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL,
  `process` date DEFAULT NULL,
  `latest` tinyint DEFAULT '0',
  `in_renewal_chain` tinyint DEFAULT '0',
  `code` int DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `entered` date NOT NULL,
  `policy_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_index`
--

DROP TABLE IF EXISTS `location_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_index` (
  `CITY` varchar(35) NOT NULL,
  `FSA` varchar(3) NOT NULL,
  `LDU` varchar(3) NOT NULL,
  `GCNID` bigint NOT NULL,
  `GCPCID` bigint NOT NULL,
  PRIMARY KEY (`CITY`,`FSA`,`GCPCID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifier`
--

DROP TABLE IF EXISTS `notifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifier` (
  `id` varchar(36) NOT NULL,
  `mailbox` varchar(20) NOT NULL,
  `campaign_id` varchar(36) NOT NULL,
  `action_date` date NOT NULL,
  `draft_date` datetime DEFAULT NULL,
  `outbox_date` datetime DEFAULT NULL,
  `sent_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifier_recipient`
--

DROP TABLE IF EXISTS `notifier_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifier_recipient` (
  `id` varchar(36) NOT NULL,
  `notifier_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `regarding` blob,
  `message_id` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `opens_count` int DEFAULT '0',
  `clicks_count` int DEFAULT '0',
  `message` varchar(255) DEFAULT NULL,
  `code` int DEFAULT NULL,
  `locale` varchar(10) NOT NULL DEFAULT 'en',
  `sent_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `id` varchar(36) NOT NULL,
  `policy_number` varchar(60) NOT NULL,
  `company` varchar(20) NOT NULL,
  `lob` varchar(5) NOT NULL,
  `premium` float DEFAULT NULL,
  `annual_premium` float DEFAULT NULL,
  `purpose` varchar(3) DEFAULT NULL,
  `transaction_effective_date` date DEFAULT NULL,
  `policy_effective_date` date DEFAULT NULL,
  `policy_expiry_date` date DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `transaction_date` date DEFAULT NULL,
  `seq` int unsigned DEFAULT '0',
  `xln` tinyint DEFAULT '0',
  `purge` tinyint DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policy_insured`
--

DROP TABLE IF EXISTS `policy_insured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_insured` (
  `policy_id` varchar(36) NOT NULL,
  `insured_name` varchar(100) NOT NULL,
  PRIMARY KEY (`policy_id`,`insured_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policy_issue`
--

DROP TABLE IF EXISTS `policy_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_issue` (
  `policy_id` varchar(36) NOT NULL,
  `code` int NOT NULL,
  `count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`policy_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote` (
  `id` varchar(36) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `received_date` date NOT NULL,
  `modified_date` date DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `company` varchar(20) NOT NULL,
  `lob` varchar(5) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `name` varchar(45) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `task_name` varchar(25) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'inactive',
  `status_timestamp` datetime DEFAULT NULL,
  `last_successful_run` datetime DEFAULT NULL,
  PRIMARY KEY (`task_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `connected` tinyint DEFAULT '0',
  `password_hash` varbinary(32) DEFAULT NULL,
  `salt` varbinary(16) DEFAULT NULL,
  `hash_algo` varchar(10) DEFAULT NULL,
  `iterations` int DEFAULT NULL,
  `confirm_code` varchar(36) DEFAULT NULL,
  `reset_code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_email`
--

DROP TABLE IF EXISTS `user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_email` (
  `user_id` varchar(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `verified` tinyint NOT NULL DEFAULT '0',
  `code` varchar(45) DEFAULT NULL,
  `code_expires` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `user_id` varchar(36) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `postal_code` varchar(6) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  `date_of_birth` varchar(40) DEFAULT NULL,
  `drivers_licence_number` varchar(50) DEFAULT NULL,
  `locale` varchar(10) NOT NULL DEFAULT 'en',
  `notification_preference` varchar(5) NOT NULL DEFAULT 'email',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_lead`
--

DROP TABLE IF EXISTS `user_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_lead` (
  `user_id` varchar(36) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_policy`
--

DROP TABLE IF EXISTS `user_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_policy` (
  `user_id` varchar(36) NOT NULL,
  `policy_id` varchar(36) NOT NULL,
  `notify` tinyint DEFAULT '0',
  PRIMARY KEY (`user_id`,`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` varchar(36) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `validation`
--

DROP TABLE IF EXISTS `validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validation` (
  `id` varchar(36) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `validation_rule`
--

DROP TABLE IF EXISTS `validation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validation_rule` (
  `id` varchar(36) NOT NULL,
  `validation_id` varchar(36) NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `func` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `cfg` json DEFAULT NULL,
  `severity` varchar(45) DEFAULT NULL,
  `code` varchar(7) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `validation_rule_template`
--

DROP TABLE IF EXISTS `validation_rule_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validation_rule_template` (
  `code` varchar(7) NOT NULL,
  `validation_type` varchar(20) DEFAULT NULL,
  `enabled` tinyint DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `func` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `cfg` json DEFAULT NULL,
  `severity` varchar(45) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `validator`
--

DROP TABLE IF EXISTS `validator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validator` (
  `id` varchar(36) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `validation_id` varchar(36) NOT NULL,
  `trigger_event` varchar(20) DEFAULT NULL,
  `rules` json DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`validation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vicc`
--

DROP TABLE IF EXISTS `vicc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vicc` (
  `MODEL_YEAR` bigint NOT NULL,
  `EXT_VICC` bigint NOT NULL,
  `VICC_CODE` bigint NOT NULL,
  `MAKE` varchar(20) NOT NULL,
  `MAKE_FR` varchar(20) NOT NULL,
  `MODEL` varchar(40) NOT NULL,
  `MODEL_FR` varchar(40) NOT NULL,
  `MAKEMOD` varchar(20) NOT NULL,
  `MAKEMOD_FR` varchar(20) NOT NULL,
  `WHEELBASE` bigint NOT NULL,
  `WEIGHT` bigint NOT NULL,
  `HORSEPOWER` bigint NOT NULL,
  `PRICE` bigint NOT NULL,
  `AIRBAGS` bigint NOT NULL,
  `ABS` bigint NOT NULL,
  `ALM_AUD` bigint NOT NULL,
  `ALM_CUTOFF` bigint NOT NULL,
  `ALM_SECKEY` bigint NOT NULL,
  `CYLINDER` bigint NOT NULL,
  `FUELTYPE` varchar(1) NOT NULL,
  `INDUCTION` varchar(1) NOT NULL,
  `HYBRID` varchar(1) NOT NULL,
  `TRACCTRL` bigint NOT NULL,
  `STABCTRL` bigint NOT NULL,
  `BODYSTYLE` varchar(2) NOT NULL,
  `BODYTYPE` varchar(2) NOT NULL,
  `DRIVETRAIN` varchar(2) NOT NULL,
  `VEHTYPE` varchar(2) NOT NULL,
  `CNVERTIBLE` bigint NOT NULL,
  PRIMARY KEY (`MODEL_YEAR`,`EXT_VICC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vin_vicc`
--

DROP TABLE IF EXISTS `vin_vicc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vin_vicc` (
  `RECNO` bigint NOT NULL,
  `VIN` varchar(10) NOT NULL,
  `VICC_CODE` varchar(4) NOT NULL,
  `EXT_VICC` varchar(6) NOT NULL,
  `MODEL_YEAR` bigint NOT NULL,
  `MULT_VIN` bigint NOT NULL,
  PRIMARY KEY (`VIN`,`EXT_VICC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-30 14:34:06
