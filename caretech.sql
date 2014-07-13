-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 31, 2014 at 11:33 AM
-- Server version: 5.5.25
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `caretech`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `booked_by` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`,`visit_id`,`employee_id`),
  KEY `employee_id` (`employee_id`),
  KEY `visit_id` (`visit_id`),
  KEY `patient_id_2` (`patient_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `date`, `time`, `about`, `booked_by`, `title`, `patient_id`, `visit_id`, `employee_id`, `date_added`) VALUES
(12, '2014-01-08', '00:12', 'ndsxuivnbdiosu', '', 'dfkvxndon', 22, 11, 8, '0000-00-00 00:00:00'),
(14, '2014-01-31', '04:05 PM', 'dfnvndfiouxd', '', 'dfnvdfnsiov', 3, 33, 8, '0000-00-00 00:00:00'),
(15, '2014-01-29', '09:30 PM', 'nboidntgiovdfn', '', 'dnbovindf', 3, 33, 8, '2014-01-29 18:23:26'),
(16, '2014-01-31', '08:25 AM', 'ndobnvfiognvc', '', 'jdngbvjdfn', 3, 33, 8, '2014-01-29 18:25:26'),
(17, '2014-01-30', '09:25 AM', 'fgxhbvdfgxv', '', 'hfbdgfv', 3, 33, 8, '2014-01-29 18:27:48'),
(18, '2014-01-29', '05:30 PM', 'BGXGFDEFS', '', 'GBDFV', 3, 33, 8, '2014-01-29 18:30:31'),
(19, '2014-01-29', '09:30 AM', 'jghfgfdzvtuikuy gjfhtgr ', '', 'bthfds', 3, 33, 8, '2014-01-29 18:32:45');

--
-- Triggers `appointment`
--
DROP TRIGGER IF EXISTS `after_insert_appointment`;
DELIMITER //
CREATE TRIGGER `after_insert_appointment` AFTER INSERT ON `appointment`
 FOR EACH ROW INSERT INTO trigger_appointment_update (appointment_id, date, time,patient_id,about,booked_by,title,visit_id,employee_id,changetype)  
        VALUES (NEW.appointment_id,NEW.date,NEW.time,NEW.patient_id,NEW.about,NEW.booked_by,NEW.title,NEW.visit_id,NEW.employee_id,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_appointment`;
DELIMITER //
CREATE TRIGGER `after_update_appointment` AFTER UPDATE ON `appointment`
 FOR EACH ROW INSERT INTO trigger_appointment_update (appointment_id, date, time,patient_id,about,booked_by,title,visit_id,employee_id,changetype)  
        VALUES (NEW.appointment_id,NEW.date,NEW.time,NEW.patient_id,NEW.about,NEW.booked_by,NEW.title,NEW.visit_id,NEW.employee_id,'AFTER UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_appointment`;
DELIMITER //
CREATE TRIGGER `before_update_appointment` BEFORE UPDATE ON `appointment`
 FOR EACH ROW INSERT INTO trigger_appointment_update (appointment_id, date, time,patient_id,about,booked_by,title,visit_id,employee_id,changetype)  
        VALUES (OLD.appointment_id,OLD.date,OLD.time,OLD.patient_id,OLD.about,OLD.booked_by,OLD.title,OLD.visit_id,OLD.employee_id,'INSERT')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `commodity`
--

CREATE TABLE `commodity` (
  `commodity_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(255) NOT NULL,
  `strength` varchar(255) NOT NULL,
  `commodity_type` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `max_stock` decimal(13,2) NOT NULL,
  `min_stock` decimal(13,2) NOT NULL,
  `remarks` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`commodity_id`),
  KEY `user_id` (`user_id`),
  KEY `commodity_name` (`commodity_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `commodity`
--

INSERT INTO `commodity` (`commodity_id`, `commodity_name`, `strength`, `commodity_type`, `unit`, `max_stock`, `min_stock`, `remarks`, `date_added`, `user_id`) VALUES
(1, 'fnvidnbiv', 'vnuidfb', 'dfbviudbf', 'dfbiuvdi', 12000.00, 120.00, 'f vhudbf v\r\n', '2013-12-22 05:21:07', 8),
(2, 'nfgduinvd', 'ndfguindiu', 'nidufgniu', 'ebgiuvbnfi', 130000.00, 130.00, 'dfn vd fi', '2013-12-22 05:21:08', 11),
(3, 'nbvigdunf', 'dfonvodfiun', 'Antibiotics', '', 12000.00, 120.00, 'rtdgsfvjymnthbr', '2013-12-30 11:47:58', 13),
(4, 'Betapyn', '120mg', 'Pain_Killers', 'tab', 12000.00, 120.00, 'Make cause drowsiness', '2013-12-30 11:50:44', 13),
(5, 'dnbuidb', 'vdnbuibdviuvdb', 'Antibiotics', 'activtd powder', 120.00, 110.00, 'nfbibgiufdbn', '2014-01-06 06:46:43', 13),
(6, 'jnvidnvifu', 'nviudfn', 'Pain_Killers', 'activtd powder', 129999.00, 1200.00, 'dinibfdniuvb', '2014-01-30 12:14:40', 13);

--
-- Triggers `commodity`
--
DROP TRIGGER IF EXISTS `after_insert_commodity`;
DELIMITER //
CREATE TRIGGER `after_insert_commodity` AFTER INSERT ON `commodity`
 FOR EACH ROW INSERT INTO trigger_commodity_update (commodity_id, commodity_name, strength,commodity_type,unit,max_stock,min_stock,remarks,changetype)  
        VALUES (NEW.commodity_id,NEW.commodity_name,NEW.strength,NEW.commodity_type,NEW.unit,NEW.max_stock,NEW.min_stock,NEW.remarks,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_commodity`;
DELIMITER //
CREATE TRIGGER `after_update_commodity` AFTER UPDATE ON `commodity`
 FOR EACH ROW INSERT INTO trigger_commodity_update (commodity_id, commodity_name, strength,commodity_type,unit,max_stock,min_stock,remarks,changetype)  
        VALUES (NEW.commodity_id,NEW.commodity_name,NEW.strength,NEW.commodity_type,NEW.unit,NEW.max_stock,NEW.min_stock,NEW.remarks,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_commodity`;
DELIMITER //
CREATE TRIGGER `before_update_commodity` BEFORE UPDATE ON `commodity`
 FOR EACH ROW INSERT INTO trigger_commodity_update (commodity_id, commodity_name, strength,commodity_type,unit,max_stock,min_stock,remarks,changetype)  
        VALUES (OLD.commodity_id,OLD.commodity_name,OLD.strength,OLD.commodity_type,OLD.unit,OLD.max_stock,OLD.min_stock,OLD.remarks,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `commodity_movement_bin_card`
--

CREATE TABLE `commodity_movement_bin_card` (
  `commodity_movement_bin_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `opening_bal` double(13,2) NOT NULL,
  `closing_bal` double(13,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `issues` double(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `identification_code` varchar(255) NOT NULL,
  `issuing_officer` int(11) NOT NULL,
  PRIMARY KEY (`commodity_movement_bin_card_id`),
  KEY `commodity_name` (`commodity_name`),
  KEY `issuing_officer` (`issuing_officer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `commodity_movement_bin_card`
--

INSERT INTO `commodity_movement_bin_card` (`commodity_movement_bin_card_id`, `commodity_name`, `batch_no`, `opening_bal`, `closing_bal`, `expiry_date`, `issues`, `date_added`, `description`, `department`, `identification_code`, `issuing_officer`) VALUES
(1, 'Betapyn', 'BET_002', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:32:59', 'DNVISUNGUI', 'Store', 'nvnod', 13),
(2, 'dnbuidb', 'jniu', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:33:43', '', 'Store', 'nvnod', 10),
(3, 'dnbuidb', 'DN_001', 12.00, 12.00, '0000-00-00', 0.00, '2014-01-16 08:47:20', 'gvsd', 'Store', 'nvnod', 10),
(5, 'Betapyn', '0', 5.00, 5.00, '2015-12-31', 0.00, '2014-01-29 05:20:31', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:LZr1O', 7),
(6, 'Betapyn', '0', 5.00, 0.00, '2015-12-31', 0.00, '2014-01-29 05:20:31', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:LZr1O', 7),
(7, 'Betapyn', '0', 5.00, 5.00, '2015-12-31', 0.00, '2014-01-29 05:26:37', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:IH3tF', 7),
(8, 'Betapyn', '0', 5.00, 0.00, '2015-12-31', 0.00, '2014-01-29 05:26:37', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:IH3tF', 7),
(9, 'Betapyn', '0', 5.00, 3.00, '2015-12-31', 2.00, '2014-01-29 05:28:12', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:VJgq3', 7),
(10, 'Betapyn', '0', 5.00, 2.00, '2015-12-31', 2.00, '2014-01-29 05:28:12', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:VJgq3', 7),
(11, 'Betapyn', 'BET_002', 3.00, 2.00, '2015-12-31', 1.00, '2014-01-29 05:29:01', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:PZD9N', 7),
(12, 'Betapyn', 'BET_002', 3.00, 1.00, '2015-12-31', 1.00, '2014-01-29 05:29:01', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:PZD9N', 7),
(13, 'Betapyn', 'BET_002', 1.00, 1.00, '2015-12-31', 1.00, '2014-01-30 10:51:44', 'Return to the Main Store from Pharmacy Department', 'Store', 'RET:02QJx', 10),
(14, 'Betapyn', 'BET_002', 1.00, 0.00, '2015-12-31', 1.00, '2014-01-30 10:51:45', 'Return to the  Main Store from Pharmacy Department', 'Pharmacy', 'RET:02QJx', 10),
(15, 'nfgduinvd', 'nfg_1', 144.00, 130.00, '2014-01-09', 14.00, '2014-01-30 11:01:28', 'Commodity:nfgduinvdhas been dispensed from DepartmentPharmacyto DepartmentPharmacy', '', 'ISS:om0Pu', 13),
(16, 'nfgduinvd', 'nfg_1', 0.00, 14.00, '2014-01-09', 14.00, '2014-01-30 11:01:28', 'Commodity:nfgduinvdhas been dispensed from DepartmentPharmacyto DepartmentPharmacy', 'Array', 'ISS:om0Pu', 13),
(17, 'fnvidnbiv', '123890', 990.00, 950.00, '0000-00-00', 40.00, '2014-01-30 11:30:59', 'Commodity:fnvidnbivhas been dispensed from DepartmentPharmacistto DepartmentPharmacy', '', 'ISS:C3lrG', 13),
(18, 'fnvidnbiv', '123890', 0.00, 40.00, '0000-00-00', 40.00, '2014-01-30 11:30:59', 'Commodity:fnvidnbivhas been dispensed from DepartmentPharmacistto DepartmentPharmacy', 'Array', 'ISS:C3lrG', 13),
(19, 'nfgduinvd', 'nfg_2', 144.00, 144.00, '2014-02-28', 0.00, '2014-01-30 12:32:21', 'nfgduinvd has  been received into the store with the  Batch Number :nfg_2.', 'Store', 'REC:0wXnD', 13);

--
-- Triggers `commodity_movement_bin_card`
--
DROP TRIGGER IF EXISTS `after_insert_commodity_movement_bin_card`;
DELIMITER //
CREATE TRIGGER `after_insert_commodity_movement_bin_card` AFTER INSERT ON `commodity_movement_bin_card`
 FOR EACH ROW INSERT INTO trigger_commodity_movement_bin_card (commodity_movement_bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (NEW.commodity_movement_bin_card_id,NEW.commodity_name,NEW.batch_no,NEW.opening_bal,NEW.closing_bal,NEW.expiry_date,NEW.issues,NEW.date_added,NEW.description,NEW.department,NEW.identification_code,NEW.issuing_officer,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_commodity_movement_bin_card`;
DELIMITER //
CREATE TRIGGER `after_update_commodity_movement_bin_card` AFTER UPDATE ON `commodity_movement_bin_card`
 FOR EACH ROW INSERT INTO trigger_commodity_movement_bin_card (commodity_movement_bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (NEW.commodity_movement_bin_card_id,NEW.commodity_name,NEW.batch_no,NEW.opening_bal,NEW.closing_bal,NEW.expiry_date,NEW.issues,NEW.date_added,NEW.description,NEW.department,NEW.identification_code,NEW.issuing_officer,'AFTER UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_commodity_movement_bin_card`;
DELIMITER //
CREATE TRIGGER `before_update_commodity_movement_bin_card` BEFORE UPDATE ON `commodity_movement_bin_card`
 FOR EACH ROW INSERT INTO trigger_commodity_movement_bin_card (commodity_movement_bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (OLD.commodity_movement_bin_card_id,OLD.commodity_name,OLD.batch_no,OLD.opening_bal,OLD.closing_bal,OLD.expiry_date,OLD.issues,OLD.date_added,OLD.description,OLD.department,OLD.identification_code,OLD.issuing_officer,'BEFORE UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `consultation_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `complaints` text NOT NULL,
  `medical_history` text NOT NULL,
  `systematic_inquiry` text NOT NULL,
  `examination_findings` text NOT NULL,
  `provisional_diagnosis` text NOT NULL,
  `final_diagnosis` text NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `working_diagnosis` text NOT NULL,
  `med_history` text NOT NULL,
  PRIMARY KEY (`consultation_id`),
  KEY `patient_id` (`patient_id`),
  KEY `visit_id` (`visit_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`consultation_id`, `patient_id`, `visit_id`, `complaints`, `medical_history`, `systematic_inquiry`, `examination_findings`, `provisional_diagnosis`, `final_diagnosis`, `doctor_id`, `date`, `working_diagnosis`, `med_history`) VALUES
(1, 23, 11, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', 8, '2014-01-06 12:56:40', 'ndfvuindf', 'fnuidnviu'),
(6, 23, 12, 'nnduvfnfou', 'nfdiunvdfiou', 'vndfunou', 'dfnvudfnv', '', '', 8, '2014-01-06 13:01:38', 'fdnvuiofdn', ''),
(7, 2, 14, 'nnduvfnfou', 'nfdiunvdfiou', 'vndfunou', 'dfnvudfnv', '', '', 8, '2014-01-07 14:09:24', 'fdnvuiofdn', ''),
(8, 8, 22, 'fnsivdfbnvicdsn', 'vnidfniucidns', 'fdbvidnfiuvx', 'fdbnvidfniguv', '', '', 8, '2014-01-08 03:17:21', 'fdvifndiv', ''),
(9, 3, 33, 'gfjbnvuidfbnsciu', 'dbfvuibfdiuvbci', 'dfibvuidfbv', 'fdbiuvdbfiuv', '', '', 8, '2014-01-29 12:16:32', 'dfvbdfiubviu', 'gncbnoidnfgiovfsd');

--
-- Triggers `consultation`
--
DROP TRIGGER IF EXISTS `after_insert_consultation`;
DELIMITER //
CREATE TRIGGER `after_insert_consultation` AFTER INSERT ON `consultation`
 FOR EACH ROW INSERT INTO trigger_consultation_update (consultation_id, patient_id, visit_id,complaints,medical_history,systematic_inquiry,examination_findings,provisional_diagnosis,final_diagnosis,changetype)  
        VALUES (NEW.consultation_id,NEW.patient_id,NEW.visit_id,NEW.complaints,NEW.medical_history,NEW.systematic_inquiry,NEW.examination_findings,NEW.provisional_diagnosis,NEW.final_diagnosis,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_consultation`;
DELIMITER //
CREATE TRIGGER `after_update_consultation` AFTER UPDATE ON `consultation`
 FOR EACH ROW INSERT INTO trigger_consultation_update (consultation_id, patient_id, visit_id,complaints,medical_history,systematic_inquiry,examination_findings,provisional_diagnosis,final_diagnosis,changetype)  
        VALUES (NEW.consultation_id,NEW.patient_id,NEW.visit_id,NEW.complaints,NEW.medical_history,NEW.systematic_inquiry,NEW.examination_findings,NEW.provisional_diagnosis,NEW.final_diagnosis,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_consultation`;
DELIMITER //
CREATE TRIGGER `before_update_consultation` BEFORE UPDATE ON `consultation`
 FOR EACH ROW INSERT INTO trigger_consultation_update (consultation_id, patient_id, visit_id,complaints,medical_history,systematic_inquiry,examination_findings,provisional_diagnosis,final_diagnosis,changetype)  
        VALUES (OLD.consultation_id,OLD.patient_id,OLD.visit_id,OLD.complaints,OLD.medical_history,OLD.systematic_inquiry,OLD.examination_findings,OLD.provisional_diagnosis,OLD.final_diagnosis,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(32) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `department_name` (`department_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(2, 'Administration'),
(3, 'Branch management'),
(9, 'Cashier'),
(4, 'Doctor'),
(7, 'Laboratory'),
(11, 'Member Management'),
(5, 'Nurse'),
(6, 'Pharmacy'),
(13, 'Radiology'),
(8, 'Reception'),
(12, 'Store'),
(1, 'Support'),
(10, 'Top Management');

-- --------------------------------------------------------

--
-- Table structure for table `dept_stock_bin_card`
--

CREATE TABLE `dept_stock_bin_card` (
  `dept_bin_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `opening_bal` decimal(13,2) NOT NULL,
  `closing_bal` decimal(13,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `issues` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `issuing_officer` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `identification_code` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_bin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `dept_stock_bin_card`
--

INSERT INTO `dept_stock_bin_card` (`dept_bin_id`, `commodity_name`, `batch_no`, `opening_bal`, `closing_bal`, `expiry_date`, `issues`, `date_added`, `issuing_officer`, `description`, `department`, `identification_code`) VALUES
(1, 'vfdgv', 'BET_002', 23.00, 39.00, '0000-00-00', 2015.00, '2014-01-16 08:44:56', '10', '', '', ''),
(2, 'Array', 'BET_002', 26.00, 26.00, '0000-00-00', 2015.00, '2014-01-13 09:08:07', '10', '', '', ''),
(3, 'Array', 'BET_002', 16.00, 26.00, '0000-00-00', 2015.00, '2014-01-13 09:08:07', '10', '', '', ''),
(4, 'Array', 'BET_002', 23.00, 23.00, '0000-00-00', 2015.00, '2014-01-13 09:08:07', '10', '', '', ''),
(5, 'Array', 'BET_002', 26.00, 26.00, '0000-00-00', 2015.00, '2014-01-13 09:08:07', '10', '', '', ''),
(6, 'Array', 'BET_002', 16.00, 26.00, '0000-00-00', 2015.00, '2014-01-13 09:08:07', '10', '', '', ''),
(7, 'Betapyn', 'BET_002', 10.00, 11.00, '0000-00-00', 2.00, '2014-01-13 09:09:52', '10', '', '', ''),
(8, 'Betapyn', 'BET_002', 10.00, 10.00, '0000-00-00', 0.00, '2014-01-13 09:09:53', '10', '', '', ''),
(9, 'Betapyn', 'BET_002', 10.00, 10.00, '0000-00-00', 1.00, '2014-01-13 09:09:53', '10', '', '', ''),
(10, 'Betapyn', 'BET_002', 9.00, 8.00, '0000-00-00', 1.00, '2014-01-13 09:15:53', '10', '', '', ''),
(11, 'Betapyn', 'BET_002', 9.00, 8.00, '0000-00-00', 1.00, '2014-01-13 09:15:53', '10', '', '', ''),
(12, 'Betapyn', 'BET_002', 9.00, 8.00, '0000-00-00', 1.00, '2014-01-13 09:15:53', '10', '', '', ''),
(13, 'Betapyn', 'BET_002', 9.00, 8.00, '0000-00-00', 1.00, '2014-01-13 09:15:53', '10', '', '', ''),
(14, 'Betapyn', 'BET_002', 9.00, 8.00, '0000-00-00', 1.00, '2014-01-13 09:15:53', '10', '', '', ''),
(15, 'Betapyn', 'BET_002', 9.00, 8.00, '0000-00-00', 1.00, '2014-01-13 09:15:53', '10', '', '', ''),
(16, 'Betapyn', 'BET_002', 8.00, 7.00, '2015-12-31', 1.00, '2014-01-13 09:19:10', '10', '', '', ''),
(17, 'Betapyn', 'BET_002', 8.00, 7.00, '2015-12-31', 1.00, '2014-01-13 09:19:10', '10', '', '', ''),
(18, 'Betapyn', 'BET_002', 8.00, 7.00, '2015-12-31', 1.00, '2014-01-13 09:19:10', '10', '', '', ''),
(19, 'Betapyn', 'BET_002', 8.00, 7.00, '2015-12-31', 1.00, '2014-01-13 09:19:10', '10', '', '', ''),
(20, 'Betapyn', 'BET_002', 8.00, 7.00, '2015-12-31', 1.00, '2014-01-13 09:19:10', '10', '', '', ''),
(21, 'Betapyn', 'BET_002', 8.00, 7.00, '2015-12-31', 1.00, '2014-01-13 09:19:10', '10', '', '', ''),
(22, 'Betapyn', 'BET_002', 7.00, 6.00, '2015-12-31', 1.00, '2014-01-13 09:48:16', '10', '', '', ''),
(23, 'Betapyn', 'BET_002', 7.00, 6.00, '2015-12-31', 1.00, '2014-01-13 09:48:16', '10', '', '', ''),
(24, 'Betapyn', 'BET_002', 7.00, 6.00, '2015-12-31', 1.00, '2014-01-13 09:48:16', '10', '', '', ''),
(25, 'Betapyn', 'BET_002', 6.00, 5.00, '2015-12-31', 1.00, '2014-01-13 10:13:38', '10', '', '', ''),
(26, 'Betapyn', 'BET_002', 6.00, 5.00, '2015-12-31', 1.00, '2014-01-13 10:13:38', '10', '', '', ''),
(27, 'Betapyn', 'BET_002', 6.00, 5.00, '2015-12-31', 1.00, '2014-01-13 10:13:38', '10', '', '', ''),
(28, 'Betapyn', 'BET_002', 5.00, 4.00, '2015-12-31', 1.00, '2014-01-13 10:20:05', '10', '', '', ''),
(29, 'Betapyn', 'BET_002', 5.00, 4.00, '2015-12-31', 1.00, '2014-01-13 10:20:05', '10', '', '', ''),
(30, 'Betapyn', 'BET_002', 5.00, 4.00, '2015-12-31', 1.00, '2014-01-13 10:20:05', '10', '', '', ''),
(31, 'kxbvkdnfv', 'KX_001', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:47:51', '1', 'fdsvdsf', 'Store', 'nvnod'),
(33, 'Betapyn', '0', 5.00, 5.00, '2015-12-31', 0.00, '2014-01-29 05:20:31', '7', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:LZr1O'),
(34, 'Betapyn', '0', 5.00, 0.00, '2015-12-31', 0.00, '2014-01-29 05:20:31', '7', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:LZr1O'),
(35, 'Betapyn', '0', 5.00, 5.00, '2015-12-31', 0.00, '2014-01-29 05:26:37', '7', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:IH3tF'),
(36, 'Betapyn', '0', 5.00, 0.00, '2015-12-31', 0.00, '2014-01-29 05:26:37', '7', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:IH3tF'),
(37, 'Betapyn', '0', 5.00, 3.00, '2015-12-31', 2.00, '2014-01-29 05:28:12', '7', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:VJgq3'),
(38, 'Betapyn', '0', 5.00, 2.00, '2015-12-31', 2.00, '2014-01-29 05:28:12', '7', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:VJgq3'),
(39, 'Betapyn', 'BET_002', 3.00, 2.00, '2015-12-31', 1.00, '2014-01-29 05:29:01', '7', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:PZD9N'),
(40, 'Betapyn', 'BET_002', 3.00, 1.00, '2015-12-31', 1.00, '2014-01-29 05:29:01', '7', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:PZD9N'),
(41, 'Betapyn', 'BET_002', 2.00, 1.00, '2015-12-31', 1.00, '2014-01-30 06:39:27', '10', 'Commodity: Betapyndispensed to a patient:SHWARI_1000002_002', 'Pharmacy', 'ISS:0SrsI'),
(42, 'Betapyn', 'BET_002', 1.00, 0.00, '2015-12-31', 1.00, '2014-01-30 10:51:44', '10', 'Return to the  Main Store from Pharmacy Department', 'Pharmacy', 'RET:02QJx'),
(43, 'nfgduinvd', 'nfg_1', 0.00, 14.00, '2014-01-09', 14.00, '2014-01-30 11:01:28', '13', 'Commodity:nfgduinvdhas been dispensed from DepartmentPharmacyto DepartmentPharmacy', 'Array', 'ISS:om0Pu'),
(44, 'fnvidnbiv', '123890', 0.00, 40.00, '0000-00-00', 40.00, '2014-01-30 11:30:59', '13', 'Commodity:fnvidnbivhas been dispensed from DepartmentPharmacistto DepartmentPharmacy', 'Array', 'ISS:C3lrG');

--
-- Triggers `dept_stock_bin_card`
--
DROP TRIGGER IF EXISTS `after_insert_dept_stock_bin_card`;
DELIMITER //
CREATE TRIGGER `after_insert_dept_stock_bin_card` AFTER INSERT ON `dept_stock_bin_card`
 FOR EACH ROW INSERT INTO trigger_dept_stock_bin_card (dept_stock_bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (NEW.dept_bin_id,NEW.commodity_name,NEW.batch_no,NEW.opening_bal,NEW.closing_bal,NEW.expiry_date,NEW.issues,NEW.date_added,NEW.description,NEW.department,NEW.identification_code,NEW.issuing_officer,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_dept_stock_bin_card`;
DELIMITER //
CREATE TRIGGER `after_update_dept_stock_bin_card` AFTER UPDATE ON `dept_stock_bin_card`
 FOR EACH ROW INSERT INTO trigger_dept_stock_bin_card (dept_stock_bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (NEW.dept_bin_id,NEW.commodity_name,NEW.batch_no,NEW.opening_bal,NEW.closing_bal,NEW.expiry_date,OLD.issues,NEW.date_added,OLD.description,NEW.department,NEW.identification_code,NEW.issuing_officer,'AFTER UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_dept_stock_bin_card`;
DELIMITER //
CREATE TRIGGER `before_update_dept_stock_bin_card` BEFORE UPDATE ON `dept_stock_bin_card`
 FOR EACH ROW INSERT INTO trigger_dept_stock_bin_card (dept_stock_bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (OLD.dept_bin_id,OLD.commodity_name,OLD.batch_no,OLD.opening_bal,OLD.closing_bal,OLD.expiry_date,OLD.issues,OLD.date_added,OLD.description,OLD.department,OLD.identification_code,OLD.issuing_officer,'BEFORE UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dose_form`
--

CREATE TABLE `dose_form` (
  `dose_form_id` int(11) NOT NULL AUTO_INCREMENT,
  `dose_form_name` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`dose_form_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `dose_form`
--

INSERT INTO `dose_form` (`dose_form_id`, `dose_form_name`) VALUES
(1, 'activtd powder'),
(2, 'cap'),
(3, 'cream'),
(4, 'dental cart'),
(5, 'dialysis soln'),
(6, 'disinf'),
(7, 'ear drops'),
(8, 'ext soln'),
(9, 'eye drops'),
(10, 'eye oint'),
(11, 'eye/ear drops'),
(12, 'impreg strips'),
(13, 'infusion'),
(14, 'inhalation'),
(15, 'inhaler'),
(16, 'inj'),
(17, 'inj depot'),
(18, 'inj oily'),
(19, 'inj pfr'),
(20, 'IUD'),
(21, 'liniment'),
(22, 'lotion'),
(23, 'n/a'),
(24, 'neb soln'),
(25, 'neonat drops'),
(26, 'oint'),
(27, 'oral drops'),
(28, 'oral gel'),
(29, 'oral mixt'),
(30, 'oral powd'),
(31, 'oral soln'),
(32, 'oral susp'),
(33, 'paed elix'),
(34, 'paste'),
(35, 'pess'),
(36, 'powd'),
(37, 'sach'),
(38, 'spray'),
(39, 'suppos'),
(40, 'syr'),
(41, 'tab'),
(42, 'tab e/c'),
(43, 'tab f/c'),
(44, 'tab s/l'),
(45, 'tab s/r'),
(46, 'vacc');

-- --------------------------------------------------------

--
-- Table structure for table `drop_down`
--

CREATE TABLE `drop_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dropdown_name` varchar(255) NOT NULL,
  `dropdown_type` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `drop_down`
--

INSERT INTO `drop_down` (`id`, `dropdown_name`, `dropdown_type`, `unique_id`) VALUES
(1, 'proc_priority', 'High', '1'),
(2, 'proc_priority', 'Moderate', '1'),
(3, 'proc_priority', 'Low', '1'),
(4, 'VEN', 'Vital', '2'),
(5, 'VEN', 'Essential', '2'),
(6, 'VEN', 'Non-Essential', '2'),
(7, 'KEML_2010', 'Yes', '3'),
(8, 'KEML_2010', 'No', '3'),
(9, 'Product_Type', 'Pharmaceuticals', '4'),
(10, 'Product_Type', 'Non_Pharmaceuticals', '4'),
(11, 'Product_Type', 'Supplies', '4'),
(12, 'Product_Type', 'Medical_Equipment', '4'),
(13, 'Radiology', 'X-Ray', '5'),
(14, 'Radiology', 'Mammography', '5'),
(15, 'Radiology', 'CT_Scan', '5'),
(16, 'Radiology', 'Ultra_Sound', '5'),
(17, 'category', 'Pharmaceuticals', '6'),
(18, 'category', 'Non_Pharmaceuticals', '6'),
(19, 'category', 'Supplies', '6'),
(20, 'category', 'Medical_Equipment', '6'),
(21, 'strength', '25gms', '7'),
(22, 'strength', '5ml', '7'),
(23, 'dose_form', '2TDS', '8'),
(24, 'dose_form', '3TDS', '8'),
(25, 'commodity_type', 'Antibiotics', '9'),
(26, 'Commodity_Type', 'Pain_Killers', '9');

-- --------------------------------------------------------

--
-- Table structure for table `drug_dosage`
--

CREATE TABLE `drug_dosage` (
  `drug_dosage_id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_dosage` varchar(255) NOT NULL,
  `total_day` varchar(255) NOT NULL,
  `drug_type` varchar(255) NOT NULL,
  PRIMARY KEY (`drug_dosage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `drug_dosage`
--

INSERT INTO `drug_dosage` (`drug_dosage_id`, `drug_dosage`, `total_day`, `drug_type`) VALUES
(1, '1TDS', '1', 'Tablet'),
(2, '2TDS', '2', 'Tablet'),
(3, '3TDS', '3', 'Tablet'),
(4, '4TDS', '4', 'Tablet'),
(5, '2_4TDS', '8', 'Tablet'),
(6, '1BTL', '1', 'Bottle'),
(7, '1TUBE', '1', 'Tube'),
(8, '2TUBE', '2', 'Tube');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `other_name` varchar(255) NOT NULL,
  `id_no` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `marital_status` enum('Single','Married','Divorced') NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `residence` varchar(255) NOT NULL,
  `employment_category` int(11) NOT NULL,
  `next_of_kin_fname` varchar(255) NOT NULL,
  `next_of_kin_lname` varchar(255) NOT NULL,
  `next_of_kin_relation` varchar(255) NOT NULL,
  `next_of_kin_phone_no` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('Yes','No') NOT NULL,
  `member_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `is_global` enum('Yes','No') NOT NULL,
  `dept` varchar(255) NOT NULL,
  `random_key` text NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `employee_class` enum('Global Employee','Member Employee','Branch Employee') NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `member_id` (`member_id`),
  KEY `branch_id` (`branch_id`),
  KEY `user_name_2` (`user_name`),
  KEY `employment_category` (`employment_category`),
  KEY `employment_category_2` (`employment_category`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `f_name`, `l_name`, `other_name`, `id_no`, `dob`, `gender`, `marital_status`, `phone_no`, `email`, `date_added`, `residence`, `employment_category`, `next_of_kin_fname`, `next_of_kin_lname`, `next_of_kin_relation`, `next_of_kin_phone_no`, `user_name`, `password`, `is_active`, `member_id`, `branch_id`, `is_global`, `dept`, `random_key`, `expiry_date`, `employee_class`) VALUES
(1, 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', 711098123, 'harrisdindisamuel@gmail.com', '2013-12-17 17:50:37', 'Nairobi', 2, 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'Administration', 'VuUHD6i4hW', '2013-11-28 17:15:07', 'Global Employee'),
(2, 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', 714189234, 'harris.samuel@strathmore.edu', '2013-12-17 17:51:01', 'Nairobi', 1, 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 10, 1, 'Yes', 'Support', '3LKoipQBFn', '2013-11-28 08:49:01', 'Global Employee'),
(3, 'david', 'otieno', 'otieno', '12345678', '1990-12-26', 'Male', 'Single', 712123456, 'davidotieno@gmail.com', '2013-12-17 17:01:08', 'Nairobi', 4, 'david', 'otieno', 'brother', '0712123456', 'otieno', 'bf3a66a531e7b93155ce3eafac68e99d', 'Yes', 10, 1, 'Yes', 'Pharmacy', '', '0000-00-00 00:00:00', 'Global Employee'),
(4, 'sharon', 'wanjiru', 'wambui', '12309812', '1990-12-26', 'Female', 'Single', 712098765, 'wanjirusharon@gmail.com', '2013-12-17 16:59:25', 'Nairobi', 3, 'Wanjiru', 'Wa Kinoti', 'Mother', '0712098345', 'wanjiru', '99f16a6c8d12e4f6fcc1151d398ef97f', 'Yes', 11, 1, 'Yes', '', '', '0000-00-00 00:00:00', 'Global Employee'),
(5, 'Ivy', 'Ngetich', 'Ruto', '1235678', '1982-12-12', 'Female', 'Married', 812345121, 'ngetich@gmail.com', '2013-12-17 17:12:18', 'Eldoret', 4, '', '', '', '', 'ngetich', '8704dfc67f4f77167b974c3af2f16d35', 'Yes', 12, 1, 'Yes', '', '', '0000-00-00 00:00:00', 'Global Employee'),
(7, 'nurse', 'nurse', 'nurse', '1234567', '1990-12-26', 'Female', 'Married', 712345908, 'nurse@gmail.com', '2013-12-17 17:06:07', 'Nairobi', 5, 'nurse', 'nurse', 'employer', '0712123456', 'nurse', '0701aa317da5a004fbf6111545678a6c', 'Yes', 10, 1, 'Yes', '', '', '0000-00-00 00:00:00', 'Global Employee'),
(8, 'doctor', 'doctor', 'doctor', '1235678', '1982-12-12', 'Male', 'Single', 812345121, 'doctor@gmail.com', '2013-12-17 17:06:07', 'Nairobi', 4, 'doctor', 'doctor', 'employer', '0712344567', 'doctor', 'f9f16d97c90d8c6f2cab37bb6d1f1992', 'Yes', 10, 1, 'Yes', '', '', '0000-00-00 00:00:00', 'Global Employee'),
(10, 'pharmacist', 'pharmacist', 'pharmacist', '12345678', '1990-12-26', 'Male', 'Single', 714339521, 'davidotieno@gmail.com', '2013-12-17 17:11:42', 'Nairobi', 6, 'pharmacist', 'pharmacist', 'employer', '0712123456', 'pharmacist', 'fd3051577824ada21b3df777812c66fa', 'Yes', 10, 1, 'Yes', '', '', '0000-00-00 00:00:00', 'Global Employee'),
(11, 'lab', 'lab', 'lab', '1235678', '1982-12-12', 'Male', 'Single', 812345121, 'doctor@gmail.com', '2013-12-17 17:11:42', 'Eldoret', 7, 'lab', 'lab', 'employer', '0712344567', 'lab', 'f9664ea1803311b35f81d07d8c9e072d', 'Yes', 10, 1, 'Yes', '', '', '0000-00-00 00:00:00', 'Global Employee'),
(13, 'store', 'store', 'store', '12345678', '1990-12-26', 'Male', 'Single', 714339521, 'store@gmail.com', '2013-12-17 17:42:39', 'Nairobi', 12, 'store', 'store', 'store', 'store', 'store', '8cd892b7b97ef9489ae4479d3f4ef0fc', 'Yes', 10, 1, 'Yes', '', '', '0000-00-00 00:00:00', 'Global Employee'),
(14, 'radiology', 'radiology', 'radiology', 'radiology', '0000-00-00', 'Male', 'Single', 2147483647, 'nbufgdnfuds', '2014-01-07 02:41:49', 'fbngdun', 13, 'bngiodnfs', 'dngbdgn', 'fdvfd', 'gbfgfd', 'radiology', 'a3cf66963cec3d59abb731b6ce910c6e', 'Yes', 10, 1, 'Yes', 'radiology', '', '0000-00-00 00:00:00', 'Global Employee'),
(18, 'cashier', 'cashier', 'cashier', 'cashier', '1990-12-26', 'Male', 'Single', 714339521, 'davidotieno@gmail.com', '2014-01-09 10:48:46', 'Nairobi', 9, 'bngiodnfs', 'Dindi', 'brother', '0712123456', 'cashier', '6ac2470ed8ccf204fd5ff89b32a355cf', 'Yes', 10, 1, 'Yes', 'Cashier', '', '0000-00-00 00:00:00', 'Member Employee');

--
-- Triggers `employee`
--
DROP TRIGGER IF EXISTS `after_insert_employee`;
DELIMITER //
CREATE TRIGGER `after_insert_employee` AFTER INSERT ON `employee`
 FOR EACH ROW INSERT INTO trigger_employee_update (employee_id, f_name, l_name,other_name,id_no,dob,gender,marital_status,phone_no,email,date_added,residence,employment_category,next_of_kin_fname,next_of_kin_lname,next_of_kin_relation,next_of_kin_phone_no,user_name,password,is_active,member_id,branch_id,is_global,changetype)  
        VALUES (NEW.employee_id,NEW.f_name,NEW.l_name,NEW.other_name,NEW.id_no,NEW.dob,NEW.gender,NEW.marital_status,NEW.phone_no,NEW.email,NEW.date_added,NEW.residence,NEW.employment_category,NEW.next_of_kin_fname,NEW.next_of_kin_lname,NEW.next_of_kin_relation,NEW.next_of_kin_phone_no,NEW.user_name,NEW.password,NEW.is_active,NEW.member_id,NEW.branch_id,NEW.is_global,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_employee`;
DELIMITER //
CREATE TRIGGER `after_update_employee` AFTER UPDATE ON `employee`
 FOR EACH ROW INSERT INTO trigger_employee_update (employee_id, f_name, l_name,other_name,id_no,dob,gender,marital_status,phone_no,email,date_added,residence,employment_category,next_of_kin_fname,next_of_kin_lname,next_of_kin_relation,next_of_kin_phone_no,user_name,password,is_active,member_id,branch_id,is_global,changetype)  
        VALUES (NEW.employee_id,NEW.f_name,NEW.l_name,NEW.other_name,NEW.id_no,NEW.dob,NEW.gender,NEW.marital_status,NEW.phone_no,NEW.email,NEW.date_added,NEW.residence,NEW.employment_category,NEW.next_of_kin_fname,NEW.next_of_kin_lname,NEW.next_of_kin_relation,NEW.next_of_kin_phone_no,NEW.user_name,NEW.password,NEW.is_active,NEW.member_id,NEW.branch_id,NEW.is_global,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_employee`;
DELIMITER //
CREATE TRIGGER `before_update_employee` BEFORE UPDATE ON `employee`
 FOR EACH ROW INSERT INTO trigger_employee_update (employee_id, f_name, l_name,other_name,id_no,dob,gender,marital_status,phone_no,email,date_added,residence,employment_category,next_of_kin_fname,next_of_kin_lname,next_of_kin_relation,next_of_kin_phone_no,user_name,password,is_active,member_id,branch_id,is_global,changetype)  
        VALUES (OLD.employee_id,OLD.f_name,OLD.l_name,OLD.other_name,OLD.id_no,OLD.dob,OLD.gender,OLD.marital_status,OLD.phone_no,OLD.email,OLD.date_added,OLD.residence,OLD.employment_category,OLD.next_of_kin_fname,OLD.next_of_kin_lname,OLD.next_of_kin_relation,OLD.next_of_kin_phone_no,OLD.user_name,OLD.password,OLD.is_active,OLD.member_id,OLD.branch_id,OLD.is_global,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_profileimage`
--

CREATE TABLE `employee_profileimage` (
  `employee_profileimage_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_profileimage_filename` varchar(255) NOT NULL,
  `employee_profileimage_title` varchar(255) NOT NULL,
  `employee_profileimage_employee_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_profileimage_id`),
  KEY `employee_profileimage_employee_id` (`employee_profileimage_employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lab_test_result`
--

CREATE TABLE `lab_test_result` (
  `lab_test_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `test` varchar(255) NOT NULL,
  `test_results` text NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `lab_tech_id` int(11) NOT NULL,
  `check` enum('0','1') NOT NULL,
  `paid` enum('not paid','paid') NOT NULL,
  `payment_id` enum('0','1') NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lab_test_id`),
  KEY `patient_id` (`patient_id`),
  KEY `visit_id` (`visit_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `consultation_id` (`consultation_id`),
  KEY `lab_tech_id` (`lab_tech_id`),
  KEY `payment_id` (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `lab_test_result`
--

INSERT INTO `lab_test_result` (`lab_test_id`, `patient_id`, `visit_id`, `test`, `test_results`, `doctor_id`, `consultation_id`, `lab_tech_id`, `check`, `paid`, `payment_id`, `date_added`) VALUES
(2, 3, 14, 'dfvfcds', ' nfdjidin f', 8, 1, 11, '0', 'paid', '1', '0000-00-00 00:00:00'),
(3, 23, 12, 'Stool Test', 'jgnbvuisndfiocidfnx vdnbvuoidsnfoieusd', 8, 6, 11, '0', 'paid', '1', '0000-00-00 00:00:00'),
(4, 23, 12, 'Malaria Test', '', 8, 6, 0, '0', 'not paid', '0', '0000-00-00 00:00:00'),
(6, 23, 12, 'X-Ray', '', 8, 6, 0, '0', 'not paid', '0', '0000-00-00 00:00:00'),
(7, 23, 12, 'CT-Scan', '', 8, 6, 0, '0', 'not paid', '0', '0000-00-00 00:00:00'),
(8, 23, 12, 'CT-Scan', '', 8, 6, 0, '0', 'not paid', '0', '0000-00-00 00:00:00'),
(9, 23, 12, 'Malaria Test', '', 11, 6, 0, '0', 'not paid', '0', '0000-00-00 00:00:00'),
(10, 23, 12, 'Stool Test', '', 8, 6, 0, '0', 'not paid', '0', '2014-01-21 14:03:10'),
(11, 3, 33, 'Malaria Test', 'nviudbgiuvfdigubvgiudfbiuvnfgiudbiuvbn    fkjgbnigfdbnuigv dfinbfiubcniubfngiuc dnbfiubuifgd', 8, 9, 11, '0', 'paid', '0', '2014-01-29 11:10:21'),
(12, 3, 33, 'Stool Test', 'jbdviudbfiu nduibnvui ndiuvbdiu dfbnvuibdf', 11, 9, 11, '0', 'paid', '0', '2014-01-29 12:59:58');

--
-- Triggers `lab_test_result`
--
DROP TRIGGER IF EXISTS `after_insert_lab_test_result`;
DELIMITER //
CREATE TRIGGER `after_insert_lab_test_result` AFTER INSERT ON `lab_test_result`
 FOR EACH ROW INSERT INTO trigger_lab_test_result_update (lab_test_id, patient_id, visit_id,test,test_results,changetype)  
        VALUES (NEW.lab_test_id,NEW.patient_id,NEW.visit_id,NEW.test,NEW.test_results,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_lab_test_result`;
DELIMITER //
CREATE TRIGGER `after_update_lab_test_result` AFTER UPDATE ON `lab_test_result`
 FOR EACH ROW INSERT INTO trigger_lab_test_result_update (lab_test_id, patient_id, visit_id,test,test_results,changetype)  
        VALUES (NEW.lab_test_id,NEW.patient_id,NEW.visit_id,NEW.test,NEW.test_results,'AFTER UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_lab_test_result`;
DELIMITER //
CREATE TRIGGER `before_update_lab_test_result` BEFORE UPDATE ON `lab_test_result`
 FOR EACH ROW INSERT INTO trigger_lab_test_result_update (lab_test_id, patient_id, visit_id,test,test_results,changetype)  
        VALUES (NEW.lab_test_id,NEW.patient_id,NEW.visit_id,NEW.test,NEW.test_results,'AFTER UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `login_logs_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `login_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` enum('Active','In_Active') NOT NULL,
  PRIMARY KEY (`login_logs_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=410 ;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`login_logs_id`, `employee_id`, `user_name`, `login_date`, `is_active`) VALUES
(2, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(3, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(4, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(5, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(6, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(7, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(8, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(9, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(10, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(11, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(12, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(13, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(14, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(15, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(16, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(17, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(18, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(19, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(20, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(21, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(22, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(23, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(24, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(25, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(26, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(27, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(28, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(29, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(30, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(31, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(32, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(33, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(34, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(35, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(36, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(37, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(38, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(39, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(40, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(41, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(42, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(43, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(44, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(45, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(46, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(47, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(48, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(49, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(50, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(51, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(52, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(53, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(54, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(55, 1, 'admin', '2013-12-17 12:42:51', 'In_Active'),
(56, 2, 'reception', '2013-12-17 12:42:51', 'In_Active'),
(57, 2, 'reception', '2013-12-17 12:41:53', 'In_Active'),
(58, 1, 'Admin', '2013-12-17 12:54:08', 'In_Active'),
(59, 2, 'reception', '2013-12-17 12:54:19', 'In_Active'),
(60, 1, 'admin', '2013-12-17 12:55:14', 'In_Active'),
(61, 8, 'doctor', '2013-12-17 17:12:52', 'Active'),
(62, 7, 'nurse', '2013-12-17 17:14:11', 'Active'),
(63, 7, 'nurse', '2013-12-17 17:14:51', 'Active'),
(64, 8, 'doctor', '2013-12-17 17:35:56', 'In_Active'),
(65, 7, 'nurse', '2013-12-17 17:44:28', 'In_Active'),
(66, 10, 'pharmacist', '2013-12-17 17:36:07', 'Active'),
(67, 10, 'pharmacist', '2013-12-17 17:42:47', 'In_Active'),
(68, 13, 'store', '2013-12-17 17:42:52', 'Active'),
(69, 13, 'store', '2013-12-17 17:44:37', 'Active'),
(70, 2, 'reception', '2013-12-17 17:49:02', 'Active'),
(71, 1, 'admin', '2013-12-17 17:49:54', 'Active'),
(72, 1, 'admin', '2013-12-17 17:51:16', 'In_Active'),
(73, 2, 'reception', '2013-12-17 17:51:23', 'Active'),
(74, 2, 'reception', '2013-12-18 16:33:57', 'Active'),
(75, 2, 'reception', '2013-12-18 16:55:32', 'Active'),
(76, 2, 'reception', '2013-12-19 18:35:50', 'Active'),
(77, 1, 'admin', '2013-12-19 18:48:28', 'In_Active'),
(78, 7, 'nurse', '2013-12-19 18:49:45', 'In_Active'),
(79, 2, 'reception', '2013-12-19 18:49:54', 'Active'),
(80, 2, 'reception', '2013-12-19 18:54:30', 'Active'),
(81, 2, 'reception', '2013-12-20 07:43:54', 'Active'),
(82, 2, 'reception', '2013-12-20 08:31:57', 'In_Active'),
(83, 7, 'nurse', '2013-12-20 08:32:06', 'Active'),
(84, 7, 'nurse', '2013-12-20 09:22:38', 'In_Active'),
(85, 7, 'nurse', '2013-12-20 09:22:46', 'Active'),
(86, 2, 'reception', '2013-12-20 11:30:53', 'In_Active'),
(87, 7, 'nurse', '2013-12-20 11:33:38', 'In_Active'),
(88, 7, 'nurse', '2013-12-20 11:53:01', 'Active'),
(89, 7, 'nurse', '2013-12-20 12:16:12', 'Active'),
(90, 2, 'reception', '2013-12-20 13:45:05', 'In_Active'),
(91, 7, 'nurse', '2013-12-20 13:45:12', 'Active'),
(92, 7, 'nurse', '2013-12-21 02:52:13', 'Active'),
(93, 7, 'nurse', '2013-12-21 07:47:15', 'In_Active'),
(94, 8, 'doctor', '2013-12-21 08:01:55', 'In_Active'),
(95, 7, 'nurse', '2013-12-21 08:05:48', 'In_Active'),
(96, 8, 'doctor', '2013-12-21 08:05:55', 'Active'),
(97, 8, 'doctor', '2013-12-21 08:10:09', 'Active'),
(98, 8, 'doctor', '2013-12-21 15:26:22', 'In_Active'),
(99, 11, 'lab', '2013-12-21 15:26:48', 'Active'),
(100, 11, 'lab', '2013-12-21 16:08:29', 'In_Active'),
(101, 10, 'pharmacist', '2013-12-21 16:08:44', 'Active'),
(102, 10, 'pharmacist', '2013-12-22 07:36:26', 'In_Active'),
(103, 13, 'store', '2013-12-22 07:36:32', 'Active'),
(104, 13, 'store', '2013-12-22 15:16:42', 'Active'),
(105, 2, 'reception', '2013-12-23 07:55:34', 'Active'),
(106, 1, 'admin', '2013-12-23 08:09:51', 'In_Active'),
(107, 2, 'reception', '2013-12-23 08:27:50', 'In_Active'),
(108, 1, 'admin', '2013-12-23 08:27:56', 'Active'),
(109, 13, 'store', '2013-12-23 12:03:33', 'Active'),
(110, 13, 'store', '2013-12-25 06:01:19', 'Active'),
(111, 1, 'admin', '2013-12-25 14:47:13', 'In_Active'),
(112, 13, 'store', '2013-12-25 14:47:20', 'Active'),
(113, 13, 'store', '2013-12-30 11:19:52', 'Active'),
(114, 13, 'store', '2013-12-30 11:28:01', 'Active'),
(115, 13, 'store', '2013-12-30 12:23:02', 'Active'),
(116, 13, 'store', '2013-12-30 19:17:41', 'In_Active'),
(117, 10, 'pharmacist', '2013-12-30 19:17:50', 'Active'),
(118, 10, 'pharmacist', '2013-12-30 19:49:59', 'Active'),
(119, 10, 'pharmacist', '2013-12-31 03:52:14', 'Active'),
(120, 10, 'pharmacist', '2013-12-31 03:53:13', 'Active'),
(121, 10, 'pharmacist', '2013-12-31 05:33:17', 'In_Active'),
(122, 10, 'pharmacist', '2013-12-31 05:33:26', 'Active'),
(123, 10, 'pharmacist', '2013-12-31 07:42:31', 'Active'),
(124, 13, 'store', '2013-12-31 09:06:22', 'In_Active'),
(125, 10, 'pharmacist', '2013-12-31 09:06:36', 'Active'),
(126, 10, 'pharmacist', '2014-01-01 03:46:17', 'Active'),
(127, 10, 'pharmacist', '2014-01-02 08:31:57', 'Active'),
(128, 10, 'pharmacist', '2014-01-02 08:48:07', 'Active'),
(129, 10, 'pharmacist', '2014-01-02 11:50:58', 'Active'),
(130, 2, 'reception', '2014-01-02 12:01:59', 'In_Active'),
(131, 10, 'pharmacist', '2014-01-02 12:02:08', 'Active'),
(132, 10, 'pharmacist', '2014-01-02 13:19:51', 'In_Active'),
(133, 13, 'store', '2014-01-02 13:19:58', 'Active'),
(134, 13, 'store', '2014-01-03 08:36:00', 'Active'),
(135, 13, 'store', '2014-01-03 10:16:50', 'Active'),
(136, 13, 'store', '2014-01-03 13:18:21', 'Active'),
(137, 13, 'store', '2014-01-04 05:57:06', 'Active'),
(138, 13, 'store', '2014-01-04 08:27:49', 'In_Active'),
(139, 10, 'pharmacist', '2014-01-04 08:27:57', 'Active'),
(140, 10, 'pharmacist', '2014-01-04 16:52:44', 'Active'),
(141, 10, 'pharmacist', '2014-01-04 17:10:10', 'Active'),
(142, 10, 'pharmacist', '2014-01-05 02:53:27', 'Active'),
(143, 10, 'pharmacist', '2014-01-05 03:22:13', 'Active'),
(144, 10, 'pharmacist', '2014-01-05 03:26:09', 'Active'),
(145, 10, 'pharmacist', '2014-01-05 07:31:47', 'Active'),
(146, 10, 'pharmacist', '2014-01-05 14:14:36', 'In_Active'),
(147, 10, 'pharmacist', '2014-01-05 14:45:53', 'In_Active'),
(148, 13, 'store', '2014-01-05 14:14:45', 'Active'),
(149, 13, 'store', '2014-01-05 14:46:04', 'Active'),
(150, 13, 'store', '2014-01-05 15:32:42', 'Active'),
(151, 2, 'reception', '2014-01-06 06:17:50', 'In_Active'),
(152, 7, 'nurse', '2014-01-06 06:26:15', 'In_Active'),
(153, 2, 'reception', '2014-01-06 06:26:36', 'In_Active'),
(154, 8, 'doctor', '2014-01-06 06:31:37', 'In_Active'),
(155, 11, 'lab', '2014-01-06 06:32:22', 'In_Active'),
(156, 8, 'doctor', '2014-01-06 06:33:28', 'In_Active'),
(157, 10, 'pharmacist', '2014-01-06 06:36:09', 'In_Active'),
(158, 13, 'store', '2014-01-06 06:36:16', 'Active'),
(159, 10, 'pharmacist', '2014-01-06 06:41:58', 'In_Active'),
(160, 13, 'store', '2014-01-06 06:50:51', 'In_Active'),
(161, 10, 'pharmacist', '2014-01-06 07:34:17', 'In_Active'),
(162, 13, 'store', '2014-01-06 07:34:22', 'Active'),
(163, 10, 'pharmacist', '2014-01-06 07:58:42', 'In_Active'),
(164, 13, 'store', '2014-01-06 09:05:25', 'In_Active'),
(165, 2, 'reception', '2014-01-06 09:05:34', 'Active'),
(166, 7, 'nurse', '2014-01-06 12:08:41', 'Active'),
(167, 2, 'reception', '2014-01-06 12:42:56', 'In_Active'),
(168, 8, 'doctor', '2014-01-06 13:35:04', 'In_Active'),
(169, 7, 'nurse', '2014-01-06 13:52:40', 'In_Active'),
(170, 11, 'lab', '2014-01-06 13:35:14', 'Active'),
(171, 8, 'doctor', '2014-01-06 14:26:46', 'In_Active'),
(172, 11, 'lab', '2014-01-06 14:26:51', 'Active'),
(173, 14, 'radiology', '2014-01-07 02:42:06', 'Active'),
(174, 11, 'lab', '2014-01-07 02:55:30', 'Active'),
(175, 11, 'lab', '2014-01-07 06:46:10', 'In_Active'),
(176, 11, 'lab', '2014-01-07 07:40:09', 'In_Active'),
(177, 2, 'reception', '2014-01-07 06:46:20', 'Active'),
(178, 2, 'reception', '2014-01-07 08:19:01', 'In_Active'),
(179, 14, 'radiology', '2014-01-07 07:40:24', 'Active'),
(180, 11, 'lab', '2014-01-07 07:56:13', 'In_Active'),
(181, 8, 'doctor', '2014-01-07 11:01:53', 'In_Active'),
(182, 11, 'lab', '2014-01-07 10:17:32', 'In_Active'),
(183, 8, 'doctor', '2014-01-07 12:25:23', 'In_Active'),
(184, 11, 'lab', '2014-01-07 11:02:16', 'In_Active'),
(185, 14, 'radiology', '2014-01-07 11:02:24', 'Active'),
(186, 14, 'radiology', '2014-01-07 12:16:32', 'Active'),
(187, 14, 'radiology', '2014-01-07 12:18:36', 'Active'),
(188, 14, 'radiology', '2014-01-07 12:19:11', 'In_Active'),
(189, 14, 'radiology', '2014-01-07 12:19:21', 'Active'),
(190, 14, 'radiology', '2014-01-07 12:25:38', 'Active'),
(191, 7, 'nurse', '2014-01-07 12:35:45', 'Active'),
(192, 14, 'radiology', '2014-01-07 12:39:54', 'Active'),
(193, 7, 'nurse', '2014-01-07 12:57:16', 'Active'),
(194, 7, 'nurse', '2014-01-07 13:36:12', 'Active'),
(195, 14, 'radiology', '2014-01-07 13:43:02', 'In_Active'),
(196, 8, 'doctor', '2014-01-07 13:43:40', 'In_Active'),
(197, 14, 'radiology', '2014-01-07 13:44:14', 'In_Active'),
(198, 8, 'doctor', '2014-01-07 13:46:16', 'In_Active'),
(199, 8, 'doctor', '2014-01-07 13:46:22', 'Active'),
(200, 7, 'nurse', '2014-01-07 13:52:58', 'Active'),
(201, 14, 'radiology', '2014-01-07 14:09:32', 'In_Active'),
(202, 8, 'doctor', '2014-01-07 14:25:37', 'In_Active'),
(203, 14, 'radiology', '2014-01-07 14:43:42', 'In_Active'),
(204, 8, 'doctor', '2014-01-07 14:43:48', 'Active'),
(205, 2, 'reception', '2014-01-07 16:54:52', 'Active'),
(206, 2, 'reception', '2014-01-08 02:48:24', 'In_Active'),
(207, 2, 'reception', '2014-01-08 01:55:46', 'In_Active'),
(208, 7, 'nurse', '2014-01-08 02:09:01', 'In_Active'),
(209, 8, 'doctor', '2014-01-08 03:15:43', 'In_Active'),
(210, 7, 'nurse', '2014-01-08 02:48:32', 'Active'),
(211, 10, 'pharmacist', '2014-01-08 03:16:28', 'In_Active'),
(212, 8, 'doctor', '2014-01-08 03:19:13', 'In_Active'),
(213, 10, 'pharmacist', '2014-01-08 03:19:23', 'Active'),
(214, 10, 'pharmacist', '2014-01-08 05:40:36', 'In_Active'),
(215, 14, 'radiology', '2014-01-08 05:35:00', 'Active'),
(216, 7, 'nurse', '2014-01-08 05:42:57', 'In_Active'),
(217, 10, 'pharmacist', '2014-01-08 05:50:39', 'In_Active'),
(218, 2, 'reception', '2014-01-08 05:51:44', 'In_Active'),
(219, 8, 'doctor', '2014-01-08 05:52:03', 'Active'),
(220, 7, 'nurse', '2014-01-08 06:18:19', 'In_Active'),
(221, 2, 'reception', '2014-01-08 06:18:26', 'Active'),
(222, 10, 'pharmacist', '2014-01-08 08:05:20', 'Active'),
(223, 1, 'admin', '2014-01-08 09:33:33', 'Active'),
(224, 10, 'pharmacist', '2014-01-08 09:56:40', 'Active'),
(225, 10, 'pharmacist', '2014-01-08 09:57:21', 'Active'),
(226, 10, 'pharmacist', '2014-01-08 11:52:00', 'Active'),
(227, 10, 'pharmacist', '2014-01-09 01:31:30', 'Active'),
(228, 10, 'pharmacist', '2014-01-09 06:31:57', 'Active'),
(229, 10, 'pharmacist', '2014-01-09 08:16:08', 'Active'),
(230, 10, 'pharmacist', '2014-01-09 10:24:19', 'In_Active'),
(231, 7, 'nurse', '2014-01-09 10:48:03', 'In_Active'),
(232, 18, 'cashier', '2014-01-09 10:48:50', 'In_Active'),
(233, 18, 'cashier', '2014-01-09 10:49:00', 'Active'),
(234, 18, 'cashier', '2014-01-09 10:49:14', 'Active'),
(235, 18, 'cashier', '2014-01-09 10:49:58', 'Active'),
(236, 18, 'cashier', '2014-01-09 10:50:24', 'Active'),
(237, 18, 'cashier', '2014-01-09 12:40:20', 'In_Active'),
(238, 10, 'pharmacist', '2014-01-09 12:40:36', 'Active'),
(239, 10, 'pharmacist', '2014-01-09 13:10:55', 'Active'),
(240, 10, 'pharmacist', '2014-01-10 00:39:36', 'Active'),
(241, 10, 'pharmacist', '2014-01-10 01:21:16', 'Active'),
(242, 10, 'pharmacist', '2014-01-10 01:24:12', 'Active'),
(243, 10, 'pharmacist', '2014-01-10 02:12:08', 'In_Active'),
(244, 10, 'pharmacist', '2014-01-10 08:33:17', 'In_Active'),
(245, 10, 'pharmacist', '2014-01-10 08:09:30', 'Active'),
(246, 2, 'reception', '2014-01-10 09:46:46', 'In_Active'),
(247, 10, 'pharmacist', '2014-01-10 10:49:04', 'In_Active'),
(248, 10, 'pharmacist', '2014-01-10 10:49:26', 'Active'),
(249, 11, 'lab', '2014-01-10 12:31:35', 'Active'),
(250, 10, 'pharmacist', '2014-01-13 05:45:00', 'Active'),
(251, 10, 'pharmacist', '2014-01-13 10:49:43', 'Active'),
(252, 7, 'nurse', '2014-01-14 02:00:17', 'In_Active'),
(253, 11, 'lab', '2014-01-14 02:00:36', 'In_Active'),
(254, 11, 'lab', '2014-01-14 02:03:11', 'In_Active'),
(255, 11, 'lab', '2014-01-14 02:04:45', 'In_Active'),
(256, 10, 'pharmacist', '2014-01-14 02:04:54', 'Active'),
(257, 2, 'reception', '2014-01-14 05:25:05', 'In_Active'),
(258, 10, 'pharmacist', '2014-01-14 05:27:20', 'Active'),
(259, 2, 'reception', '2014-01-14 08:49:52', 'In_Active'),
(260, 18, 'cashier', '2014-01-14 08:51:24', 'In_Active'),
(261, 18, 'cashier', '2014-01-14 10:12:00', 'In_Active'),
(262, 7, 'nurse', '2014-01-14 10:23:02', 'In_Active'),
(263, 18, 'cashier', '2014-01-14 10:44:51', 'In_Active'),
(264, 18, 'cashier', '2014-01-14 11:04:58', 'In_Active'),
(265, 18, 'cashier', '2014-01-14 10:44:58', 'Active'),
(266, 18, 'cashier', '2014-01-14 11:04:41', 'Active'),
(267, 18, 'cashier', '2014-01-14 11:05:09', 'Active'),
(268, 18, 'cashier', '2014-01-14 12:35:20', 'Active'),
(269, 13, 'store', '2014-01-15 06:34:35', 'Active'),
(270, 13, 'store', '2014-01-15 08:04:03', 'Active'),
(271, 13, 'store', '2014-01-15 08:59:28', 'Active'),
(272, 13, 'store', '2014-01-15 13:26:37', 'In_Active'),
(273, 13, 'store', '2014-01-15 11:52:38', 'Active'),
(274, 10, 'pharmacist', '2014-01-15 13:26:56', 'Active'),
(275, 2, 'reception', '2014-01-16 07:11:11', 'In_Active'),
(276, 13, 'store', '2014-01-16 07:11:19', 'Active'),
(277, 2, 'reception', '2014-01-16 09:07:03', 'In_Active'),
(278, 13, 'store', '2014-01-16 12:21:13', 'In_Active'),
(279, 13, 'store', '2014-01-16 13:20:23', 'In_Active'),
(280, 18, 'cashier', '2014-01-16 12:21:31', 'Active'),
(281, 10, 'pharmacist', '2014-01-16 13:20:34', 'Active'),
(282, 18, 'cashier', '2014-01-17 05:30:09', 'Active'),
(283, 18, 'cashier', '2014-01-17 08:19:09', 'In_Active'),
(284, 2, 'reception', '2014-01-17 08:19:23', 'Active'),
(285, 2, 'reception', '2014-01-17 11:52:41', 'Active'),
(286, 2, 'reception', '2014-01-18 14:07:44', 'In_Active'),
(287, 13, 'store', '2014-01-18 14:07:53', 'Active'),
(288, 2, 'reception', '2014-01-19 14:33:31', 'Active'),
(289, 2, 'reception', '2014-01-19 14:50:19', 'Active'),
(290, 2, 'reception', '2014-01-19 14:54:19', 'Active'),
(291, 2, 'reception', '2014-01-20 05:37:22', 'In_Active'),
(292, 18, 'cashier', '2014-01-20 08:03:56', 'In_Active'),
(293, 8, 'doctor', '2014-01-20 09:07:44', 'In_Active'),
(294, 8, 'doctor', '2014-01-20 09:07:28', 'In_Active'),
(295, 10, 'pharmacist', '2014-01-20 09:07:39', 'Active'),
(296, 8, 'doctor', '2014-01-20 09:41:16', 'Active'),
(297, 8, 'doctor', '2014-01-20 10:23:42', 'In_Active'),
(298, 2, 'reception', '2014-01-20 10:56:19', 'In_Active'),
(299, 8, 'doctor', '2014-01-20 10:56:28', 'Active'),
(300, 8, 'doctor', '2014-01-21 01:40:59', 'In_Active'),
(301, 11, 'lab', '2014-01-21 02:26:31', 'In_Active'),
(302, 14, 'radiology', '2014-01-21 02:26:52', 'Active'),
(303, 8, 'doctor', '2014-01-21 07:06:32', 'In_Active'),
(304, 10, 'pharmacist', '2014-01-21 06:47:31', 'Active'),
(305, 10, 'pharmacist', '2014-01-21 09:08:24', 'In_Active'),
(306, 18, 'cashier', '2014-01-21 07:51:25', 'Active'),
(307, 2, 'reception', '2014-01-21 08:25:32', 'In_Active'),
(308, 14, 'radiology', '2014-01-21 09:05:38', 'In_Active'),
(309, 18, 'cashier', '2014-01-21 09:05:56', 'Active'),
(310, 18, 'cashier', '2014-01-21 09:08:35', 'Active'),
(311, 18, 'cashier', '2014-01-21 14:02:43', 'In_Active'),
(312, 18, 'cashier', '2014-01-30 12:57:40', 'In_Active'),
(313, 8, 'doctor', '2014-01-21 14:02:53', 'Active'),
(314, 18, 'cashier', '2014-01-22 07:22:00', 'Active'),
(315, 18, 'cashier', '2014-01-22 07:47:22', 'Active'),
(316, 2, 'reception', '2014-01-23 06:45:14', 'In_Active'),
(317, 7, 'nurse', '2014-01-23 06:46:42', 'In_Active'),
(318, 8, 'doctor', '2014-01-23 06:46:47', 'Active'),
(319, 8, 'doctor', '2014-01-23 07:00:57', 'Active'),
(320, 8, 'doctor', '2014-01-23 09:58:51', 'In_Active'),
(321, 7, 'nurse', '2014-01-23 09:59:11', 'In_Active'),
(322, 2, 'reception', '2014-01-23 10:08:54', 'In_Active'),
(323, 18, 'cashier', '2014-01-23 10:10:14', 'In_Active'),
(324, 2, 'reception', '2014-01-23 10:29:13', 'In_Active'),
(325, 7, 'nurse', '2014-01-23 10:29:49', 'In_Active'),
(326, 2, 'reception', '2014-01-23 10:30:35', 'In_Active'),
(327, 7, 'nurse', '2014-01-23 10:50:26', 'In_Active'),
(328, 8, 'doctor', '2014-01-23 10:50:42', 'In_Active'),
(329, 7, 'nurse', '2014-01-23 10:50:47', 'Active'),
(330, 8, 'doctor', '2014-01-23 11:56:23', 'In_Active'),
(331, 4, 'djfivjdfo', '2014-01-23 11:00:12', 'Active'),
(332, 2, 'reception', '2014-01-23 11:54:12', 'In_Active'),
(333, 7, 'nurse', '2014-01-23 11:54:30', 'In_Active'),
(334, 2, 'reception', '2014-01-23 11:55:06', 'In_Active'),
(335, 7, 'nurse', '2014-01-23 11:57:08', 'In_Active'),
(336, 2, 'reception', '2014-01-23 11:56:35', 'Active'),
(337, 8, 'doctor', '2014-01-23 11:58:30', 'In_Active'),
(338, 14, 'radiology', '2014-01-23 11:59:09', 'In_Active'),
(339, 11, 'lab', '2014-01-23 11:59:27', 'In_Active'),
(340, 8, 'doctor', '2014-01-23 12:00:12', 'In_Active'),
(341, 11, 'lab', '2014-01-23 12:00:59', 'In_Active'),
(342, 18, 'cashier', '2014-01-23 12:02:50', 'In_Active'),
(343, 8, 'doctor', '2014-01-23 12:03:57', 'In_Active'),
(344, 11, 'lab', '2014-01-23 12:04:03', 'Active'),
(345, 2, 'reception', '2014-01-24 07:06:06', 'In_Active'),
(346, 2, 'reception', '2014-01-24 07:08:10', 'In_Active'),
(347, 2, 'reception', '2014-01-24 07:47:23', 'In_Active'),
(348, 2, 'reception', '2014-01-24 07:08:22', 'Active'),
(349, 10, 'pharmacist', '2014-01-24 07:47:42', 'Active'),
(350, 2, 'reception', '2014-01-27 00:36:18', 'In_Active'),
(351, 10, 'pharmacist', '2014-01-27 00:36:25', 'Active'),
(352, 10, 'pharmacist', '2014-01-27 02:51:02', 'In_Active'),
(353, 18, 'cashier', '2014-01-27 11:10:30', 'In_Active'),
(354, 10, 'pharmacist', '2014-01-27 11:11:11', 'In_Active'),
(355, 18, 'cashier', '2014-01-27 11:11:38', 'In_Active'),
(356, 10, 'pharmacist', '2014-01-27 11:47:48', 'In_Active'),
(357, 2, 'reception', '2014-01-27 11:50:07', 'In_Active'),
(358, 10, 'pharmacist', '2014-01-27 12:19:21', 'In_Active'),
(359, 2, 'reception', '2014-01-27 12:22:31', 'In_Active'),
(360, 11, 'lab', '2014-01-27 12:22:37', 'Active'),
(361, 18, 'cashier', '2014-01-27 19:18:03', 'Active'),
(362, 11, 'lab', '2014-01-27 19:44:43', 'Active'),
(363, 18, 'cashier', '2014-01-28 07:45:58', 'In_Active'),
(364, 2, 'reception', '2014-01-28 02:57:10', 'In_Active'),
(365, 11, 'lab', '2014-01-28 03:11:16', 'In_Active'),
(366, 2, 'reception', '2014-01-28 03:11:41', 'In_Active'),
(367, 11, 'lab', '2014-01-28 03:11:47', 'Active'),
(368, 11, 'lab', '2014-01-28 05:39:00', 'In_Active'),
(369, 18, 'cashier', '2014-01-28 05:39:06', 'Active'),
(370, 2, 'reception', '2014-01-28 07:41:47', 'In_Active'),
(371, 14, 'radiology', '2014-01-28 08:35:09', 'In_Active'),
(372, 18, 'cashier', '2014-01-28 09:42:26', 'In_Active'),
(373, 18, 'cashier', '2014-01-28 10:05:11', 'In_Active'),
(374, 2, 'reception', '2014-01-28 10:11:51', 'In_Active'),
(375, 2, 'reception', '2014-01-28 10:08:06', 'In_Active'),
(376, 7, 'nurse', '2014-01-28 10:08:13', 'Active'),
(377, 1, 'admin', '2014-01-28 10:57:32', 'In_Active'),
(378, 7, 'nurse', '2014-01-28 10:57:41', 'Active'),
(379, 7, 'nurse', '2014-01-28 13:11:00', 'Active'),
(380, 7, 'nurse', '2014-01-28 13:48:34', 'Active'),
(381, 2, 'reception', '2014-01-29 05:19:18', 'In_Active'),
(382, 7, 'nurse', '2014-01-29 05:19:28', 'Active'),
(383, 7, 'nurse', '2014-01-29 05:36:50', 'In_Active'),
(384, 2, 'reception', '2014-01-29 06:11:35', 'In_Active'),
(385, 2, 'reception', '2014-01-29 06:45:13', 'In_Active'),
(386, 2, 'reception', '2014-01-29 07:09:35', 'In_Active'),
(387, 8, 'doctor', '2014-01-29 06:45:23', 'Active'),
(388, 7, 'nurse', '2014-01-29 07:54:57', 'In_Active'),
(389, 11, 'lab', '2014-01-29 11:58:02', 'In_Active'),
(390, 18, 'cashier', '2014-01-29 11:35:09', 'In_Active'),
(391, 18, 'cashier', '2014-01-29 11:59:01', 'In_Active'),
(392, 8, 'doctor', '2014-01-29 18:06:34', 'In_Active'),
(393, 8, 'doctor', '2014-01-29 12:20:53', 'In_Active'),
(394, 14, 'radiology', '2014-01-29 12:59:07', 'In_Active'),
(395, 18, 'cashier', '2014-01-29 13:00:14', 'In_Active'),
(396, 14, 'radiology', '2014-01-29 13:00:31', 'Active'),
(397, 14, 'radiology', '2014-01-29 15:53:09', 'In_Active'),
(398, 8, 'doctor', '2014-01-29 16:14:13', 'Active'),
(399, 2, 'reception', '2014-01-29 18:06:48', 'Active'),
(400, 10, 'pharmacist', '2014-01-29 20:36:17', 'Active'),
(401, 10, 'pharmacist', '2014-01-30 09:41:58', 'In_Active'),
(402, 10, 'pharmacist', '2014-01-30 06:40:08', 'Active'),
(403, 13, 'store', '2014-01-30 09:42:40', 'In_Active'),
(404, 10, 'pharmacist', '2014-01-30 09:42:49', 'Active'),
(405, 10, 'pharmacist', '2014-01-30 11:00:23', 'In_Active'),
(406, 13, 'store', '2014-01-30 11:00:30', 'Active'),
(407, 2, 'reception', '2014-01-30 12:55:28', 'In_Active'),
(408, 7, 'nurse', '2014-01-30 12:57:46', 'In_Active'),
(409, 2, 'reception', '2014-01-30 12:58:00', 'Active');

--
-- Triggers `login_logs`
--
DROP TRIGGER IF EXISTS `after_login_logs_insert`;
DELIMITER //
CREATE TRIGGER `after_login_logs_insert` AFTER INSERT ON `login_logs`
 FOR EACH ROW INSERT INTO trigger_login_logs_update (login_logs_id, employee_id,login_date,is_active,changetype,user_name)  
        VALUES (NEW.login_logs_id,NEW.employee_id,NEW.login_date,NEW.is_active,'INSERT',NEW.user_name)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_login_logs_update`;
DELIMITER //
CREATE TRIGGER `after_login_logs_update` AFTER UPDATE ON `login_logs`
 FOR EACH ROW INSERT INTO trigger_login_logs_update (login_logs_id, employee_id,login_date,is_active,changetype,user_name)  
        VALUES (NEW.login_logs_id,NEW.employee_id,NEW.login_date,NEW.is_active,'AFTER_UPDATE',NEW.user_name)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` enum('Yes','No') NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `member_name`, `category`, `address`, `phone_no`, `email`, `is_active`, `location`, `description`, `date_added`) VALUES
(10, 'Shwari Githurai', 'Health Centre', 'Githurai 44', 710123456, 'shwari_githurai@shwarihealthcare.org', 'Yes', 'Githurai', 'Located in Githurai', '0000-00-00 00:00:00'),
(11, 'Shwari Upperhill', 'Health Centre', '59857', 710123456, 'shwari_githurai@shwarihealthcare.org', 'No', 'Githurai', 'Located in Upper hill', '2013-12-06 09:19:17'),
(12, 'Shwari Siaya', 'Health Centre', '13 Siaya', 2147483647, 'shwari_siaya@shwarihealthcare.org', 'No', 'Siaya', 'Located in Siaya', '2013-12-03 13:24:56');

--
-- Triggers `member`
--
DROP TRIGGER IF EXISTS `after_insert_member`;
DELIMITER //
CREATE TRIGGER `after_insert_member` AFTER INSERT ON `member`
 FOR EACH ROW INSERT INTO trigger_member_update (member_id, member_name, category,address,phone_no,email,is_active,location,description,date_added,changetype)  
        VALUES (NEW.member_id,NEW.member_name,NEW.category,NEW.address,NEW.phone_no,NEW.email,NEW.is_active,NEW.location,NEW.description,NEW.date_added,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_member`;
DELIMITER //
CREATE TRIGGER `after_update_member` AFTER UPDATE ON `member`
 FOR EACH ROW INSERT INTO trigger_member_update (member_id, member_name, category,address,phone_no,email,is_active,location,description,date_added,changetype)  
        VALUES (NEW.member_id,NEW.member_name,NEW.category,NEW.address,NEW.phone_no,NEW.email,NEW.is_active,NEW.location,NEW.description,NEW.date_added,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_member`;
DELIMITER //
CREATE TRIGGER `before_update_member` BEFORE UPDATE ON `member`
 FOR EACH ROW INSERT INTO trigger_member_update (member_id, member_name, category,address,phone_no,email,is_active,location,description,date_added,changetype)  
        VALUES (OLD.member_id,OLD.member_name,OLD.category,OLD.address,OLD.phone_no,OLD.email,OLD.is_active,OLD.location,OLD.description,OLD.date_added,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `member_branch`
--

CREATE TABLE `member_branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `member_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` enum('Yes','No') NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `member_branch`
--

INSERT INTO `member_branch` (`branch_id`, `branch_name`, `category`, `address`, `location`, `email`, `description`, `member_id`, `date_added`, `is_active`, `phone_no`) VALUES
(1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Kilimani deals with health ', 10, '2013-12-23 08:00:41', '', '710123456');

--
-- Triggers `member_branch`
--
DROP TRIGGER IF EXISTS `after_insert_member_branch`;
DELIMITER //
CREATE TRIGGER `after_insert_member_branch` AFTER INSERT ON `member_branch`
 FOR EACH ROW INSERT INTO trigger_member_branch_update (branch_id, branch_name, category,address,location,email,description,member_id,date_added,changetype,phone_no,is_active)  
        VALUES (NEW.branch_id,NEW.branch_name,NEW.category,NEW.address,NEW.location,NEW.email,NEW.description,NEW.member_id,NEW.date_added,'INSERT',NEW.phone_no,NEW.is_active)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_member_branch`;
DELIMITER //
CREATE TRIGGER `after_update_member_branch` AFTER UPDATE ON `member_branch`
 FOR EACH ROW INSERT INTO trigger_member_branch_update (branch_id, branch_name, category,address,location,email,description,member_id,date_added,changetype,phone_no,is_active)  
        VALUES (NEW.branch_id,NEW.branch_name,NEW.category,NEW.address,NEW.location,NEW.email,NEW.description,NEW.member_id,NEW.date_added,'AFTER_UPDATE',NEW.phone_no,NEW.is_active)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_member_branch`;
DELIMITER //
CREATE TRIGGER `before_update_member_branch` BEFORE UPDATE ON `member_branch`
 FOR EACH ROW INSERT INTO trigger_member_branch_update (branch_id, branch_name, category,address,location,email,description,member_id,date_added,changetype,phone_no,is_active)  
        VALUES (OLD.branch_id,OLD.branch_name,OLD.category,OLD.address,OLD.location,OLD.email,OLD.description,OLD.member_id,OLD.date_added,'BEFORE_UPDATE',OLD.phone_no,OLD.is_active)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) NOT NULL,
  `cost` decimal(13,4) NOT NULL,
  `package_details` varchar(255) NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`package_id`, `package_name`, `cost`, `package_details`) VALUES
(1, 'Ante-Natal', 300.0000, 'Ante-Natal');

--
-- Triggers `packages`
--
DROP TRIGGER IF EXISTS `after_insert_package`;
DELIMITER //
CREATE TRIGGER `after_insert_package` AFTER INSERT ON `packages`
 FOR EACH ROW INSERT INTO trigger_package_update (package_id, package_name, cost,package_details,changetype)  
        VALUES (NEW.package_id,NEW.package_name,NEW.cost,NEW.package_details,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_package`;
DELIMITER //
CREATE TRIGGER `after_update_package` AFTER UPDATE ON `packages`
 FOR EACH ROW INSERT INTO trigger_package_update (package_id, package_name, cost,package_details,changetype)  
        VALUES (NEW.package_id,NEW.package_name,NEW.cost,NEW.package_details,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_package`;
DELIMITER //
CREATE TRIGGER `before_update_package` BEFORE UPDATE ON `packages`
 FOR EACH ROW INSERT INTO trigger_package_update (package_id, package_name, cost,package_details,changetype)  
        VALUES (OLD.package_id,OLD.package_name,OLD.cost,OLD.package_details,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `other_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `marital_status` enum('Single','Married','Divorced') NOT NULL,
  `phone_no` int(24) NOT NULL,
  `identification_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `residence` varchar(255) NOT NULL,
  `employment_status` enum('Yes','No') NOT NULL,
  `employer` varchar(255) NOT NULL,
  `next_of_kin_fname` varchar(255) NOT NULL,
  `next_of_kin_lname` varchar(255) NOT NULL,
  `next_of_kin_relation` varchar(255) NOT NULL,
  `next_of_kin_phone` varchar(255) NOT NULL,
  `is_shwari_member` enum('Yes','No') NOT NULL,
  `shwari_member_relation` varchar(255) NOT NULL,
  `family_base_number` varchar(255) NOT NULL,
  `family_number` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('Active','In Active') NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `f_name`, `s_name`, `other_name`, `dob`, `gender`, `marital_status`, `phone_no`, `identification_number`, `email`, `residence`, `employment_status`, `employer`, `next_of_kin_fname`, `next_of_kin_lname`, `next_of_kin_relation`, `next_of_kin_phone`, `is_shwari_member`, `shwari_member_relation`, `family_base_number`, `family_number`, `date_added`, `status`) VALUES
(2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'Male', 'Single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', 'Yes', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_1000001', 'SHWARI_1000001_001', '2013-12-17 10:25:21', 'Active'),
(3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'Male', 'Single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', 'Yes', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_1000002', 'SHWARI_1000002_002', '2013-12-17 10:25:21', 'Active'),
(4, 'Dindi', 'Dindi', 'Dindi', '2013-12-15', 'Male', 'Single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', '', 'Seld', '0714339521', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_003', '2013-12-17 10:25:21', 'Active'),
(5, 'Dindi', 'Dindi', 'dINDI', '1990-12-08', 'Female', 'Single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_004', '2014-01-23 10:31:43', 'Active'),
(6, 'D', 'Dindi', 'H', '2013-12-16', 'Female', 'Single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'q', 'w', 'e', '123456789', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_005', '2013-12-17 10:25:21', 'Active'),
(7, 'Queen', 'D', 'W', '2013-12-15', 'Male', 'Single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_1000001', 'SHWARI_1000001_012', '2013-12-17 10:25:21', 'Active'),
(8, '123', '123', '123', '2013-12-09', 'Male', 'Single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_1000001', 'SHWARI_1000001_013', '2013-12-17 10:25:21', 'Active'),
(9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'Male', 'Single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_1000001', 'SHWARI_1000001_000', '2013-12-17 10:25:21', 'Active'),
(10, 'Edward', 'Bono', 'De', '2013-12-01', 'Male', 'Single', 713123456, '12345678', 'edwarddebono@gmail.com', '', '', '', 'Edward', 'De', 'Self', '0718123456', 'Yes', '', '1', 'SHWARI_1000001_000', '2014-01-29 06:08:33', 'Active'),
(11, 'Buffet', 'Edward', 'Branson', '2013-12-01', 'Male', 'Married', 718123456, '12345678', 'buffet@gmail.com', '', '', '', 'dnfuvindfui', 'dfinvudfi', 'Self', '48955489234', 'Yes', '', '3', 'SHWARI_1000001_000', '2014-01-29 06:08:37', 'Active'),
(12, 'dfgnuidn', 'fdngivend', 'ufdnbiurn', '2013-12-01', 'Male', 'Married', 7654231, '54312566', 'ndfgiuvnd@fvngiu.eurn', '', '', '', 'jfnbundfu', 'nuvnduing', 'self', '68954095', 'Yes', '', '3', 'SHWARI_1000001_000', '2014-01-29 06:08:40', 'Active'),
(13, 'fbdsuyvbfduy', 'dbyuvbsuydfb', 'dfhbgvyfudb', '2013-12-01', 'Male', 'Married', 719123456, '57844394', 'nsifnbei@fdf.com', '', '', '', 'fnisfni', 'nsfviuenviu', 'fniuen', '0802324', 'Yes', '', '3', 'SHWARI_1000001_000', '2014-01-29 06:09:00', 'Active'),
(14, 'nhgfrde', 'hbgdvcs', 'thrgfrew', '2013-12-01', 'Male', 'Married', 87654321, '12345678', 'hytgrf@hytgrf.grf', '', '', '', 'ybhtgvfd', 'bhtvgrfcd', 'yhgf', '876543', 'Yes', '', '3', 'SHWARI_1000001_000', '2014-01-29 06:08:43', 'Active'),
(15, 'htgfd', 'htgrfed', 'htgrfed', '2013-12-01', 'Male', 'Divorced', 0, '12345678', 'htgf@hgfd.gfd', '', '', '', 'htbgvcfd', 'vcfds', 'gfdfe', '6534254', 'Yes', '', '3', 'SHWARI_1000001_000', '2014-01-29 06:08:46', 'Active'),
(16, 'Harris', 'Dindi', 'Samuel', '2013-12-08', 'Male', 'Single', 712345678, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Harris', 'Dindi', 'Self', '0714123456', 'Yes', '', '1000003', 'SHWARI_1000001_000', '2014-01-29 06:08:53', 'Active'),
(17, 'dindi', 'dindi', 'dindi', '2013-12-17', 'Male', 'Single', 123456789, '12345678', 'hads@dfsds.cda', '', '', '', 'dfsfdw', 'fder', 'dfsd', '123456789', 'Yes', '', 'SHWARI_1000003_000', 'SHWARI_1000001_000', '2014-01-29 06:08:55', 'Active'),
(18, 'fdubvuifbd', 'djvknuidf', 'dufibviuefbd', '2013-12-17', 'Male', 'Married', 76534243, '12345678', 'nfdiug@jdknfv.ndfnbuiv', '', '', '', 'gfjveouigh', 'vfdnugneou', 'fdiubguei', '458385497934', 'Yes', '', 'SHWARI_100000', 'SHWARI_1000004_000', '2013-12-17 10:43:57', 'Active'),
(19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'Male', 'Married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000005', 'SHWARI_1000004_000', '2013-12-17 10:46:22', 'Active'),
(20, 'Harris', 'Dindi', 'Samuel', '2013-12-17', 'Male', 'Divorced', 713222456, '12345678', 'harrisdindi.samuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_1000006', 'SHWARI_1000006_000', '2013-12-17 10:56:55', 'Active'),
(21, 'Harris ', 'Dindi', 'Junior', '2013-12-01', 'Male', 'Single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Harris Senior', 'Father', '0712345678', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_1', '2013-12-17 11:08:33', 'Active'),
(22, 'Dindi', 'Dindi', 'Dindi', '2013-12-17', 'Male', 'Married', 123456789, '1234567', 'nvjfndv@ndfgnvd.com', '', '', '', 'ndguivnfud', 'gdnbiurndgiv', 'gdnvuit', '58394234820', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_2', '2013-12-17 18:07:33', 'Active'),
(23, 'niun', 'nviudfn', 'ni', '2013-12-17', 'Male', 'Married', 714123456, '12345678', 'ndv@vdj.dvnd', '', '', '', 'bvd', 'no', 'noin', '988908', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_3', '2013-12-17 18:17:02', 'Active'),
(24, 'fdnviufnd', 'dnxvuid', 'cfonsviucfds', '2013-12-23', 'Male', 'Married', 1234567899, '12345678', 'dnguif@fnf.com', '', '', '', 'nfsuinvc', 'cnsfviudfn', 'dfniuvdfn', '1234567890', 'Yes', '', 'SHWARI1000007', 'SHWARI_1000007_0', '2013-12-23 08:14:12', 'Active'),
(25, 'Wamae', 'Sam', 'Wamae', '2013-12-23', 'Male', 'Married', 712345678, '12345678', 'swamae@healthstrat.co.ke', '', '', '', 'Wamae', 'Wamae', 'Self', '071234567890', 'Yes', '', 'SHWARI1000007', 'SHWARI_1000007_0', '2013-12-23 08:15:23', 'Active'),
(26, 'Marani', 'Lyndon', 'Doctor', '1994-01-31', 'Male', 'Married', 711123123, '1234567', 'lmarani@healthstrat.co.ke', '', '', '', 'L', 'Marani', 'Self', '0712123123', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_4', '2014-01-06 06:15:29', 'Active'),
(27, 'ndfuivndfiu', 'jnviufdn', 'ifdunviudf', '2014-01-06', 'Male', 'Married', 2147483647, '12334656', 'bngiovfd@ifdniof.fdno', '', '', '', 'jngdbiuvngfdiu', 'nfuvfnu', 'Father', '6765432314', 'Yes', '', 'SHWARI_1000007', 'SHWARI_1000007_0', '2014-01-06 11:16:20', 'Active'),
(28, 'ctrc', 'jbhu', 'xdxe', '2004-01-01', 'Male', 'Single', 71339521, '12345678', 'byubv@gvg.vty', '', '', '', 'vtyuvybu', 'buyby', 'cytvyt', '080887676', 'Yes', '', 'SHWARI_1000007', 'SHWARI_1000007_1', '2014-01-06 11:26:28', 'Active'),
(29, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000008', 'SHWARI_1000008_0', '2014-01-14 06:56:20', 'Active'),
(30, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000008', 'SHWARI_1000008_0', '2014-01-14 06:56:20', 'Active'),
(31, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000009', 'SHWARI_1000009_0', '2014-01-14 06:56:20', 'Active'),
(32, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000009', 'SHWARI_1000009_0', '2014-01-14 06:56:21', 'Active'),
(33, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000010', 'SHWARI_1000010_0', '2014-01-14 06:56:21', 'Active'),
(34, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000010', 'SHWARI_1000010_0', '2014-01-14 06:56:21', 'Active'),
(35, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000011', 'SHWARI_1000011_0', '2014-01-14 06:56:21', 'Active'),
(36, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000011', 'SHWARI_1000011_0', '2014-01-14 06:56:21', 'Active'),
(37, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000012', 'SHWARI_1000012_0', '2014-01-14 06:56:21', 'Active'),
(38, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000012', 'SHWARI_1000012_0', '2014-01-14 06:56:21', 'Active'),
(39, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000013', 'SHWARI_1000013_0', '2014-01-14 06:56:21', 'Active'),
(40, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000014', 'SHWARI_1000014_0', '2014-01-14 06:56:21', 'Active'),
(41, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000015', 'SHWARI_1000015_0', '2014-01-14 06:56:22', 'Active'),
(42, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000015', 'SHWARI_1000015_0', '2014-01-14 06:56:22', 'Active'),
(43, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000015', 'SHWARI_1000015_0', '2014-01-14 06:56:22', 'Active'),
(44, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000015', 'SHWARI_1000015_0', '2014-01-14 06:56:22', 'Active'),
(45, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000016', 'SHWARI_1000016_0', '2014-01-14 06:56:22', 'Active'),
(46, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000017', 'SHWARI_1000017_0', '2014-01-14 06:56:22', 'Active'),
(47, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000018', 'SHWARI_1000018_0', '2014-01-14 06:56:22', 'Active'),
(48, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000018', 'SHWARI_1000018_0', '2014-01-14 06:56:22', 'Active'),
(49, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000019', 'SHWARI_1000019_0', '2014-01-14 06:56:22', 'Active'),
(50, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000019', 'SHWARI_1000019_0', '2014-01-14 06:56:22', 'Active'),
(51, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000019', 'SHWARI_1000019_0', '2014-01-14 06:56:22', 'Active'),
(52, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000020', 'SHWARI_1000020_0', '2014-01-14 06:56:22', 'Active'),
(53, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000021', 'SHWARI_1000021_0', '2014-01-14 06:56:23', 'Active'),
(54, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'Male', 'Single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000021', 'SHWARI_1000021_0', '2014-01-14 06:56:23', 'Active'),
(55, 'qwersd', 'nvfidni', 'asde', '2014-01-01', 'Male', 'Single', 714339125, '12345678', 'fdgvdfg@hsdk.com', '', '', '', 'asdwe', 'dfuuid', 'Father', '4584068557', 'Yes', '', 'SHWARI_1000022', 'SHWARI_1000022_0', '2014-01-14 07:02:41', 'Active'),
(56, 'dindi', 'dindi', 'dindi', '2014-01-19', 'Male', 'Single', 714339521, '12345678', 'harrisdindisamel@gmail.com', '', '', '', 'dindi', 'dindi', 'parent', '0714339521', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_5', '2014-01-19 14:57:21', 'Active'),
(57, 'dindi', 'dindi', 'dindi', '2014-01-19', 'Male', 'Single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'dindi', 'father', '0714339521', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_6', '2014-01-19 15:00:45', 'Active'),
(58, 'dindi', 'dindi', 'dindi', '2014-01-19', 'Male', 'Single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'dindi', 'self', '0714339521', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_7', '2014-01-19 15:03:09', 'Active'),
(59, 'dindi', 'dindi', 'dindi', '2014-01-19', 'Male', 'Single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'dindi', 'self', '0714339521', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_8', '2014-01-19 15:03:25', 'Active'),
(60, 'dindi', 'dindi', 'dindi', '2014-01-19', 'Male', 'Single', 123456789, '12345678', 'didndi@dfnognfod.sufsud', '', '', '', 'jkfiui', 'fiurbiu', 'bigb', '65454323', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_9', '2014-01-19 15:08:24', 'Active'),
(61, 'dindi', 'dindi', 'dindi', '2014-01-19', 'Male', 'Single', 123456789, '12345678', 'didndi@dfnognfod.sufsud', '', '', '', 'jkfiui', 'fiurbiu', 'bigb', '65454323', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_10', '2014-01-19 15:08:59', 'Active'),
(62, 'ufbdbfudbu', 'dubud', 'fdubgudb', '2014-01-19', 'Male', 'Single', 86457594, '12345678', 'dfgf@df.fdd', '', '', '', 'bvybv', 'bubu', 'hbu', '56453423', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_10', '2014-01-19 15:12:36', 'Active'),
(63, 'uidfnvui', 'fnviudnfi', 'ndfvuidnf', '2014-01-19', 'Male', 'Single', 712345678, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'nvidxfnvcu', 'nxfvuid', 'nxvuidn', '756432112324356', 'Yes', '', 'SHWARI_1000006', 'SHWARI_1000006_1', '2014-01-19 19:20:19', 'Active'),
(64, 'dindi', 'dindi', 'dindi', '2014-01-20', 'Male', 'Single', 714123456, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'dindi', 'self', '0712345678', 'Yes', '', 'SHWARI_1000006', 'SHWARI_1000006_2', '2014-01-20 05:35:01', 'Active'),
(65, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'Male', 'Single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Father', '0721123112', 'Yes', '', ' SHWARI_1000001', ' SHWARI_100000_1', '2014-01-29 05:39:07', 'Active'),
(66, 'dbvibd', 'vbdvdf', 'dfbvibdi', '2014-01-29', 'Male', 'Married', 2147483647, '75968534', 'bvbfdfx@fdnubf.dfibu', '', '', '', 'djnxbijvbdfiub', 'dbviubfdiu', 'vbduixgbviudfs', '7596844302', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_10', '2014-01-29 05:41:13', 'Active'),
(67, 'DNBVOUINGOUIQ', 'bnfgoidfncNFIDNBU', 'NVOFGBN', '2014-01-29', 'Male', 'Single', 8675432, '78609340', 'GNBUGF@NDOIGNV.DNVIO', '', '', '', 'DNGBIUNVDOFU', 'NDOIBNOVIU', 'NDJOGNBVOID', '86754321', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_10', '2014-01-29 05:42:36', 'Active'),
(68, 'nofgdnbviogfn', 'ghbnviofdn', 'dfnvoifn', '2014-01-29', 'Male', 'Single', 98756432, '78654321', 'nhbgfd@gddf.dfs', '', '', '', 'ngoingvofidn', 'nfdounbvoiufsnbd', 'vdfobnoviubdfn', '067568453420', 'Yes', '', 'SHWARI_1000002', 'SHWARI_1000002_10', '2014-01-29 05:48:04', 'Active'),
(69, 'dfsbviudb', 'vbdbfy', 'bfsviubdfi', '2014-01-29', 'Male', 'Single', 2147483647, '84579436', 'dnbivddfiu@fubvuif.dfiguvbfdi', '', '', '', 'jdnbivndifu', 'dnibviubdfi', 'ndiugbviufdb', '5865838042', 'Yes', '', 'SHWARI_1000001', 'SHWARI_1000001_14', '2014-01-29 06:15:40', 'Active'),
(70, 'difbnvibdfiu', 'bnfgiu biu', 'dfibviubfdi', '2014-01-29', 'Male', 'Single', 2147483647, '76549320', 'ndibvnidu@fdv.nvnd', '', '', '', 'gbniuvdfb', 'bduivbfiud', 'Father', '6875034318', 'Yes', '', 'SHWARI_1000023', 'SHWARI_1000023_0', '2014-01-29 06:19:27', 'Active');

--
-- Triggers `patient`
--
DROP TRIGGER IF EXISTS `after_insert_patient`;
DELIMITER //
CREATE TRIGGER `after_insert_patient` AFTER INSERT ON `patient`
 FOR EACH ROW INSERT INTO trigger_patient_update (patient_id, f_name, s_name,other_name,dob,gender,marital_status,phone_no,email,residence,employment_status,employer,next_of_kin_fname,next_of_kin_lname,next_of_kin_relation,next_of_kin_phone,is_shwari_member,shwari_member_relation,family_number,identification_number,changetype,status)  
        VALUES (NEW.patient_id,NEW.f_name,NEW.s_name,NEW.other_name,NEW.dob,NEW.gender,NEW.marital_status,NEW.phone_no,NEW.email,NEW.residence,NEW.employment_status,NEW.employer,NEW.next_of_kin_fname,NEW.next_of_kin_lname,NEW.next_of_kin_relation,NEW.next_of_kin_phone,NEW.is_shwari_member,shwari_member_relation,NEW.family_number,NEW.identification_number,'INSERT',NEW.status)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_patient`;
DELIMITER //
CREATE TRIGGER `after_update_patient` AFTER UPDATE ON `patient`
 FOR EACH ROW INSERT INTO trigger_patient_update (patient_id, f_name, s_name,other_name,dob,gender,marital_status,phone_no,email,residence,employment_status,employer,next_of_kin_fname,next_of_kin_lname,next_of_kin_relation,next_of_kin_phone,is_shwari_member,shwari_member_relation,family_number,identification_number,changetype,status)  
        VALUES (NEW.patient_id,NEW.f_name,NEW.s_name,NEW.other_name,NEW.dob,NEW.gender,NEW.marital_status,NEW.phone_no,NEW.email,NEW.residence,NEW.employment_status,NEW.employer,NEW.next_of_kin_fname,NEW.next_of_kin_lname,NEW.next_of_kin_relation,NEW.next_of_kin_phone,NEW.is_shwari_member,NEW.shwari_member_relation,NEW.family_number,NEW.identification_number,'AFTER_UPDATE',NEW.status)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_patient`;
DELIMITER //
CREATE TRIGGER `before_update_patient` BEFORE UPDATE ON `patient`
 FOR EACH ROW INSERT INTO trigger_patient_update (patient_id, f_name, s_name,other_name,dob,gender,marital_status,phone_no,email,residence,employment_status,employer,next_of_kin_fname,next_of_kin_lname,next_of_kin_relation,next_of_kin_phone,is_shwari_member,shwari_member_relation,family_number,identification_number,changetype,status)  
        VALUES (OLD.patient_id,OLD.f_name,OLD.s_name,OLD.other_name,OLD.dob,OLD.gender,OLD.marital_status,OLD.phone_no,OLD.email,OLD.residence,OLD.employment_status,OLD.employer,OLD.next_of_kin_fname,OLD.next_of_kin_lname,OLD.next_of_kin_relation,OLD.next_of_kin_phone,OLD.is_shwari_member,OLD.shwari_member_relation,OLD.family_number,OLD.identification_number,'BEFORE_UPDATE',OLD.status)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_payments`
--

CREATE TABLE `patient_payments` (
  `patient_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `cost` decimal(13,4) NOT NULL,
  `pharm_payments` decimal(13,4) NOT NULL,
  `lab_payments` decimal(13,4) NOT NULL,
  `date` date NOT NULL,
  `mpesa_code` varchar(255) NOT NULL,
  `patient_type` varchar(255) NOT NULL,
  `paid` enum('not paid','paid') NOT NULL,
  `rad_payments` decimal(13,4) NOT NULL,
  `lab_payment` enum('not paid','paid') NOT NULL,
  `rad_payment` enum('not paid','paid') NOT NULL,
  `pharm_payment` enum('not paid','paid') NOT NULL,
  `cost_cr` decimal(13,2) NOT NULL,
  `pharm_payments_cr` decimal(13,2) NOT NULL,
  `lab_payments_cr` decimal(13,2) NOT NULL,
  `rad_payments_cr` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_payments_dr` decimal(13,2) NOT NULL,
  `total_payments_cr` decimal(13,2) NOT NULL,
  `payment_code` varchar(255) NOT NULL,
  `payment_method` enum('mpesa','airtel money','orange money','cash','yu cash') NOT NULL,
  PRIMARY KEY (`patient_payment_id`),
  KEY `visit_id` (`visit_id`),
  KEY `patient_id` (`patient_id`),
  KEY `package_id` (`package_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `patient_payments`
--

INSERT INTO `patient_payments` (`patient_payment_id`, `visit_id`, `patient_id`, `package_id`, `cost`, `pharm_payments`, `lab_payments`, `date`, `mpesa_code`, `patient_type`, `paid`, `rad_payments`, `lab_payment`, `rad_payment`, `pharm_payment`, `cost_cr`, `pharm_payments_cr`, `lab_payments_cr`, `rad_payments_cr`, `date_added`, `total_payments_dr`, `total_payments_cr`, `payment_code`, `payment_method`) VALUES
(2, 10, 21, 1, 100.0000, 0.0000, 0.0000, '2014-01-20', '', '', 'not paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 100.00, 0.00, 0.00, '2014-01-22 07:41:44', 0.00, 0.00, '', 'mpesa'),
(3, 12, 23, 1, 100.0000, 120.0000, 1100.0000, '2013-12-18', '', 'normal', 'not paid', 1250.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '2014-01-21 14:03:10', 0.00, 0.00, '', 'mpesa'),
(7, 16, 2, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '', 'mpesa'),
(8, 14, 2, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'paid', 750.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '', 'mpesa'),
(9, 18, 2, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'paid', 0.0000, 'not paid', 'paid', 'paid', 0.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '', 'mpesa'),
(10, 19, 2, 1, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '', 'paid', 12000.0000, 'not paid', 'paid', 'paid', 0.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '', 'mpesa'),
(11, 20, 6, 1, 300.0000, 230.0000, 0.0000, '0000-00-00', '', '', 'paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '', 'mpesa'),
(12, 21, 3, 1, 300.0000, 0.0230, 0.0000, '0000-00-00', '', '', 'paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '', 'mpesa'),
(13, 22, 8, 1, 300.0000, 450.0000, 0.0000, '0000-00-00', '', '', 'paid', 0.0000, 'not paid', 'not paid', 'paid', 0.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '', 'mpesa'),
(14, 23, 3, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'paid', 0.0000, 'paid', 'paid', 'paid', 0.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '', 'mpesa'),
(15, 24, 2, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'paid', 0.0000, 'paid', 'paid', 'paid', 0.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '', 'mpesa'),
(16, 25, 25, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'paid', 0.0000, 'paid', 'paid', 'paid', 0.00, 0.00, 0.00, 0.00, '2014-01-20 10:51:45', 0.00, 0.00, '', 'mpesa'),
(17, 26, 11, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'not paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '2014-01-20 10:53:56', 0.00, 0.00, '', 'mpesa'),
(18, 27, 7, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'not paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '2014-01-21 08:12:25', 0.00, 0.00, '', 'mpesa'),
(19, 28, 10, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'paid', 0.0000, 'paid', 'paid', 'paid', 300.00, 0.00, 0.00, 0.00, '2014-01-22 13:58:39', 1000.00, 0.00, '', 'mpesa'),
(20, 29, 7, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'not paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '2014-01-23 06:45:09', 300.00, 0.00, '', 'mpesa'),
(21, 30, 5, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'not paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '2014-01-23 10:30:27', 300.00, 0.00, '', 'mpesa'),
(22, 31, 19, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'not paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '2014-01-23 11:55:01', 300.00, 0.00, '', 'mpesa'),
(23, 32, 5, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'not paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '2014-01-24 06:58:40', 300.00, 0.00, '', 'mpesa'),
(24, 33, 3, 1, 300.0000, 1225.0000, 1200.0000, '0000-00-00', '', '', 'paid', 6850.0000, 'paid', 'paid', 'paid', 300.00, 600.00, 1200.00, 6000.00, '2014-01-30 06:39:27', 4550.00, 0.00, '', ''),
(25, 34, 3, 1, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '', 'not paid', 0.0000, 'not paid', 'not paid', 'not paid', 0.00, 0.00, 0.00, 0.00, '2014-01-30 12:54:18', 300.00, 0.00, '', 'mpesa');

--
-- Triggers `patient_payments`
--
DROP TRIGGER IF EXISTS `after_insert_patient_payments`;
DELIMITER //
CREATE TRIGGER `after_insert_patient_payments` AFTER INSERT ON `patient_payments`
 FOR EACH ROW INSERT INTO trigger_patient_payments_update (patient_payments_id,visit_id,patient_id, cost, pharm_payments,lab_payments,date,mpesa_code,changetype,total_payments_cr,total_payments_dr)  
        VALUES (NEW.patient_payment_id,NEW.visit_id,NEW.patient_id,NEW.cost,NEW.pharm_payments,NEW.lab_payments,NEW.date,NEW.mpesa_code,'INSERT',NEW.total_payments_cr,NEW.total_payments_dr)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_patient_payments`;
DELIMITER //
CREATE TRIGGER `after_update_patient_payments` AFTER UPDATE ON `patient_payments`
 FOR EACH ROW INSERT INTO trigger_patient_payments_update (patient_payments_id,visit_id,patient_id, cost, pharm_payments,lab_payments,date,mpesa_code,changetype,total_payments_cr,total_payments_dr)  
        VALUES (NEW.patient_payment_id,NEW.visit_id,NEW.patient_id,NEW.cost,NEW.pharm_payments,NEW.lab_payments,NEW.date,NEW.mpesa_code,'INSERT',NEW.total_payments_cr,NEW.total_payments_dr)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_patient_payments`;
DELIMITER //
CREATE TRIGGER `before_update_patient_payments` BEFORE UPDATE ON `patient_payments`
 FOR EACH ROW INSERT INTO trigger_patient_payments_update (patient_payments_id,visit_id,patient_id, cost, pharm_payments,lab_payments,date,mpesa_code,changetype,total_payments_cr,total_payments_dr)  
        VALUES (OLD.patient_payment_id,OLD.visit_id,OLD.patient_id,OLD.cost,OLD.pharm_payments,OLD.lab_payments,OLD.date,OLD.mpesa_code,'AFTER_UPDATE',OLD.total_payments_cr,OLD.total_payments_dr)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_visit_statement`
--

CREATE TABLE `patient_visit_statement` (
  `patient_visit_statement_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `quantity` decimal(13,2) NOT NULL DEFAULT '1.00',
  `amount` decimal(13,2) NOT NULL,
  `charged` enum('No','Yes') NOT NULL,
  `department` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_payment_id` int(11) NOT NULL,
  `revenue_type` enum('package','radiology','laboratory','medicine') NOT NULL,
  `payment_code` varchar(255) NOT NULL,
  `payment_method` enum('mpesa','airtel money','orange money','cash','yu cash') NOT NULL,
  PRIMARY KEY (`patient_visit_statement_id`),
  KEY `patient_id` (`patient_id`,`visit_id`),
  KEY `visit_id` (`visit_id`),
  KEY `patient_payment_id` (`patient_payment_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `patient_visit_statement`
--

INSERT INTO `patient_visit_statement` (`patient_visit_statement_id`, `patient_id`, `visit_id`, `description`, `quantity`, `amount`, `charged`, `department`, `user_id`, `date_added`, `patient_payment_id`, `revenue_type`, `payment_code`, `payment_method`) VALUES
(1, 3, 10, 'mdvoimfi', 0.00, 12.00, '', 'dfingviof', 8, '2014-01-20 10:05:06', 2, 'package', '', 'mpesa'),
(2, 2, 24, 'Ante-Natal', 0.00, 300.00, 'No', 'Support', 2, '2014-01-20 10:27:46', 15, 'package', '', 'mpesa'),
(3, 25, 25, 'Ante-Natal', 0.00, 300.00, 'No', 'Support', 2, '2014-01-20 10:51:45', 16, 'package', '', 'mpesa'),
(4, 11, 26, 'Ante-Natal', 0.00, 300.00, 'No', 'Support', 2, '2014-01-20 10:53:56', 17, 'package', '', 'mpesa'),
(5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 'Doctor', 8, '2014-01-21 08:03:37', 3, 'medicine', '', 'mpesa'),
(6, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 'Doctor', 8, '2014-01-21 08:03:53', 3, 'radiology', '', 'mpesa'),
(7, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 'Doctor', 8, '2014-01-20 12:47:05', 3, 'radiology', '', 'mpesa'),
(8, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 'Doctor', 8, '2014-01-21 01:32:56', 3, 'radiology', '', 'mpesa'),
(9, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 'Doctor', 8, '2014-01-21 01:35:34', 3, 'radiology', '', 'mpesa'),
(10, 23, 12, 'Mammogram', 0.00, 750.00, 'No', 'Doctor', 8, '2014-01-21 01:38:26', 3, 'radiology', '', 'mpesa'),
(11, 23, 12, 'Malaria Test', 0.00, 150.00, 'No', 'Laboratory', 11, '2014-01-21 01:48:21', 3, 'laboratory', '', 'mpesa'),
(12, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 'Radiology', 14, '2014-01-21 02:58:51', 3, 'radiology', '', 'mpesa'),
(16, 23, 12, 'Betapyn', 48.00, 1200.00, 'No', 'Doctor', 10, '2014-01-21 07:11:02', 3, 'medicine', '', 'mpesa'),
(17, 7, 27, 'Ante-Natal', 0.00, 300.00, 'No', 'Support', 2, '2014-01-21 08:12:25', 18, 'package', '', 'mpesa'),
(18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 'Support', 2, '2014-01-22 13:58:39', 19, 'package', '', 'mpesa'),
(19, 23, 12, 'Stool Test', 1.00, 450.00, 'No', 'Doctor', 8, '2014-01-21 14:03:10', 3, 'laboratory', '', 'mpesa'),
(20, 10, 28, 'nidvnocfid', 1.00, 12.00, 'Yes', 'Pharmacy', 8, '2014-01-22 13:58:39', 19, 'medicine', '', 'mpesa'),
(21, 7, 29, 'Ante-Natal', 1.00, 300.00, 'No', 'Support', 2, '2014-01-23 06:45:09', 20, 'package', '', 'mpesa'),
(22, 5, 30, 'Ante-Natal', 1.00, 300.00, 'No', 'Support', 2, '2014-01-23 10:30:27', 21, 'package', '', 'mpesa'),
(23, 19, 31, 'Ante-Natal', 1.00, 300.00, 'No', 'Support', 2, '2014-01-23 11:55:01', 22, 'package', '', 'mpesa'),
(24, 5, 32, 'Ante-Natal', 1.00, 300.00, 'No', 'Support', 2, '2014-01-24 06:58:40', 23, 'package', '', 'mpesa'),
(25, 3, 33, 'Ante-Natal', 1.00, 300.00, 'Yes', 'Support', 2, '2014-01-29 11:56:32', 24, 'package', '', ''),
(26, 3, 33, 'Malaria Test', 1.00, 150.00, 'Yes', 'Doctor', 8, '2014-01-29 11:56:32', 24, 'laboratory', '', ''),
(27, 3, 33, 'Stool Test', 1.00, 450.00, 'Yes', 'Laboratory', 11, '2014-01-29 11:56:32', 24, 'laboratory', '', ''),
(28, 3, 33, 'Betapyn', 24.00, 600.00, 'Yes', 'Doctor', 8, '2014-01-29 12:59:58', 24, 'medicine', '', ''),
(29, 3, 33, 'X-Ray', 1.00, 350.00, 'Yes', 'Doctor', 8, '2014-01-29 12:59:58', 24, 'radiology', '', ''),
(30, 3, 33, 'CT-Scan', 1.00, 500.00, 'Yes', 'Radiology', 14, '2014-01-29 12:59:58', 24, 'radiology', '', ''),
(31, 3, 33, 'Mammogram', 1.00, 750.00, 'Yes', 'Radiology', 14, '2014-01-29 12:59:58', 24, 'radiology', '', ''),
(32, 3, 33, 'Ultra Sound', 1.00, 850.00, 'No', 'Radiology', 14, '2014-01-29 13:21:37', 24, 'radiology', '', 'mpesa'),
(33, 3, 33, 'Betapyn', 24.00, 600.00, 'No', 'Doctor', 8, '2014-01-29 19:16:29', 24, 'medicine', '', 'mpesa'),
(34, 3, 34, 'Ante-Natal', 1.00, 300.00, 'No', 'Support', 2, '2014-01-30 12:54:18', 25, 'package', '', 'mpesa');

--
-- Triggers `patient_visit_statement`
--
DROP TRIGGER IF EXISTS `after_insert_patient_visit_statement`;
DELIMITER //
CREATE TRIGGER `after_insert_patient_visit_statement` AFTER INSERT ON `patient_visit_statement`
 FOR EACH ROW INSERT INTO trigger_patient_visit_statement (patient_visit_statement_id,department,user_id,quantity,patient_id ,visit_id, description,amount,date_added,charged,changetype,revenue_type)  
        VALUES (NEW.patient_visit_statement_id,NEW.department,NEW.user_id,NEW.quantity,NEW.patient_id,NEW.visit_id,NEW.description,NEW.amount,NEW.date_added,NEW.charged,'INSERT',NEW.revenue_type)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_patient_visit_statement`;
DELIMITER //
CREATE TRIGGER `after_update_patient_visit_statement` AFTER UPDATE ON `patient_visit_statement`
 FOR EACH ROW INSERT INTO trigger_patient_visit_statement (patient_visit_statement_id,department,user_id,quantity,patient_id ,visit_id, description,amount,date_added,charged,changetype,revenue_type)  
        VALUES (NEW.patient_visit_statement_id,NEW.department,NEW.user_id,NEW.quantity,NEW.patient_id,NEW.visit_id,NEW.description,NEW.amount,NEW.date_added,NEW.charged,'AFTER UPDATE',NEW.revenue_type)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_patient_visit_statement`;
DELIMITER //
CREATE TRIGGER `before_update_patient_visit_statement` BEFORE UPDATE ON `patient_visit_statement`
 FOR EACH ROW INSERT INTO trigger_patient_visit_statement (patient_visit_statement_id,department,user_id,quantity,patient_id ,visit_id, description,amount,date_added,charged,changetype,revenue_type)  
        VALUES (OLD.patient_visit_statement_id,OLD.department,OLD.user_id,OLD.quantity,OLD.patient_id,OLD.visit_id,OLD.description,OLD.amount,OLD.date_added,OLD.charged,'BEFORE UPDATE',OLD.revenue_type)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pharm_bin_card`
--

CREATE TABLE `pharm_bin_card` (
  `pharm_bin_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `opening_bal` decimal(13,2) NOT NULL,
  `closing_bal` decimal(13,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `issues` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `issuing_officer` int(11) NOT NULL,
  `description` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `identification_code` varchar(255) NOT NULL,
  PRIMARY KEY (`pharm_bin_card_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pharm_bin_card`
--

INSERT INTO `pharm_bin_card` (`pharm_bin_card_id`, `commodity_name`, `batch_no`, `opening_bal`, `closing_bal`, `expiry_date`, `issues`, `date_added`, `issuing_officer`, `description`, `department`, `identification_code`) VALUES
(1, 'dvcds', 'jniu', 54.00, 34.00, '2014-01-16', 21.00, '2014-01-16 08:06:53', 1, '', '', ''),
(2, 'Betapyn', 'BET_002', 68.00, 44.00, '2015-12-31', 24.00, '2014-01-09 13:17:23', 10, '', '', ''),
(3, 'Betapyn', 'BET_002', 44.00, 20.00, '2015-12-31', 24.00, '2014-01-09 13:36:38', 10, '', '', ''),
(4, 'NOIBFNOID', 'NO_001', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:48:32', 1, 'FKLDVJFM', 'Store', 'nvnod'),
(5, 'Betapyn', 'BET_002', 2.00, 1.00, '2015-12-31', 1.00, '2014-01-30 06:39:27', 10, 'Commodity: Betapyndispensed to a patient:SHWARI_1000002_002', 'Patient Number:SHWARI_1000002_002', 'ISS:0SrsI');

--
-- Triggers `pharm_bin_card`
--
DROP TRIGGER IF EXISTS `after_insert_pharm_bin_card`;
DELIMITER //
CREATE TRIGGER `after_insert_pharm_bin_card` AFTER INSERT ON `pharm_bin_card`
 FOR EACH ROW INSERT INTO trigger_pharm_bin_card (bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (NEW.pharm_bin_card_id,NEW.commodity_name,NEW.batch_no,NEW.opening_bal,NEW.closing_bal,NEW.expiry_date,NEW.issues,NEW.date_added,NEW.description,NEW.department,NEW.identification_code,NEW.issuing_officer,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_pharm_bin_card`;
DELIMITER //
CREATE TRIGGER `after_update_pharm_bin_card` AFTER UPDATE ON `pharm_bin_card`
 FOR EACH ROW INSERT INTO trigger_pharm_bin_card (bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (NEW.pharm_bin_card_id,NEW.commodity_name,NEW.batch_no,NEW.opening_bal,NEW.closing_bal,NEW.expiry_date,NEW.issues,NEW.date_added,NEW.description,NEW.department,NEW.identification_code,NEW.issuing_officer,'AFTER UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_pharm_bin_card`;
DELIMITER //
CREATE TRIGGER `before_update_pharm_bin_card` BEFORE UPDATE ON `pharm_bin_card`
 FOR EACH ROW INSERT INTO trigger_pharm_bin_card (bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (OLD.pharm_bin_card_id,OLD.commodity_name,OLD.batch_no,OLD.opening_bal,OLD.closing_bal,OLD.expiry_date,OLD.issues,OLD.date_added,OLD.description,OLD.department,OLD.identification_code,OLD.issuing_officer,'BEFORE UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `quantity_requested` decimal(5,1) NOT NULL,
  `remarks` text NOT NULL,
  `is_dispensed` enum('Not Dispensed','Dispensed') NOT NULL,
  `quantity_issued` decimal(5,1) NOT NULL,
  `paid` enum('Not Paid','Paid') NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`prescription_id`),
  KEY `patient_id` (`patient_id`),
  KEY `visit_id` (`visit_id`),
  KEY `consultation_id` (`consultation_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `commodity_name` (`commodity_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `patient_id`, `visit_id`, `commodity_name`, `dosage`, `duration`, `quantity_requested`, `remarks`, `is_dispensed`, `quantity_issued`, `paid`, `date_added`, `user_id`, `consultation_id`, `doctor_id`, `date`) VALUES
(1, 8, 22, 'Betapyn', '12', 12, 24.0, 'May cause drowsiness', 'Not Dispensed', 24.0, 'Not Paid', '2014-01-08 03:29:48', 10, 1, 8, '0000-00-00 00:00:00'),
(5, 23, 12, 'Betapyn', '3TDS', 12, 36.0, 'fnvicnfdiu', 'Dispensed', 0.0, 'Not Paid', '2014-01-20 08:50:53', 0, 6, 8, '0000-00-00 00:00:00'),
(6, 23, 12, 'Betapyn', '2TDS', 12, 24.0, 'dfsvncosdfnoiwas', 'Not Dispensed', 0.0, 'Not Paid', '2014-01-21 07:30:12', 0, 6, 8, '0000-00-00 00:00:00'),
(10, 23, 12, 'Betapyn', '2TDS', 12, 24.0, 'osnvcoidsncouids', 'Not Dispensed', 0.0, 'Not Paid', '2014-01-21 07:30:17', 0, 6, 8, '0000-00-00 00:00:00'),
(13, 23, 12, 'Betapyn', '4TDS', 12, 48.0, 'kfsmcoidnsfioc', 'Not Dispensed', 0.0, 'Not Paid', '2014-01-21 07:30:21', 0, 6, 10, '0000-00-00 00:00:00'),
(14, 3, 33, 'Betapyn', '2TDS', 12, 24.0, 'nvdnbuvnbfuid nvodfnbuxv dbvuodfbnuv', 'Dispensed', 1.0, 'Paid', '2014-01-30 06:39:27', 10, 9, 8, '0000-00-00 00:00:00'),
(15, 3, 33, 'Betapyn', '2TDS', 12, 24.0, 'jnvgdjfnvofdn', 'Dispensed', 1.0, 'Not Paid', '2014-01-30 06:39:27', 10, 9, 8, '0000-00-00 00:00:00');

--
-- Triggers `prescription`
--
DROP TRIGGER IF EXISTS `after_insert_prescription`;
DELIMITER //
CREATE TRIGGER `after_insert_prescription` AFTER INSERT ON `prescription`
 FOR EACH ROW INSERT INTO trigger_prescription_update (prescription_id, patient_id, visit_id,commodity_name,dosage,duration,quantity_requested,remarks,is_dispensed,quantity_issued,paid,date_added,user_id,changetype)  
        VALUES (NEW.prescription_id,NEW.patient_id,NEW.visit_id,NEW.commodity_name,NEW.dosage,NEW.duration,NEW.quantity_requested,NEW.remarks,NEW.is_dispensed,NEW.quantity_issued,NEW.paid,NEW.date_added,NEW.user_id,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_prescription`;
DELIMITER //
CREATE TRIGGER `after_update_prescription` AFTER UPDATE ON `prescription`
 FOR EACH ROW INSERT INTO trigger_prescription_update (prescription_id, patient_id, visit_id,commodity_name,dosage,duration,quantity_requested,remarks,is_dispensed,quantity_issued,paid,date_added,user_id,changetype)  
        VALUES (NEW.prescription_id,NEW.patient_id,NEW.visit_id,NEW.commodity_name,NEW.dosage,NEW.duration,NEW.quantity_requested,NEW.remarks,NEW.is_dispensed,NEW.quantity_issued,NEW.paid,NEW.date_added,NEW.user_id,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_prescription`;
DELIMITER //
CREATE TRIGGER `before_update_prescription` BEFORE UPDATE ON `prescription`
 FOR EACH ROW INSERT INTO trigger_prescription_update (prescription_id, patient_id, visit_id,commodity_name,dosage,duration,quantity_requested,remarks,is_dispensed,quantity_issued,paid,date_added,user_id,changetype)  
        VALUES (OLD.prescription_id,OLD.patient_id,OLD.visit_id,OLD.commodity_name,OLD.dosage,OLD.duration,OLD.quantity_requested,OLD.remarks,OLD.is_dispensed,OLD.quantity_issued,OLD.paid,OLD.date_added,OLD.user_id,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `project_requests`
--

CREATE TABLE `project_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(100) DEFAULT NULL,
  `wordpress` int(11) DEFAULT NULL,
  `codeigniter` int(11) DEFAULT NULL,
  `highcharts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `project_requests`
--

INSERT INTO `project_requests` (`id`, `month`, `wordpress`, `codeigniter`, `highcharts`) VALUES
(1, 'Jan', 4, 5, 7),
(2, 'Feb', 5, 2, 8),
(3, 'Mar', 6, 3, 9),
(4, 'Apr', 2, 6, 6),
(5, 'May', 5, 7, 7),
(6, 'Jun', 7, 1, 10),
(7, 'Jul', 2, 2, 9),
(8, 'Aug', 1, 6, 7),
(9, 'Sep', 6, 6, 6),
(10, 'Oct', 7, 4, 9),
(11, 'Nov', 3, 6, 8),
(12, 'Dec', 4, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `rad_test_results`
--

CREATE TABLE `rad_test_results` (
  `rad_test_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `test` varchar(255) NOT NULL,
  `test_result` text NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `rad_tech_id` int(11) NOT NULL,
  `check` enum('0','1') NOT NULL,
  `payment_id` enum('0','1') NOT NULL,
  `paid` enum('not paid','paid') NOT NULL,
  `doctor_description` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rad_test_id`),
  KEY `patient_id` (`patient_id`),
  KEY `visit_id` (`visit_id`),
  KEY `test_id` (`test`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `rad_test_results`
--

INSERT INTO `rad_test_results` (`rad_test_id`, `patient_id`, `visit_id`, `test`, `test_result`, `doctor_id`, `consultation_id`, `rad_tech_id`, `check`, `payment_id`, `paid`, `doctor_description`, `date_added`) VALUES
(1, 2, 10, 'fgvfcds', 'dvfdsac', 5, 4, 4, '', '', '', '', '0000-00-00 00:00:00'),
(2, 2, 14, 'Mammogram', 'jknfgivundfiu ndfgbnvuidf dngvfiudng dnvdfiu', 8, 7, 14, '0', '1', 'paid', ' jndsijfdic ndfivdnsfi', '0000-00-00 00:00:00'),
(3, 23, 12, 'CT-Scan', '', 8, 6, 0, '0', '0', 'not paid', '  jk vjcds foiwdns', '2014-01-21 01:32:56'),
(4, 23, 12, 'CT-Scan', '', 8, 6, 0, '0', '0', 'not paid', ' jdfnvoicdsnfoicn', '2014-01-21 01:35:34'),
(5, 23, 12, 'Mammogram', '', 8, 6, 0, '0', '0', 'not paid', ' dfnvodfnoiv', '2014-01-21 01:38:26'),
(6, 23, 12, 'Mammogram', '', 14, 6, 0, '0', '0', 'not paid', '', '2014-01-21 02:51:38'),
(7, 23, 12, 'CT-Scan', '', 14, 6, 0, '0', '0', 'not paid', '', '2014-01-21 02:58:51'),
(8, 3, 33, 'X-Ray', 'viodnviondiougbvndf dfnvodfinv', 8, 9, 14, '1', '0', 'paid', ' jfnviudgn jdbnvfiugbn dfibnviudfbn dibnvdfgiubnv ', '2014-01-29 13:09:11'),
(9, 3, 33, 'CT-Scan', 'dnvjdnbjv ct scan updated', 14, 9, 14, '1', '0', 'paid', '', '2014-01-29 13:24:12'),
(10, 3, 33, 'Mammogram', 'fdvfsdfcds', 14, 9, 14, '1', '0', 'paid', '', '2014-01-29 13:55:10'),
(11, 3, 33, 'Ultra Sound', '', 14, 9, 0, '0', '0', 'not paid', '', '2014-01-29 13:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `referral_id` int(11) NOT NULL AUTO_INCREMENT,
  `referring_doctor` int(11) NOT NULL,
  `referring_doctor_email` varchar(255) NOT NULL,
  `referred_doctor` varchar(255) NOT NULL,
  `referred_doctor_email` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  PRIMARY KEY (`referral_id`),
  KEY `visit_id` (`visit_id`),
  KEY `referring_doctor` (`referring_doctor`),
  KEY `patient_id` (`patient_id`),
  KEY `visit_id_2` (`visit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `referral`
--

INSERT INTO `referral` (`referral_id`, `referring_doctor`, `referring_doctor_email`, `referred_doctor`, `referred_doctor_email`, `subject`, `message`, `patient_id`, `visit_id`) VALUES
(1, 1, 'cfvncfdj', 'ndncd', 'ncdns', 'cnsvnc', 'cnfvdfiu', 2, 10),
(2, 8, 'ndfvfd@oivdnoid.nfofvdn', 'dfnvod@dnvo.nvodno', 'dfnvod@dnvo.nvodno', 'dvnfvodfn', 'fvdnvodfn', 3, 33);

--
-- Triggers `referral`
--
DROP TRIGGER IF EXISTS `after_insert_referral`;
DELIMITER //
CREATE TRIGGER `after_insert_referral` AFTER INSERT ON `referral`
 FOR EACH ROW INSERT INTO trigger_referral_update (referral_id,referring_doctor,referring_doctor_email, referred_doctor, referred_doctor_email,subject,message,patient_id,visit_id,changetype)  
        VALUES (NEW.referral_id,NEW.referring_doctor,NEW.referring_doctor_email,NEW.referred_doctor,NEW.referred_doctor_email,NEW.subject,NEW.message,NEW.patient_id,NEW.visit_id,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_referral`;
DELIMITER //
CREATE TRIGGER `after_update_referral` AFTER UPDATE ON `referral`
 FOR EACH ROW INSERT INTO trigger_referral_update (referral_id,referring_doctor,referring_doctor_email, referred_doctor, referred_doctor_email,subject,message,patient_id,visit_id,changetype)  
        VALUES (NEW.referral_id,NEW.referring_doctor,NEW.referring_doctor_email,NEW.referred_doctor,NEW.referred_doctor_email,NEW.subject,NEW.message,NEW.patient_id,NEW.visit_id,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_referral`;
DELIMITER //
CREATE TRIGGER `before_update_referral` BEFORE UPDATE ON `referral`
 FOR EACH ROW INSERT INTO trigger_referral_update (referral_id,referring_doctor,referring_doctor_email, referred_doctor, referred_doctor_email,subject,message,patient_id,visit_id,changetype)  
        VALUES (OLD.referral_id,OLD.referring_doctor,OLD.referring_doctor_email,OLD.referred_doctor,OLD.referred_doctor_email,OLD.subject,OLD.message,OLD.patient_id,OLD.visit_id,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `department_from` varchar(255) NOT NULL,
  `user_from` int(11) NOT NULL,
  `department_to` varchar(255) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `no_of_packs` decimal(13,2) NOT NULL,
  `total_quantity_requested` decimal(13,2) NOT NULL DEFAULT '0.00',
  `strength` varchar(255) NOT NULL,
  `total_quantity_issued` decimal(13,2) NOT NULL,
  `remarks` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `request_order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`request_id`),
  UNIQUE KEY `request_order_id_2` (`request_order_id`),
  KEY `request_order_id` (`request_order_id`),
  KEY `user_id` (`user_id`),
  KEY `stock_id` (`stock_id`),
  KEY `commodity_name` (`commodity_name`),
  KEY `user_from` (`user_from`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `stock_id`, `department_from`, `user_from`, `department_to`, `commodity_name`, `no_of_packs`, `total_quantity_requested`, `strength`, `total_quantity_issued`, `remarks`, `date_added`, `user_id`, `request_order_id`) VALUES
(1, 4, 'Store', 2, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, '120', 1100.00, '', '2013-12-31 11:02:04', 11, '12353vdfs'),
(4, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 0.00, 'knfvuiofbnd ', '2014-01-05 11:12:51', 0, 'REQ:0La9F'),
(5, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 0.00, 'knfvuiofbnd ', '2014-01-05 11:12:52', 0, 'REQ:8hIgK'),
(6, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, '120mg', 0.00, 'ndvinbdf ', '2013-12-31 11:22:21', 0, 'REQ:0uRaY'),
(7, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 0.00, ' nodfivndfio', '2014-01-01 03:47:47', 0, 'REQ:HEnpC'),
(8, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 'vnuidfb', 0.00, ' jdvnjdn', '2014-01-01 03:47:47', 0, 'REQ:0rSDi'),
(9, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 12.00, 144.00, 'dfonvodfiun', 0.00, ' ncjfndsj', '2014-01-01 03:47:47', 0, 'REQ:50F6T'),
(10, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 0.00, '1 ', '2014-01-01 03:49:48', 0, 'REQ:1bAwH'),
(11, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 'vnuidfb', 0.00, '2 ', '2014-01-01 03:49:48', 0, 'REQ:HPpoH'),
(12, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 'dfonvodfiun', 0.00, '3 ', '2014-01-01 03:49:48', 0, 'REQ:0XRNY'),
(13, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 0.00, 'dvndufnv ', '2014-01-02 08:33:08', 0, 'REQ:12ZPs'),
(14, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 0.00, 'ndvufbdni ', '2014-01-02 08:34:42', 0, 'REQ:1gAI9'),
(15, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 'vnuidfb', 0.00, 'ndfuivndfiu ', '2014-01-02 08:34:42', 0, 'REQ:FXZU4'),
(16, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, '120mg', 0.00, 'fnvubdfnu ', '2014-01-02 08:35:32', 0, 'REQ:ufPvF'),
(17, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 'vnuidfb', 0.00, 'fnvuifdnbi ', '2014-01-02 08:35:32', 0, 'REQ:bOkoL'),
(18, 0, 'Pharmacist', 10, 'Store', 'nfgduinvd', 12.00, 156.00, 'ndfguindiu', 0.00, 'djfnvdfiunsiu ', '2014-01-05 08:35:32', 0, 'REQ:Dg1yt'),
(19, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, '120mg', 10.00, 'DFNVIUFDNUI ', '2014-01-05 16:09:03', 13, 'REQ:0OWG9'),
(20, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 19.00, 2280.00, 'vnuidfb', 0.00, 'FNVFUND ', '2014-01-02 08:36:24', 0, 'REQ:zNRj3'),
(21, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 14.00, 182.00, 'dfonvodfiun', 0.00, 'ENFUVINDUI ', '2014-01-02 08:36:24', 0, 'REQ:y63TM'),
(22, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 0.00, 'FMDIBVGMFDI ', '2014-01-02 08:38:32', 0, 'REQ:3hvvr'),
(23, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, '120mg', 0.00, 'FDMGOIDMF ', '2014-01-02 08:38:32', 0, 'REQ:1i3V6'),
(24, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 'vnuidfb', 0.00, 'FDGNOIVNFD ', '2014-01-03 08:38:32', 0, 'REQ:Yl0mW'),
(25, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, '120mg', 0.00, 'FNGDONFIOD ', '2014-01-03 08:38:32', 0, 'REQ:b0gGa'),
(26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 10.00, 'FVDS ', '2014-01-05 16:08:30', 13, 'REQ:fBg5y'),
(27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 'vnuidfb', 20.00, 'FDGDS ', '2014-01-05 15:59:23', 13, 'REQ:1WzRV'),
(28, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 'dfonvodfiun', 0.00, '12RFEFD ', '2014-01-05 08:39:23', 0, 'REQ:0Dqcz'),
(29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 'dfonvodfiun', 1.00, 'FDGEDS ', '2014-01-13 09:09:52', 10, 'REQ:1POjL'),
(30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 'dfonvodfiun', 0.00, 'VFDMVFIODM ', '2014-01-13 09:17:19', 0, 'REQ:1kGO0'),
(31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 5.00, ' jniufdbncx', '2014-01-13 08:32:55', 13, 'REQ:OQ21Z'),
(32, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 12.00, 144.00, 'dfonvodfiun', 0.00, 'jfbivnc', '2014-01-06 06:39:43', 0, 'REQ:LpW5X'),
(33, 0, 'Pharmacist', 10, 'Store', 'nfgduinvd', 12.00, 144.00, 'ndfguindiu', 0.00, 'jvbndicbn', '2014-01-06 06:39:43', 0, 'REQ:01uI3'),
(34, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 'vnuidfb', 10.00, 'jnbivudbcx', '2014-01-06 08:35:35', 13, 'REQ:19H6v'),
(35, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 169.00, 'dfonvodfiun', 0.00, 'jbvdsicubsiu', '2014-01-06 06:39:43', 0, 'REQ:9xyM7'),
(36, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, '120mg', 10.00, ' jdnvbjkdfn', '2014-01-06 08:40:20', 13, 'REQ:plnLr'),
(37, 0, 'Pharmacist', 10, 'Store', 'dnbuidb', 12.00, 144.00, 'vdnbuibdviuvdb', 0.00, 'ndgvundf', '2014-01-06 07:34:09', 0, 'REQ:PWwWd'),
(38, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, '120mg', 5.00, 'nvdfioun', '2014-01-06 08:43:16', 13, 'REQ:CNgCQ'),
(39, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 1.00, ' vnbiunvco', '2014-01-06 08:48:28', 13, 'REQ:uF8f3'),
(40, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 1.00, ' bviubfdiuv', '2014-01-06 08:49:16', 13, 'REQ:qCID1'),
(41, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 1.00, '', '2014-01-06 08:55:26', 13, 'REQ:aP2IQ'),
(42, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, '120mg', 0.00, ' Needed urgently', '2014-01-30 09:44:16', 0, 'REQ:bVgy6'),
(43, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 2.00, 240.00, 'vnuidfb', 40.00, ' Also needed urgently', '2014-01-30 11:30:59', 13, 'REQ:1JRaD'),
(44, 14, 'Pharmacy', 10, 'Store', 'nfgduinvd', 12.00, 144.00, 'ndfguindiu', 14.00, 'fsknviodsfnvofid ', '2014-01-30 11:01:28', 13, 'REQ:hcQAa');

--
-- Triggers `request`
--
DROP TRIGGER IF EXISTS `after_insert_request`;
DELIMITER //
CREATE TRIGGER `after_insert_request` AFTER INSERT ON `request`
 FOR EACH ROW INSERT INTO trigger_request_update (request_id,stock_id,department_from, user_from,department_to,commodity_name,no_of_packs,total_quantity_requested,strength,total_quantity_issued,user_id,changetype,request_order_id,remarks)  
        VALUES (NEW.request_id,NEW.stock_id,NEW.department_from,NEW.user_from,NEW.department_to,NEW.commodity_name,NEW.no_of_packs,NEW.total_quantity_requested,NEW.strength,NEW.total_quantity_issued,NEW.user_id,'INSERT',NEW.request_order_id,NEW.remarks)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_request`;
DELIMITER //
CREATE TRIGGER `after_update_request` AFTER UPDATE ON `request`
 FOR EACH ROW INSERT INTO trigger_request_update (request_id,stock_id,department_from, user_from,department_to,commodity_name,no_of_packs,total_quantity_requested,strength,total_quantity_issued,user_id,changetype,request_order_id,remarks)  
        VALUES (NEW.request_id,NEW.stock_id,NEW.department_from,NEW.user_from,NEW.department_to,NEW.commodity_name,NEW.no_of_packs,NEW.total_quantity_requested,NEW.strength,NEW.total_quantity_issued,NEW.user_id,'AFTER_UPDATE',NEW.request_order_id,NEW.remarks)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_request`;
DELIMITER //
CREATE TRIGGER `before_update_request` BEFORE UPDATE ON `request`
 FOR EACH ROW INSERT INTO trigger_request_update (request_id,stock_id,department_from, user_from,department_to,commodity_name,no_of_packs,total_quantity_requested,strength,total_quantity_issued,user_id,changetype,request_order_id,remarks)  
        VALUES (OLD.request_id,OLD.stock_id,OLD.department_from,OLD.user_from,OLD.department_to,OLD.commodity_name,OLD.no_of_packs,OLD.total_quantity_requested,OLD.strength,OLD.total_quantity_issued,OLD.user_id,'BEFORE_UPDATE',OLD.request_order_id,OLD.remarks)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(255) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `delivery_no` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `expiry_date` date NOT NULL,
  `unit_per_pack` decimal(13,2) NOT NULL,
  `no_of_packs` decimal(13,2) NOT NULL,
  `total_quantity` decimal(13,2) NOT NULL,
  `buying_price` decimal(13,4) NOT NULL,
  `selling_price` decimal(13,4) NOT NULL,
  `remarks` text NOT NULL,
  `available_quantity` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `has_expired` enum('No','Yes') NOT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `commodity_id` (`commodity_id`),
  KEY `user_id` (`user_id`),
  KEY `commodity_name` (`commodity_name`),
  KEY `batch_no` (`batch_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `commodity_name`, `commodity_id`, `delivery_no`, `supplier_name`, `batch_no`, `expiry_date`, `unit_per_pack`, `no_of_packs`, `total_quantity`, `buying_price`, `selling_price`, `remarks`, `available_quantity`, `date_added`, `user_id`, `has_expired`) VALUES
(4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 950.00, 12.0000, 17.0000, 'fsmviodmfvx', 120.00, '2014-01-30 11:30:59', 8, 'No'),
(5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 0.00, 15.0000, 25.0000, 'May cause drowsiness  ', 0.00, '2014-01-06 08:43:16', 13, 'No'),
(6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 1.00, 15.0000, 25.0000, 'May cause drowsiness be cautious please ', 1.00, '2014-01-30 10:51:44', 13, 'No'),
(10, 'dnbuidb', 5, 'nsifnius', 'KEMSA', 'dnb_1', '2014-01-22', 12.00, 12.00, 144.00, 12.0000, 14.0000, 'vscdfsv ', 0.00, '2014-01-15 08:15:59', 13, 'Yes'),
(12, 'dnbuidb', 5, 'fgfd', 'KEMSA', 'dnb_2', '2014-01-24', 12.00, 13.00, 156.00, 13.0000, 14.0000, 'snnvfns ', 0.00, '2014-01-15 08:27:06', 13, 'Yes'),
(13, 'dnbuidb', 5, 'sjndfg', 'NDUVDFNJ', 'dnb_3', '2014-01-16', 12.00, 12.00, 144.00, 13.0000, 13.0000, 'sfer ', 0.00, '2014-01-15 09:03:00', 13, 'No'),
(14, 'nfgduinvd', 2, 'qw', 'KEMSA', 'nfg_1', '2014-01-09', 12.00, 12.00, 130.00, 12.0000, 14.0000, ' qw', 130.00, '2014-01-30 11:13:53', 13, 'No'),
(15, 'nfgduinvd', 2, 'nboingfdoi', 'KEMSA', 'nfg_2', '2014-02-28', 12.00, 12.00, 144.00, 12.0000, 15.0000, ' knbvofdniovncfdiosn', 0.00, '2014-01-30 12:32:21', 13, 'No');

--
-- Triggers `stock`
--
DROP TRIGGER IF EXISTS `after_insert_stock_items`;
DELIMITER //
CREATE TRIGGER `after_insert_stock_items` AFTER INSERT ON `stock`
 FOR EACH ROW INSERT INTO trigger_stock_log_update (stock_id, commodity_name, commodity_id,delivery_no,supplier_name,batch_no,expiry_date,units_per_pack,no_of_packs,total_quantity,buying_price,selling_price,remarks,available_quantity,user_id,changetype,has_expired)  
        VALUES (NEW.stock_id,NEW.commodity_name,NEW.commodity_id,NEW.delivery_no,NEW.supplier_name,NEW.batch_no,NEW.expiry_date,NEW.unit_per_pack,NEW.no_of_packs,NEW.total_quantity,NEW.buying_price,NEW.selling_price,NEW.remarks,NEW.available_quantity,NEW.user_id,'INSERT',NEW.has_expired)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_stock_items`;
DELIMITER //
CREATE TRIGGER `after_update_stock_items` AFTER UPDATE ON `stock`
 FOR EACH ROW INSERT INTO trigger_stock_log_update (stock_id, commodity_name, commodity_id,delivery_no,supplier_name,batch_no,expiry_date,units_per_pack,no_of_packs,total_quantity,buying_price,selling_price,remarks,available_quantity,user_id,changetype,has_expired)
VALUES (NEW.stock_id,NEW.commodity_name,NEW.commodity_id,NEW.delivery_no,NEW.supplier_name,NEW.batch_no,NEW.expiry_date,NEW.unit_per_pack,NEW.no_of_packs,NEW.total_quantity,NEW.buying_price,NEW.selling_price,NEW.remarks,NEW.available_quantity,NEW.user_id,'AFTER_UPDATE',NEW.has_expired)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_stock_items`;
DELIMITER //
CREATE TRIGGER `before_update_stock_items` BEFORE UPDATE ON `stock`
 FOR EACH ROW INSERT INTO trigger_stock_log_update (stock_id, commodity_name, commodity_id,delivery_no,supplier_name,batch_no,expiry_date,units_per_pack,no_of_packs,total_quantity,buying_price,selling_price,remarks,available_quantity,user_id,changetype,has_expired)  
        VALUES (OLD.stock_id,OLD.commodity_name,OLD.commodity_id,OLD.delivery_no,OLD.supplier_name,OLD.batch_no,OLD.expiry_date,OLD.unit_per_pack,OLD.no_of_packs,OLD.total_quantity,OLD.buying_price,OLD.selling_price,OLD.remarks,OLD.available_quantity,OLD.user_id,'BEFORE_UPDATE',OLD.has_expired)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_audit`
--

CREATE TABLE `stock_audit` (
  `stock_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `delivery_no` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `expiry_date` date NOT NULL,
  `units_per_pack` decimal(13,2) NOT NULL,
  `no_of_packs` decimal(13,2) NOT NULL,
  `total_quantity` decimal(13,2) NOT NULL,
  `buying_price` decimal(13,4) NOT NULL,
  `selling_price` decimal(13,4) NOT NULL,
  `remarks` text NOT NULL,
  `available_quantity` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `commodity_id` (`commodity_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_user_list`
--

CREATE TABLE `stock_user_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `stock_user_type` varchar(255) NOT NULL,
  `stock_user_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stock_user_list`
--

INSERT INTO `stock_user_list` (`id`, `name`, `stock_user_type`, `stock_user_type_id`) VALUES
(1, 'Clinton Foundation', 'Source', 1),
(2, 'KEMSA', 'Source', 1),
(3, 'Shwari Health Cntre', 'Destination', 2);

-- --------------------------------------------------------

--
-- Table structure for table `store_bin_card`
--

CREATE TABLE `store_bin_card` (
  `store_bin_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `opening_bal` decimal(13,2) NOT NULL,
  `closing_bal` decimal(13,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `issues` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `identification_code` varchar(255) NOT NULL,
  `issuing_officer` varchar(255) NOT NULL,
  PRIMARY KEY (`store_bin_card_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `store_bin_card`
--

INSERT INTO `store_bin_card` (`store_bin_card_id`, `commodity_name`, `batch_no`, `opening_bal`, `closing_bal`, `expiry_date`, `issues`, `date_added`, `description`, `department`, `identification_code`, `issuing_officer`) VALUES
(1, 'dnbuidb', 'dnb_2', 156.00, 156.00, '2014-01-24', 0.00, '2014-01-16 08:11:05', 'dnbuidbhas  been received into the store with the  Batch Number :dnb_2.', 'Store', 'REC:T5r88', '1'),
(2, 'dnbuidb', 'dnb_3', 144.00, 144.00, '2014-01-16', 0.00, '2014-01-15 09:03:00', 'dnbuidb has  been received into the store with the  Batch Number :dnb_3.', 'Store', 'REC:sGc7q', ''),
(3, 'nfgduinvd', 'nfg_1', 144.00, 144.00, '2014-01-09', 0.00, '2014-01-15 09:04:19', 'nfgduinvd has  been received into the store with the  Batch Number :nfg_1.', 'Store', 'REC:1PmTN', ''),
(4, 'NVJDFNX', 'NV_1', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:49:15', 'DFVC', 'Store', 'nvnod', '1'),
(5, 'Betapyn', 'BET_002', 1.00, 1.00, '2015-12-31', 1.00, '2014-01-30 10:51:44', 'Return to the Main Store from Pharmacy Department', 'Store', 'RET:02QJx', '10'),
(6, 'nfgduinvd', 'nfg_1', 144.00, 130.00, '2014-01-09', 14.00, '2014-01-30 11:01:28', 'Commodity:nfgduinvdhas been dispensed from DepartmentPharmacyto DepartmentPharmacy', '', 'ISS:om0Pu', '13'),
(7, 'fnvidnbiv', '123890', 990.00, 950.00, '0000-00-00', 40.00, '2014-01-30 11:30:59', 'Commodity:fnvidnbivhas been dispensed from DepartmentPharmacistto DepartmentPharmacy', '', 'ISS:C3lrG', '13'),
(8, 'nfgduinvd', 'nfg_2', 144.00, 144.00, '2014-02-28', 0.00, '2014-01-30 12:32:21', 'nfgduinvd has  been received into the store with the  Batch Number :nfg_2.', 'Store', 'REC:0wXnD', '13');

--
-- Triggers `store_bin_card`
--
DROP TRIGGER IF EXISTS `after_insert_store_bin_card`;
DELIMITER //
CREATE TRIGGER `after_insert_store_bin_card` AFTER INSERT ON `store_bin_card`
 FOR EACH ROW INSERT INTO trigger_store_bin_card (store_bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (NEW.store_bin_card_id,NEW.commodity_name,NEW.batch_no,NEW.opening_bal,NEW.closing_bal,NEW.expiry_date,NEW.issues,NEW.date_added,NEW.description,NEW.department,NEW.identification_code,NEW.issuing_officer,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_store_bin_card`;
DELIMITER //
CREATE TRIGGER `after_update_store_bin_card` AFTER UPDATE ON `store_bin_card`
 FOR EACH ROW INSERT INTO trigger_store_bin_card (store_bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (NEW.store_bin_card_id,NEW.commodity_name,NEW.batch_no,NEW.opening_bal,NEW.closing_bal,NEW.expiry_date,NEW.issues,NEW.date_added,NEW.description,NEW.department,NEW.identification_code,NEW.issuing_officer,'AFTER UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_store_bin_card`;
DELIMITER //
CREATE TRIGGER `before_update_store_bin_card` BEFORE UPDATE ON `store_bin_card`
 FOR EACH ROW INSERT INTO trigger_store_bin_card (store_bin_card_id, commodity_name, batch_no,opening_bal,closing_bal,expiry_date,issues,date_added,description,department,identification_code,issuing_officer,change_type)  
        VALUES (OLD.store_bin_card_id,OLD.commodity_name,OLD.batch_no,OLD.opening_bal,OLD.closing_bal,OLD.expiry_date,OLD.issues,OLD.date_added,OLD.description,OLD.department,OLD.identification_code,OLD.issuing_officer,'BEFORE UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `contact_person_phone_no` varchar(255) NOT NULL,
  `is_active` enum('Active','Not Active') NOT NULL,
  `remarks` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_code`, `supplier_name`, `phone_no`, `contact_person`, `contact_person_phone_no`, `is_active`, `remarks`, `date_added`) VALUES
(1, 'SUP_1', 'KEMSA', '0714339521', 'KEMSA', '0712123456', 'Active', 'Active\r\n', '2013-12-25 15:19:17'),
(2, 'SUP_2', 'MEDS', '0712345678', 'MEDS', '0712345678', 'Active', 'Active', '2013-12-25 15:19:17'),
(4, 'SUP_3', 'NDUVDFNJ', 'NEUIFNVFIU', 'NFUISNIUD', 'NUFISNVEFIU', 'Active', '', '2013-12-25 15:20:38'),
(5, 'SUP_4', 'Clinton Foundation', '0123123123123', 'Clinton Foundation', '07123123123', 'Active', '', '2013-12-25 15:27:52'),
(6, 'SUP_5', 'nbvydsibvyicu', 'vdniudniu', 'nviundiu', 'vinviudnx', 'Active', '', '2014-01-06 06:45:40'),
(7, 'SUP_6', 'nvdiufnvuidf', '87564534', 'nfviundfiu', '867564542', 'Active', '', '2014-01-30 11:42:41'),
(8, 'SUP_7', 'bnvdovindfoi', '48503', 'nfoinso', '60453048', 'Active', '', '2014-01-30 12:04:53'),
(9, 'SUP_8', 'vnidgnviudf', '6453', 'dnbviufnd', '56450', 'Active', '', '2014-01-30 12:06:33'),
(10, 'SUP_9', 'gbngfnd', '564543', 'ndfvin', '67654', 'Active', '', '2014-01-30 12:08:05');

--
-- Triggers `supplier`
--
DROP TRIGGER IF EXISTS `after_insert_supplier`;
DELIMITER //
CREATE TRIGGER `after_insert_supplier` AFTER INSERT ON `supplier`
 FOR EACH ROW INSERT INTO trigger_supplier_update (supplier_id, supplier_name,supplier_code,phone_no,contact_person,contact_person_phone_no,is_active,remarks,changetype)  
        VALUES (NEW.supplier_id,NEW.supplier_name,NEW.supplier_code,NEW.phone_no,NEW.contact_person,NEW.contact_person_phone_no,NEW.is_active,NEW.remarks,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_supplier`;
DELIMITER //
CREATE TRIGGER `after_update_supplier` AFTER UPDATE ON `supplier`
 FOR EACH ROW INSERT INTO trigger_supplier_update (supplier_id, supplier_name, phone_no,contact_person,contact_person_phone_no,is_active,remarks,changetype)  
        VALUES (NEW.supplier_id,NEW.supplier_name,NEW.phone_no,NEW.contact_person,NEW.contact_person_phone_no,NEW.is_active,NEW.remarks,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_supplier`;
DELIMITER //
CREATE TRIGGER `before_update_supplier` BEFORE UPDATE ON `supplier`
 FOR EACH ROW INSERT INTO trigger_supplier_update (supplier_id, supplier_name, phone_no,contact_person,contact_person_phone_no,is_active,remarks,changetype)  
        VALUES (OLD.supplier_id,OLD.supplier_name,OLD.phone_no,OLD.contact_person,OLD.contact_person_phone_no,OLD.is_active,NEW.remarks,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(255) NOT NULL,
  `test_price` decimal(13,4) NOT NULL,
  `test_type` enum('Laboratory','Radiology') NOT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`test_id`, `test_name`, `test_price`, `test_type`) VALUES
(1, 'Malaria Test', 150.0000, 'Laboratory'),
(2, 'Stool Test', 450.0000, 'Laboratory'),
(3, 'X-Ray', 350.0000, 'Radiology'),
(4, 'CT-Scan', 500.0000, 'Radiology'),
(6, 'Mammogram', 750.0000, 'Radiology'),
(7, 'Ultra Sound', 850.0000, 'Radiology');

--
-- Triggers `test`
--
DROP TRIGGER IF EXISTS `after_insert_test`;
DELIMITER //
CREATE TRIGGER `after_insert_test` AFTER INSERT ON `test`
 FOR EACH ROW INSERT INTO trigger_test_update (test_id, test_name, test_price,test_type,changetype)  
        VALUES (NEW.test_id,NEW.test_name,NEW.test_price,NEW.test_type,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_test`;
DELIMITER //
CREATE TRIGGER `after_update_test` AFTER UPDATE ON `test`
 FOR EACH ROW INSERT INTO trigger_test_update (test_id, test_name, test_price,test_type,changetype)  
        VALUES (NEW.test_id,NEW.test_name,NEW.test_price,NEW.test_type,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_test`;
DELIMITER //
CREATE TRIGGER `before_update_test` BEFORE UPDATE ON `test`
 FOR EACH ROW INSERT INTO trigger_test_update (test_id, test_name, test_price,test_type,changetype)  
        VALUES (OLD.test_id,OLD.test_name,OLD.test_price,OLD.test_type,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `no_of_pack` decimal(5,2) NOT NULL,
  `transaction_total_quantity` decimal(13,2) NOT NULL,
  `available_quantity` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `has_expired` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `user_id` (`user_id`),
  KEY `request_id` (`request_id`),
  KEY `batch_no` (`batch_no`),
  KEY `destination` (`destination`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `request_id`, `destination`, `batch_no`, `no_of_pack`, `transaction_total_quantity`, `available_quantity`, `date_added`, `user_id`, `has_expired`) VALUES
(1, 39, 'Pharmacy', 'BET_002', 12.00, 1.00, 0.00, '2014-01-30 10:51:44', 13, 'No'),
(21, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 1.00, '2014-01-30 06:39:27', 10, 'No'),
(22, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 1.00, '2014-01-30 06:39:27', 10, 'No'),
(23, 29, 'Nurse', 'BET_002', 12.00, 3.00, 1.00, '2014-01-30 06:39:27', 10, 'No'),
(24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, '2014-01-29 05:29:01', 10, 'No'),
(25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, '2014-01-29 05:29:01', 10, 'No'),
(26, 44, 'Pharmacy', 'nfg_1', 12.00, 130.00, 130.00, '2014-01-30 11:01:28', 13, 'No'),
(27, 43, 'Pharmacy', '123890', 2.00, 950.00, 950.00, '2014-01-30 11:30:59', 13, 'No');

--
-- Triggers `transaction`
--
DROP TRIGGER IF EXISTS `after_insert_transaction_items`;
DELIMITER //
CREATE TRIGGER `after_insert_transaction_items` AFTER INSERT ON `transaction`
 FOR EACH ROW INSERT INTO trigger_transaction_log_update (transaction_id, request_id,destination, batch_no,no_of_pack,transaction_total_quantity,user_id,date_added,changetype,available_quantity,has_expired)  
        VALUES (NEW.transaction_id,NEW.request_id,NEW.destination,NEW.batch_no,NEW.no_of_pack,NEW.transaction_total_quantity,NEW.user_id,NEW.date_added,'INSERT',NEW.available_quantity,NEW.has_expired)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_transaction_item`;
DELIMITER //
CREATE TRIGGER `after_update_transaction_item` AFTER UPDATE ON `transaction`
 FOR EACH ROW INSERT INTO trigger_transaction_log_update (transaction_id,request_id, destination, batch_no,no_of_pack,transaction_total_quantity,user_id,date_added,changetype,available_quantity,has_expired)  
        VALUES (NEW.transaction_id,NEW.request_id,NEW.destination,NEW.batch_no,NEW.no_of_pack,NEW.transaction_total_quantity,NEW.user_id,NEW.date_added,'AFTER_UPDATE',NEW.available_quantity,NEW.has_expired)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_transaction_item`;
DELIMITER //
CREATE TRIGGER `before_update_transaction_item` BEFORE UPDATE ON `transaction`
 FOR EACH ROW INSERT INTO trigger_transaction_log_update (transaction_id,request_id, destination, batch_no,no_of_pack,transaction_total_quantity,user_id,date_added,changetype,available_quantity,has_expired)  
        VALUES (OLD.transaction_id,OLD.request_id,OLD.destination,OLD.batch_no,OLD.no_of_pack,OLD.transaction_total_quantity,OLD.user_id,OLD.date_added,'BEFORE_UPDATE',OLD.available_quantity,OLD.has_expired)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `triage`
--

CREATE TABLE `triage` (
  `triage_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `weight` decimal(6,3) NOT NULL,
  `diastolic` decimal(6,3) NOT NULL,
  `systolic` decimal(6,3) NOT NULL,
  `temperature` decimal(6,3) NOT NULL,
  `height` decimal(6,3) NOT NULL,
  `respiratory_rate` decimal(6,3) NOT NULL,
  `pulse_rate` decimal(6,3) NOT NULL,
  `critical_symptoms` text NOT NULL,
  `allergy` text NOT NULL,
  `OCS` text NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `urgency` varchar(255) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  PRIMARY KEY (`triage_id`),
  KEY `visit_id` (`visit_id`),
  KEY `nurse_id` (`nurse_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `triage`
--

INSERT INTO `triage` (`triage_id`, `patient_id`, `visit_id`, `weight`, `diastolic`, `systolic`, `temperature`, `height`, `respiratory_rate`, `pulse_rate`, `critical_symptoms`, `allergy`, `OCS`, `Date`, `urgency`, `nurse_id`) VALUES
(2, 21, 10, 10.000, 99.990, 99.990, 35.000, 1.500, 99.990, 99.990, 'none', 'none', 'none', '2013-12-20 09:21:05', 'urgent', 7),
(4, 21, 10, 10.000, 120.000, 120.000, 35.000, 1.500, 120.000, 120.000, '', '', '', '2013-12-20 11:54:20', 'urgent', 7),
(8, 21, 10, 120.000, 120.000, 120.000, 35.000, 1.500, 120.000, 120.000, '', '', 'jnfdiuvneisf', '2013-12-20 12:42:01', '', 7),
(9, 21, 10, 129.000, 123.000, 123.000, 35.000, 1.500, 23.000, 24.000, '', '', 'KNBVGFJDNOBV', '2013-12-20 13:17:13', '', 7),
(10, 23, 12, 80.000, 120.000, 120.000, 35.000, 1.500, 120.000, 120.000, '', 'dfnvuidfn', 'Needs Urgent attention', '2014-01-06 13:08:41', '', 7),
(11, 2, 14, 80.000, 120.000, 120.000, 35.000, 1.500, 120.000, 120.000, '', '', 'ensfciund', '2014-01-07 12:36:42', '', 7),
(12, 7, 29, 35.000, 12.000, 13.000, 36.000, 1.500, 120.000, 120.000, '', '', 'nvdviudnsfiud', '2014-01-23 06:46:04', '', 7),
(17, 5, 30, 80.000, 120.000, 120.000, 35.000, 1.500, 120.000, 130.000, '', '', 'djnbviu bdni', '2014-01-23 10:49:53', '', 7),
(18, 19, 31, 30.000, 120.000, 120.000, 35.000, 1.500, 120.000, 120.000, '', '', '', '2014-01-23 11:55:52', '', 7),
(19, 3, 33, 120.000, 12.000, 12.000, 35.000, 1.500, 120.000, 120.000, '', 'dfbiubviudf', 'ndbivdnfiu', '2014-01-29 08:12:56', '', 7),
(20, 3, 33, 89.000, 120.000, 120.000, 36.000, 1.500, 120.000, 120.000, '', 'dfbiubviudf', 'djbvibdfus', '2014-01-29 08:12:56', '', 7),
(21, 3, 33, 12.000, 130.000, 130.000, 35.000, 1.500, 130.000, 130.000, '', 'dfbiubviudf', 'jndfviubdfui', '2014-01-29 08:12:56', '', 7),
(22, 3, 33, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, '', 'dfbiubviudf', '', '2014-01-29 08:12:56', '', 7);

--
-- Triggers `triage`
--
DROP TRIGGER IF EXISTS `after_insert_triage`;
DELIMITER //
CREATE TRIGGER `after_insert_triage` AFTER INSERT ON `triage`
 FOR EACH ROW INSERT INTO trigger_triage_update (triage_id,patient_id,visit_id, weight, diastolic,systolic,temperature,height,respiratory_rate,pulse_rate,critical_symptoms,allergy,changetype)  
        VALUES (NEW.triage_id,NEW.patient_id,NEW.visit_id,NEW.weight,NEW.diastolic,NEW.systolic,NEW.temperature,NEW.height,NEW.respiratory_rate,NEW.pulse_rate,NEW.critical_symptoms,NEW.allergy,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_triage`;
DELIMITER //
CREATE TRIGGER `after_update_triage` AFTER UPDATE ON `triage`
 FOR EACH ROW INSERT INTO trigger_triage_update (triage_id,patient_id,visit_id, weight, diastolic,systolic,temperature,height,respiratory_rate,pulse_rate,critical_symptoms,allergy,changetype)  
        VALUES (NEW.triage_id,NEW.patient_id,NEW.visit_id,NEW.weight,NEW.diastolic,NEW.systolic,NEW.temperature,NEW.height,NEW.respiratory_rate,NEW.pulse_rate,NEW.critical_symptoms,NEW.allergy,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_triage`;
DELIMITER //
CREATE TRIGGER `before_update_triage` BEFORE UPDATE ON `triage`
 FOR EACH ROW INSERT INTO trigger_triage_update (triage_id,patient_id,visit_id, weight, diastolic,systolic,temperature,height,respiratory_rate,pulse_rate,critical_symptoms,allergy,changetype)  
        VALUES (OLD.triage_id,OLD.patient_id,OLD.visit_id,OLD.weight,OLD.diastolic,OLD.systolic,OLD.temperature,OLD.height,OLD.respiratory_rate,OLD.pulse_rate,OLD.critical_symptoms,OLD.allergy,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger-test_update`
--

CREATE TABLE `trigger-test_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `test_price` decimal(13,4) NOT NULL,
  `test_type` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_appointment_insert`
--

CREATE TABLE `trigger_appointment_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `booked_by` varchar(255) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `trigger_appointment_insert`
--

INSERT INTO `trigger_appointment_insert` (`id`, `appointment_id`, `date`, `time`, `patient_id`, `title`, `about`, `booked_by`, `visit_id`, `employee_id`, `transaction_date`, `changetype`) VALUES
(1, 12, '2013-12-21', '00:12', 22, 'dfkvxndon', 'ndsxuivnbdiosu', '', 11, 8, '2013-12-21 14:54:24', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_appointment_update`
--

CREATE TABLE `trigger_appointment_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `booked_by` varchar(255) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `trigger_appointment_update`
--

INSERT INTO `trigger_appointment_update` (`id`, `appointment_id`, `date`, `time`, `patient_id`, `title`, `about`, `booked_by`, `visit_id`, `employee_id`, `transaction_date`, `changetype`) VALUES
(1, 12, '2013-12-21', '00:12', 22, 'dfkvxndon', 'ndsxuivnbdiosu', '', 11, 8, '2014-01-08 02:10:59', 'INSERT'),
(2, 12, '2014-01-08', '00:12', 22, 'dfkvxndon', 'ndsxuivnbdiosu', '', 11, 8, '2014-01-08 02:10:59', 'AFTER UPDATE'),
(3, 14, '2014-01-31', '04:05 PM', 3, 'dfnvdfnsiov', 'dfnvndfiouxd', '', 33, 8, '2014-01-29 18:02:55', 'INSERT'),
(4, 15, '2014-01-29', '09:30 PM', 3, 'dnbovindf', 'nboidntgiovdfn', '', 33, 8, '2014-01-29 18:23:26', 'INSERT'),
(5, 16, '2014-01-31', '08:25 AM', 3, 'jdngbvjdfn', 'ndobnvfiognvc', '', 33, 8, '2014-01-29 18:25:26', 'INSERT'),
(6, 17, '2014-01-30', '09:25 AM', 3, 'hfbdgfv', 'fgxhbvdfgxv', '', 33, 8, '2014-01-29 18:27:48', 'INSERT'),
(7, 18, '2014-01-29', '05:30 PM', 3, 'GBDFV', 'BGXGFDEFS', '', 33, 8, '2014-01-29 18:30:31', 'INSERT'),
(8, 19, '2014-01-29', '09:30 AM', 3, 'bthfds', 'jghfgfdzvtuikuy gjfhtgr ', '', 33, 8, '2014-01-29 18:32:45', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_commodity_insert`
--

CREATE TABLE `trigger_commodity_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `strength` varchar(255) NOT NULL,
  `commodity_type` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `max_stock` decimal(13,2) NOT NULL,
  `min_stock` decimal(13,2) NOT NULL,
  `remarks` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `trigger_commodity_insert`
--

INSERT INTO `trigger_commodity_insert` (`id`, `commodity_id`, `commodity_name`, `strength`, `commodity_type`, `unit`, `max_stock`, `min_stock`, `remarks`, `transaction_date`, `changetype`) VALUES
(1, 1, 'fnvidnbiv', 'vnuidfb', 'dfbviudbf', 'dfbiuvdi', 1200.00, 120.00, 'f vhudbf v\r\n', '2013-12-21 12:08:03', 'INSERT'),
(2, 2, 'nfgduinvd', 'ndfguindiu', 'nidufgniu', 'ebgiuvbnfi', 13000.00, 130.00, 'dfn vd fi', '2013-12-21 12:08:03', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_commodity_movement_bin_card`
--

CREATE TABLE `trigger_commodity_movement_bin_card` (
  `trigger_commodity_bin_card` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_movement_bin_card_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `opening_bal` decimal(13,2) NOT NULL,
  `closing_bal` decimal(13,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `issues` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `identification_code` varchar(255) NOT NULL,
  `issuing_officer` int(11) NOT NULL,
  `change_type` varchar(255) NOT NULL,
  PRIMARY KEY (`trigger_commodity_bin_card`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `trigger_commodity_movement_bin_card`
--

INSERT INTO `trigger_commodity_movement_bin_card` (`trigger_commodity_bin_card`, `commodity_movement_bin_card_id`, `commodity_name`, `batch_no`, `opening_bal`, `closing_bal`, `expiry_date`, `issues`, `date_added`, `description`, `department`, `identification_code`, `issuing_officer`, `change_type`) VALUES
(1, 1, 'Betapyn', 'BET_002', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-15 12:46:39', 'SDNVISUNGUI', 'Store', 'nvnod', 13, 'BEFORE UPDATE'),
(2, 1, 'Betapyn', 'BET_002', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:32:59', 'DNVISUNGUI', 'Store', 'nvnod', 13, 'AFTER UPDATE'),
(3, 1, 'Betapyn', 'BET_002', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:32:59', 'DNVISUNGUI', 'Store', 'nvnod', 13, 'BEFORE UPDATE'),
(4, 1, 'Betapyn', 'BET_002', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:32:59', 'DNVISUNGUI', 'Store', 'nvnod', 13, 'AFTER UPDATE'),
(5, 2, 'dnbuidb', 'jniu', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:33:43', '', 'Store', 'nvnod', 10, 'INSERT'),
(6, 3, 'dnbuidb', 'gfves', 12.00, 12.00, '0000-00-00', 0.00, '2014-01-16 08:47:09', 'gvsd', 'Store', 'nvnod', 10, 'INSERT'),
(7, 3, 'dnbuidb', 'gfves', 12.00, 12.00, '0000-00-00', 0.00, '2014-01-16 08:47:09', 'gvsd', 'Store', 'nvnod', 10, 'BEFORE UPDATE'),
(8, 3, 'dnbuidb', 'DN_001', 12.00, 12.00, '0000-00-00', 0.00, '2014-01-16 08:47:20', 'gvsd', 'Store', 'nvnod', 10, 'AFTER UPDATE'),
(9, 5, 'Betapyn', '0', 5.00, 5.00, '2015-12-31', 0.00, '2014-01-29 05:20:31', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:LZr1O', 7, 'INSERT'),
(10, 6, 'Betapyn', '0', 5.00, 0.00, '2015-12-31', 0.00, '2014-01-29 05:20:31', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:LZr1O', 7, 'INSERT'),
(11, 7, 'Betapyn', '0', 5.00, 5.00, '2015-12-31', 0.00, '2014-01-29 05:26:37', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:IH3tF', 7, 'INSERT'),
(12, 8, 'Betapyn', '0', 5.00, 0.00, '2015-12-31', 0.00, '2014-01-29 05:26:37', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:IH3tF', 7, 'INSERT'),
(13, 9, 'Betapyn', '0', 5.00, 3.00, '2015-12-31', 2.00, '2014-01-29 05:28:12', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:VJgq3', 7, 'INSERT'),
(14, 10, 'Betapyn', '0', 5.00, 2.00, '2015-12-31', 2.00, '2014-01-29 05:28:12', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:VJgq3', 7, 'INSERT'),
(15, 11, 'Betapyn', 'BET_002', 3.00, 2.00, '2015-12-31', 1.00, '2014-01-29 05:29:01', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:PZD9N', 7, 'INSERT'),
(16, 12, 'Betapyn', 'BET_002', 3.00, 1.00, '2015-12-31', 1.00, '2014-01-29 05:29:01', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:PZD9N', 7, 'INSERT'),
(17, 13, 'Betapyn', 'BET_002', 1.00, 1.00, '2015-12-31', 1.00, '2014-01-30 10:51:44', 'Return to the Main Store from Pharmacy Department', 'Store', 'RET:02QJx', 10, 'INSERT'),
(18, 14, 'Betapyn', 'BET_002', 1.00, 0.00, '2015-12-31', 1.00, '2014-01-30 10:51:45', 'Return to the  Main Store from Pharmacy Department', 'Pharmacy', 'RET:02QJx', 10, 'INSERT'),
(19, 15, 'nfgduinvd', 'nfg_1', 144.00, 130.00, '2014-01-09', 14.00, '2014-01-30 11:01:28', 'Commodity:nfgduinvdhas been dispensed from DepartmentPharmacyto DepartmentPharmacy', '', 'ISS:om0Pu', 13, 'INSERT'),
(20, 16, 'nfgduinvd', 'nfg_1', 0.00, 14.00, '2014-01-09', 14.00, '2014-01-30 11:01:28', 'Commodity:nfgduinvdhas been dispensed from DepartmentPharmacyto DepartmentPharmacy', 'Array', 'ISS:om0Pu', 13, 'INSERT'),
(21, 17, 'fnvidnbiv', '123890', 990.00, 950.00, '0000-00-00', 40.00, '2014-01-30 11:30:59', 'Commodity:fnvidnbivhas been dispensed from DepartmentPharmacistto DepartmentPharmacy', '', 'ISS:C3lrG', 13, 'INSERT'),
(22, 18, 'fnvidnbiv', '123890', 0.00, 40.00, '0000-00-00', 40.00, '2014-01-30 11:30:59', 'Commodity:fnvidnbivhas been dispensed from DepartmentPharmacistto DepartmentPharmacy', 'Array', 'ISS:C3lrG', 13, 'INSERT'),
(23, 19, 'nfgduinvd', 'nfg_2', 144.00, 144.00, '2014-02-28', 0.00, '2014-01-30 12:32:21', 'nfgduinvd has  been received into the store with the  Batch Number :nfg_2.', 'Store', 'REC:0wXnD', 13, 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_commodity_update`
--

CREATE TABLE `trigger_commodity_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `strength` varchar(255) NOT NULL,
  `commodity_type` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `max_stock` decimal(13,2) NOT NULL,
  `min_stock` decimal(13,2) NOT NULL,
  `remarks` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `trigger_commodity_update`
--

INSERT INTO `trigger_commodity_update` (`id`, `commodity_id`, `commodity_name`, `strength`, `commodity_type`, `unit`, `max_stock`, `min_stock`, `remarks`, `transaction_date`, `changetype`) VALUES
(1, 1, 'fnvidnbiv', 'vnuidfb', 'dfbviudbf', 'dfbiuvdi', 1200.00, 120.00, 'f vhudbf v\r\n', '2013-12-22 05:21:07', 'BEFORE_UPDATE'),
(2, 1, 'fnvidnbiv', 'vnuidfb', 'dfbviudbf', 'dfbiuvdi', 12000.00, 120.00, 'f vhudbf v\r\n', '2013-12-22 05:21:07', 'AFTER_UPDATE'),
(3, 2, 'nfgduinvd', 'ndfguindiu', 'nidufgniu', 'ebgiuvbnfi', 13000.00, 130.00, 'dfn vd fi', '2013-12-22 05:21:08', 'BEFORE_UPDATE'),
(4, 2, 'nfgduinvd', 'ndfguindiu', 'nidufgniu', 'ebgiuvbnfi', 130000.00, 130.00, 'dfn vd fi', '2013-12-22 05:21:08', 'AFTER_UPDATE'),
(5, 3, 'nbvigdunf', 'dfonvodfiun', 'Antibiotics', '', 12000.00, 120.00, 'rtdgsfvjymnthbr', '2013-12-30 11:47:58', 'INSERT'),
(6, 4, 'Betapyn', '120mg', 'Pain_Killers', 'tab', 12000.00, 120.00, 'Make cause drowsiness', '2013-12-30 11:50:44', 'INSERT'),
(7, 5, 'dnbuidb', 'vdnbuibdviuvdb', 'Antibiotics', 'activtd powder', 120.00, 110.00, 'nfbibgiufdbn', '2014-01-06 06:46:43', 'INSERT'),
(8, 6, 'jnvidnvifu', 'nviudfn', 'Pain_Killers', 'activtd powder', 129999.00, 1200.00, 'dinibfdniuvb', '2014-01-30 12:14:40', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_consultation_insert`
--

CREATE TABLE `trigger_consultation_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultation_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `complaints` text NOT NULL,
  `medical_history` text NOT NULL,
  `systematic_inquiry` text NOT NULL,
  `examination_findings` text NOT NULL,
  `provisional_diagnosis` text NOT NULL,
  `final_diagnosis` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `trigger_consultation_insert`
--

INSERT INTO `trigger_consultation_insert` (`id`, `consultation_id`, `patient_id`, `visit_id`, `complaints`, `medical_history`, `systematic_inquiry`, `examination_findings`, `provisional_diagnosis`, `final_diagnosis`, `transaction_date`, `changetype`) VALUES
(1, 1, 21, 11, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'gdbnfg', '2013-12-21 11:52:51', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_consultation_update`
--

CREATE TABLE `trigger_consultation_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultation_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `complaints` text NOT NULL,
  `medical_history` text NOT NULL,
  `systematic_inquiry` text NOT NULL,
  `examination_findings` text NOT NULL,
  `provisional_diagnosis` text NOT NULL,
  `final_diagnosis` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `trigger_consultation_update`
--

INSERT INTO `trigger_consultation_update` (`id`, `consultation_id`, `patient_id`, `visit_id`, `complaints`, `medical_history`, `systematic_inquiry`, `examination_findings`, `provisional_diagnosis`, `final_diagnosis`, `transaction_date`, `changetype`) VALUES
(1, 1, 21, 11, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'gdbnfg', '2013-12-21 12:00:29', 'BEFORE_UPDATE'),
(2, 1, 21, 11, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', '2013-12-21 12:00:29', 'AFTER_UPDATE'),
(3, 1, 21, 11, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', '2014-01-05 09:05:40', 'BEFORE_UPDATE'),
(4, 1, 21, 10, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', '2014-01-05 09:05:40', 'AFTER_UPDATE'),
(5, 1, 21, 10, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', '2014-01-06 12:53:43', 'BEFORE_UPDATE'),
(6, 1, 23, 10, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', '2014-01-06 12:53:43', 'AFTER_UPDATE'),
(7, 1, 23, 10, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', '2014-01-06 12:55:58', 'BEFORE_UPDATE'),
(8, 1, 23, 12, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', '2014-01-06 12:55:58', 'AFTER_UPDATE'),
(9, 1, 23, 12, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', '2014-01-06 12:56:40', 'BEFORE_UPDATE'),
(10, 1, 23, 11, 'djf vjdf', ' djvxdfij', ' dfxo vifd', 'ngdoubgu', 'n dfbnviud', 'Needs urgent attention', '2014-01-06 12:56:40', 'AFTER_UPDATE'),
(11, 6, 23, 12, 'nnduvfnfou', 'nfdiunvdfiou', 'vndfunou', 'dfnvudfnv', '', '', '2014-01-06 13:01:38', 'INSERT'),
(12, 7, 23, 12, 'nnduvfnfou', 'nfdiunvdfiou', 'vndfunou', 'dfnvudfnv', '', '', '2014-01-06 13:08:41', 'INSERT'),
(13, 7, 23, 12, 'nnduvfnfou', 'nfdiunvdfiou', 'vndfunou', 'dfnvudfnv', '', '', '2014-01-06 14:03:46', 'BEFORE_UPDATE'),
(14, 7, 23, 14, 'nnduvfnfou', 'nfdiunvdfiou', 'vndfunou', 'dfnvudfnv', '', '', '2014-01-06 14:03:46', 'AFTER_UPDATE'),
(15, 7, 23, 14, 'nnduvfnfou', 'nfdiunvdfiou', 'vndfunou', 'dfnvudfnv', '', '', '2014-01-07 14:09:24', 'BEFORE_UPDATE'),
(16, 7, 2, 14, 'nnduvfnfou', 'nfdiunvdfiou', 'vndfunou', 'dfnvudfnv', '', '', '2014-01-07 14:09:24', 'AFTER_UPDATE'),
(17, 8, 8, 22, 'fnsivdfbnvicdsn', 'vnidfniucidns', 'fdbvidnfiuvx', 'fdbnvidfniguv', '', '', '2014-01-08 03:17:21', 'INSERT'),
(18, 9, 3, 33, 'gfjbnvuidfbnsciu', 'dbfvuibfdiuvbci', 'dfibvuidfbv', 'fdbiuvdbfiuv', '', '', '2014-01-29 08:12:56', 'INSERT'),
(19, 9, 3, 33, 'gfjbnvuidfbnsciu', 'dbfvuibfdiuvbci', 'dfibvuidfbv', 'fdbiuvdbfiuv', '', '', '2014-01-29 12:16:32', 'BEFORE_UPDATE'),
(20, 9, 3, 33, 'gfjbnvuidfbnsciu', 'dbfvuibfdiuvbci', 'dfibvuidfbv', 'fdbiuvdbfiuv', '', '', '2014-01-29 12:16:32', 'AFTER_UPDATE');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_dept_stock_bin_card`
--

CREATE TABLE `trigger_dept_stock_bin_card` (
  `trigger_dept_stock_bin_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_stock_bin_card_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `opening_bal` decimal(13,2) NOT NULL,
  `closing_bal` decimal(13,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `issues` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `identification_code` varchar(255) NOT NULL,
  `issuing_officer` int(11) NOT NULL,
  `change_type` varchar(255) NOT NULL,
  PRIMARY KEY (`trigger_dept_stock_bin_card_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `trigger_dept_stock_bin_card`
--

INSERT INTO `trigger_dept_stock_bin_card` (`trigger_dept_stock_bin_card_id`, `dept_stock_bin_card_id`, `commodity_name`, `batch_no`, `opening_bal`, `closing_bal`, `expiry_date`, `issues`, `date_added`, `description`, `department`, `identification_code`, `issuing_officer`, `change_type`) VALUES
(2, 1, 'Array', 'BET_002', 23.00, 39.00, '0000-00-00', 2015.00, '2014-01-13 09:08:07', '', '', '', 10, 'BEFORE UPDATE'),
(3, 1, 'vfdgv', 'BET_002', 23.00, 39.00, '0000-00-00', 2015.00, '2014-01-16 08:44:56', '', '', '', 10, 'AFTER UPDATE'),
(4, 1, 'vfdgv', 'BET_002', 23.00, 39.00, '0000-00-00', 2015.00, '2014-01-16 08:44:56', '', '', '', 10, 'BEFORE UPDATE'),
(5, 1, 'vfdgv', 'BET_002', 23.00, 39.00, '0000-00-00', 2015.00, '2014-01-16 08:44:56', '', '', '', 10, 'AFTER UPDATE'),
(6, 31, 'kxbvkdnfv', 'vdxvd', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:45:28', 'fdsvdsf', 'Store', 'nvnod', 1, 'INSERT'),
(7, 31, 'kxbvkdnfv', 'vdxvd', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:45:28', 'fdsvdsf', 'Store', 'nvnod', 1, 'BEFORE UPDATE'),
(8, 31, 'kxbvkdnfv', 'KX_001', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:47:51', 'fdsvdsf', 'Store', 'nvnod', 1, 'AFTER UPDATE'),
(10, 33, 'Betapyn', '0', 5.00, 5.00, '2015-12-31', 0.00, '2014-01-29 05:20:31', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:LZr1O', 7, 'INSERT'),
(11, 34, 'Betapyn', '0', 5.00, 0.00, '2015-12-31', 0.00, '2014-01-29 05:20:31', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:LZr1O', 7, 'INSERT'),
(12, 35, 'Betapyn', '0', 5.00, 5.00, '2015-12-31', 0.00, '2014-01-29 05:26:37', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:IH3tF', 7, 'INSERT'),
(13, 36, 'Betapyn', '0', 5.00, 0.00, '2015-12-31', 0.00, '2014-01-29 05:26:37', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:IH3tF', 7, 'INSERT'),
(14, 37, 'Betapyn', '0', 5.00, 3.00, '2015-12-31', 2.00, '2014-01-29 05:28:12', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:VJgq3', 7, 'INSERT'),
(15, 38, 'Betapyn', '0', 5.00, 2.00, '2015-12-31', 2.00, '2014-01-29 05:28:12', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:VJgq3', 7, 'INSERT'),
(16, 39, 'Betapyn', 'BET_002', 3.00, 2.00, '2015-12-31', 1.00, '2014-01-29 05:29:01', 'Return to the Pharmacy from Nurse Department', 'Nurse', 'RET:PZD9N', 7, 'INSERT'),
(17, 40, 'Betapyn', 'BET_002', 3.00, 1.00, '2015-12-31', 1.00, '2014-01-29 05:29:01', 'Return to the Pharmacy from Nurse Department', 'Pharmacy', 'RET:PZD9N', 7, 'INSERT'),
(18, 41, 'Betapyn', 'BET_002', 2.00, 1.00, '2015-12-31', 1.00, '2014-01-30 06:39:27', 'Commodity: Betapyndispensed to a patient:SHWARI_1000002_002', 'Pharmacy', 'ISS:0SrsI', 10, 'INSERT'),
(19, 42, 'Betapyn', 'BET_002', 1.00, 0.00, '2015-12-31', 1.00, '2014-01-30 10:51:44', 'Return to the  Main Store from Pharmacy Department', 'Pharmacy', 'RET:02QJx', 10, 'INSERT'),
(20, 43, 'nfgduinvd', 'nfg_1', 0.00, 14.00, '2014-01-09', 14.00, '2014-01-30 11:01:28', 'Commodity:nfgduinvdhas been dispensed from DepartmentPharmacyto DepartmentPharmacy', 'Array', 'ISS:om0Pu', 13, 'INSERT'),
(21, 44, 'fnvidnbiv', '123890', 0.00, 40.00, '0000-00-00', 40.00, '2014-01-30 11:30:59', 'Commodity:fnvidnbivhas been dispensed from DepartmentPharmacistto DepartmentPharmacy', 'Array', 'ISS:C3lrG', 13, 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_employee_insert`
--

CREATE TABLE `trigger_employee_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `other_name` varchar(255) NOT NULL,
  `id_no` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `residence` varchar(255) NOT NULL,
  `employment_category` varchar(255) NOT NULL,
  `next_of_kin_fname` varchar(255) NOT NULL,
  `next_of_kin_lname` varchar(255) NOT NULL,
  `next_of_kin_relation` varchar(255) NOT NULL,
  `next_of_kin_phone_no` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('Yes','No') NOT NULL,
  `member_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `is_global` enum('Yes','No') NOT NULL,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dept` varchar(255) NOT NULL,
  `random_key` text NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `trigger_employee_insert`
--

INSERT INTO `trigger_employee_insert` (`id`, `employee_id`, `f_name`, `l_name`, `other_name`, `id_no`, `dob`, `gender`, `marital_status`, `phone_no`, `email`, `date_added`, `residence`, `employment_category`, `next_of_kin_fname`, `next_of_kin_lname`, `next_of_kin_relation`, `next_of_kin_phone_no`, `user_name`, `password`, `is_active`, `member_id`, `branch_id`, `is_global`, `changetype`, `transaction_date`, `dept`, `random_key`, `expiry_date`) VALUES
(1, 1, 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 11:44:47', 'Nairobi', 'Global', 'admin', 'admin', 'admin', '0712312345', 'admin', '', '', 0, 0, '', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(2, 2, 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 11:44:47', 'Nairobi', 'Local', 'reception', 'reception', 'reception', '0712987234', 'reception', '', '', 0, 0, '', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(3, 3, 'david', 'otieno', 'otieno', '12345678', '1990-12-26', 'Male', 'Single', '712123456', 'davidotieno@gmail.com', '2013-12-17 16:51:49', 'Nairobi', '4', 'david', 'otieno', 'brother', '0712123456', 'otieno', 'otieno', 'Yes', 10, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(4, 4, 'sharon', 'wanjiru', 'wambui', '12309812', '1990-12-26', 'Female', 'Single', '712098765', 'wanjirusharon@gmail.com', '2013-12-17 16:59:25', 'Nairobi', '3', 'Wanjiru', 'Wa Kinoti', 'Mother', '0712098345', 'wanjiru', '99f16a6c8d12e4f6fcc1151d398ef97f', 'Yes', 11, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(5, 5, 'Ivy', 'Ngetich', 'Ruto', '1235678', '1982-12-12', 'Female', 'Married', '812345121', 'ngetich@gmail.com', '2013-12-17 16:59:25', 'Eldoret', '4', '', '', '', '', '', '', 'Yes', 12, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(6, 7, 'nurse', 'nurse', 'nurse', '1234567', '1990-12-26', 'Female', 'Married', '712345908', 'nurse@gmail.com', '2013-12-17 17:06:07', 'Nairobi', '5', 'nurse', 'nurse', 'employer', '0712123456', 'nurse', '0701aa317da5a004fbf6111545678a6c', 'Yes', 10, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(7, 8, 'doctor', 'doctor', 'doctor', '1235678', '1982-12-12', 'Male', 'Single', '812345121', 'doctor@gmail.com', '2013-12-17 17:06:07', 'Nairobi', '4', 'doctor', 'doctor', 'employer', '0712344567', 'doctor', 'f9f16d97c90d8c6f2cab37bb6d1f1992', 'Yes', 10, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(8, 10, 'pharmacist', 'pharmacist', 'pharmacist', '12345678', '1990-12-26', 'Male', 'Single', '714339521', 'davidotieno@gmail.com', '2013-12-17 17:11:42', 'Nairobi', '6', 'pharmacist', 'pharmacist', 'employer', '0712123456', 'pharmacist', 'fd3051577824ada21b3df777812c66fa', 'Yes', 10, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(9, 11, 'lab', 'lab', 'lab', '1235678', '1982-12-12', 'Male', 'Single', '812345121', 'doctor@gmail.com', '2013-12-17 17:11:42', 'Eldoret', '7', 'lab', 'lab', 'employer', '0712344567', 'lab', 'f9664ea1803311b35f81d07d8c9e072d', 'Yes', 10, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(10, 13, 'store', 'store', 'store', '12345678', '1990-12-26', 'Male', 'Single', '714339521', 'store@gmail.com', '2013-12-17 17:41:58', 'Nairobi', '11', 'store', 'store', 'store', 'store', 'store', '8cd892b7b97ef9489ae4479d3f4ef0fc', 'Yes', 10, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_employee_update`
--

CREATE TABLE `trigger_employee_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(255) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `other_name` varchar(255) NOT NULL,
  `id_no` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `marital_status` enum('Single','Divorced','Married') NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `residence` varchar(255) NOT NULL,
  `employment_category` enum('Doctor','Lab','Pharmacy','Nurse') NOT NULL,
  `next_of_kin_fname` varchar(255) NOT NULL,
  `next_of_kin_lname` varchar(255) NOT NULL,
  `next_of_kin_relation` varchar(255) NOT NULL,
  `next_of_kin_phone_no` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('Yes','No') NOT NULL,
  `member_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `is_global` enum('Yes','No') NOT NULL,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dept` varchar(255) NOT NULL,
  `random_key` text NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=283 ;

--
-- Dumping data for table `trigger_employee_update`
--

INSERT INTO `trigger_employee_update` (`id`, `employee_id`, `f_name`, `l_name`, `other_name`, `id_no`, `dob`, `gender`, `marital_status`, `phone_no`, `email`, `date_added`, `residence`, `employment_category`, `next_of_kin_fname`, `next_of_kin_lname`, `next_of_kin_relation`, `next_of_kin_phone_no`, `user_name`, `password`, `is_active`, `member_id`, `branch_id`, `is_global`, `changetype`, `transaction_date`, `dept`, `random_key`, `expiry_date`) VALUES
(1, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 11:44:47', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', '', 0, 0, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(2, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 11:46:04', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', '', 0, 0, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(3, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 11:44:47', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', '', 0, 0, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(4, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 11:44:47', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', '', 0, 0, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(5, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 11:46:04', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', '', 0, 0, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(6, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 11:46:04', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', '', 0, 0, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(7, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 11:44:47', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(8, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 12:59:37', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(9, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 11:46:04', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(10, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 12:59:37', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(11, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 12:59:37', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(12, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 15:55:38', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(13, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 15:55:38', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(14, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 15:55:38', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(15, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 15:55:38', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(16, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 15:58:44', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(17, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 15:58:44', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(18, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:00:02', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(19, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:00:02', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(20, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:00:02', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(21, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:00:02', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(22, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:01', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(23, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:01', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(24, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(25, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(26, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(27, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 12:59:37', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(28, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 16:05:11', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(29, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(30, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(31, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(32, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(33, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(34, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(35, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(36, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(37, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:03:18', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(38, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:14:04', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(39, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:14:04', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(40, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:17:29', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(41, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 16:05:11', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(42, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 16:19:47', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(43, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '0000-00-00 00:00:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(44, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '0000-00-00 00:00:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(45, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '0000-00-00 00:00:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(46, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '0000-00-00 00:00:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(47, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:48:12', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(48, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:48:12', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(49, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:50:43', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(50, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:50:43', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(51, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:54:05', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(52, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:54:05', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(53, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '0000-00-00 00:00:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(54, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '0000-00-00 00:00:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(55, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:06:25', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(56, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:06:25', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(57, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:07:28', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(58, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:07:28', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(59, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:07:52', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(60, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:07:52', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(61, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:08:32', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(62, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 16:08:32', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(63, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 17:10:46', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(64, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 17:10:46', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(65, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 19:13:17', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(66, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 19:13:17', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(67, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 19:13:17', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(68, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 17:29:10', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(69, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-27 17:29:10', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(70, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 05:52:17', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '', 'Yes', 0, 0, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(71, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 05:52:17', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(72, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 06:27:20', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(73, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 06:27:20', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(74, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 06:29:36', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(75, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 06:29:36', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(76, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 06:29:56', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(77, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-27 16:19:47', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(78, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:31:13', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'No', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(79, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:31:13', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(80, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:34:04', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(81, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:34:04', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(82, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:36:13', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(83, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:36:13', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(84, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:37:46', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(85, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:37:46', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(86, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:46:22', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(87, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:46:22', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(88, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:47:18', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(89, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:47:18', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(90, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:49:01', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(91, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:49:01', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(92, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:55:46', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(93, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:55:46', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(94, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:57:28', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(95, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:57:28', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(96, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:57:44', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(97, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 06:57:44', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(98, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 07:14:26', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'No', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(99, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 07:14:26', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(100, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 07:51:01', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'c78c41f02dfdcff5396dcd20a5954125', 'No', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(101, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 06:29:56', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(102, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 08:03:25', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(103, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 08:03:25', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(104, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 08:11:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(105, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 07:51:01', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'c78c41f02dfdcff5396dcd20a5954125', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(106, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:27:40', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'b0edd6bc420cecf8cb0dc5e6176f7239', 'No', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(107, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:27:40', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'b0edd6bc420cecf8cb0dc5e6176f7239', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(108, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:28:12', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'reception', 'No', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(109, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:28:12', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'reception', 'No', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(110, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:28:34', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'reception', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(111, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:28:34', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'reception', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(112, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:37:42', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(113, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:37:42', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(114, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:54:51', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(115, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 08:11:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(116, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 14:46:07', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(117, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 14:46:07', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(118, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 14:47:12', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(119, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 14:47:12', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(120, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 14:48:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(121, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 14:48:00', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(122, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 15:14:08', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(123, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 15:14:08', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(124, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 15:15:07', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(125, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-11-28 15:15:07', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(126, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:14:58', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(127, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-11-28 08:54:51', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(128, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 05:17:23', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'e10adc3949ba59abbe56e057f20f883e', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(129, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 05:17:23', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', 'e10adc3949ba59abbe56e057f20f883e', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(130, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 05:18:00', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(131, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:14:58', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(132, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:18:22', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(133, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:18:22', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(134, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:18:22', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(135, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 05:18:00', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(136, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 05:18:00', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(137, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:18:22', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(138, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:18:22', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(139, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:18:22', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(140, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:41:50', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(141, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 05:41:50', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(142, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 06:38:35', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(143, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 05:18:00', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(144, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 06:38:40', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(145, '1', 'admin', 'admin', 'admin', '12345678', '2013-11-27', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 06:38:35', 'Nairobi', '', 'admin', 'admin', 'admin', '0712312345', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(146, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:18:06', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(147, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:18:06', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(148, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:26:35', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00');
INSERT INTO `trigger_employee_update` (`id`, `employee_id`, `f_name`, `l_name`, `other_name`, `id_no`, `dob`, `gender`, `marital_status`, `phone_no`, `email`, `date_added`, `residence`, `employment_category`, `next_of_kin_fname`, `next_of_kin_lname`, `next_of_kin_relation`, `next_of_kin_phone_no`, `user_name`, `password`, `is_active`, `member_id`, `branch_id`, `is_global`, `changetype`, `transaction_date`, `dept`, `random_key`, `expiry_date`) VALUES
(149, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:26:35', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(150, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:27:15', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(151, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:27:15', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(152, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:29:37', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(153, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:29:37', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(154, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:36:10', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(155, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:36:10', 'Nairobi', '', 'admin', '0712312345', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(156, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:36:14', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(157, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:36:14', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(158, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:36:18', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(159, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:36:18', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(160, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:57:25', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(161, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 06:38:40', 'Nairobi', '', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(162, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 08:57:43', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(163, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 08:57:25', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(164, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 09:51:43', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(165, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 09:51:43', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(166, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 09:51:43', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(167, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 09:51:43', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(168, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:05:26', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(169, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:05:26', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(170, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:08:57', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(171, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:08:57', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(172, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:10:48', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(173, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:10:48', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(174, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:12:06', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(175, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:12:06', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(176, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:17:53', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(177, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:17:53', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(178, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:18:41', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(179, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:18:41', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(180, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:20:03', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(181, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:20:03', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(182, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:21:18', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(183, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:21:18', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(184, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:21:18', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(185, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:21:18', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(186, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:25:39', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(187, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:25:39', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(188, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:26:24', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(189, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:26:24', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(190, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:27:46', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(191, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:27:46', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(192, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:28:27', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(193, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:28:27', 'Nairobi', 'Pharmacy', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(194, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:29:10', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(195, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 10:29:10', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(196, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(197, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(198, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(199, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(200, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(201, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(202, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(203, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(204, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(205, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:31:44', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(206, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:45:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(207, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:45:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(208, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:45:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(209, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:45:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(210, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:45:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(211, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:45:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(212, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:45:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(213, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:45:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(214, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:54:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(215, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:54:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(216, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:55:22', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(217, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:55:22', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(218, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:58:18', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(219, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 12:58:18', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(220, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 13:01:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(221, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 13:01:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(222, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 13:01:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(223, '1', 'admin', 'admin', 'administrator', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 13:01:46', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(224, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 13:05:03', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(225, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 13:05:03', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(226, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 13:05:03', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(227, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-02 13:05:03', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 1, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(228, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-04 07:03:00', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, '', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(229, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-02 08:57:43', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 1, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(230, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-04 07:03:02', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 10, 1, 'No', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(231, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-04 07:03:00', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, '', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(232, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 06:52:30', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(233, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-04 07:03:02', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 10, 1, 'No', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(234, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-06 06:52:37', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(235, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 06:52:30', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(236, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:40:33', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(237, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:40:33', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(238, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:40:33', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(239, '1', 'admin', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:40:33', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(240, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:42:32', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(241, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:42:32', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(242, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:42:32', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(243, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:42:32', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(244, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:53:36', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(245, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:53:36', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(246, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:54:00', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(247, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:54:00', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(248, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:54:00', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(249, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:54:00', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(250, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:57:21', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(251, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:57:21', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(252, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:57:29', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(253, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:57:29', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(254, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:57:29', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(255, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-06 06:52:37', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(256, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-06 12:08:25', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'No', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(257, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-06 09:57:29', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'No', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(258, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-07 06:30:31', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(259, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-06 12:08:25', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'No', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(260, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-06 09:24:49', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(261, '3', 'david', 'otieno', 'otieno', '12345678', '1990-12-26', 'Male', 'Single', '712123456', 'davidotieno@gmail.com', '2013-12-17 16:51:49', 'Nairobi', 'Nurse', 'david', 'otieno', 'brother', '0712123456', 'otieno', 'otieno', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(262, '3', 'david', 'otieno', 'otieno', '12345678', '1990-12-26', 'Male', 'Single', '712123456', 'davidotieno@gmail.com', '2013-12-17 16:52:24', 'Nairobi', 'Nurse', 'david', 'otieno', 'brother', '0712123456', 'otieno', 'otieno', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(263, '3', 'david', 'otieno', 'otieno', '12345678', '1990-12-26', 'Male', 'Single', '712123456', 'davidotieno@gmail.com', '2013-12-17 16:52:24', 'Nairobi', 'Nurse', 'david', 'otieno', 'brother', '0712123456', 'otieno', 'otieno', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(264, '3', 'david', 'otieno', 'otieno', '12345678', '1990-12-26', 'Male', 'Single', '712123456', 'davidotieno@gmail.com', '2013-12-17 17:01:08', 'Nairobi', 'Nurse', 'david', 'otieno', 'brother', '0712123456', 'otieno', 'bf3a66a531e7b93155ce3eafac68e99d', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(265, '5', 'Ivy', 'Ngetich', 'Ruto', '1235678', '1982-12-12', 'Female', 'Married', '812345121', 'ngetich@gmail.com', '2013-12-17 16:59:25', 'Eldoret', 'Nurse', '', '', '', '', '', '', 'Yes', 12, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(266, '5', 'Ivy', 'Ngetich', 'Ruto', '1235678', '1982-12-12', 'Female', 'Married', '812345121', 'ngetich@gmail.com', '2013-12-17 17:01:08', 'Eldoret', 'Nurse', '', '', '', '', '8704dfc67f4f77167b974c3af2f16d35', '8704dfc67f4f77167b974c3af2f16d35', 'Yes', 12, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(267, '5', 'Ivy', 'Ngetich', 'Ruto', '1235678', '1982-12-12', 'Female', 'Married', '812345121', 'ngetich@gmail.com', '2013-12-17 17:01:08', 'Eldoret', 'Nurse', '', '', '', '', '8704dfc67f4f77167b974c3af2f16d35', '8704dfc67f4f77167b974c3af2f16d35', 'Yes', 12, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(268, '5', 'Ivy', 'Ngetich', 'Ruto', '1235678', '1982-12-12', 'Female', 'Married', '812345121', 'ngetich@gmail.com', '2013-12-17 17:12:18', 'Eldoret', 'Nurse', '', '', '', '', 'ngetich', '8704dfc67f4f77167b974c3af2f16d35', 'Yes', 12, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(269, '13', 'store', 'store', 'store', '12345678', '1990-12-26', 'Male', 'Single', '714339521', 'store@gmail.com', '2013-12-17 17:41:58', 'Nairobi', '', 'store', 'store', 'store', 'store', 'store', '8cd892b7b97ef9489ae4479d3f4ef0fc', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(270, '13', 'store', 'store', 'store', '12345678', '1990-12-26', 'Male', 'Single', '714339521', 'store@gmail.com', '2013-12-17 17:42:39', 'Nairobi', '', 'store', 'store', 'store', 'store', 'store', '8cd892b7b97ef9489ae4479d3f4ef0fc', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(271, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-07 06:30:31', 'Nairobi', '', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(272, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-17 17:50:37', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(273, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-17 17:50:37', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(274, '1', 'No', 'administrator', 'admin', '12345678', '0000-00-00', 'Male', 'Single', '711098123', 'harrisdindisamuel@gmail.com', '2013-12-17 17:50:37', 'Nairobi', 'Lab', 'admin', '0712312345', 'nvsiunsfiue', 'kjsngvjkernsfg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(275, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-06 09:24:49', 'Nairobi', 'Pharmacy', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(276, '2', 'reception', 'reception', 'reception', '12309823', '2013-11-27', 'Female', 'Single', '714189234', 'harris.samuel@strathmore.edu', '2013-12-17 17:51:01', 'Nairobi', 'Doctor', 'reception', 'reception', 'reception', '0712987234', 'reception', '1da95b279fc0d21024cece2c68a4c200', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(277, '14', 'radiology', 'radiology', 'radiology', 'radiology', '0000-00-00', 'Male', 'Single', '2147483647', 'nbufgdnfuds', '2014-01-07 02:39:56', 'fbngdun', '', 'bngiodnfs', 'dngbdgn', 'fdvfd', 'gbfgfd', 'radiology', 'a3cf66963cec3d59abb731b6ce910c6e', 'Yes', 10, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(278, '14', 'radiology', 'radiology', 'radiology', 'radiology', '0000-00-00', 'Male', 'Single', '2147483647', 'nbufgdnfuds', '2014-01-07 02:39:56', 'fbngdun', '', 'bngiodnfs', 'dngbdgn', 'fdvfd', 'gbfgfd', 'radiology', 'a3cf66963cec3d59abb731b6ce910c6e', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(279, '14', 'radiology', 'radiology', 'radiology', 'radiology', '0000-00-00', 'Male', 'Single', '2147483647', 'nbufgdnfuds', '2014-01-07 02:41:49', 'fbngdun', '', 'bngiodnfs', 'dngbdgn', 'fdvfd', 'gbfgfd', 'radiology', 'a3cf66963cec3d59abb731b6ce910c6e', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(280, '18', 'cashier', 'cashier', 'cashier', 'cashier', '1990-12-26', 'Male', 'Single', '714339521', 'davidotieno@gmail.com', '2014-01-09 10:47:51', 'Nairobi', 'Doctor', 'bngiodnfs', 'Dindi', 'brother', '0712123456', 'cashier', '6ac2470ed8ccf204fd5ff89b32a355cf', 'Yes', 10, 1, 'Yes', 'INSERT', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(281, '18', 'cashier', 'cashier', 'cashier', 'cashier', '1990-12-26', 'Male', 'Single', '714339521', 'davidotieno@gmail.com', '2014-01-09 10:47:51', 'Nairobi', 'Doctor', 'bngiodnfs', 'Dindi', 'brother', '0712123456', 'cashier', '6ac2470ed8ccf204fd5ff89b32a355cf', 'Yes', 10, 1, 'Yes', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(282, '18', 'cashier', 'cashier', 'cashier', 'cashier', '1990-12-26', 'Male', 'Single', '714339521', 'davidotieno@gmail.com', '2014-01-09 10:48:46', 'Nairobi', '', 'bngiodnfs', 'Dindi', 'brother', '0712123456', 'cashier', '6ac2470ed8ccf204fd5ff89b32a355cf', 'Yes', 10, 1, 'Yes', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_lab_test_result_insert`
--

CREATE TABLE `trigger_lab_test_result_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_test_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_results` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_lab_test_result_update`
--

CREATE TABLE `trigger_lab_test_result_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_test_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `test` varchar(11) NOT NULL,
  `test_results` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `trigger_lab_test_result_update`
--

INSERT INTO `trigger_lab_test_result_update` (`id`, `lab_test_id`, `patient_id`, `visit_id`, `test`, `test_results`, `transaction_date`, `changetype`) VALUES
(1, 2, 3, 11, 'dfvfcds', 'bxvdfs', '2014-01-06 13:33:01', 'INSERT'),
(2, 3, 23, 12, 'Stool Test', '', '2014-01-06 13:34:13', 'INSERT'),
(3, 3, 23, 14, 'Stool Test', '', '2014-01-06 13:39:16', 'AFTER UPDATE'),
(4, 3, 23, 14, 'Stool Test', '', '2014-01-06 13:39:16', 'AFTER UPDATE'),
(5, 2, 3, 14, 'dfvfcds', 'bxvdfs', '2014-01-06 13:40:52', 'AFTER UPDATE'),
(6, 2, 3, 14, 'dfvfcds', 'bxvdfs', '2014-01-06 13:40:52', 'AFTER UPDATE'),
(7, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-06 13:47:33', 'AFTER UPDATE'),
(8, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-06 13:47:33', 'AFTER UPDATE'),
(9, 3, 23, 14, 'Stool Test', 'vnduinviufdni djfnviudnfv dfnsvudfni', '2014-01-06 13:47:53', 'AFTER UPDATE'),
(10, 3, 23, 14, 'Stool Test', 'vnduinviufdni djfnviudnfv dfnsvudfni', '2014-01-06 13:47:53', 'AFTER UPDATE'),
(11, 3, 23, 14, 'Stool Test', 'vnduinviufdni djfnviudnfv dfnsvudfni', '2014-01-06 14:21:23', 'AFTER UPDATE'),
(12, 3, 23, 14, 'Stool Test', 'vnduinviufdni djfnviudnfv dfnsvudfni', '2014-01-06 14:21:23', 'AFTER UPDATE'),
(13, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-06 14:26:29', 'AFTER UPDATE'),
(14, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-06 14:26:29', 'AFTER UPDATE'),
(15, 3, 23, 12, 'Stool Test', 'vnduinviufdni djfnviudnfv dfnsvudfni', '2014-01-06 14:27:27', 'AFTER UPDATE'),
(16, 3, 23, 12, 'Stool Test', 'vnduinviufdni djfnviudnfv dfnsvudfni', '2014-01-06 14:27:27', 'AFTER UPDATE'),
(17, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:28:02', 'AFTER UPDATE'),
(18, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:28:02', 'AFTER UPDATE'),
(19, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-06 14:39:14', 'AFTER UPDATE'),
(20, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-06 14:39:14', 'AFTER UPDATE'),
(21, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-06 14:39:16', 'AFTER UPDATE'),
(22, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-06 14:39:16', 'AFTER UPDATE'),
(23, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:39:22', 'AFTER UPDATE'),
(24, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:39:22', 'AFTER UPDATE'),
(25, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:39:24', 'AFTER UPDATE'),
(26, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:39:24', 'AFTER UPDATE'),
(27, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:46:02', 'AFTER UPDATE'),
(28, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:46:02', 'AFTER UPDATE'),
(29, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:47:56', 'AFTER UPDATE'),
(30, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:47:56', 'AFTER UPDATE'),
(31, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:48:22', 'AFTER UPDATE'),
(32, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:48:22', 'AFTER UPDATE'),
(33, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:48:25', 'AFTER UPDATE'),
(34, 3, 23, 12, 'Stool Test', '', '2014-01-06 14:48:25', 'AFTER UPDATE'),
(35, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 02:57:21', 'AFTER UPDATE'),
(36, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 02:57:21', 'AFTER UPDATE'),
(37, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 02:59:52', 'AFTER UPDATE'),
(38, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 02:59:52', 'AFTER UPDATE'),
(39, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 03:00:47', 'AFTER UPDATE'),
(40, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 03:00:47', 'AFTER UPDATE'),
(41, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 03:04:37', 'AFTER UPDATE'),
(42, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 03:04:37', 'AFTER UPDATE'),
(43, 3, 23, 12, 'Stool Test', '', '2014-01-07 03:05:33', 'AFTER UPDATE'),
(44, 3, 23, 12, 'Stool Test', '', '2014-01-07 03:05:33', 'AFTER UPDATE'),
(45, 3, 23, 12, 'Stool Test', '', '2014-01-07 06:59:15', 'AFTER UPDATE'),
(46, 3, 23, 12, 'Stool Test', '', '2014-01-07 06:59:15', 'AFTER UPDATE'),
(47, 3, 23, 12, 'Stool Test', '', '2014-01-07 06:59:21', 'AFTER UPDATE'),
(48, 3, 23, 12, 'Stool Test', '', '2014-01-07 06:59:21', 'AFTER UPDATE'),
(49, 3, 23, 12, 'Stool Test', '', '2014-01-07 06:59:37', 'AFTER UPDATE'),
(50, 3, 23, 12, 'Stool Test', '', '2014-01-07 06:59:37', 'AFTER UPDATE'),
(51, 3, 23, 12, 'Stool Test', '', '2014-01-07 07:14:38', 'AFTER UPDATE'),
(52, 3, 23, 12, 'Stool Test', '', '2014-01-07 07:14:38', 'AFTER UPDATE'),
(53, 3, 23, 12, 'Stool Test', '', '2014-01-07 07:15:30', 'AFTER UPDATE'),
(54, 3, 23, 12, 'Stool Test', '', '2014-01-07 07:15:30', 'AFTER UPDATE'),
(55, 3, 23, 12, 'Stool Test', '', '2014-01-07 07:15:58', 'AFTER UPDATE'),
(56, 3, 23, 12, 'Stool Test', '', '2014-01-07 07:15:58', 'AFTER UPDATE'),
(57, 3, 23, 12, 'Stool Test', 'jgnbvuisndfiocidfnx vdnbvuoidsnfoieusd', '2014-01-07 07:27:59', 'AFTER UPDATE'),
(58, 3, 23, 12, 'Stool Test', 'jgnbvuisndfiocidfnx vdnbvuoidsnfoieusd', '2014-01-07 07:27:59', 'AFTER UPDATE'),
(59, 4, 23, 12, 'Malaria Tes', '', '2014-01-07 07:28:15', 'INSERT'),
(60, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 08:46:03', 'AFTER UPDATE'),
(61, 2, 3, 14, 'dfvfcds', ' nfdjidin f', '2014-01-07 08:46:03', 'AFTER UPDATE'),
(62, 4, 23, 12, 'Malaria Tes', '', '2014-01-07 08:46:03', 'AFTER UPDATE'),
(63, 4, 23, 12, 'Malaria Tes', '', '2014-01-07 08:46:03', 'AFTER UPDATE'),
(65, 6, 23, 12, 'X-Ray', '', '2014-01-20 12:37:53', 'INSERT'),
(66, 7, 23, 12, 'CT-Scan', '', '2014-01-20 12:39:45', 'INSERT'),
(67, 8, 23, 12, 'CT-Scan', '', '2014-01-20 12:47:05', 'INSERT'),
(68, 9, 23, 12, 'Malaria Tes', '', '2014-01-21 01:48:21', 'INSERT'),
(69, 10, 23, 12, 'Stool Test', '', '2014-01-21 14:03:10', 'INSERT'),
(70, 11, 3, 33, 'Malaria Tes', '', '2014-01-29 08:13:21', 'INSERT'),
(71, 11, 3, 33, 'Malaria Tes', '', '2014-01-29 10:46:51', 'AFTER UPDATE'),
(72, 11, 3, 33, 'Malaria Tes', '', '2014-01-29 10:46:51', 'AFTER UPDATE'),
(73, 11, 3, 33, 'Malaria Tes', 'nviudbgiuvfdigubvgiudfbiuvnfgiudbiuvbn    fkjgbnigfdbnuigv dfinbfiubcniubfngiuc dnbfiubuifgd', '2014-01-29 11:10:21', 'AFTER UPDATE'),
(74, 11, 3, 33, 'Malaria Tes', 'nviudbgiuvfdigubvgiudfbiuvnfgiudbiuvbn    fkjgbnigfdbnuigv dfinbfiubcniubfngiuc dnbfiubuifgd', '2014-01-29 11:10:21', 'AFTER UPDATE'),
(75, 12, 3, 33, 'Stool Test', '', '2014-01-29 11:41:31', 'INSERT'),
(76, 11, 3, 33, 'Malaria Tes', 'nviudbgiuvfdigubvgiudfbiuvnfgiudbiuvbn    fkjgbnigfdbnuigv dfinbfiubcniubfngiuc dnbfiubuifgd', '2014-01-29 11:56:32', 'AFTER UPDATE'),
(77, 11, 3, 33, 'Malaria Tes', 'nviudbgiuvfdigubvgiudfbiuvnfgiudbiuvbn    fkjgbnigfdbnuigv dfinbfiubcniubfngiuc dnbfiubuifgd', '2014-01-29 11:56:32', 'AFTER UPDATE'),
(78, 12, 3, 33, 'Stool Test', '', '2014-01-29 11:56:32', 'AFTER UPDATE'),
(79, 12, 3, 33, 'Stool Test', '', '2014-01-29 11:56:32', 'AFTER UPDATE'),
(80, 12, 3, 33, 'Stool Test', 'jbdviudbfiu nduibnvui ndiuvbdiu dfbnvuibdf', '2014-01-29 11:57:44', 'AFTER UPDATE'),
(81, 12, 3, 33, 'Stool Test', 'jbdviudbfiu nduibnvui ndiuvbdiu dfbnvuibdf', '2014-01-29 11:57:44', 'AFTER UPDATE'),
(82, 11, 3, 33, 'Malaria Tes', 'nviudbgiuvfdigubvgiudfbiuvnfgiudbiuvbn    fkjgbnigfdbnuigv dfinbfiubcniubfngiuc dnbfiubuifgd', '2014-01-29 12:59:58', 'AFTER UPDATE'),
(83, 11, 3, 33, 'Malaria Tes', 'nviudbgiuvfdigubvgiudfbiuvnfgiudbiuvbn    fkjgbnigfdbnuigv dfinbfiubcniubfngiuc dnbfiubuifgd', '2014-01-29 12:59:58', 'AFTER UPDATE'),
(84, 12, 3, 33, 'Stool Test', 'jbdviudbfiu nduibnvui ndiuvbdiu dfbnvuibdf', '2014-01-29 12:59:58', 'AFTER UPDATE'),
(85, 12, 3, 33, 'Stool Test', 'jbdviudbfiu nduibnvui ndiuvbdiu dfbnvuibdf', '2014-01-29 12:59:58', 'AFTER UPDATE');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_login_logs_insert`
--

CREATE TABLE `trigger_login_logs_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_logs_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `login_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` enum('Active','In_Active') NOT NULL,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `trigger_login_logs_insert`
--

INSERT INTO `trigger_login_logs_insert` (`id`, `login_logs_id`, `employee_id`, `user_name`, `login_date`, `is_active`, `changetype`) VALUES
(1, 2, 2, '', '2013-11-27 13:04:17', 'Active', 'INSERT'),
(2, 3, 2, '', '2013-11-28 06:58:17', 'Active', 'INSERT'),
(3, 4, 2, '', '2013-11-28 08:40:05', 'Active', 'INSERT'),
(4, 5, 2, '', '2013-11-28 09:05:02', 'Active', 'INSERT'),
(5, 6, 2, '', '2013-11-28 12:28:33', 'Active', 'INSERT'),
(6, 7, 2, '', '2013-11-28 12:29:58', 'Active', 'INSERT'),
(7, 8, 2, '', '2013-12-01 12:34:38', 'Active', 'INSERT'),
(8, 9, 2, '', '2013-12-01 15:40:08', 'Active', 'INSERT'),
(9, 10, 2, '', '2013-12-02 05:24:15', 'Active', 'INSERT'),
(10, 11, 2, '', '2013-12-02 05:29:06', 'Active', 'INSERT'),
(11, 12, 2, '', '2013-12-02 05:36:51', 'Active', 'INSERT'),
(12, 13, 1, '', '2013-12-02 05:41:58', 'Active', 'INSERT'),
(13, 14, 1, '', '2013-12-02 05:42:33', 'Active', 'INSERT'),
(14, 15, 1, '', '2013-12-02 06:29:39', 'Active', 'INSERT'),
(15, 16, 1, '', '2013-12-02 06:56:31', 'Active', 'INSERT'),
(16, 17, 1, '', '2013-12-02 07:45:46', 'Active', 'INSERT'),
(17, 18, 1, '', '2013-12-02 08:03:33', 'Active', 'INSERT'),
(18, 19, 1, '', '2013-12-02 08:26:03', 'Active', 'INSERT'),
(19, 20, 1, '', '2013-12-02 08:26:48', 'Active', 'INSERT'),
(20, 21, 1, '', '2013-12-02 08:27:32', 'Active', 'INSERT'),
(21, 22, 1, '', '2013-12-02 08:31:44', 'Active', 'INSERT'),
(22, 23, 1, '', '2013-12-02 08:37:08', 'Active', 'INSERT'),
(23, 24, 2, '', '2013-12-02 08:38:23', 'Active', 'INSERT'),
(24, 25, 1, '', '2013-12-02 09:02:33', 'Active', 'INSERT'),
(25, 26, 1, '', '2013-12-02 10:04:54', 'Active', 'INSERT'),
(26, 27, 1, '', '2013-12-02 10:08:39', 'Active', 'INSERT'),
(27, 28, 1, '', '2013-12-02 10:10:24', 'Active', 'INSERT'),
(28, 29, 1, '', '2013-12-02 10:11:45', 'Active', 'INSERT'),
(29, 30, 1, '', '2013-12-02 10:17:29', 'Active', 'INSERT'),
(30, 31, 1, '', '2013-12-02 10:18:24', 'Active', 'INSERT'),
(31, 32, 1, '', '2013-12-02 10:19:39', 'Active', 'INSERT'),
(32, 33, 1, '', '2013-12-02 11:22:42', 'Active', 'INSERT'),
(33, 34, 1, '', '2013-12-03 06:21:45', 'Active', 'INSERT'),
(34, 35, 1, '', '2013-12-03 11:33:00', 'Active', 'INSERT'),
(35, 36, 1, '', '2013-12-03 11:40:03', 'Active', 'INSERT'),
(36, 37, 1, '', '2013-12-03 13:35:05', 'Active', 'INSERT'),
(37, 38, 1, '', '2013-12-06 07:34:37', 'Active', 'INSERT'),
(38, 39, 1, '', '2013-12-07 06:30:38', 'Active', 'INSERT'),
(39, 40, 1, '', '2013-12-06 08:03:34', 'Active', 'INSERT'),
(40, 41, 2, '', '2013-12-06 09:24:56', 'Active', 'INSERT'),
(41, 42, 2, '', '2013-12-06 10:14:32', 'Active', 'INSERT'),
(42, 43, 2, '', '2013-12-06 11:34:33', 'Active', 'INSERT'),
(43, 44, 2, '', '2013-12-16 02:18:19', 'Active', 'INSERT'),
(44, 45, 2, '', '2013-12-16 05:23:34', 'Active', 'INSERT'),
(45, 46, 2, '', '2013-12-16 05:28:21', 'Active', 'INSERT'),
(46, 47, 2, '', '2013-12-16 08:21:13', 'Active', 'INSERT'),
(47, 48, 2, '', '2013-12-16 10:11:07', 'Active', 'INSERT'),
(48, 49, 2, '', '2013-12-16 13:55:15', 'Active', 'INSERT'),
(49, 50, 2, '', '2013-12-16 14:17:38', 'Active', 'INSERT'),
(50, 51, 2, '', '2013-12-17 05:24:11', 'Active', 'INSERT'),
(51, 52, 2, '', '2013-12-17 05:44:35', 'Active', 'INSERT'),
(52, 53, 2, '', '2013-12-17 10:34:09', 'Active', 'INSERT'),
(53, 54, 2, '', '2013-12-17 11:03:06', 'Active', 'INSERT'),
(54, 55, 1, '', '2013-12-17 12:28:33', 'Active', 'INSERT'),
(55, 56, 2, '', '2013-12-17 12:30:35', 'Active', 'INSERT'),
(56, 57, 2, '', '2013-12-17 12:39:44', 'Active', 'INSERT'),
(57, 58, 1, '', '2013-12-17 12:49:35', 'Active', 'INSERT'),
(58, 59, 2, 'reception', '2013-12-17 12:51:26', 'Active', 'INSERT'),
(59, 58, 1, 'Admin', '2013-12-17 12:54:08', 'In_Active', 'AFTER_UPDATE'),
(60, 59, 2, 'reception', '2013-12-17 12:54:19', 'In_Active', 'AFTER_UPDATE'),
(61, 60, 1, 'admin', '2013-12-17 12:55:06', 'Active', 'INSERT'),
(62, 60, 1, 'admin', '2013-12-17 12:55:14', 'In_Active', 'AFTER_UPDATE'),
(63, 61, 8, 'doctor', '2013-12-17 17:12:52', 'Active', 'INSERT'),
(64, 62, 7, 'nurse', '2013-12-17 17:14:11', 'Active', 'INSERT'),
(65, 63, 7, 'nurse', '2013-12-17 17:14:51', 'Active', 'INSERT'),
(66, 64, 8, 'doctor', '2013-12-17 17:21:00', 'Active', 'INSERT'),
(67, 65, 7, 'nurse', '2013-12-17 17:21:12', 'Active', 'INSERT'),
(68, 64, 8, 'doctor', '2013-12-17 17:35:56', 'In_Active', 'AFTER_UPDATE'),
(69, 66, 10, 'pharmacist', '2013-12-17 17:36:07', 'Active', 'INSERT'),
(70, 67, 10, 'pharmacist', '2013-12-17 17:36:43', 'Active', 'INSERT'),
(71, 67, 10, 'pharmacist', '2013-12-17 17:42:47', 'In_Active', 'AFTER_UPDATE'),
(72, 68, 13, 'store', '2013-12-17 17:42:52', 'Active', 'INSERT'),
(73, 65, 7, 'nurse', '2013-12-17 17:44:28', 'In_Active', 'AFTER_UPDATE'),
(74, 69, 13, 'store', '2013-12-17 17:44:37', 'Active', 'INSERT'),
(75, 70, 2, 'reception', '2013-12-17 17:49:02', 'Active', 'INSERT'),
(76, 71, 1, 'admin', '2013-12-17 17:49:54', 'Active', 'INSERT'),
(77, 72, 1, 'admin', '2013-12-17 17:51:10', 'Active', 'INSERT'),
(78, 72, 1, 'admin', '2013-12-17 17:51:16', 'In_Active', 'AFTER_UPDATE'),
(79, 73, 2, 'reception', '2013-12-17 17:51:23', 'Active', 'INSERT'),
(80, 74, 2, 'reception', '2013-12-18 16:33:57', 'Active', 'INSERT'),
(81, 75, 2, 'reception', '2013-12-18 16:55:32', 'Active', 'INSERT'),
(82, 76, 2, 'reception', '2013-12-19 18:35:50', 'Active', 'INSERT'),
(83, 77, 1, 'admin', '2013-12-19 18:48:05', 'Active', 'INSERT'),
(84, 77, 1, 'admin', '2013-12-19 18:48:28', 'In_Active', 'AFTER_UPDATE'),
(85, 78, 7, 'nurse', '2013-12-19 18:48:36', 'Active', 'INSERT'),
(86, 78, 7, 'nurse', '2013-12-19 18:49:45', 'In_Active', 'AFTER_UPDATE'),
(87, 79, 2, 'reception', '2013-12-19 18:49:54', 'Active', 'INSERT'),
(88, 80, 2, 'reception', '2013-12-19 18:54:30', 'Active', 'INSERT'),
(89, 81, 2, 'reception', '2013-12-20 07:43:54', 'Active', 'INSERT'),
(90, 82, 2, 'reception', '2013-12-20 07:52:25', 'Active', 'INSERT'),
(91, 82, 2, 'reception', '2013-12-20 08:31:57', 'In_Active', 'AFTER_UPDATE'),
(92, 83, 7, 'nurse', '2013-12-20 08:32:06', 'Active', 'INSERT'),
(93, 84, 7, 'nurse', '2013-12-20 08:52:17', 'Active', 'INSERT'),
(94, 84, 7, 'nurse', '2013-12-20 09:22:38', 'In_Active', 'AFTER_UPDATE'),
(95, 85, 7, 'nurse', '2013-12-20 09:22:46', 'Active', 'INSERT'),
(96, 86, 2, 'reception', '2013-12-20 11:30:31', 'Active', 'INSERT'),
(97, 86, 2, 'reception', '2013-12-20 11:30:53', 'In_Active', 'AFTER_UPDATE'),
(98, 87, 7, 'nurse', '2013-12-20 11:30:58', 'Active', 'INSERT'),
(99, 87, 7, 'nurse', '2013-12-20 11:33:38', 'In_Active', 'AFTER_UPDATE'),
(100, 88, 7, 'nurse', '2013-12-20 11:53:01', 'Active', 'INSERT'),
(101, 89, 7, 'nurse', '2013-12-20 12:16:12', 'Active', 'INSERT'),
(102, 90, 2, 'reception', '2013-12-20 13:38:23', 'Active', 'INSERT'),
(103, 90, 2, 'reception', '2013-12-20 13:45:05', 'In_Active', 'AFTER_UPDATE'),
(104, 91, 7, 'nurse', '2013-12-20 13:45:12', 'Active', 'INSERT'),
(105, 92, 7, 'nurse', '2013-12-21 02:52:13', 'Active', 'INSERT'),
(106, 93, 7, 'nurse', '2013-12-21 07:43:51', 'Active', 'INSERT'),
(107, 93, 7, 'nurse', '2013-12-21 07:47:15', 'In_Active', 'AFTER_UPDATE'),
(108, 94, 8, 'doctor', '2013-12-21 07:47:26', 'Active', 'INSERT'),
(109, 94, 8, 'doctor', '2013-12-21 08:01:55', 'In_Active', 'AFTER_UPDATE'),
(110, 95, 7, 'nurse', '2013-12-21 08:02:00', 'Active', 'INSERT'),
(111, 95, 7, 'nurse', '2013-12-21 08:05:48', 'In_Active', 'AFTER_UPDATE'),
(112, 96, 8, 'doctor', '2013-12-21 08:05:55', 'Active', 'INSERT'),
(113, 97, 8, 'doctor', '2013-12-21 08:10:09', 'Active', 'INSERT'),
(114, 98, 8, 'doctor', '2013-12-21 10:37:11', 'Active', 'INSERT'),
(115, 98, 8, 'doctor', '2013-12-21 15:26:22', 'In_Active', 'AFTER_UPDATE'),
(116, 99, 11, 'lab', '2013-12-21 15:26:48', 'Active', 'INSERT'),
(117, 100, 11, 'lab', '2013-12-21 15:27:59', 'Active', 'INSERT'),
(118, 100, 11, 'lab', '2013-12-21 16:08:29', 'In_Active', 'AFTER_UPDATE'),
(119, 101, 10, 'pharmacist', '2013-12-21 16:08:44', 'Active', 'INSERT'),
(120, 102, 10, 'pharmacist', '2013-12-22 03:26:41', 'Active', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_login_logs_update`
--

CREATE TABLE `trigger_login_logs_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_logs_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `login_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `is_active` enum('Active','Is_Active') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=469 ;

--
-- Dumping data for table `trigger_login_logs_update`
--

INSERT INTO `trigger_login_logs_update` (`id`, `login_logs_id`, `employee_id`, `user_name`, `login_date`, `changetype`, `is_active`) VALUES
(1, 102, 10, 'pharmacist', '2013-12-22 07:36:26', 'AFTER_UPDATE', ''),
(2, 103, 13, 'store', '2013-12-22 07:36:32', 'INSERT', 'Active'),
(3, 104, 13, 'store', '2013-12-22 15:16:42', 'INSERT', 'Active'),
(4, 105, 2, 'reception', '2013-12-23 07:55:34', 'INSERT', 'Active'),
(5, 106, 1, 'admin', '2013-12-23 07:58:05', 'INSERT', 'Active'),
(6, 106, 1, 'admin', '2013-12-23 08:09:51', 'AFTER_UPDATE', ''),
(7, 107, 2, 'reception', '2013-12-23 08:10:01', 'INSERT', 'Active'),
(8, 107, 2, 'reception', '2013-12-23 08:27:50', 'AFTER_UPDATE', ''),
(9, 108, 1, 'admin', '2013-12-23 08:27:56', 'INSERT', 'Active'),
(10, 109, 13, 'store', '2013-12-23 12:03:33', 'INSERT', 'Active'),
(11, 110, 13, 'store', '2013-12-25 06:01:19', 'INSERT', 'Active'),
(12, 111, 1, 'admin', '2013-12-25 14:00:16', 'INSERT', 'Active'),
(13, 111, 1, 'admin', '2013-12-25 14:47:13', 'AFTER_UPDATE', ''),
(14, 112, 13, 'store', '2013-12-25 14:47:20', 'INSERT', 'Active'),
(15, 113, 13, 'store', '2013-12-30 11:19:52', 'INSERT', 'Active'),
(16, 114, 13, 'store', '2013-12-30 11:28:01', 'INSERT', 'Active'),
(17, 115, 13, 'store', '2013-12-30 12:23:02', 'INSERT', 'Active'),
(18, 116, 13, 'store', '2013-12-30 19:08:19', 'INSERT', 'Active'),
(19, 116, 13, 'store', '2013-12-30 19:17:41', 'AFTER_UPDATE', ''),
(20, 117, 10, 'pharmacist', '2013-12-30 19:17:50', 'INSERT', 'Active'),
(21, 118, 10, 'pharmacist', '2013-12-30 19:49:59', 'INSERT', 'Active'),
(22, 119, 10, 'pharmacist', '2013-12-31 03:52:14', 'INSERT', 'Active'),
(23, 120, 10, 'pharmacist', '2013-12-31 03:53:13', 'INSERT', 'Active'),
(24, 121, 10, 'pharmacist', '2013-12-31 05:29:52', 'INSERT', 'Active'),
(25, 121, 10, 'pharmacist', '2013-12-31 05:33:17', 'AFTER_UPDATE', ''),
(26, 122, 10, 'pharmacist', '2013-12-31 05:33:26', 'INSERT', 'Active'),
(27, 123, 10, 'pharmacist', '2013-12-31 07:42:31', 'INSERT', 'Active'),
(28, 124, 13, 'store', '2013-12-31 08:42:23', 'INSERT', 'Active'),
(29, 124, 13, 'store', '2013-12-31 09:06:22', 'AFTER_UPDATE', ''),
(30, 125, 10, 'pharmacist', '2013-12-31 09:06:36', 'INSERT', 'Active'),
(31, 126, 10, 'pharmacist', '2014-01-01 03:46:17', 'INSERT', 'Active'),
(32, 127, 10, 'pharmacist', '2014-01-02 08:31:57', 'INSERT', 'Active'),
(33, 128, 10, 'pharmacist', '2014-01-02 08:48:07', 'INSERT', 'Active'),
(34, 129, 10, 'pharmacist', '2014-01-02 11:50:58', 'INSERT', 'Active'),
(35, 130, 2, 'reception', '2014-01-02 11:59:20', 'INSERT', 'Active'),
(36, 130, 2, 'reception', '2014-01-02 12:01:59', 'AFTER_UPDATE', ''),
(37, 131, 10, 'pharmacist', '2014-01-02 12:02:08', 'INSERT', 'Active'),
(38, 132, 10, 'pharmacist', '2014-01-02 12:17:13', 'INSERT', 'Active'),
(39, 132, 10, 'pharmacist', '2014-01-02 13:19:51', 'AFTER_UPDATE', ''),
(40, 133, 13, 'store', '2014-01-02 13:19:58', 'INSERT', 'Active'),
(41, 134, 13, 'store', '2014-01-03 08:36:00', 'INSERT', 'Active'),
(42, 135, 13, 'store', '2014-01-03 10:16:50', 'INSERT', 'Active'),
(43, 136, 13, 'store', '2014-01-03 13:18:21', 'INSERT', 'Active'),
(44, 137, 13, 'store', '2014-01-04 05:57:06', 'INSERT', 'Active'),
(45, 138, 13, 'store', '2014-01-04 07:37:23', 'INSERT', 'Active'),
(46, 138, 13, 'store', '2014-01-04 08:27:49', 'AFTER_UPDATE', ''),
(47, 139, 10, 'pharmacist', '2014-01-04 08:27:57', 'INSERT', 'Active'),
(48, 140, 10, 'pharmacist', '2014-01-04 16:52:44', 'INSERT', 'Active'),
(49, 141, 10, 'pharmacist', '2014-01-04 17:10:10', 'INSERT', 'Active'),
(50, 142, 10, 'pharmacist', '2014-01-05 02:53:27', 'INSERT', 'Active'),
(51, 143, 10, 'pharmacist', '2014-01-05 03:22:13', 'INSERT', 'Active'),
(52, 144, 10, 'pharmacist', '2014-01-05 03:26:09', 'INSERT', 'Active'),
(53, 145, 10, 'pharmacist', '2014-01-05 07:31:47', 'INSERT', 'Active'),
(54, 146, 10, 'pharmacist', '2014-01-05 07:35:52', 'INSERT', 'Active'),
(55, 147, 10, 'pharmacist', '2014-01-05 08:13:01', 'INSERT', 'Active'),
(56, 146, 10, 'pharmacist', '2014-01-05 14:14:36', 'AFTER_UPDATE', ''),
(57, 148, 13, 'store', '2014-01-05 14:14:45', 'INSERT', 'Active'),
(58, 147, 10, 'pharmacist', '2014-01-05 14:45:53', 'AFTER_UPDATE', ''),
(59, 149, 13, 'store', '2014-01-05 14:46:04', 'INSERT', 'Active'),
(60, 150, 13, 'store', '2014-01-05 15:32:42', 'INSERT', 'Active'),
(61, 151, 2, 'reception', '2014-01-06 06:00:57', 'INSERT', 'Active'),
(62, 151, 2, 'reception', '2014-01-06 06:17:50', 'AFTER_UPDATE', ''),
(63, 152, 7, 'nurse', '2014-01-06 06:17:55', 'INSERT', 'Active'),
(64, 152, 7, 'nurse', '2014-01-06 06:26:15', 'AFTER_UPDATE', ''),
(65, 153, 2, 'reception', '2014-01-06 06:26:22', 'INSERT', 'Active'),
(66, 153, 2, 'reception', '2014-01-06 06:26:36', 'AFTER_UPDATE', ''),
(67, 154, 8, 'doctor', '2014-01-06 06:26:42', 'INSERT', 'Active'),
(68, 154, 8, 'doctor', '2014-01-06 06:31:37', 'AFTER_UPDATE', ''),
(69, 155, 11, 'lab', '2014-01-06 06:31:54', 'INSERT', 'Active'),
(70, 155, 11, 'lab', '2014-01-06 06:32:22', 'AFTER_UPDATE', ''),
(71, 156, 8, 'doctor', '2014-01-06 06:32:26', 'INSERT', 'Active'),
(72, 156, 8, 'doctor', '2014-01-06 06:33:28', 'AFTER_UPDATE', ''),
(73, 157, 10, 'pharmacist', '2014-01-06 06:33:38', 'INSERT', 'Active'),
(74, 157, 10, 'pharmacist', '2014-01-06 06:36:09', 'AFTER_UPDATE', ''),
(75, 158, 13, 'store', '2014-01-06 06:36:16', 'INSERT', 'Active'),
(76, 159, 10, 'pharmacist', '2014-01-06 06:36:30', 'INSERT', 'Active'),
(77, 159, 10, 'pharmacist', '2014-01-06 06:41:58', 'AFTER_UPDATE', ''),
(78, 160, 13, 'store', '2014-01-06 06:42:04', 'INSERT', 'Active'),
(79, 160, 13, 'store', '2014-01-06 06:50:51', 'AFTER_UPDATE', ''),
(80, 161, 10, 'pharmacist', '2014-01-06 07:33:30', 'INSERT', 'Active'),
(81, 161, 10, 'pharmacist', '2014-01-06 07:34:17', 'AFTER_UPDATE', ''),
(82, 162, 13, 'store', '2014-01-06 07:34:22', 'INSERT', 'Active'),
(83, 163, 10, 'pharmacist', '2014-01-06 07:37:42', 'INSERT', 'Active'),
(84, 163, 10, 'pharmacist', '2014-01-06 07:58:42', 'AFTER_UPDATE', ''),
(85, 164, 13, 'store', '2014-01-06 07:58:51', 'INSERT', 'Active'),
(86, 164, 13, 'store', '2014-01-06 09:05:25', 'AFTER_UPDATE', ''),
(87, 165, 2, 'reception', '2014-01-06 09:05:34', 'INSERT', 'Active'),
(88, 166, 7, 'nurse', '2014-01-06 12:08:41', 'INSERT', 'Active'),
(89, 167, 2, 'reception', '2014-01-06 12:15:50', 'INSERT', 'Active'),
(90, 167, 2, 'reception', '2014-01-06 12:42:56', 'AFTER_UPDATE', ''),
(91, 168, 8, 'doctor', '2014-01-06 12:43:02', 'INSERT', 'Active'),
(92, 169, 7, 'nurse', '2014-01-06 13:05:32', 'INSERT', 'Active'),
(93, 168, 8, 'doctor', '2014-01-06 13:35:04', 'AFTER_UPDATE', ''),
(94, 170, 11, 'lab', '2014-01-06 13:35:14', 'INSERT', 'Active'),
(95, 169, 7, 'nurse', '2014-01-06 13:52:40', 'AFTER_UPDATE', ''),
(96, 171, 8, 'doctor', '2014-01-06 13:52:46', 'INSERT', 'Active'),
(97, 171, 8, 'doctor', '2014-01-06 14:26:46', 'AFTER_UPDATE', ''),
(98, 172, 11, 'lab', '2014-01-06 14:26:51', 'INSERT', 'Active'),
(99, 173, 14, 'radiology', '2014-01-07 02:42:06', 'INSERT', 'Active'),
(100, 174, 11, 'lab', '2014-01-07 02:55:30', 'INSERT', 'Active'),
(101, 175, 11, 'lab', '2014-01-07 06:18:18', 'INSERT', 'Active'),
(102, 176, 11, 'lab', '2014-01-07 06:34:15', 'INSERT', 'Active'),
(103, 175, 11, 'lab', '2014-01-07 06:46:10', 'AFTER_UPDATE', ''),
(104, 177, 2, 'reception', '2014-01-07 06:46:20', 'INSERT', 'Active'),
(105, 178, 2, 'reception', '2014-01-07 06:48:13', 'INSERT', 'Active'),
(106, 176, 11, 'lab', '2014-01-07 07:40:09', 'AFTER_UPDATE', ''),
(107, 179, 14, 'radiology', '2014-01-07 07:40:24', 'INSERT', 'Active'),
(108, 180, 11, 'lab', '2014-01-07 07:44:40', 'INSERT', 'Active'),
(109, 180, 11, 'lab', '2014-01-07 07:56:13', 'AFTER_UPDATE', ''),
(110, 181, 8, 'doctor', '2014-01-07 07:56:21', 'INSERT', 'Active'),
(111, 178, 2, 'reception', '2014-01-07 08:19:01', 'AFTER_UPDATE', ''),
(112, 182, 11, 'lab', '2014-01-07 08:19:06', 'INSERT', 'Active'),
(113, 182, 11, 'lab', '2014-01-07 10:17:32', 'AFTER_UPDATE', ''),
(114, 183, 8, 'doctor', '2014-01-07 10:17:39', 'INSERT', 'Active'),
(115, 181, 8, 'doctor', '2014-01-07 11:01:53', 'AFTER_UPDATE', ''),
(116, 184, 11, 'lab', '2014-01-07 11:02:02', 'INSERT', 'Active'),
(117, 184, 11, 'lab', '2014-01-07 11:02:16', 'AFTER_UPDATE', ''),
(118, 185, 14, 'radiology', '2014-01-07 11:02:24', 'INSERT', 'Active'),
(119, 186, 14, 'radiology', '2014-01-07 12:16:32', 'INSERT', 'Active'),
(120, 187, 14, 'radiology', '2014-01-07 12:18:36', 'INSERT', 'Active'),
(121, 188, 14, 'radiology', '2014-01-07 12:19:00', 'INSERT', 'Active'),
(122, 188, 14, 'radiology', '2014-01-07 12:19:11', 'AFTER_UPDATE', ''),
(123, 189, 14, 'radiology', '2014-01-07 12:19:21', 'INSERT', 'Active'),
(124, 183, 8, 'doctor', '2014-01-07 12:25:23', 'AFTER_UPDATE', ''),
(125, 190, 14, 'radiology', '2014-01-07 12:25:38', 'INSERT', 'Active'),
(126, 191, 7, 'nurse', '2014-01-07 12:35:45', 'INSERT', 'Active'),
(127, 192, 14, 'radiology', '2014-01-07 12:39:54', 'INSERT', 'Active'),
(128, 193, 7, 'nurse', '2014-01-07 12:57:16', 'INSERT', 'Active'),
(129, 194, 7, 'nurse', '2014-01-07 13:36:12', 'INSERT', 'Active'),
(130, 195, 14, 'radiology', '2014-01-07 13:39:08', 'INSERT', 'Active'),
(131, 195, 14, 'radiology', '2014-01-07 13:43:02', 'AFTER_UPDATE', ''),
(132, 196, 8, 'doctor', '2014-01-07 13:43:10', 'INSERT', 'Active'),
(133, 196, 8, 'doctor', '2014-01-07 13:43:40', 'AFTER_UPDATE', ''),
(134, 197, 14, 'radiology', '2014-01-07 13:43:47', 'INSERT', 'Active'),
(135, 197, 14, 'radiology', '2014-01-07 13:44:14', 'AFTER_UPDATE', ''),
(136, 198, 8, 'doctor', '2014-01-07 13:44:20', 'INSERT', 'Active'),
(137, 198, 8, 'doctor', '2014-01-07 13:46:16', 'AFTER_UPDATE', ''),
(138, 199, 8, 'doctor', '2014-01-07 13:46:22', 'INSERT', 'Active'),
(139, 200, 7, 'nurse', '2014-01-07 13:52:58', 'INSERT', 'Active'),
(140, 201, 14, 'radiology', '2014-01-07 14:06:00', 'INSERT', 'Active'),
(141, 201, 14, 'radiology', '2014-01-07 14:09:32', 'AFTER_UPDATE', ''),
(142, 202, 8, 'doctor', '2014-01-07 14:09:39', 'INSERT', 'Active'),
(143, 202, 8, 'doctor', '2014-01-07 14:25:37', 'AFTER_UPDATE', ''),
(144, 203, 14, 'radiology', '2014-01-07 14:25:44', 'INSERT', 'Active'),
(145, 203, 14, 'radiology', '2014-01-07 14:43:42', 'AFTER_UPDATE', ''),
(146, 204, 8, 'doctor', '2014-01-07 14:43:48', 'INSERT', 'Active'),
(147, 205, 2, 'reception', '2014-01-07 16:54:52', 'INSERT', 'Active'),
(148, 206, 2, 'reception', '2014-01-08 01:18:01', 'INSERT', 'Active'),
(149, 207, 2, 'reception', '2014-01-08 01:42:44', 'INSERT', 'Active'),
(150, 207, 2, 'reception', '2014-01-08 01:55:46', 'AFTER_UPDATE', ''),
(151, 208, 7, 'nurse', '2014-01-08 01:55:54', 'INSERT', 'Active'),
(152, 208, 7, 'nurse', '2014-01-08 02:09:01', 'AFTER_UPDATE', ''),
(153, 209, 8, 'doctor', '2014-01-08 02:09:09', 'INSERT', 'Active'),
(154, 206, 2, 'reception', '2014-01-08 02:48:24', 'AFTER_UPDATE', ''),
(155, 210, 7, 'nurse', '2014-01-08 02:48:32', 'INSERT', 'Active'),
(156, 209, 8, 'doctor', '2014-01-08 03:15:43', 'AFTER_UPDATE', ''),
(157, 211, 10, 'pharmacist', '2014-01-08 03:16:15', 'INSERT', 'Active'),
(158, 211, 10, 'pharmacist', '2014-01-08 03:16:28', 'AFTER_UPDATE', ''),
(159, 212, 8, 'doctor', '2014-01-08 03:16:34', 'INSERT', 'Active'),
(160, 212, 8, 'doctor', '2014-01-08 03:19:13', 'AFTER_UPDATE', ''),
(161, 213, 10, 'pharmacist', '2014-01-08 03:19:23', 'INSERT', 'Active'),
(162, 214, 10, 'pharmacist', '2014-01-08 05:31:09', 'INSERT', 'Active'),
(163, 215, 14, 'radiology', '2014-01-08 05:35:00', 'INSERT', 'Active'),
(164, 214, 10, 'pharmacist', '2014-01-08 05:40:36', 'AFTER_UPDATE', ''),
(165, 216, 7, 'nurse', '2014-01-08 05:40:42', 'INSERT', 'Active'),
(166, 216, 7, 'nurse', '2014-01-08 05:42:57', 'AFTER_UPDATE', ''),
(167, 217, 10, 'pharmacist', '2014-01-08 05:43:07', 'INSERT', 'Active'),
(168, 217, 10, 'pharmacist', '2014-01-08 05:50:39', 'AFTER_UPDATE', ''),
(169, 218, 2, 'reception', '2014-01-08 05:50:47', 'INSERT', 'Active'),
(170, 218, 2, 'reception', '2014-01-08 05:51:44', 'AFTER_UPDATE', ''),
(171, 219, 8, 'doctor', '2014-01-08 05:52:03', 'INSERT', 'Active'),
(172, 220, 7, 'nurse', '2014-01-08 06:18:09', 'INSERT', 'Active'),
(173, 220, 7, 'nurse', '2014-01-08 06:18:19', 'AFTER_UPDATE', ''),
(174, 221, 2, 'reception', '2014-01-08 06:18:26', 'INSERT', 'Active'),
(175, 222, 10, 'pharmacist', '2014-01-08 08:05:20', 'INSERT', 'Active'),
(176, 223, 1, 'admin', '2014-01-08 09:33:33', 'INSERT', 'Active'),
(177, 224, 10, 'pharmacist', '2014-01-08 09:56:40', 'INSERT', 'Active'),
(178, 225, 10, 'pharmacist', '2014-01-08 09:57:21', 'INSERT', 'Active'),
(179, 226, 10, 'pharmacist', '2014-01-08 11:52:00', 'INSERT', 'Active'),
(180, 227, 10, 'pharmacist', '2014-01-09 01:31:30', 'INSERT', 'Active'),
(181, 228, 10, 'pharmacist', '2014-01-09 06:31:57', 'INSERT', 'Active'),
(182, 229, 10, 'pharmacist', '2014-01-09 08:16:08', 'INSERT', 'Active'),
(183, 230, 10, 'pharmacist', '2014-01-09 10:19:48', 'INSERT', 'Active'),
(184, 230, 10, 'pharmacist', '2014-01-09 10:24:19', 'AFTER_UPDATE', ''),
(185, 231, 7, 'nurse', '2014-01-09 10:24:25', 'INSERT', 'Active'),
(186, 231, 7, 'nurse', '2014-01-09 10:48:03', 'AFTER_UPDATE', ''),
(187, 232, 18, 'cashier', '2014-01-09 10:48:09', 'INSERT', 'Active'),
(188, 232, 18, 'cashier', '2014-01-09 10:48:50', 'AFTER_UPDATE', ''),
(189, 233, 18, 'cashier', '2014-01-09 10:49:00', 'INSERT', 'Active'),
(190, 234, 18, 'cashier', '2014-01-09 10:49:14', 'INSERT', 'Active'),
(191, 235, 18, 'cashier', '2014-01-09 10:49:58', 'INSERT', 'Active'),
(192, 236, 18, 'cashier', '2014-01-09 10:50:24', 'INSERT', 'Active'),
(193, 237, 18, 'cashier', '2014-01-09 10:50:48', 'INSERT', 'Active'),
(194, 237, 18, 'cashier', '2014-01-09 12:40:20', 'AFTER_UPDATE', ''),
(195, 238, 10, 'pharmacist', '2014-01-09 12:40:36', 'INSERT', 'Active'),
(196, 239, 10, 'pharmacist', '2014-01-09 13:10:55', 'INSERT', 'Active'),
(197, 240, 10, 'pharmacist', '2014-01-10 00:39:36', 'INSERT', 'Active'),
(198, 241, 10, 'pharmacist', '2014-01-10 01:21:16', 'INSERT', 'Active'),
(199, 242, 10, 'pharmacist', '2014-01-10 01:24:12', 'INSERT', 'Active'),
(200, 243, 10, 'pharmacist', '2014-01-10 01:24:50', 'INSERT', 'Active'),
(201, 243, 10, 'pharmacist', '2014-01-10 02:12:08', 'AFTER_UPDATE', ''),
(202, 244, 10, 'pharmacist', '2014-01-10 02:12:25', 'INSERT', 'Active'),
(203, 245, 10, 'pharmacist', '2014-01-10 08:09:30', 'INSERT', 'Active'),
(204, 244, 10, 'pharmacist', '2014-01-10 08:33:17', 'AFTER_UPDATE', ''),
(205, 246, 2, 'reception', '2014-01-10 08:33:31', 'INSERT', 'Active'),
(206, 246, 2, 'reception', '2014-01-10 09:46:46', 'AFTER_UPDATE', ''),
(207, 247, 10, 'pharmacist', '2014-01-10 09:46:55', 'INSERT', 'Active'),
(208, 247, 10, 'pharmacist', '2014-01-10 10:49:04', 'AFTER_UPDATE', ''),
(209, 248, 10, 'pharmacist', '2014-01-10 10:49:26', 'INSERT', 'Active'),
(210, 249, 11, 'lab', '2014-01-10 12:31:35', 'INSERT', 'Active'),
(211, 250, 10, 'pharmacist', '2014-01-13 05:45:00', 'INSERT', 'Active'),
(212, 251, 10, 'pharmacist', '2014-01-13 10:49:43', 'INSERT', 'Active'),
(213, 252, 7, 'nurse', '2014-01-14 01:53:11', 'INSERT', 'Active'),
(214, 252, 7, 'nurse', '2014-01-14 02:00:17', 'AFTER_UPDATE', ''),
(215, 253, 11, 'lab', '2014-01-14 02:00:36', 'INSERT', 'Active'),
(216, 253, 11, 'lab', '2014-01-14 02:00:36', 'AFTER_UPDATE', ''),
(217, 254, 11, 'lab', '2014-01-14 02:02:27', 'INSERT', 'Active'),
(218, 254, 11, 'lab', '2014-01-14 02:03:11', 'AFTER_UPDATE', ''),
(219, 255, 11, 'lab', '2014-01-14 02:03:20', 'INSERT', 'Active'),
(220, 255, 11, 'lab', '2014-01-14 02:04:45', 'AFTER_UPDATE', ''),
(221, 256, 10, 'pharmacist', '2014-01-14 02:04:54', 'INSERT', 'Active'),
(222, 257, 2, 'reception', '2014-01-14 05:17:55', 'INSERT', 'Active'),
(223, 257, 2, 'reception', '2014-01-14 05:25:05', 'AFTER_UPDATE', ''),
(224, 258, 10, 'pharmacist', '2014-01-14 05:27:20', 'INSERT', 'Active'),
(225, 259, 2, 'reception', '2014-01-14 06:55:19', 'INSERT', 'Active'),
(226, 259, 2, 'reception', '2014-01-14 08:49:52', 'AFTER_UPDATE', ''),
(227, 260, 18, 'cashier', '2014-01-14 08:50:02', 'INSERT', 'Active'),
(228, 260, 18, 'cashier', '2014-01-14 08:51:24', 'AFTER_UPDATE', ''),
(229, 261, 18, 'cashier', '2014-01-14 08:51:49', 'INSERT', 'Active'),
(230, 261, 18, 'cashier', '2014-01-14 10:12:00', 'AFTER_UPDATE', ''),
(231, 262, 7, 'nurse', '2014-01-14 10:12:06', 'INSERT', 'Active'),
(232, 262, 7, 'nurse', '2014-01-14 10:23:02', 'AFTER_UPDATE', ''),
(233, 263, 18, 'cashier', '2014-01-14 10:23:12', 'INSERT', 'Active'),
(234, 264, 18, 'cashier', '2014-01-14 10:44:19', 'INSERT', 'Active'),
(235, 263, 18, 'cashier', '2014-01-14 10:44:51', 'AFTER_UPDATE', ''),
(236, 265, 18, 'cashier', '2014-01-14 10:44:58', 'INSERT', 'Active'),
(237, 266, 18, 'cashier', '2014-01-14 11:04:41', 'INSERT', 'Active'),
(238, 264, 18, 'cashier', '2014-01-14 11:04:58', 'AFTER_UPDATE', ''),
(239, 267, 18, 'cashier', '2014-01-14 11:05:09', 'INSERT', 'Active'),
(240, 268, 18, 'cashier', '2014-01-14 12:35:20', 'INSERT', 'Active'),
(241, 269, 13, 'store', '2014-01-15 06:34:35', 'INSERT', 'Active'),
(242, 270, 13, 'store', '2014-01-15 08:04:03', 'INSERT', 'Active'),
(243, 271, 13, 'store', '2014-01-15 08:59:28', 'INSERT', 'Active'),
(244, 272, 13, 'store', '2014-01-15 11:04:55', 'INSERT', 'Active'),
(245, 273, 13, 'store', '2014-01-15 11:52:38', 'INSERT', 'Active'),
(246, 272, 13, 'store', '2014-01-15 13:26:37', 'AFTER_UPDATE', ''),
(247, 274, 10, 'pharmacist', '2014-01-15 13:26:56', 'INSERT', 'Active'),
(248, 275, 2, 'reception', '2014-01-16 07:01:33', 'INSERT', 'Active'),
(249, 275, 2, 'reception', '2014-01-16 07:11:11', 'AFTER_UPDATE', ''),
(250, 276, 13, 'store', '2014-01-16 07:11:19', 'INSERT', 'Active'),
(251, 277, 2, 'reception', '2014-01-16 08:52:42', 'INSERT', 'Active'),
(252, 277, 2, 'reception', '2014-01-16 09:07:03', 'AFTER_UPDATE', ''),
(253, 278, 13, 'store', '2014-01-16 09:07:08', 'INSERT', 'Active'),
(254, 279, 13, 'store', '2014-01-16 10:30:48', 'INSERT', 'Active'),
(255, 278, 13, 'store', '2014-01-16 12:21:13', 'AFTER_UPDATE', ''),
(256, 280, 18, 'cashier', '2014-01-16 12:21:31', 'INSERT', 'Active'),
(257, 279, 13, 'store', '2014-01-16 13:20:23', 'AFTER_UPDATE', ''),
(258, 281, 10, 'pharmacist', '2014-01-16 13:20:34', 'INSERT', 'Active'),
(259, 282, 18, 'cashier', '2014-01-17 05:30:09', 'INSERT', 'Active'),
(260, 283, 18, 'cashier', '2014-01-17 05:30:10', 'INSERT', 'Active'),
(261, 283, 18, 'cashier', '2014-01-17 08:19:09', 'AFTER_UPDATE', ''),
(262, 284, 2, 'reception', '2014-01-17 08:19:23', 'INSERT', 'Active'),
(263, 285, 2, 'reception', '2014-01-17 11:52:41', 'INSERT', 'Active'),
(264, 286, 2, 'reception', '2014-01-18 13:54:16', 'INSERT', 'Active'),
(265, 286, 2, 'reception', '2014-01-18 14:07:44', 'AFTER_UPDATE', ''),
(266, 287, 13, 'store', '2014-01-18 14:07:53', 'INSERT', 'Active'),
(267, 288, 2, 'reception', '2014-01-19 14:33:31', 'INSERT', 'Active'),
(268, 289, 2, 'reception', '2014-01-19 14:50:19', 'INSERT', 'Active'),
(269, 290, 2, 'reception', '2014-01-19 14:54:19', 'INSERT', 'Active'),
(270, 291, 2, 'reception', '2014-01-20 05:33:28', 'INSERT', 'Active'),
(271, 291, 2, 'reception', '2014-01-20 05:37:22', 'AFTER_UPDATE', ''),
(272, 292, 18, 'cashier', '2014-01-20 05:37:27', 'INSERT', 'Active'),
(273, 292, 18, 'cashier', '2014-01-20 08:03:56', 'AFTER_UPDATE', ''),
(274, 293, 8, 'doctor', '2014-01-20 08:04:02', 'INSERT', 'Active'),
(275, 294, 8, 'doctor', '2014-01-20 08:40:27', 'INSERT', 'Active'),
(276, 294, 8, 'doctor', '2014-01-20 09:07:28', 'AFTER_UPDATE', ''),
(277, 295, 10, 'pharmacist', '2014-01-20 09:07:39', 'INSERT', 'Active'),
(278, 293, 8, 'doctor', '2014-01-20 09:07:44', 'AFTER_UPDATE', ''),
(279, 296, 8, 'doctor', '2014-01-20 09:41:16', 'INSERT', 'Active'),
(280, 297, 8, 'doctor', '2014-01-20 09:42:11', 'INSERT', 'Active'),
(281, 297, 8, 'doctor', '2014-01-20 10:23:42', 'AFTER_UPDATE', ''),
(282, 298, 2, 'reception', '2014-01-20 10:23:59', 'INSERT', 'Active'),
(283, 298, 2, 'reception', '2014-01-20 10:56:19', 'AFTER_UPDATE', ''),
(284, 299, 8, 'doctor', '2014-01-20 10:56:28', 'INSERT', 'Active'),
(285, 300, 8, 'doctor', '2014-01-21 01:26:05', 'INSERT', 'Active'),
(286, 300, 8, 'doctor', '2014-01-21 01:40:59', 'AFTER_UPDATE', ''),
(287, 301, 11, 'lab', '2014-01-21 01:41:04', 'INSERT', 'Active'),
(288, 301, 11, 'lab', '2014-01-21 02:26:31', 'AFTER_UPDATE', ''),
(289, 302, 14, 'radiology', '2014-01-21 02:26:52', 'INSERT', 'Active'),
(290, 303, 8, 'doctor', '2014-01-21 06:41:31', 'INSERT', 'Active'),
(291, 304, 10, 'pharmacist', '2014-01-21 06:47:31', 'INSERT', 'Active'),
(292, 303, 8, 'doctor', '2014-01-21 07:06:32', 'AFTER_UPDATE', ''),
(293, 305, 10, 'pharmacist', '2014-01-21 07:06:48', 'INSERT', 'Active'),
(294, 306, 18, 'cashier', '2014-01-21 07:51:25', 'INSERT', 'Active'),
(295, 307, 2, 'reception', '2014-01-21 08:12:09', 'INSERT', 'Active'),
(296, 307, 2, 'reception', '2014-01-21 08:25:32', 'AFTER_UPDATE', ''),
(297, 308, 14, 'radiology', '2014-01-21 08:25:44', 'INSERT', 'Active'),
(298, 308, 14, 'radiology', '2014-01-21 09:05:38', 'AFTER_UPDATE', ''),
(299, 309, 18, 'cashier', '2014-01-21 09:05:56', 'INSERT', 'Active'),
(300, 305, 10, 'pharmacist', '2014-01-21 09:08:24', 'AFTER_UPDATE', ''),
(301, 310, 18, 'cashier', '2014-01-21 09:08:35', 'INSERT', 'Active'),
(302, 311, 18, 'cashier', '2014-01-21 12:43:07', 'INSERT', 'Active'),
(303, 312, 18, 'cashier', '2014-01-21 13:18:18', 'INSERT', 'Active'),
(304, 311, 18, 'cashier', '2014-01-21 14:02:43', 'AFTER_UPDATE', ''),
(305, 313, 8, 'doctor', '2014-01-21 14:02:53', 'INSERT', 'Active'),
(306, 314, 18, 'cashier', '2014-01-22 07:22:00', 'INSERT', 'Active'),
(307, 315, 18, 'cashier', '2014-01-22 07:47:22', 'INSERT', 'Active'),
(308, 316, 2, 'reception', '2014-01-23 06:44:51', 'INSERT', 'Active'),
(309, 316, 2, 'reception', '2014-01-23 06:45:14', 'AFTER_UPDATE', ''),
(310, 317, 7, 'nurse', '2014-01-23 06:45:30', 'INSERT', 'Active'),
(311, 317, 7, 'nurse', '2014-01-23 06:46:42', 'AFTER_UPDATE', ''),
(312, 318, 8, 'doctor', '2014-01-23 06:46:47', 'INSERT', 'Active'),
(313, 319, 8, 'doctor', '2014-01-23 07:00:57', 'INSERT', 'Active'),
(314, 320, 8, 'doctor', '2014-01-23 09:55:45', 'INSERT', 'Active'),
(315, 320, 8, 'doctor', '2014-01-23 09:58:51', 'AFTER_UPDATE', ''),
(316, 321, 7, 'nurse', '2014-01-23 09:59:01', 'INSERT', 'Active'),
(317, 321, 7, 'nurse', '2014-01-23 09:59:11', 'AFTER_UPDATE', ''),
(318, 322, 2, 'reception', '2014-01-23 09:59:24', 'INSERT', 'Active'),
(319, 322, 2, 'reception', '2014-01-23 10:08:54', 'AFTER_UPDATE', ''),
(320, 323, 18, 'cashier', '2014-01-23 10:09:00', 'INSERT', 'Active'),
(321, 323, 18, 'cashier', '2014-01-23 10:10:14', 'AFTER_UPDATE', ''),
(322, 324, 2, 'reception', '2014-01-23 10:10:22', 'INSERT', 'Active'),
(323, 324, 2, 'reception', '2014-01-23 10:29:13', 'AFTER_UPDATE', ''),
(324, 325, 7, 'nurse', '2014-01-23 10:29:35', 'INSERT', 'Active'),
(325, 325, 7, 'nurse', '2014-01-23 10:29:49', 'AFTER_UPDATE', ''),
(326, 326, 2, 'reception', '2014-01-23 10:29:58', 'INSERT', 'Active'),
(327, 326, 2, 'reception', '2014-01-23 10:30:35', 'AFTER_UPDATE', ''),
(328, 327, 7, 'nurse', '2014-01-23 10:30:42', 'INSERT', 'Active'),
(329, 327, 7, 'nurse', '2014-01-23 10:50:26', 'AFTER_UPDATE', ''),
(330, 328, 8, 'doctor', '2014-01-23 10:50:31', 'INSERT', 'Active'),
(331, 328, 8, 'doctor', '2014-01-23 10:50:42', 'AFTER_UPDATE', ''),
(332, 329, 7, 'nurse', '2014-01-23 10:50:47', 'INSERT', 'Active'),
(333, 330, 8, 'doctor', '2014-01-23 10:58:21', 'INSERT', 'Active'),
(334, 331, 4, 'djfivjdfo', '2014-01-23 11:00:12', 'INSERT', 'Active'),
(335, 332, 2, 'reception', '2014-01-23 11:53:55', 'INSERT', 'Active'),
(336, 332, 2, 'reception', '2014-01-23 11:54:12', 'AFTER_UPDATE', ''),
(337, 333, 7, 'nurse', '2014-01-23 11:54:19', 'INSERT', 'Active'),
(338, 333, 7, 'nurse', '2014-01-23 11:54:30', 'AFTER_UPDATE', ''),
(339, 334, 2, 'reception', '2014-01-23 11:54:41', 'INSERT', 'Active'),
(340, 334, 2, 'reception', '2014-01-23 11:55:06', 'AFTER_UPDATE', ''),
(341, 335, 7, 'nurse', '2014-01-23 11:55:13', 'INSERT', 'Active'),
(342, 330, 8, 'doctor', '2014-01-23 11:56:23', 'AFTER_UPDATE', ''),
(343, 336, 2, 'reception', '2014-01-23 11:56:35', 'INSERT', 'Active'),
(344, 335, 7, 'nurse', '2014-01-23 11:57:08', 'AFTER_UPDATE', ''),
(345, 337, 8, 'doctor', '2014-01-23 11:57:15', 'INSERT', 'Active'),
(346, 337, 8, 'doctor', '2014-01-23 11:58:30', 'AFTER_UPDATE', ''),
(347, 338, 14, 'radiology', '2014-01-23 11:58:40', 'INSERT', 'Active'),
(348, 338, 14, 'radiology', '2014-01-23 11:59:09', 'AFTER_UPDATE', ''),
(349, 339, 11, 'lab', '2014-01-23 11:59:19', 'INSERT', 'Active'),
(350, 339, 11, 'lab', '2014-01-23 11:59:27', 'AFTER_UPDATE', ''),
(351, 340, 8, 'doctor', '2014-01-23 11:59:37', 'INSERT', 'Active'),
(352, 340, 8, 'doctor', '2014-01-23 12:00:12', 'AFTER_UPDATE', ''),
(353, 341, 11, 'lab', '2014-01-23 12:00:20', 'INSERT', 'Active'),
(354, 341, 11, 'lab', '2014-01-23 12:00:59', 'AFTER_UPDATE', ''),
(355, 342, 18, 'cashier', '2014-01-23 12:01:09', 'INSERT', 'Active'),
(356, 342, 18, 'cashier', '2014-01-23 12:02:50', 'AFTER_UPDATE', ''),
(357, 343, 8, 'doctor', '2014-01-23 12:02:59', 'INSERT', 'Active'),
(358, 343, 8, 'doctor', '2014-01-23 12:03:57', 'AFTER_UPDATE', ''),
(359, 344, 11, 'lab', '2014-01-23 12:04:03', 'INSERT', 'Active'),
(360, 345, 2, 'reception', '2014-01-24 06:40:01', 'INSERT', 'Active'),
(361, 346, 2, 'reception', '2014-01-24 07:05:43', 'INSERT', 'Active'),
(362, 345, 2, 'reception', '2014-01-24 07:06:06', 'AFTER_UPDATE', ''),
(363, 347, 2, 'reception', '2014-01-24 07:06:13', 'INSERT', 'Active'),
(364, 346, 2, 'reception', '2014-01-24 07:08:10', 'AFTER_UPDATE', ''),
(365, 348, 2, 'reception', '2014-01-24 07:08:22', 'INSERT', 'Active'),
(366, 347, 2, 'reception', '2014-01-24 07:47:23', 'AFTER_UPDATE', ''),
(367, 349, 10, 'pharmacist', '2014-01-24 07:47:42', 'INSERT', 'Active'),
(368, 350, 2, 'reception', '2014-01-27 00:34:39', 'INSERT', 'Active'),
(369, 350, 2, 'reception', '2014-01-27 00:36:18', 'AFTER_UPDATE', ''),
(370, 351, 10, 'pharmacist', '2014-01-27 00:36:25', 'INSERT', 'Active'),
(371, 352, 10, 'pharmacist', '2014-01-27 01:11:24', 'INSERT', 'Active'),
(372, 352, 10, 'pharmacist', '2014-01-27 02:51:02', 'AFTER_UPDATE', ''),
(373, 353, 18, 'cashier', '2014-01-27 02:51:08', 'INSERT', 'Active'),
(374, 353, 18, 'cashier', '2014-01-27 11:10:30', 'AFTER_UPDATE', ''),
(375, 354, 10, 'pharmacist', '2014-01-27 11:10:50', 'INSERT', 'Active'),
(376, 354, 10, 'pharmacist', '2014-01-27 11:11:11', 'AFTER_UPDATE', ''),
(377, 355, 18, 'cashier', '2014-01-27 11:11:19', 'INSERT', 'Active'),
(378, 355, 18, 'cashier', '2014-01-27 11:11:38', 'AFTER_UPDATE', ''),
(379, 356, 10, 'pharmacist', '2014-01-27 11:11:49', 'INSERT', 'Active'),
(380, 356, 10, 'pharmacist', '2014-01-27 11:47:48', 'AFTER_UPDATE', ''),
(381, 357, 2, 'reception', '2014-01-27 11:49:44', 'INSERT', 'Active'),
(382, 357, 2, 'reception', '2014-01-27 11:50:07', 'AFTER_UPDATE', ''),
(383, 358, 10, 'pharmacist', '2014-01-27 11:50:14', 'INSERT', 'Active'),
(384, 358, 10, 'pharmacist', '2014-01-27 12:19:21', 'AFTER_UPDATE', ''),
(385, 359, 2, 'reception', '2014-01-27 12:19:35', 'INSERT', 'Active'),
(386, 359, 2, 'reception', '2014-01-27 12:22:31', 'AFTER_UPDATE', ''),
(387, 360, 11, 'lab', '2014-01-27 12:22:37', 'INSERT', 'Active'),
(388, 361, 18, 'cashier', '2014-01-27 19:18:03', 'INSERT', 'Active'),
(389, 362, 11, 'lab', '2014-01-27 19:44:43', 'INSERT', 'Active'),
(390, 363, 18, 'cashier', '2014-01-28 02:11:36', 'INSERT', 'Active'),
(391, 364, 2, 'reception', '2014-01-28 02:56:40', 'INSERT', 'Active'),
(392, 364, 2, 'reception', '2014-01-28 02:57:10', 'AFTER_UPDATE', ''),
(393, 365, 11, 'lab', '2014-01-28 02:57:16', 'INSERT', 'Active'),
(394, 365, 11, 'lab', '2014-01-28 03:11:16', 'AFTER_UPDATE', ''),
(395, 366, 2, 'reception', '2014-01-28 03:11:23', 'INSERT', 'Active'),
(396, 366, 2, 'reception', '2014-01-28 03:11:41', 'AFTER_UPDATE', ''),
(397, 367, 11, 'lab', '2014-01-28 03:11:47', 'INSERT', 'Active'),
(398, 368, 11, 'lab', '2014-01-28 05:33:02', 'INSERT', 'Active'),
(399, 368, 11, 'lab', '2014-01-28 05:39:00', 'AFTER_UPDATE', ''),
(400, 369, 18, 'cashier', '2014-01-28 05:39:06', 'INSERT', 'Active'),
(401, 370, 2, 'reception', '2014-01-28 07:41:10', 'INSERT', 'Active'),
(402, 370, 2, 'reception', '2014-01-28 07:41:47', 'AFTER_UPDATE', ''),
(403, 371, 14, 'radiology', '2014-01-28 07:42:19', 'INSERT', 'Active'),
(404, 363, 18, 'cashier', '2014-01-28 07:45:58', 'AFTER_UPDATE', ''),
(405, 371, 14, 'radiology', '2014-01-28 08:35:09', 'AFTER_UPDATE', ''),
(406, 372, 18, 'cashier', '2014-01-28 08:35:16', 'INSERT', 'Active'),
(407, 373, 18, 'cashier', '2014-01-28 09:01:57', 'INSERT', 'Active'),
(408, 372, 18, 'cashier', '2014-01-28 09:42:26', 'AFTER_UPDATE', ''),
(409, 374, 2, 'reception', '2014-01-28 09:42:33', 'INSERT', 'Active'),
(410, 373, 18, 'cashier', '2014-01-28 10:05:11', 'AFTER_UPDATE', ''),
(411, 375, 2, 'reception', '2014-01-28 10:05:30', 'INSERT', 'Active'),
(412, 375, 2, 'reception', '2014-01-28 10:08:06', 'AFTER_UPDATE', ''),
(413, 376, 7, 'nurse', '2014-01-28 10:08:13', 'INSERT', 'Active'),
(414, 374, 2, 'reception', '2014-01-28 10:11:51', 'AFTER_UPDATE', ''),
(415, 377, 1, 'admin', '2014-01-28 10:11:59', 'INSERT', 'Active'),
(416, 377, 1, 'admin', '2014-01-28 10:57:32', 'AFTER_UPDATE', ''),
(417, 378, 7, 'nurse', '2014-01-28 10:57:41', 'INSERT', 'Active'),
(418, 379, 7, 'nurse', '2014-01-28 13:11:00', 'INSERT', 'Active'),
(419, 380, 7, 'nurse', '2014-01-28 13:48:34', 'INSERT', 'Active'),
(420, 381, 2, 'reception', '2014-01-29 05:17:56', 'INSERT', 'Active'),
(421, 381, 2, 'reception', '2014-01-29 05:19:18', 'AFTER_UPDATE', ''),
(422, 382, 7, 'nurse', '2014-01-29 05:19:28', 'INSERT', 'Active'),
(423, 383, 7, 'nurse', '2014-01-29 05:20:07', 'INSERT', 'Active'),
(424, 383, 7, 'nurse', '2014-01-29 05:36:50', 'AFTER_UPDATE', ''),
(425, 384, 2, 'reception', '2014-01-29 05:37:01', 'INSERT', 'Active'),
(426, 384, 2, 'reception', '2014-01-29 06:11:35', 'AFTER_UPDATE', ''),
(427, 385, 2, 'reception', '2014-01-29 06:11:46', 'INSERT', 'Active'),
(428, 386, 2, 'reception', '2014-01-29 06:42:07', 'INSERT', 'Active'),
(429, 385, 2, 'reception', '2014-01-29 06:45:13', 'AFTER_UPDATE', ''),
(430, 387, 8, 'doctor', '2014-01-29 06:45:23', 'INSERT', 'Active'),
(431, 386, 2, 'reception', '2014-01-29 07:09:35', 'AFTER_UPDATE', ''),
(432, 388, 7, 'nurse', '2014-01-29 07:10:09', 'INSERT', 'Active'),
(433, 388, 7, 'nurse', '2014-01-29 07:54:57', 'AFTER_UPDATE', ''),
(434, 389, 11, 'lab', '2014-01-29 07:55:05', 'INSERT', 'Active'),
(435, 390, 18, 'cashier', '2014-01-29 10:38:45', 'INSERT', 'Active'),
(436, 390, 18, 'cashier', '2014-01-29 11:35:09', 'AFTER_UPDATE', ''),
(437, 391, 18, 'cashier', '2014-01-29 11:56:14', 'INSERT', 'Active'),
(438, 389, 11, 'lab', '2014-01-29 11:58:02', 'AFTER_UPDATE', ''),
(439, 392, 8, 'doctor', '2014-01-29 11:58:16', 'INSERT', 'Active'),
(440, 391, 18, 'cashier', '2014-01-29 11:59:01', 'AFTER_UPDATE', ''),
(441, 393, 8, 'doctor', '2014-01-29 11:59:15', 'INSERT', 'Active'),
(442, 393, 8, 'doctor', '2014-01-29 12:20:53', 'AFTER_UPDATE', ''),
(443, 394, 14, 'radiology', '2014-01-29 12:21:05', 'INSERT', 'Active'),
(444, 394, 14, 'radiology', '2014-01-29 12:59:07', 'AFTER_UPDATE', ''),
(445, 395, 18, 'cashier', '2014-01-29 12:59:18', 'INSERT', 'Active'),
(446, 395, 18, 'cashier', '2014-01-29 13:00:14', 'AFTER_UPDATE', ''),
(447, 396, 14, 'radiology', '2014-01-29 13:00:31', 'INSERT', 'Active'),
(448, 397, 14, 'radiology', '2014-01-29 15:52:59', 'INSERT', 'Active'),
(449, 397, 14, 'radiology', '2014-01-29 15:53:09', 'AFTER_UPDATE', ''),
(450, 398, 8, 'doctor', '2014-01-29 16:14:13', 'INSERT', 'Active'),
(451, 392, 8, 'doctor', '2014-01-29 18:06:34', 'AFTER_UPDATE', ''),
(452, 399, 2, 'reception', '2014-01-29 18:06:48', 'INSERT', 'Active'),
(453, 400, 10, 'pharmacist', '2014-01-29 20:36:17', 'INSERT', 'Active'),
(454, 401, 10, 'pharmacist', '2014-01-30 05:35:03', 'INSERT', 'Active'),
(455, 402, 10, 'pharmacist', '2014-01-30 06:40:08', 'INSERT', 'Active'),
(456, 401, 10, 'pharmacist', '2014-01-30 09:41:58', 'AFTER_UPDATE', ''),
(457, 403, 13, 'store', '2014-01-30 09:42:15', 'INSERT', 'Active'),
(458, 403, 13, 'store', '2014-01-30 09:42:40', 'AFTER_UPDATE', ''),
(459, 404, 10, 'pharmacist', '2014-01-30 09:42:49', 'INSERT', 'Active'),
(460, 405, 10, 'pharmacist', '2014-01-30 10:49:45', 'INSERT', 'Active'),
(461, 405, 10, 'pharmacist', '2014-01-30 11:00:23', 'AFTER_UPDATE', ''),
(462, 406, 13, 'store', '2014-01-30 11:00:30', 'INSERT', 'Active'),
(463, 407, 2, 'reception', '2014-01-30 12:53:55', 'INSERT', 'Active'),
(464, 407, 2, 'reception', '2014-01-30 12:55:28', 'AFTER_UPDATE', ''),
(465, 408, 7, 'nurse', '2014-01-30 12:55:35', 'INSERT', 'Active'),
(466, 312, 18, 'cashier', '2014-01-30 12:57:40', 'AFTER_UPDATE', ''),
(467, 408, 7, 'nurse', '2014-01-30 12:57:46', 'AFTER_UPDATE', ''),
(468, 409, 2, 'reception', '2014-01-30 12:58:00', 'INSERT', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_member_branch_insert`
--

CREATE TABLE `trigger_member_branch_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `member_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `phone_no` varchar(255) NOT NULL,
  `is_active` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `trigger_member_branch_insert`
--

INSERT INTO `trigger_member_branch_insert` (`id`, `branch_id`, `branch_name`, `category`, `address`, `location`, `email`, `description`, `member_id`, `date_added`, `changetype`, `transaction_date`, `phone_no`, `is_active`) VALUES
(1, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 1, '2013-12-04 07:02:30', 'INSERT', '0000-00-00 00:00:00', '', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_member_branch_update`
--

CREATE TABLE `trigger_member_branch_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `member_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `phone_no` varchar(255) NOT NULL,
  `is_active` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `trigger_member_branch_update`
--

INSERT INTO `trigger_member_branch_update` (`id`, `branch_id`, `branch_name`, `category`, `address`, `location`, `email`, `description`, `member_id`, `date_added`, `changetype`, `transaction_date`, `phone_no`, `is_active`) VALUES
(1, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 1, '2013-12-04 07:02:30', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', 'Yes'),
(2, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-04 07:02:43', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', 'Yes'),
(3, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-04 07:02:43', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', 'Yes'),
(4, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-07 07:04:07', 'AFTER_UPDATE', '0000-00-00 00:00:00', '', 'No'),
(5, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-07 07:04:07', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '', 'No'),
(6, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-06 08:59:00', 'AFTER_UPDATE', '0000-00-00 00:00:00', '254714339521', 'Yes'),
(7, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-06 08:59:00', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '254714339521', 'Yes'),
(8, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-06 09:00:20', 'AFTER_UPDATE', '0000-00-00 00:00:00', '254714339521', 'No'),
(9, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-06 09:00:20', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '254714339521', 'No'),
(10, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-06 09:00:20', 'AFTER_UPDATE', '0000-00-00 00:00:00', '254714339521', 'No'),
(11, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Located in Kilimani deals with health ', 10, '2013-12-06 09:00:20', 'BEFORE_UPDATE', '0000-00-00 00:00:00', '254714339521', 'No'),
(12, 1, 'Shwari', 'Health Centre', 'Kilimani Saachi Plaza', 'Kilimani ', 'healthstrat@healthstrat.co.ke', 'Kilimani deals with health ', 10, '2013-12-23 08:00:41', 'AFTER_UPDATE', '0000-00-00 00:00:00', '710123456', '');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_member_insert`
--

CREATE TABLE `trigger_member_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `trigger_member_insert`
--

INSERT INTO `trigger_member_insert` (`id`, `member_id`, `member_name`, `category`, `address`, `phone_no`, `email`, `is_active`, `location`, `description`, `date_added`, `changetype`, `transaction_date`) VALUES
(1, 10, 'Shwari Githurai', 'Health Centre', 'Githurai 44', 710123456, 'shwari_githurai@shwarihealthcare.org', '', 'Githurai', 'Located in Githurai', '0000-00-00 00:00:00', 'INSERT', '0000-00-00 00:00:00'),
(2, 11, 'Shwari Upperhill', 'Health Centre', 'Upperhill Clarkson', 710123456, 'shwari_githurai@shwarihealthcare.org', '', 'Githurai', 'Located in Upper hill', '2013-12-03 10:06:04', 'INSERT', '0000-00-00 00:00:00'),
(3, 12, '', '', '', 0, '', '', '', '', '2013-12-03 10:06:04', 'INSERT', '0000-00-00 00:00:00'),
(4, 12, '', '', '', 0, '', '', '', '', '2013-12-03 10:06:04', 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(5, 12, 'Shwari Siaya', 'Health Centre', '13 Siaya', 2147483647, 'shwari_siaya@shwarihealthcare.org', '', 'Siaya', 'Located in Siaya', '2013-12-03 10:06:04', 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(6, 12, 'Shwari Siaya', 'Health Centre', '13 Siaya', 2147483647, 'shwari_siaya@shwarihealthcare.org', '', 'Siaya', 'Located in Siaya', '2013-12-03 10:06:04', 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(7, 11, 'Shwari Upperhill', 'Health Centre', 'Upperhill Clarkson', 710123456, 'shwari_githurai@shwarihealthcare.org', '', 'Githurai', 'Located in Upper hill', '2013-12-03 10:06:04', 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(8, 11, 'Shwari Upperhill', 'Health Centre', 'No', 710123456, 'shwari_githurai@shwarihealthcare.org', '', 'Githurai', 'Located in Upper hill', '2013-12-06 09:15:55', 'BEFORE_UPDATE', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_member_update`
--

CREATE TABLE `trigger_member_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `trigger_member_update`
--

INSERT INTO `trigger_member_update` (`id`, `member_id`, `member_name`, `category`, `address`, `phone_no`, `email`, `is_active`, `location`, `description`, `date_added`, `changetype`, `transaction_date`) VALUES
(1, 12, 'Shwari Siaya', 'Health Centre', '13 Siaya', 2147483647, 'shwari_siaya@shwarihealthcare.org', '', 'Siaya', 'Located in Siaya', '2013-12-03 10:06:04', 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(2, 12, 'Shwari Siaya', 'Health Centre', '13 Siaya', 2147483647, 'shwari_siaya@shwarihealthcare.org', '', 'Siaya', 'Located in Siaya', '2013-12-03 10:06:04', 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(3, 12, 'Shwari Siaya', 'Health Centre', '13 Siaya', 2147483647, 'shwari_siaya@shwarihealthcare.org', '', 'Siaya', 'Located in Siaya', '2013-12-03 13:24:56', 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(4, 11, 'Shwari Upperhill', 'Health Centre', 'No', 710123456, 'shwari_githurai@shwarihealthcare.org', '', 'Githurai', 'Located in Upper hill', '2013-12-06 09:15:55', 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(5, 11, 'Shwari Upperhill', 'Health Centre', '59857', 710123456, 'shwari_githurai@shwarihealthcare.org', '', 'Githurai', 'Located in Upper hill', '2013-12-06 09:19:17', 'AFTER_UPDATE', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_package_insert`
--

CREATE TABLE `trigger_package_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `cost` decimal(13,4) NOT NULL,
  `package_details` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_package_update`
--

CREATE TABLE `trigger_package_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `cost` decimal(13,4) NOT NULL,
  `package_details` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `trigger_package_update`
--

INSERT INTO `trigger_package_update` (`id`, `package_id`, `package_name`, `cost`, `package_details`, `transaction_date`, `changetype`) VALUES
(1, 1, 'Ante-Natal', 300.0000, 'Ante-Natal', '2013-12-23 08:23:24', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_patient_insert`
--

CREATE TABLE `trigger_patient_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `other_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `marital_status` enum('single','married','divorced') NOT NULL,
  `phone_no` int(11) NOT NULL,
  `identification_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `residence` varchar(255) NOT NULL,
  `employment_status` enum('employed','not_employed') NOT NULL,
  `employer` varchar(255) NOT NULL,
  `next_of_kin_fname` varchar(255) NOT NULL,
  `next_of_kin_lname` varchar(255) NOT NULL,
  `next_of_kin_relation` varchar(255) NOT NULL,
  `next_of_kin_phone` varchar(255) NOT NULL,
  `is_shwari_member` enum('Yes','No') NOT NULL,
  `shwari_member_relation` varchar(255) NOT NULL,
  `family_number` varchar(255) NOT NULL,
  `status` enum('Active','In Active') NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `trigger_patient_insert`
--

INSERT INTO `trigger_patient_insert` (`id`, `patient_id`, `f_name`, `s_name`, `other_name`, `dob`, `gender`, `marital_status`, `phone_no`, `identification_number`, `email`, `residence`, `employment_status`, `employer`, `next_of_kin_fname`, `next_of_kin_lname`, `next_of_kin_relation`, `next_of_kin_phone`, `is_shwari_member`, `shwari_member_relation`, `family_number`, `status`, `transaction_date`, `changetype`) VALUES
(1, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'Male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', '', 'SHWARI_0001', 'Active', '2013-12-06 11:09:22', 'INSERT'),
(2, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'Male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', '', 'Active', '2013-12-06 11:09:22', 'INSERT'),
(3, 4, 'Dindi', 'Dindi', 'Dindi', '2013-12-15', 'Male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', '', 'Seld', '0714339521', 'Yes', '', 'SHWARI_0000012', 'Active', '2013-12-16 13:12:46', 'INSERT'),
(4, 5, 'Dindi', 'Dindi', 'dINDI', '2013-12-08', 'Female', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_0000012', 'Active', '2013-12-16 13:28:45', 'INSERT'),
(5, 6, 'D', 'Dindi', 'H', '2013-12-16', 'Female', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'q', 'w', 'e', '123456789', 'Yes', '', 'SHWARI_0000012', 'Active', '2013-12-16 13:35:43', 'INSERT'),
(6, 7, 'Q', 'D', 'W', '2013-12-15', 'Male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_0012', 'Active', '2013-12-16 13:41:18', 'INSERT'),
(7, 8, '123', '123', '123', '2013-12-09', 'Male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_001213', 'Active', '2013-12-16 13:42:32', 'INSERT'),
(8, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'Male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_1214', 'Active', '2013-12-16 13:44:37', 'INSERT'),
(9, 10, 'Edward', 'Bono', 'De', '2013-12-01', 'Male', 'single', 713123456, '12345678', 'edwarddebono@gmail.com', '', '', '', 'Edward', 'De', 'Self', '0718123456', 'Yes', '', '1_0', 'Active', '2013-12-17 07:05:21', 'INSERT'),
(10, 11, 'Buffet', 'Edward', 'Branson', '2013-12-01', 'Male', 'married', 718123456, '12345678', 'buffet@gmail.com', '', '', '', 'dnfuvindfui', 'dfinvudfi', 'Self', '48955489234', 'Yes', '', 'SHWARI3_0', 'Active', '2013-12-17 07:17:20', 'INSERT'),
(11, 12, 'dfgnuidn', 'fdngivend', 'ufdnbiurn', '2013-12-01', 'Male', 'married', 7654231, '54312566', 'ndfgiuvnd@fvngiu.eurn', '', '', '', 'jfnbundfu', 'nuvnduing', 'self', '68954095', 'Yes', '', 'SHWARI_0', 'Active', '2013-12-17 07:21:36', 'INSERT'),
(12, 13, 'fbdsuyvbfduy', 'dbyuvbsuydfb', 'dfhbgvyfudb', '2013-12-01', 'Male', 'married', 719123456, '57844394', 'nsifnbei@fdf.com', '', '', '', 'fnisfni', 'nsfviuenviu', 'fniuen', '0802324', 'Yes', '', 'SHWARI000002', 'Active', '2013-12-17 07:26:54', 'INSERT'),
(13, 14, 'nhgfrde', 'hbgdvcs', 'thrgfrew', '2013-12-01', 'Male', 'married', 87654321, '12345678', 'hytgrf@hytgrf.grf', '', '', '', 'ybhtgvfd', 'bhtvgrfcd', 'yhgf', '876543', 'Yes', '', 'SHWARI3_0', 'Active', '2013-12-17 07:43:36', 'INSERT'),
(14, 15, 'htgfd', 'htgrfed', 'htgrfed', '2013-12-01', 'Male', 'divorced', 0, '12345678', 'htgf@hgfd.gfd', '', '', '', 'htbgvcfd', 'vcfds', 'gfdfe', '6534254', 'Yes', '', 'SHWARI_3_000', 'Active', '2013-12-17 07:48:01', 'INSERT'),
(15, 16, 'Harris', 'Dindi', 'Samuel', '2013-12-08', 'Male', 'single', 712345678, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Harris', 'Dindi', 'Self', '0714123456', 'Yes', '', 'SHWARI_100000', 'Active', '2013-12-17 10:35:27', 'INSERT'),
(16, 17, 'dindi', 'dindi', 'dindi', '2013-12-17', 'Male', 'single', 123456789, '12345678', 'hads@dfsds.cda', '', '', '', 'dfsfdw', 'fder', 'dfsd', '123456789', 'Yes', '', 'SHWARI_100000', 'Active', '2013-12-17 10:38:33', 'INSERT'),
(17, 18, 'fdubvuifbd', 'djvknuidf', 'dufibviuefbd', '2013-12-17', 'Male', 'married', 76534243, '12345678', 'nfdiug@jdknfv.ndfnbuiv', '', '', '', 'gfjveouigh', 'vfdnugneou', 'fdiubguei', '458385497934', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:43:57', 'INSERT'),
(18, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'Male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:45:40', 'INSERT'),
(19, 20, 'Harris', 'Dindi', 'Samuel', '2013-12-17', 'Male', 'divorced', 713222456, '12345678', 'harrisdindi.samuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_1000006_000', 'Active', '2013-12-17 10:56:55', 'INSERT'),
(20, 21, 'Harris ', 'Dindi', 'Junior', '2013-12-01', 'Male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Harris Senior', 'Father', '0712345678', 'Yes', '', 'SHWARI_1000002_1', 'Active', '2013-12-17 11:08:33', 'INSERT'),
(21, 22, 'Dindi', 'Dindi', 'Dindi', '2013-12-17', 'Male', 'married', 123456789, '1234567', 'nvjfndv@ndfgnvd.com', '', '', '', 'ndguivnfud', 'gdnbiurndgiv', 'gdnvuit', '58394234820', 'Yes', '', 'SHWARI_1000002_2', 'Active', '2013-12-17 18:07:33', 'INSERT'),
(22, 23, 'niun', 'nviudfn', 'ni', '2013-12-17', 'Male', 'married', 714123456, '12345678', 'ndv@vdj.dvnd', '', '', '', 'bvd', 'no', 'noin', '988908', 'Yes', '', 'SHWARI_1000002_3', 'Active', '2013-12-17 18:17:02', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_patient_payments_insert`
--

CREATE TABLE `trigger_patient_payments_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_payments_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `cost` decimal(13,4) NOT NULL,
  `pharm_payments` decimal(13,4) NOT NULL,
  `lab_payments` decimal(13,4) NOT NULL,
  `date` date NOT NULL,
  `mpesa_code` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `trigger_patient_payments_insert`
--

INSERT INTO `trigger_patient_payments_insert` (`id`, `patient_payments_id`, `visit_id`, `patient_id`, `cost`, `pharm_payments`, `lab_payments`, `date`, `mpesa_code`, `transaction_date`, `changetype`) VALUES
(1, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2013-12-21 08:45:55', 'INSERT'),
(2, 3, 11, 22, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2013-12-21 08:45:55', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_patient_payments_update`
--

CREATE TABLE `trigger_patient_payments_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_payments_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `cost` decimal(13,4) NOT NULL,
  `pharm_payments` decimal(13,4) NOT NULL,
  `lab_payments` decimal(13,4) NOT NULL,
  `date` date NOT NULL,
  `mpesa_code` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `total_payments_dr` decimal(13,2) NOT NULL,
  `total_payments_cr` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=211 ;

--
-- Dumping data for table `trigger_patient_payments_update`
--

INSERT INTO `trigger_patient_payments_update` (`id`, `patient_payments_id`, `visit_id`, `patient_id`, `cost`, `pharm_payments`, `lab_payments`, `date`, `mpesa_code`, `transaction_date`, `changetype`, `total_payments_dr`, `total_payments_cr`) VALUES
(4, 3, 11, 22, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-05 14:00:41', 'AFTER_UPDATE', 0.00, 0.00),
(5, 3, 11, 22, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-05 14:00:41', 'INSERT', 0.00, 0.00),
(6, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-06 12:05:27', 'AFTER_UPDATE', 0.00, 0.00),
(7, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-06 12:05:27', 'INSERT', 0.00, 0.00),
(8, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-06 12:05:28', 'AFTER_UPDATE', 0.00, 0.00),
(9, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-06 12:05:28', 'INSERT', 0.00, 0.00),
(10, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-06 12:05:30', 'AFTER_UPDATE', 0.00, 0.00),
(11, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-06 12:05:30', 'INSERT', 0.00, 0.00),
(12, 3, 11, 22, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-06 12:05:33', 'AFTER_UPDATE', 0.00, 0.00),
(13, 3, 11, 22, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-06 12:05:33', 'INSERT', 0.00, 0.00),
(14, 3, 11, 22, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-06 12:05:35', 'AFTER_UPDATE', 0.00, 0.00),
(15, 3, 11, 22, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-06 12:05:35', 'INSERT', 0.00, 0.00),
(16, 7, 16, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-06 12:15:22', 'INSERT', 0.00, 0.00),
(17, 8, 17, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-06 12:29:48', 'INSERT', 0.00, 0.00),
(18, 3, 11, 22, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-06 14:53:55', 'AFTER_UPDATE', 0.00, 0.00),
(19, 3, 11, 23, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-06 14:53:55', 'INSERT', 0.00, 0.00),
(20, 3, 11, 23, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-06 14:54:17', 'AFTER_UPDATE', 0.00, 0.00),
(21, 3, 12, 23, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-06 14:54:17', 'INSERT', 0.00, 0.00),
(22, 3, 12, 23, 100.0000, 120.0000, 120.0000, '2013-12-18', '', '2014-01-06 14:54:23', 'AFTER_UPDATE', 0.00, 0.00),
(23, 3, 12, 23, 100.0000, 120.0000, 450.0000, '2013-12-18', '', '2014-01-06 14:54:23', 'INSERT', 0.00, 0.00),
(24, 3, 12, 23, 100.0000, 120.0000, 450.0000, '2013-12-18', '', '2014-01-06 15:02:59', 'AFTER_UPDATE', 0.00, 0.00),
(25, 3, 12, 23, 100.0000, 120.0000, 900.0000, '2013-12-18', '', '2014-01-06 15:02:59', 'INSERT', 0.00, 0.00),
(26, 3, 12, 23, 100.0000, 120.0000, 900.0000, '2013-12-18', '', '2014-01-06 15:04:10', 'AFTER_UPDATE', 0.00, 0.00),
(27, 3, 12, 23, 100.0000, 120.0000, 1350.0000, '2013-12-18', '', '2014-01-06 15:04:10', 'INSERT', 0.00, 0.00),
(28, 3, 12, 23, 100.0000, 120.0000, 1350.0000, '2013-12-18', '', '2014-01-06 15:04:53', 'AFTER_UPDATE', 0.00, 0.00),
(29, 3, 12, 23, 100.0000, 120.0000, 1800.0000, '2013-12-18', '', '2014-01-06 15:04:53', 'INSERT', 0.00, 0.00),
(30, 3, 12, 23, 100.0000, 120.0000, 1800.0000, '2013-12-18', '', '2014-01-07 02:57:21', 'AFTER_UPDATE', 0.00, 0.00),
(31, 3, 12, 23, 100.0000, 120.0000, 2250.0000, '2013-12-18', '', '2014-01-07 02:57:21', 'INSERT', 0.00, 0.00),
(32, 3, 12, 23, 100.0000, 120.0000, 2250.0000, '2013-12-18', '', '2014-01-07 02:59:52', 'AFTER_UPDATE', 0.00, 0.00),
(33, 3, 12, 23, 100.0000, 120.0000, 2700.0000, '2013-12-18', '', '2014-01-07 02:59:52', 'INSERT', 0.00, 0.00),
(34, 3, 12, 23, 100.0000, 120.0000, 2700.0000, '2013-12-18', '', '2014-01-07 03:04:37', 'AFTER_UPDATE', 0.00, 0.00),
(35, 3, 12, 23, 100.0000, 120.0000, 3150.0000, '2013-12-18', '', '2014-01-07 03:04:37', 'INSERT', 0.00, 0.00),
(36, 3, 12, 23, 100.0000, 120.0000, 3150.0000, '2013-12-18', '', '2014-01-07 03:05:33', 'AFTER_UPDATE', 0.00, 0.00),
(37, 3, 12, 23, 100.0000, 120.0000, 3600.0000, '2013-12-18', '', '2014-01-07 03:05:33', 'INSERT', 0.00, 0.00),
(38, 3, 12, 23, 100.0000, 120.0000, 3600.0000, '2013-12-18', '', '2014-01-07 07:15:29', 'AFTER_UPDATE', 0.00, 0.00),
(39, 3, 12, 23, 100.0000, 120.0000, 4050.0000, '2013-12-18', '', '2014-01-07 07:15:29', 'INSERT', 0.00, 0.00),
(40, 3, 12, 23, 100.0000, 120.0000, 4050.0000, '2013-12-18', '', '2014-01-07 07:15:58', 'AFTER_UPDATE', 0.00, 0.00),
(41, 3, 12, 23, 100.0000, 120.0000, 4500.0000, '2013-12-18', '', '2014-01-07 07:15:58', 'INSERT', 0.00, 0.00),
(42, 8, 17, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-07 14:31:49', 'AFTER_UPDATE', 0.00, 0.00),
(43, 8, 14, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-07 14:31:49', 'INSERT', 0.00, 0.00),
(44, 8, 14, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-07 14:31:54', 'AFTER_UPDATE', 0.00, 0.00),
(45, 8, 14, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-07 14:31:54', 'INSERT', 0.00, 0.00),
(46, 9, 18, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-08 01:19:29', 'INSERT', 0.00, 0.00),
(47, 10, 19, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-08 01:22:06', 'INSERT', 0.00, 0.00),
(48, 11, 20, 6, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-08 01:41:41', 'INSERT', 0.00, 0.00),
(49, 12, 21, 3, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-08 01:49:29', 'INSERT', 0.00, 0.00),
(50, 13, 22, 8, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-08 01:53:02', 'INSERT', 0.00, 0.00),
(51, 13, 22, 8, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-08 11:52:39', 'AFTER_UPDATE', 0.00, 0.00),
(52, 13, 22, 8, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-08 11:52:39', 'INSERT', 0.00, 0.00),
(53, 13, 22, 8, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-08 11:55:52', 'AFTER_UPDATE', 0.00, 0.00),
(54, 13, 22, 8, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-08 11:55:52', 'INSERT', 0.00, 0.00),
(55, 11, 20, 6, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 11:27:17', 'AFTER_UPDATE', 0.00, 0.00),
(56, 11, 20, 6, 300.0000, 230.0000, 0.0000, '0000-00-00', '', '2014-01-09 11:27:17', 'INSERT', 0.00, 0.00),
(57, 12, 21, 3, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 11:27:23', 'AFTER_UPDATE', 0.00, 0.00),
(58, 12, 21, 3, 300.0000, 0.0230, 0.0000, '0000-00-00', '', '2014-01-09 11:27:23', 'INSERT', 0.00, 0.00),
(59, 13, 22, 8, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 11:27:30', 'AFTER_UPDATE', 0.00, 0.00),
(60, 13, 22, 8, 300.0000, 400.0000, 0.0000, '0000-00-00', '', '2014-01-09 11:27:30', 'INSERT', 0.00, 0.00),
(61, 10, 19, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 11:27:38', 'AFTER_UPDATE', 0.00, 0.00),
(62, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 11:27:38', 'INSERT', 0.00, 0.00),
(63, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 11:27:45', 'AFTER_UPDATE', 0.00, 0.00),
(64, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 11:27:45', 'INSERT', 0.00, 0.00),
(65, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-09 12:17:36', 'AFTER_UPDATE', 0.00, 0.00),
(66, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-09 12:17:36', 'INSERT', 0.00, 0.00),
(67, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-09 12:17:40', 'AFTER_UPDATE', 0.00, 0.00),
(68, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-09 12:17:40', 'INSERT', 0.00, 0.00),
(69, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-09 12:17:44', 'AFTER_UPDATE', 0.00, 0.00),
(70, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-09 12:17:44', 'INSERT', 0.00, 0.00),
(71, 3, 12, 23, 100.0000, 120.0000, 4500.0000, '2013-12-18', '', '2014-01-09 12:17:48', 'AFTER_UPDATE', 0.00, 0.00),
(72, 3, 12, 23, 100.0000, 120.0000, 4500.0000, '2013-12-18', '', '2014-01-09 12:17:48', 'INSERT', 0.00, 0.00),
(73, 3, 12, 23, 100.0000, 120.0000, 4500.0000, '2013-12-18', '', '2014-01-09 12:17:51', 'AFTER_UPDATE', 0.00, 0.00),
(74, 3, 12, 23, 100.0000, 120.0000, 4500.0000, '2013-12-18', '', '2014-01-09 12:17:51', 'INSERT', 0.00, 0.00),
(75, 3, 12, 23, 100.0000, 120.0000, 4500.0000, '2013-12-18', '', '2014-01-09 12:17:54', 'AFTER_UPDATE', 0.00, 0.00),
(76, 3, 12, 23, 100.0000, 120.0000, 4500.0000, '2013-12-18', '', '2014-01-09 12:17:54', 'INSERT', 0.00, 0.00),
(77, 7, 16, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:01', 'AFTER_UPDATE', 0.00, 0.00),
(78, 7, 16, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:01', 'INSERT', 0.00, 0.00),
(79, 7, 16, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:07', 'AFTER_UPDATE', 0.00, 0.00),
(80, 7, 16, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:07', 'INSERT', 0.00, 0.00),
(81, 7, 16, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:10', 'AFTER_UPDATE', 0.00, 0.00),
(82, 7, 16, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:10', 'INSERT', 0.00, 0.00),
(83, 8, 14, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:14', 'AFTER_UPDATE', 0.00, 0.00),
(84, 8, 14, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:14', 'INSERT', 0.00, 0.00),
(85, 8, 14, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:17', 'AFTER_UPDATE', 0.00, 0.00),
(86, 8, 14, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:17', 'INSERT', 0.00, 0.00),
(87, 8, 14, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:23', 'AFTER_UPDATE', 0.00, 0.00),
(88, 8, 14, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:23', 'INSERT', 0.00, 0.00),
(89, 9, 18, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:30', 'AFTER_UPDATE', 0.00, 0.00),
(90, 9, 18, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:30', 'INSERT', 0.00, 0.00),
(91, 9, 18, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:33', 'AFTER_UPDATE', 0.00, 0.00),
(92, 9, 18, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:33', 'INSERT', 0.00, 0.00),
(93, 9, 18, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:37', 'AFTER_UPDATE', 0.00, 0.00),
(94, 9, 18, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:37', 'INSERT', 0.00, 0.00),
(95, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 12:18:41', 'AFTER_UPDATE', 0.00, 0.00),
(96, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 12:18:41', 'INSERT', 0.00, 0.00),
(97, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 12:18:46', 'AFTER_UPDATE', 0.00, 0.00),
(98, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 12:18:46', 'INSERT', 0.00, 0.00),
(99, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 12:18:49', 'AFTER_UPDATE', 0.00, 0.00),
(100, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 12:18:49', 'INSERT', 0.00, 0.00),
(101, 11, 20, 6, 300.0000, 230.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:54', 'AFTER_UPDATE', 0.00, 0.00),
(102, 11, 20, 6, 300.0000, 230.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:18:54', 'INSERT', 0.00, 0.00),
(103, 11, 20, 6, 300.0000, 230.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:19:05', 'AFTER_UPDATE', 0.00, 0.00),
(104, 11, 20, 6, 300.0000, 230.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:19:05', 'INSERT', 0.00, 0.00),
(105, 11, 20, 6, 300.0000, 230.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:19:09', 'AFTER_UPDATE', 0.00, 0.00),
(106, 11, 20, 6, 300.0000, 230.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:19:09', 'INSERT', 0.00, 0.00),
(107, 12, 21, 3, 300.0000, 0.0230, 0.0000, '0000-00-00', '', '2014-01-09 12:19:12', 'AFTER_UPDATE', 0.00, 0.00),
(108, 12, 21, 3, 300.0000, 0.0230, 0.0000, '0000-00-00', '', '2014-01-09 12:19:12', 'INSERT', 0.00, 0.00),
(109, 12, 21, 3, 300.0000, 0.0230, 0.0000, '0000-00-00', '', '2014-01-09 12:19:16', 'AFTER_UPDATE', 0.00, 0.00),
(110, 12, 21, 3, 300.0000, 0.0230, 0.0000, '0000-00-00', '', '2014-01-09 12:19:16', 'INSERT', 0.00, 0.00),
(111, 12, 21, 3, 300.0000, 0.0230, 0.0000, '0000-00-00', '', '2014-01-09 12:19:19', 'AFTER_UPDATE', 0.00, 0.00),
(112, 12, 21, 3, 300.0000, 0.0230, 0.0000, '0000-00-00', '', '2014-01-09 12:19:19', 'INSERT', 0.00, 0.00),
(113, 13, 22, 8, 300.0000, 400.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:19:24', 'AFTER_UPDATE', 0.00, 0.00),
(114, 13, 22, 8, 300.0000, 400.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:19:24', 'INSERT', 0.00, 0.00),
(115, 13, 22, 8, 300.0000, 400.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:19:27', 'AFTER_UPDATE', 0.00, 0.00),
(116, 13, 22, 8, 300.0000, 400.0000, 0.0000, '0000-00-00', '', '2014-01-09 12:19:27', 'INSERT', 0.00, 0.00),
(117, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 12:19:44', 'AFTER_UPDATE', 0.00, 0.00),
(118, 10, 19, 2, 300.0000, 0.0000, 1000.0000, '0000-00-00', '', '2014-01-09 12:19:44', 'INSERT', 0.00, 0.00),
(119, 13, 22, 8, 300.0000, 400.0000, 0.0000, '0000-00-00', '', '2014-01-09 13:08:38', 'AFTER_UPDATE', 0.00, 0.00),
(120, 13, 22, 8, 300.0000, 400.0000, 0.0000, '0000-00-00', '', '2014-01-09 13:08:38', 'INSERT', 0.00, 0.00),
(125, 13, 22, 8, 300.0000, 400.0000, 0.0000, '0000-00-00', '', '2014-01-09 13:17:23', 'AFTER_UPDATE', 0.00, 0.00),
(126, 13, 22, 8, 300.0000, 425.0000, 0.0000, '0000-00-00', '', '2014-01-09 13:17:23', 'INSERT', 0.00, 0.00),
(127, 13, 22, 8, 300.0000, 425.0000, 0.0000, '0000-00-00', '', '2014-01-09 13:36:38', 'AFTER_UPDATE', 0.00, 0.00),
(128, 13, 22, 8, 300.0000, 450.0000, 0.0000, '0000-00-00', '', '2014-01-09 13:36:38', 'INSERT', 0.00, 0.00),
(129, 14, 23, 3, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-17 09:03:45', 'INSERT', 0.00, 0.00),
(130, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2013-12-21', '', '2014-01-20 06:46:06', 'AFTER_UPDATE', 0.00, 0.00),
(131, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2014-01-20', '', '2014-01-20 06:46:06', 'INSERT', 0.00, 0.00),
(132, 15, 24, 2, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-20 10:27:46', 'INSERT', 0.00, 0.00),
(133, 16, 25, 25, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-20 10:51:45', 'INSERT', 0.00, 0.00),
(134, 17, 26, 11, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-20 10:53:56', 'INSERT', 0.00, 0.00),
(135, 3, 12, 23, 100.0000, 120.0000, 4500.0000, '2013-12-18', '', '2014-01-20 12:37:53', 'AFTER_UPDATE', 0.00, 0.00),
(136, 3, 12, 23, 100.0000, 120.0000, 4850.0000, '2013-12-18', '', '2014-01-20 12:37:53', 'INSERT', 0.00, 0.00),
(137, 3, 12, 23, 100.0000, 120.0000, 4850.0000, '2013-12-18', '', '2014-01-20 12:39:45', 'AFTER_UPDATE', 0.00, 0.00),
(138, 3, 12, 23, 100.0000, 120.0000, 5350.0000, '2013-12-18', '', '2014-01-20 12:39:45', 'INSERT', 0.00, 0.00),
(139, 3, 12, 23, 100.0000, 120.0000, 5350.0000, '2013-12-18', '', '2014-01-20 12:47:05', 'AFTER_UPDATE', 0.00, 0.00),
(140, 3, 12, 23, 100.0000, 120.0000, 5850.0000, '2013-12-18', '', '2014-01-20 12:47:05', 'INSERT', 0.00, 0.00),
(141, 3, 12, 23, 100.0000, 120.0000, 5850.0000, '2013-12-18', '', '2014-01-21 01:32:56', 'AFTER_UPDATE', 0.00, 0.00),
(142, 3, 12, 23, 100.0000, 120.0000, 500.0000, '2013-12-18', '', '2014-01-21 01:32:56', 'INSERT', 0.00, 0.00),
(143, 3, 12, 23, 100.0000, 120.0000, 500.0000, '2013-12-18', '', '2014-01-21 01:35:34', 'AFTER_UPDATE', 0.00, 0.00),
(144, 3, 12, 23, 100.0000, 120.0000, 500.0000, '2013-12-18', '', '2014-01-21 01:35:34', 'INSERT', 0.00, 0.00),
(145, 3, 12, 23, 100.0000, 120.0000, 500.0000, '2013-12-18', '', '2014-01-21 01:38:26', 'AFTER_UPDATE', 0.00, 0.00),
(146, 3, 12, 23, 100.0000, 120.0000, 500.0000, '2013-12-18', '', '2014-01-21 01:38:26', 'INSERT', 0.00, 0.00),
(147, 3, 12, 23, 100.0000, 120.0000, 500.0000, '2013-12-18', '', '2014-01-21 01:48:21', 'AFTER_UPDATE', 0.00, 0.00),
(148, 3, 12, 23, 100.0000, 120.0000, 650.0000, '2013-12-18', '', '2014-01-21 01:48:21', 'INSERT', 0.00, 0.00),
(149, 3, 12, 23, 100.0000, 120.0000, 650.0000, '2013-12-18', '', '2014-01-21 02:58:51', 'AFTER_UPDATE', 0.00, 0.00),
(150, 3, 12, 23, 100.0000, 120.0000, 650.0000, '2013-12-18', '', '2014-01-21 02:58:51', 'INSERT', 0.00, 0.00),
(151, 18, 27, 7, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-21 08:12:25', 'INSERT', 0.00, 0.00),
(152, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-21 08:13:40', 'INSERT', 0.00, 0.00),
(153, 3, 12, 23, 100.0000, 120.0000, 650.0000, '2013-12-18', '', '2014-01-21 14:03:10', 'AFTER_UPDATE', 0.00, 0.00),
(154, 3, 12, 23, 100.0000, 120.0000, 1100.0000, '2013-12-18', '', '2014-01-21 14:03:10', 'INSERT', 0.00, 0.00),
(155, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2014-01-20', '', '2014-01-22 07:41:44', 'AFTER_UPDATE', 0.00, 0.00),
(156, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2014-01-20', '', '2014-01-22 07:41:44', 'INSERT', 0.00, 0.00),
(157, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2014-01-20', '', '2014-01-22 07:43:40', 'AFTER_UPDATE', 0.00, 0.00),
(158, 2, 10, 21, 100.0000, 0.0000, 0.0000, '2014-01-20', '', '2014-01-22 07:43:40', 'INSERT', 0.00, 0.00),
(159, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 08:00:55', 'AFTER_UPDATE', 0.00, 0.00),
(160, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 08:00:55', 'INSERT', 0.00, 0.00),
(161, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 08:09:45', 'AFTER_UPDATE', 0.00, 0.00),
(162, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 08:09:45', 'INSERT', 0.00, 0.00),
(163, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 10:38:43', 'AFTER_UPDATE', 0.00, 0.00),
(164, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 10:38:43', 'INSERT', 1000.00, 0.00),
(165, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 11:59:56', 'AFTER_UPDATE', 1000.00, 0.00),
(166, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 11:59:56', 'INSERT', 1000.00, 0.00),
(167, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 13:58:39', 'AFTER_UPDATE', 1000.00, 0.00),
(168, 19, 28, 10, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-22 13:58:39', 'INSERT', 1000.00, 0.00),
(169, 20, 29, 7, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-23 06:45:09', 'INSERT', 300.00, 0.00),
(170, 21, 30, 5, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-23 10:30:27', 'INSERT', 300.00, 0.00),
(171, 22, 31, 19, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-23 11:55:01', 'INSERT', 300.00, 0.00),
(172, 23, 32, 5, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-24 06:58:40', 'INSERT', 300.00, 0.00),
(173, 24, 33, 3, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-29 06:42:25', 'INSERT', 300.00, 0.00),
(174, 24, 33, 3, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-29 08:13:22', 'AFTER_UPDATE', 300.00, 0.00),
(175, 24, 33, 3, 300.0000, 0.0000, 150.0000, '0000-00-00', '', '2014-01-29 08:13:22', 'INSERT', 450.00, 0.00),
(176, 24, 33, 3, 300.0000, 0.0000, 150.0000, '0000-00-00', '', '2014-01-29 10:37:49', 'AFTER_UPDATE', 450.00, 0.00),
(177, 24, 33, 3, 300.0000, 0.0000, 300.0000, '0000-00-00', '', '2014-01-29 10:37:49', 'INSERT', 450.00, 0.00),
(178, 24, 33, 3, 300.0000, 0.0000, 300.0000, '0000-00-00', '', '2014-01-29 10:46:51', 'AFTER_UPDATE', 450.00, 0.00),
(179, 24, 33, 3, 300.0000, 0.0000, 300.0000, '0000-00-00', '', '2014-01-29 10:46:51', 'INSERT', 450.00, 0.00),
(180, 24, 33, 3, 300.0000, 0.0000, 300.0000, '0000-00-00', '', '2014-01-29 11:41:31', 'AFTER_UPDATE', 450.00, 0.00),
(181, 24, 33, 3, 300.0000, 0.0000, 750.0000, '0000-00-00', '', '2014-01-29 11:41:31', 'INSERT', 900.00, 0.00),
(182, 24, 33, 3, 300.0000, 0.0000, 750.0000, '0000-00-00', '', '2014-01-29 11:55:55', 'AFTER_UPDATE', 900.00, 0.00),
(183, 24, 33, 3, 300.0000, 0.0000, 1200.0000, '0000-00-00', '', '2014-01-29 11:55:55', 'INSERT', 900.00, 0.00),
(184, 24, 33, 3, 300.0000, 0.0000, 1200.0000, '0000-00-00', '', '2014-01-29 11:56:32', 'AFTER_UPDATE', 900.00, 0.00),
(185, 24, 33, 3, 300.0000, 0.0000, 1200.0000, '0000-00-00', '', '2014-01-29 11:56:32', 'INSERT', 900.00, 0.00),
(186, 24, 33, 3, 300.0000, 0.0000, 1200.0000, '0000-00-00', '', '2014-01-29 11:59:53', 'AFTER_UPDATE', 900.00, 0.00),
(187, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 11:59:53', 'INSERT', 1500.00, 0.00),
(188, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:19:51', 'AFTER_UPDATE', 1500.00, 0.00),
(189, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:19:51', 'INSERT', 1850.00, 0.00),
(190, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:21:21', 'AFTER_UPDATE', 1850.00, 0.00),
(191, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:21:21', 'INSERT', 1850.00, 0.00),
(192, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:31:17', 'AFTER_UPDATE', 1850.00, 0.00),
(193, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:31:17', 'INSERT', 2350.00, 0.00),
(194, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:36:28', 'AFTER_UPDATE', 2350.00, 0.00),
(195, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:36:28', 'INSERT', 3100.00, 0.00),
(196, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:47:06', 'AFTER_UPDATE', 3100.00, 0.00),
(197, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:47:06', 'INSERT', 3100.00, 0.00),
(198, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:47:45', 'AFTER_UPDATE', 3100.00, 0.00),
(199, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:47:45', 'INSERT', 3100.00, 0.00),
(200, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:47:58', 'AFTER_UPDATE', 3100.00, 0.00),
(201, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:47:58', 'INSERT', 3100.00, 0.00),
(202, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:59:58', 'AFTER_UPDATE', 3100.00, 0.00),
(203, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 12:59:58', 'INSERT', 3100.00, 0.00),
(204, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 13:21:37', 'AFTER_UPDATE', 3100.00, 0.00),
(205, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 13:21:37', 'INSERT', 3950.00, 0.00),
(206, 24, 33, 3, 300.0000, 600.0000, 1200.0000, '0000-00-00', '', '2014-01-29 19:16:29', 'AFTER_UPDATE', 3950.00, 0.00),
(207, 24, 33, 3, 300.0000, 1200.0000, 1200.0000, '0000-00-00', '', '2014-01-29 19:16:29', 'INSERT', 4550.00, 0.00),
(208, 24, 33, 3, 300.0000, 1200.0000, 1200.0000, '0000-00-00', '', '2014-01-30 06:39:27', 'AFTER_UPDATE', 4550.00, 0.00),
(209, 24, 33, 3, 300.0000, 1225.0000, 1200.0000, '0000-00-00', '', '2014-01-30 06:39:27', 'INSERT', 4550.00, 0.00),
(210, 25, 34, 3, 300.0000, 0.0000, 0.0000, '0000-00-00', '', '2014-01-30 12:54:18', 'INSERT', 300.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `trigger_patient_update`
--

CREATE TABLE `trigger_patient_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `other_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `marital_status` enum('single','married','divorced') NOT NULL,
  `phone_no` int(11) NOT NULL,
  `identification_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `residence` varchar(255) NOT NULL,
  `employment_status` enum('employed','not_employed') NOT NULL,
  `employer` varchar(255) NOT NULL,
  `next_of_kin_fname` varchar(255) NOT NULL,
  `next_of_kin_lname` varchar(255) NOT NULL,
  `next_of_kin_relation` varchar(255) NOT NULL,
  `next_of_kin_phone` varchar(255) NOT NULL,
  `is_shwari_member` enum('Yes','No') NOT NULL,
  `shwari_member_relation` varchar(255) NOT NULL,
  `family_number` varchar(255) NOT NULL,
  `status` enum('Active','In Active') NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=218 ;

--
-- Dumping data for table `trigger_patient_update`
--

INSERT INTO `trigger_patient_update` (`id`, `patient_id`, `f_name`, `s_name`, `other_name`, `dob`, `gender`, `marital_status`, `phone_no`, `identification_number`, `email`, `residence`, `employment_status`, `employer`, `next_of_kin_fname`, `next_of_kin_lname`, `next_of_kin_relation`, `next_of_kin_phone`, `is_shwari_member`, `shwari_member_relation`, `family_number`, `status`, `transaction_date`, `changetype`) VALUES
(1, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', '', 'Active', '2013-12-06 13:31:06', 'BEFORE_UPDATE'),
(2, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', '', 'Active', '2013-12-06 13:31:06', 'AFTER_UPDATE'),
(3, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:25:43', 'BEFORE_UPDATE'),
(4, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:25:43', 'AFTER_UPDATE'),
(5, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:25:46', 'BEFORE_UPDATE'),
(6, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:25:46', 'AFTER_UPDATE'),
(7, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:25:50', 'BEFORE_UPDATE'),
(8, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:25:50', 'AFTER_UPDATE'),
(9, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:26:11', 'BEFORE_UPDATE'),
(10, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:26:11', 'AFTER_UPDATE'),
(11, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:26:41', 'BEFORE_UPDATE'),
(12, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:26:41', 'AFTER_UPDATE'),
(13, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:26:46', 'BEFORE_UPDATE'),
(14, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:26:46', 'AFTER_UPDATE'),
(15, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:26:52', 'BEFORE_UPDATE'),
(16, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 07:26:52', 'AFTER_UPDATE'),
(17, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_0001', 'Active', '2013-12-16 08:19:57', 'BEFORE_UPDATE'),
(18, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:19:57', 'AFTER_UPDATE'),
(19, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:19:59', 'BEFORE_UPDATE'),
(20, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:19:59', 'AFTER_UPDATE'),
(21, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:00', 'BEFORE_UPDATE'),
(22, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:00', 'AFTER_UPDATE'),
(23, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:01', 'BEFORE_UPDATE'),
(24, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:01', 'AFTER_UPDATE'),
(25, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:04', 'BEFORE_UPDATE'),
(26, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:04', 'AFTER_UPDATE'),
(27, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:04', 'BEFORE_UPDATE'),
(28, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:04', 'AFTER_UPDATE'),
(29, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:07', 'BEFORE_UPDATE'),
(30, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:20:07', 'AFTER_UPDATE'),
(31, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', '', 'Active', '2013-12-16 08:20:18', 'BEFORE_UPDATE'),
(32, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI000001_002', 'Active', '2013-12-16 08:20:18', 'AFTER_UPDATE'),
(33, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI000001_002', 'Active', '2013-12-16 08:20:22', 'BEFORE_UPDATE'),
(34, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI000001_002', 'Active', '2013-12-16 08:20:22', 'AFTER_UPDATE'),
(35, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI000001_001', 'Active', '2013-12-16 08:21:52', 'BEFORE_UPDATE'),
(36, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-16 08:21:52', 'AFTER_UPDATE'),
(37, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-16 08:21:55', 'BEFORE_UPDATE'),
(38, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-16 08:21:55', 'AFTER_UPDATE'),
(39, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-16 08:21:56', 'BEFORE_UPDATE'),
(40, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-16 08:21:56', 'AFTER_UPDATE'),
(41, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-16 08:21:59', 'BEFORE_UPDATE'),
(42, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-16 08:21:59', 'AFTER_UPDATE'),
(43, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-16 08:22:02', 'BEFORE_UPDATE'),
(44, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-16 08:22:02', 'AFTER_UPDATE'),
(45, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI000001_002', 'Active', '2013-12-16 08:22:10', 'BEFORE_UPDATE'),
(46, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000001_002', 'Active', '2013-12-16 08:22:10', 'AFTER_UPDATE'),
(47, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000001_002', 'Active', '2013-12-16 12:05:30', 'BEFORE_UPDATE'),
(48, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-16 12:05:30', 'AFTER_UPDATE'),
(49, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-16 12:05:43', 'BEFORE_UPDATE'),
(50, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-16 12:05:43', 'AFTER_UPDATE'),
(51, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-16 12:05:47', 'BEFORE_UPDATE'),
(52, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-16 12:05:47', 'AFTER_UPDATE'),
(53, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-16 12:05:47', 'BEFORE_UPDATE'),
(54, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-16 12:05:47', 'AFTER_UPDATE'),
(55, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-16 13:13:08', 'BEFORE_UPDATE'),
(56, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-16 13:13:08', 'AFTER_UPDATE'),
(57, 7, 'Q', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_0012', 'Active', '2013-12-16 13:49:09', 'BEFORE_UPDATE'),
(58, 7, 'Q', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:49:09', 'AFTER_UPDATE'),
(59, 7, 'Q', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:49:12', 'BEFORE_UPDATE'),
(60, 7, 'Q', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:49:12', 'AFTER_UPDATE'),
(61, 7, 'Q', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:49:12', 'BEFORE_UPDATE'),
(62, 7, 'Q', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:49:12', 'AFTER_UPDATE'),
(63, 7, 'Q', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:49:14', 'BEFORE_UPDATE'),
(64, 7, 'Q', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:49:14', 'AFTER_UPDATE'),
(65, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_001213', 'Active', '2013-12-16 13:50:31', 'BEFORE_UPDATE'),
(66, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_013', 'Active', '2013-12-16 13:50:31', 'AFTER_UPDATE'),
(67, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_013', 'Active', '2013-12-16 13:50:37', 'BEFORE_UPDATE'),
(68, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_013', 'Active', '2013-12-16 13:50:37', 'AFTER_UPDATE'),
(69, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_013', 'Active', '2013-12-16 13:50:38', 'BEFORE_UPDATE'),
(70, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_013', 'Active', '2013-12-16 13:50:38', 'AFTER_UPDATE'),
(71, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_1214', 'Active', '2013-12-16 13:52:22', 'BEFORE_UPDATE'),
(72, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_014', 'Active', '2013-12-16 13:52:22', 'AFTER_UPDATE'),
(73, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_014', 'Active', '2013-12-16 13:54:02', 'BEFORE_UPDATE'),
(74, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_014', 'Active', '2013-12-16 13:54:02', 'AFTER_UPDATE'),
(75, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_014', 'Active', '2013-12-16 13:54:05', 'BEFORE_UPDATE'),
(76, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_014', 'Active', '2013-12-16 13:54:05', 'AFTER_UPDATE'),
(77, 7, 'Q', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:54:45', 'BEFORE_UPDATE'),
(78, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:54:45', 'AFTER_UPDATE'),
(79, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:54:47', 'BEFORE_UPDATE'),
(80, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:54:47', 'AFTER_UPDATE'),
(81, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:54:48', 'BEFORE_UPDATE'),
(82, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:54:48', 'AFTER_UPDATE'),
(83, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:54:49', 'BEFORE_UPDATE'),
(84, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-16 13:54:49', 'AFTER_UPDATE'),
(85, 4, 'Dindi', 'Dindi', 'Dindi', '2013-12-15', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', '', 'Seld', '0714339521', 'Yes', '', 'SHWARI_0000012', 'Active', '2013-12-17 05:55:30', 'BEFORE_UPDATE'),
(86, 4, 'Dindi', 'Dindi', 'Dindi', '2013-12-15', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', '', 'Seld', '0714339521', 'Yes', '', 'SHWARI_000002_003', 'Active', '2013-12-17 05:55:30', 'AFTER_UPDATE'),
(87, 6, 'D', 'Dindi', 'H', '2013-12-16', 'female', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'q', 'w', 'e', '123456789', 'Yes', '', 'SHWARI_0000012', 'Active', '2013-12-17 06:00:08', 'BEFORE_UPDATE'),
(88, 6, 'D', 'Dindi', 'H', '2013-12-16', 'female', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'q', 'w', 'e', '123456789', 'Yes', '', 'SHWARI_000002_005', 'Active', '2013-12-17 06:00:08', 'AFTER_UPDATE'),
(89, 5, 'Dindi', 'Dindi', 'dINDI', '2013-12-08', 'female', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_0000012', 'Active', '2013-12-17 06:00:13', 'BEFORE_UPDATE'),
(90, 5, 'Dindi', 'Dindi', 'dINDI', '2013-12-08', 'female', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_000002_004', 'Active', '2013-12-17 06:00:13', 'AFTER_UPDATE'),
(91, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_014', 'Active', '2013-12-17 06:37:07', 'BEFORE_UPDATE'),
(92, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_000', 'Active', '2013-12-17 06:37:07', 'AFTER_UPDATE'),
(93, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_000', 'Active', '2013-12-17 06:37:10', 'BEFORE_UPDATE'),
(94, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_000', 'Active', '2013-12-17 06:37:10', 'AFTER_UPDATE'),
(95, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_000', 'Active', '2013-12-17 06:46:39', 'BEFORE_UPDATE'),
(96, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_000', 'Active', '2013-12-17 06:46:39', 'AFTER_UPDATE'),
(97, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_000', 'Active', '2013-12-17 06:47:54', 'BEFORE_UPDATE'),
(98, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_000', 'Active', '2013-12-17 06:47:54', 'AFTER_UPDATE'),
(99, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_013', 'Active', '2013-12-17 06:47:57', 'BEFORE_UPDATE'),
(100, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_013', 'Active', '2013-12-17 06:47:57', 'AFTER_UPDATE'),
(101, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-17 06:47:58', 'BEFORE_UPDATE'),
(102, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-17 06:47:58', 'AFTER_UPDATE'),
(103, 6, 'D', 'Dindi', 'H', '2013-12-16', 'female', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'q', 'w', 'e', '123456789', 'Yes', '', 'SHWARI_000002_005', 'Active', '2013-12-17 06:47:59', 'BEFORE_UPDATE'),
(104, 6, 'D', 'Dindi', 'H', '2013-12-16', 'female', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'q', 'w', 'e', '123456789', 'Yes', '', 'SHWARI_000002_005', 'Active', '2013-12-17 06:47:59', 'AFTER_UPDATE'),
(105, 5, 'Dindi', 'Dindi', 'dINDI', '2013-12-08', 'female', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_000002_004', 'Active', '2013-12-17 06:48:00', 'BEFORE_UPDATE'),
(106, 5, 'Dindi', 'Dindi', 'dINDI', '2013-12-08', 'female', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_000002_004', 'Active', '2013-12-17 06:48:00', 'AFTER_UPDATE'),
(107, 4, 'Dindi', 'Dindi', 'Dindi', '2013-12-15', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', '', 'Seld', '0714339521', 'Yes', '', 'SHWARI_000002_003', 'Active', '2013-12-17 06:48:00', 'BEFORE_UPDATE'),
(108, 4, 'Dindi', 'Dindi', 'Dindi', '2013-12-15', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', '', 'Seld', '0714339521', 'Yes', '', 'SHWARI_000002_003', 'Active', '2013-12-17 06:48:00', 'AFTER_UPDATE'),
(109, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-17 06:48:00', 'BEFORE_UPDATE'),
(110, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-17 06:48:00', 'AFTER_UPDATE'),
(111, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-17 06:48:36', 'BEFORE_UPDATE'),
(112, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-17 06:48:36', 'AFTER_UPDATE'),
(113, 15, 'htgfd', 'htgrfed', 'htgrfed', '2013-12-01', 'male', 'divorced', 0, '12345678', 'htgf@hgfd.gfd', '', '', '', 'htbgvcfd', 'vcfds', 'gfdfe', '6534254', 'Yes', '', 'SHWARI_3_000', 'Active', '2013-12-17 08:41:57', 'BEFORE_UPDATE'),
(114, 15, 'htgfd', 'htgrfed', 'htgrfed', '2013-12-01', 'male', 'divorced', 0, '12345678', 'htgf@hgfd.gfd', '', '', '', 'htbgvcfd', 'vcfds', 'gfdfe', '6534254', 'Yes', '', 'SHWARI_3_000', 'Active', '2013-12-17 08:41:57', 'AFTER_UPDATE'),
(115, 14, 'nhgfrde', 'hbgdvcs', 'thrgfrew', '2013-12-01', 'male', 'married', 87654321, '12345678', 'hytgrf@hytgrf.grf', '', '', '', 'ybhtgvfd', 'bhtvgrfcd', 'yhgf', '876543', 'Yes', '', 'SHWARI3_0', 'Active', '2013-12-17 08:42:01', 'BEFORE_UPDATE'),
(116, 14, 'nhgfrde', 'hbgdvcs', 'thrgfrew', '2013-12-01', 'male', 'married', 87654321, '12345678', 'hytgrf@hytgrf.grf', '', '', '', 'ybhtgvfd', 'bhtvgrfcd', 'yhgf', '876543', 'Yes', '', 'SHWARI3_0', 'Active', '2013-12-17 08:42:01', 'AFTER_UPDATE'),
(117, 13, 'fbdsuyvbfduy', 'dbyuvbsuydfb', 'dfhbgvyfudb', '2013-12-01', 'male', 'married', 719123456, '57844394', 'nsifnbei@fdf.com', '', '', '', 'fnisfni', 'nsfviuenviu', 'fniuen', '0802324', 'Yes', '', 'SHWARI000002', 'Active', '2013-12-17 08:42:03', 'BEFORE_UPDATE'),
(118, 13, 'fbdsuyvbfduy', 'dbyuvbsuydfb', 'dfhbgvyfudb', '2013-12-01', 'male', 'married', 719123456, '57844394', 'nsifnbei@fdf.com', '', '', '', 'fnisfni', 'nsfviuenviu', 'fniuen', '0802324', 'Yes', '', 'SHWARI000002', 'Active', '2013-12-17 08:42:03', 'AFTER_UPDATE'),
(119, 12, 'dfgnuidn', 'fdngivend', 'ufdnbiurn', '2013-12-01', 'male', 'married', 7654231, '54312566', 'ndfgiuvnd@fvngiu.eurn', '', '', '', 'jfnbundfu', 'nuvnduing', 'self', '68954095', 'Yes', '', 'SHWARI_0', 'Active', '2013-12-17 08:42:33', 'BEFORE_UPDATE'),
(120, 12, 'dfgnuidn', 'fdngivend', 'ufdnbiurn', '2013-12-01', 'male', 'married', 7654231, '54312566', 'ndfgiuvnd@fvngiu.eurn', '', '', '', 'jfnbundfu', 'nuvnduing', 'self', '68954095', 'Yes', '', 'SHWARI_0', 'Active', '2013-12-17 08:42:33', 'AFTER_UPDATE'),
(121, 15, 'htgfd', 'htgrfed', 'htgrfed', '2013-12-01', 'male', 'divorced', 0, '12345678', 'htgf@hgfd.gfd', '', '', '', 'htbgvcfd', 'vcfds', 'gfdfe', '6534254', 'Yes', '', 'SHWARI_3_000', 'Active', '2013-12-17 10:18:04', 'BEFORE_UPDATE'),
(122, 15, 'htgfd', 'htgrfed', 'htgrfed', '2013-12-01', 'male', 'divorced', 0, '12345678', 'htgf@hgfd.gfd', '', '', '', 'htbgvcfd', 'vcfds', 'gfdfe', '6534254', 'Yes', '', 'SHWARI_3_000', 'Active', '2013-12-17 10:18:04', 'AFTER_UPDATE'),
(123, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_000001_001', 'Active', '2013-12-17 10:25:21', 'BEFORE_UPDATE'),
(124, 2, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '', 'harrisdindisamuel@gmail.com', 'Mumias', '', 'Health Strat', 'Charles', 'Dindi', 'Father', '0721627225', 'Yes', 'Father', 'SHWARI_1000001_001', 'Active', '2013-12-17 10:25:21', 'AFTER_UPDATE'),
(125, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_000002_002', 'Active', '2013-12-17 10:25:21', 'BEFORE_UPDATE'),
(126, 3, 'Samuel', 'Dindi', 'Harris', '1990-12-26', 'male', 'single', 714189234, '', 'harris.samuel@strathmore.edu', 'Nairobi', '', '', 'reception', 'reception', 'reception', '0987123456', 'No', '', 'SHWARI_1000002_002', 'Active', '2013-12-17 10:25:21', 'AFTER_UPDATE'),
(127, 4, 'Dindi', 'Dindi', 'Dindi', '2013-12-15', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', '', 'Seld', '0714339521', 'Yes', '', 'SHWARI_000002_003', 'Active', '2013-12-17 10:25:21', 'BEFORE_UPDATE'),
(128, 4, 'Dindi', 'Dindi', 'Dindi', '2013-12-15', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', '', 'Seld', '0714339521', 'Yes', '', 'SHWARI_1000002_003', 'Active', '2013-12-17 10:25:21', 'AFTER_UPDATE'),
(129, 5, 'Dindi', 'Dindi', 'dINDI', '2013-12-08', 'female', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_000002_004', 'Active', '2013-12-17 10:25:21', 'BEFORE_UPDATE'),
(130, 5, 'Dindi', 'Dindi', 'dINDI', '2013-12-08', 'female', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_1000002_004', 'Active', '2013-12-17 10:25:21', 'AFTER_UPDATE'),
(131, 6, 'D', 'Dindi', 'H', '2013-12-16', 'female', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'q', 'w', 'e', '123456789', 'Yes', '', 'SHWARI_000002_005', 'Active', '2013-12-17 10:25:21', 'BEFORE_UPDATE'),
(132, 6, 'D', 'Dindi', 'H', '2013-12-16', 'female', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'q', 'w', 'e', '123456789', 'Yes', '', 'SHWARI_1000002_005', 'Active', '2013-12-17 10:25:21', 'AFTER_UPDATE'),
(133, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_000001_012', 'Active', '2013-12-17 10:25:21', 'BEFORE_UPDATE'),
(134, 7, 'Queen', 'D', 'W', '2013-12-15', 'male', 'single', 123456789, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'Dindi', 'self', '123456789', 'Yes', '', 'SHWARI_1000001_012', 'Active', '2013-12-17 10:25:21', 'AFTER_UPDATE'),
(135, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_000001_013', 'Active', '2013-12-17 10:25:21', 'BEFORE_UPDATE'),
(136, 8, '123', '123', '123', '2013-12-09', 'male', 'single', 123456789, '12345678', 'hsd@asd.com', '', '', '', 'hsd', 'hsd', 'self', '12345678', 'Yes', '', 'SHWARI_1000001_013', 'Active', '2013-12-17 10:25:21', 'AFTER_UPDATE'),
(137, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_000001_000', 'Active', '2013-12-17 10:25:21', 'BEFORE_UPDATE'),
(138, 9, 'andisn', 'dindi', 'insdciudn', '2013-12-15', 'male', 'single', 2147483647, '12345678', 'kjbdcuyesd@jdbn.cow', '', '', '', 'feiuscnviu', 'neisfucniu', 'einfceiu', '43243535498', 'Yes', '', 'SHWARI_1000001_000', 'Active', '2013-12-17 10:25:21', 'AFTER_UPDATE'),
(139, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:46:22', 'BEFORE_UPDATE'),
(140, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:46:22', 'AFTER_UPDATE'),
(141, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:46:24', 'BEFORE_UPDATE'),
(142, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:46:24', 'AFTER_UPDATE'),
(143, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:46:24', 'BEFORE_UPDATE'),
(144, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:46:24', 'AFTER_UPDATE'),
(145, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:46:25', 'BEFORE_UPDATE'),
(146, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:46:25', 'AFTER_UPDATE'),
(147, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:57:01', 'BEFORE_UPDATE'),
(148, 19, 'dfbgiubdiuf', 'ndfigbniurnvd', 'eiugbiv', '2013-12-17', 'male', 'married', 123456781, '12345678', 'fnbvibdf@jdbfivdb.sds', '', '', '', 'ngfudn', 'dfunuvfd', 'djfngvodn', '5390464', 'Yes', '', 'SHWARI_1000004_000', 'Active', '2013-12-17 10:57:01', 'AFTER_UPDATE'),
(149, 24, 'fdnviufnd', 'dnxvuid', 'cfonsviucfds', '2013-12-23', 'male', 'married', 1234567899, '12345678', 'dnguif@fnf.com', '', '', '', 'nfsuinvc', 'cnsfviudfn', 'dfniuvdfn', '1234567890', 'Yes', '', 'SHWARI_1000007_0', 'Active', '2013-12-23 08:14:12', 'INSERT'),
(150, 25, 'Wamae', 'Sam', 'Wamae', '2013-12-23', 'male', 'married', 712345678, '12345678', 'swamae@healthstrat.co.ke', '', '', '', 'Wamae', 'Wamae', 'Self', '071234567890', 'Yes', '', 'SHWARI_1000007_0', 'Active', '2013-12-23 08:15:23', 'INSERT'),
(151, 26, 'Marani', 'Lyndon', 'Doctor', '1994-01-31', 'male', 'married', 711123123, '1234567', 'lmarani@healthstrat.co.ke', '', '', '', 'L', 'Marani', 'Self', '0712123123', 'Yes', '', 'SHWARI_1000002_4', 'Active', '2014-01-06 06:15:29', 'INSERT'),
(152, 27, 'ndfuivndfiu', 'jnviufdn', 'ifdunviudf', '2014-01-06', 'male', 'married', 2147483647, '12334656', 'bngiovfd@ifdniof.fdno', '', '', '', 'jngdbiuvngfdiu', 'nfuvfnu', 'Father', '6765432314', 'Yes', '', 'SHWARI_1000007_0', 'Active', '2014-01-06 11:12:40', 'INSERT'),
(153, 27, 'ndfuivndfiu', 'jnviufdn', 'ifdunviudf', '2014-01-06', 'male', 'married', 2147483647, '12334656', 'bngiovfd@ifdniof.fdno', '', '', '', 'jngdbiuvngfdiu', 'nfuvfnu', 'Father', '6765432314', 'Yes', '', 'SHWARI_1000007_0', 'Active', '2014-01-06 11:16:20', 'BEFORE_UPDATE'),
(154, 27, 'ndfuivndfiu', 'jnviufdn', 'ifdunviudf', '2014-01-06', 'male', 'married', 2147483647, '12334656', 'bngiovfd@ifdniof.fdno', '', '', '', 'jngdbiuvngfdiu', 'nfuvfnu', 'Father', '6765432314', 'Yes', '', 'SHWARI_1000007_0', 'Active', '2014-01-06 11:16:20', 'AFTER_UPDATE'),
(155, 27, 'ndfuivndfiu', 'jnviufdn', 'ifdunviudf', '2014-01-06', 'male', 'married', 2147483647, '12334656', 'bngiovfd@ifdniof.fdno', '', '', '', 'jngdbiuvngfdiu', 'nfuvfnu', 'Father', '6765432314', 'Yes', '', 'SHWARI_1000007_0', 'Active', '2014-01-06 11:16:24', 'BEFORE_UPDATE'),
(156, 27, 'ndfuivndfiu', 'jnviufdn', 'ifdunviudf', '2014-01-06', 'male', 'married', 2147483647, '12334656', 'bngiovfd@ifdniof.fdno', '', '', '', 'jngdbiuvngfdiu', 'nfuvfnu', 'Father', '6765432314', 'Yes', '', 'SHWARI_1000007_0', 'Active', '2014-01-06 11:16:24', 'AFTER_UPDATE'),
(157, 28, 'ctrc', 'jbhu', 'xdxe', '2004-01-01', 'male', 'single', 71339521, '12345678', 'byubv@gvg.vty', '', '', '', 'vtyuvybu', 'buyby', 'cytvyt', '080887676', 'Yes', '', 'SHWARI_1000007_1', 'Active', '2014-01-06 11:26:28', 'INSERT'),
(158, 29, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000008_0', 'Active', '2014-01-14 06:56:20', 'INSERT'),
(159, 30, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000008_0', 'Active', '2014-01-14 06:56:20', 'INSERT'),
(160, 31, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000009_0', 'Active', '2014-01-14 06:56:20', 'INSERT'),
(161, 32, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000009_0', 'Active', '2014-01-14 06:56:21', 'INSERT'),
(162, 33, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000010_0', 'Active', '2014-01-14 06:56:21', 'INSERT'),
(163, 34, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000010_0', 'Active', '2014-01-14 06:56:21', 'INSERT'),
(164, 35, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000011_0', 'Active', '2014-01-14 06:56:21', 'INSERT'),
(165, 36, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000011_0', 'Active', '2014-01-14 06:56:21', 'INSERT'),
(166, 37, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000012_0', 'Active', '2014-01-14 06:56:21', 'INSERT'),
(167, 38, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000012_0', 'Active', '2014-01-14 06:56:21', 'INSERT'),
(168, 39, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000013_0', 'Active', '2014-01-14 06:56:21', 'INSERT'),
(169, 40, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000014_0', 'Active', '2014-01-14 06:56:21', 'INSERT'),
(170, 41, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000015_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(171, 42, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000015_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(172, 43, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000015_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(173, 44, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000015_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(174, 45, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000016_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(175, 46, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000017_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(176, 47, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000018_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(177, 48, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000018_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(178, 49, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000019_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(179, 50, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000019_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(180, 51, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000019_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(181, 52, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000020_0', 'Active', '2014-01-14 06:56:22', 'INSERT'),
(182, 53, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000021_0', 'Active', '2014-01-14 06:56:23', 'INSERT'),
(183, 54, 'dnvdfgyvu', 'nvidfgn', 'fdngyvfgu', '2014-01-14', 'male', 'single', 2147483647, '12345678', 'dnfg@jdfi.dfuidiui', '', '', '', 'nguidg', 'dfgiudig', 'Father', '76564534233', 'Yes', '', 'SHWARI_1000021_0', 'Active', '2014-01-14 06:56:23', 'INSERT'),
(184, 55, 'qwersd', 'nvfidni', 'asde', '2014-01-01', 'male', 'single', 714339125, '12345678', 'fdgvdfg@hsdk.com', '', '', '', 'asdwe', 'dfuuid', 'Father', '4584068557', 'Yes', '', 'SHWARI_1000022_0', 'Active', '2014-01-14 07:02:41', 'INSERT'),
(185, 56, 'dindi', 'dindi', 'dindi', '2014-01-19', 'male', 'single', 714339521, '12345678', 'harrisdindisamel@gmail.com', '', '', '', 'dindi', 'dindi', 'parent', '0714339521', 'Yes', '', 'SHWARI_1000002_5', 'Active', '2014-01-19 14:57:21', 'INSERT'),
(186, 57, 'dindi', 'dindi', 'dindi', '2014-01-19', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'dindi', 'father', '0714339521', 'Yes', '', 'SHWARI_1000002_6', 'Active', '2014-01-19 15:00:45', 'INSERT'),
(187, 58, 'dindi', 'dindi', 'dindi', '2014-01-19', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'dindi', 'self', '0714339521', 'Yes', '', 'SHWARI_1000002_7', 'Active', '2014-01-19 15:03:09', 'INSERT'),
(188, 59, 'dindi', 'dindi', 'dindi', '2014-01-19', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'dindi', 'self', '0714339521', 'Yes', '', 'SHWARI_1000002_8', 'Active', '2014-01-19 15:03:25', 'INSERT'),
(189, 60, 'dindi', 'dindi', 'dindi', '2014-01-19', 'male', 'single', 123456789, '12345678', 'didndi@dfnognfod.sufsud', '', '', '', 'jkfiui', 'fiurbiu', 'bigb', '65454323', 'Yes', '', 'SHWARI_1000002_9', 'Active', '2014-01-19 15:08:24', 'INSERT'),
(190, 61, 'dindi', 'dindi', 'dindi', '2014-01-19', 'male', 'single', 123456789, '12345678', 'didndi@dfnognfod.sufsud', '', '', '', 'jkfiui', 'fiurbiu', 'bigb', '65454323', 'Yes', '', 'SHWARI_1000002_10', 'Active', '2014-01-19 15:08:59', 'INSERT'),
(191, 62, 'ufbdbfudbu', 'dubud', 'fdubgudb', '2014-01-19', 'male', 'single', 86457594, '12345678', 'dfgf@df.fdd', '', '', '', 'bvybv', 'bubu', 'hbu', '56453423', 'Yes', '', 'SHWARI_1000002_10', 'Active', '2014-01-19 15:12:36', 'INSERT');
INSERT INTO `trigger_patient_update` (`id`, `patient_id`, `f_name`, `s_name`, `other_name`, `dob`, `gender`, `marital_status`, `phone_no`, `identification_number`, `email`, `residence`, `employment_status`, `employer`, `next_of_kin_fname`, `next_of_kin_lname`, `next_of_kin_relation`, `next_of_kin_phone`, `is_shwari_member`, `shwari_member_relation`, `family_number`, `status`, `transaction_date`, `changetype`) VALUES
(192, 63, 'uidfnvui', 'fnviudnfi', 'ndfvuidnf', '2014-01-19', 'male', 'single', 712345678, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'nvidxfnvcu', 'nxfvuid', 'nxvuidn', '756432112324356', 'Yes', '', 'SHWARI_1000006_1', 'Active', '2014-01-19 19:20:19', 'INSERT'),
(193, 64, 'dindi', 'dindi', 'dindi', '2014-01-20', 'male', 'single', 714123456, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'dindi', 'dindi', 'self', '0712345678', 'Yes', '', 'SHWARI_1000006_2', 'Active', '2014-01-20 05:35:01', 'INSERT'),
(194, 5, 'Dindi', 'Dindi', 'dINDI', '2013-12-08', 'female', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_1000002_004', 'Active', '2014-01-23 10:31:43', 'BEFORE_UPDATE'),
(195, 5, 'Dindi', 'Dindi', 'dINDI', '1990-12-08', 'female', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Self', '0714339521', 'Yes', '', 'SHWARI_1000002_004', 'Active', '2014-01-23 10:31:43', 'AFTER_UPDATE'),
(196, 65, 'Harris', 'Dindi', 'Samuel', '1990-12-26', 'male', 'single', 714339521, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Dindi', 'Dindi', 'Father', '0721123112', 'Yes', '', ' SHWARI_100000_1', 'Active', '2014-01-29 05:39:07', 'INSERT'),
(197, 66, 'dbvibd', 'vbdvdf', 'dfbvibdi', '2014-01-29', 'male', 'married', 2147483647, '75968534', 'bvbfdfx@fdnubf.dfibu', '', '', '', 'djnxbijvbdfiub', 'dbviubfdiu', 'vbduixgbviudfs', '7596844302', 'Yes', '', 'SHWARI_1000002_10', 'Active', '2014-01-29 05:41:13', 'INSERT'),
(198, 67, 'DNBVOUINGOUIQ', 'bnfgoidfncNFIDNBU', 'NVOFGBN', '2014-01-29', 'male', 'single', 8675432, '78609340', 'GNBUGF@NDOIGNV.DNVIO', '', '', '', 'DNGBIUNVDOFU', 'NDOIBNOVIU', 'NDJOGNBVOID', '86754321', 'Yes', '', 'SHWARI_1000002_10', 'Active', '2014-01-29 05:42:36', 'INSERT'),
(199, 68, 'nofgdnbviogfn', 'ghbnviofdn', 'dfnvoifn', '2014-01-29', 'male', 'single', 98756432, '78654321', 'nhbgfd@gddf.dfs', '', '', '', 'ngoingvofidn', 'nfdounbvoiufsnbd', 'vdfobnoviubdfn', '067568453420', 'Yes', '', 'SHWARI_1000002_10', 'Active', '2014-01-29 05:48:04', 'INSERT'),
(200, 10, 'Edward', 'Bono', 'De', '2013-12-01', 'male', 'single', 713123456, '12345678', 'edwarddebono@gmail.com', '', '', '', 'Edward', 'De', 'Self', '0718123456', 'Yes', '', '1_0', 'Active', '2014-01-29 06:08:33', 'BEFORE_UPDATE'),
(201, 10, 'Edward', 'Bono', 'De', '2013-12-01', 'male', 'single', 713123456, '12345678', 'edwarddebono@gmail.com', '', '', '', 'Edward', 'De', 'Self', '0718123456', 'Yes', '', 'SHWARI_1000001_000', 'Active', '2014-01-29 06:08:33', 'AFTER_UPDATE'),
(202, 11, 'Buffet', 'Edward', 'Branson', '2013-12-01', 'male', 'married', 718123456, '12345678', 'buffet@gmail.com', '', '', '', 'dnfuvindfui', 'dfinvudfi', 'Self', '48955489234', 'Yes', '', 'SHWARI3_0', 'Active', '2014-01-29 06:08:37', 'BEFORE_UPDATE'),
(203, 11, 'Buffet', 'Edward', 'Branson', '2013-12-01', 'male', 'married', 718123456, '12345678', 'buffet@gmail.com', '', '', '', 'dnfuvindfui', 'dfinvudfi', 'Self', '48955489234', 'Yes', '', 'SHWARI_1000001_000', 'Active', '2014-01-29 06:08:37', 'AFTER_UPDATE'),
(204, 12, 'dfgnuidn', 'fdngivend', 'ufdnbiurn', '2013-12-01', 'male', 'married', 7654231, '54312566', 'ndfgiuvnd@fvngiu.eurn', '', '', '', 'jfnbundfu', 'nuvnduing', 'self', '68954095', 'Yes', '', 'SHWARI_0', 'Active', '2014-01-29 06:08:40', 'BEFORE_UPDATE'),
(205, 12, 'dfgnuidn', 'fdngivend', 'ufdnbiurn', '2013-12-01', 'male', 'married', 7654231, '54312566', 'ndfgiuvnd@fvngiu.eurn', '', '', '', 'jfnbundfu', 'nuvnduing', 'self', '68954095', 'Yes', '', 'SHWARI_1000001_000', 'Active', '2014-01-29 06:08:40', 'AFTER_UPDATE'),
(206, 14, 'nhgfrde', 'hbgdvcs', 'thrgfrew', '2013-12-01', 'male', 'married', 87654321, '12345678', 'hytgrf@hytgrf.grf', '', '', '', 'ybhtgvfd', 'bhtvgrfcd', 'yhgf', '876543', 'Yes', '', 'SHWARI3_0', 'Active', '2014-01-29 06:08:43', 'BEFORE_UPDATE'),
(207, 14, 'nhgfrde', 'hbgdvcs', 'thrgfrew', '2013-12-01', 'male', 'married', 87654321, '12345678', 'hytgrf@hytgrf.grf', '', '', '', 'ybhtgvfd', 'bhtvgrfcd', 'yhgf', '876543', 'Yes', '', 'SHWARI_1000001_000', 'Active', '2014-01-29 06:08:43', 'AFTER_UPDATE'),
(208, 15, 'htgfd', 'htgrfed', 'htgrfed', '2013-12-01', 'male', 'divorced', 0, '12345678', 'htgf@hgfd.gfd', '', '', '', 'htbgvcfd', 'vcfds', 'gfdfe', '6534254', 'Yes', '', 'SHWARI_3_000', 'Active', '2014-01-29 06:08:46', 'BEFORE_UPDATE'),
(209, 15, 'htgfd', 'htgrfed', 'htgrfed', '2013-12-01', 'male', 'divorced', 0, '12345678', 'htgf@hgfd.gfd', '', '', '', 'htbgvcfd', 'vcfds', 'gfdfe', '6534254', 'Yes', '', 'SHWARI_1000001_000', 'Active', '2014-01-29 06:08:46', 'AFTER_UPDATE'),
(210, 16, 'Harris', 'Dindi', 'Samuel', '2013-12-08', 'male', 'single', 712345678, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Harris', 'Dindi', 'Self', '0714123456', 'Yes', '', 'SHWARI_100000', 'Active', '2014-01-29 06:08:53', 'BEFORE_UPDATE'),
(211, 16, 'Harris', 'Dindi', 'Samuel', '2013-12-08', 'male', 'single', 712345678, '12345678', 'harrisdindisamuel@gmail.com', '', '', '', 'Harris', 'Dindi', 'Self', '0714123456', 'Yes', '', 'SHWARI_1000001_000', 'Active', '2014-01-29 06:08:53', 'AFTER_UPDATE'),
(212, 17, 'dindi', 'dindi', 'dindi', '2013-12-17', 'male', 'single', 123456789, '12345678', 'hads@dfsds.cda', '', '', '', 'dfsfdw', 'fder', 'dfsd', '123456789', 'Yes', '', 'SHWARI_100000', 'Active', '2014-01-29 06:08:55', 'BEFORE_UPDATE'),
(213, 17, 'dindi', 'dindi', 'dindi', '2013-12-17', 'male', 'single', 123456789, '12345678', 'hads@dfsds.cda', '', '', '', 'dfsfdw', 'fder', 'dfsd', '123456789', 'Yes', '', 'SHWARI_1000001_000', 'Active', '2014-01-29 06:08:55', 'AFTER_UPDATE'),
(214, 13, 'fbdsuyvbfduy', 'dbyuvbsuydfb', 'dfhbgvyfudb', '2013-12-01', 'male', 'married', 719123456, '57844394', 'nsifnbei@fdf.com', '', '', '', 'fnisfni', 'nsfviuenviu', 'fniuen', '0802324', 'Yes', '', 'SHWARI000002', 'Active', '2014-01-29 06:09:00', 'BEFORE_UPDATE'),
(215, 13, 'fbdsuyvbfduy', 'dbyuvbsuydfb', 'dfhbgvyfudb', '2013-12-01', 'male', 'married', 719123456, '57844394', 'nsifnbei@fdf.com', '', '', '', 'fnisfni', 'nsfviuenviu', 'fniuen', '0802324', 'Yes', '', 'SHWARI_1000001_000', 'Active', '2014-01-29 06:09:00', 'AFTER_UPDATE'),
(216, 69, 'dfsbviudb', 'vbdbfy', 'bfsviubdfi', '2014-01-29', 'male', 'single', 2147483647, '84579436', 'dnbivddfiu@fubvuif.dfiguvbfdi', '', '', '', 'jdnbivndifu', 'dnibviubdfi', 'ndiugbviufdb', '5865838042', 'Yes', '', 'SHWARI_1000001_14', 'Active', '2014-01-29 06:15:40', 'INSERT'),
(217, 70, 'difbnvibdfiu', 'bnfgiu biu', 'dfibviubfdi', '2014-01-29', 'male', 'single', 2147483647, '76549320', 'ndibvnidu@fdv.nvnd', '', '', '', 'gbniuvdfb', 'bduivbfiud', 'Father', '6875034318', 'Yes', '', 'SHWARI_1000023_0', 'Active', '2014-01-29 06:19:27', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_patient_visit_statement`
--

CREATE TABLE `trigger_patient_visit_statement` (
  `trigger_patient_visit_statement` int(11) NOT NULL AUTO_INCREMENT,
  `patient_visit_statement_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `quantity` decimal(13,2) NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `charged` enum('No','Yes') NOT NULL,
  `user_id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `patient_payment_id` int(11) NOT NULL,
  `revenue_type` enum('package','radiology','laboratory','medicine') NOT NULL,
  PRIMARY KEY (`trigger_patient_visit_statement`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=147 ;

--
-- Dumping data for table `trigger_patient_visit_statement`
--

INSERT INTO `trigger_patient_visit_statement` (`trigger_patient_visit_statement`, `patient_visit_statement_id`, `patient_id`, `visit_id`, `description`, `quantity`, `amount`, `charged`, `user_id`, `department`, `date_added`, `changetype`, `patient_payment_id`, `revenue_type`) VALUES
(1, 1, 5, 11, 'BV JDNXVUIFND', 0.00, 123.00, '', 0, '', '2014-01-17 07:53:25', 'INSERT', 0, 'package'),
(2, 2, 2, 10, 'DJFNSVJNDSFO', 0.00, 12.00, '', 0, '', '2014-01-17 07:53:25', 'INSERT', 0, 'package'),
(3, 1, 5, 11, 'BV JDNXVUIFND', 0.00, 123.00, '', 0, '', '2014-01-17 07:53:25', 'BEFORE UPDATE', 0, 'package'),
(4, 1, 5, 11, 'BV JDNXVUIFND', 0.00, 123.00, 'No', 0, '', '2014-01-17 07:53:47', 'AFTER UPDATE', 0, 'package'),
(5, 1, 5, 11, 'BV JDNXVUIFND', 0.00, 123.00, 'No', 0, '', '2014-01-17 07:53:47', 'BEFORE UPDATE', 0, 'package'),
(6, 1, 5, 11, 'BV JDNXVUIFND', 0.00, 123.00, 'No', 0, '', '2014-01-17 07:53:47', 'AFTER UPDATE', 0, 'package'),
(7, 1, 5, 11, 'BV JDNXVUIFND', 0.00, 123.00, 'No', 0, '', '2014-01-17 07:53:47', 'BEFORE UPDATE', 0, 'package'),
(8, 1, 5, 11, 'BV JDNXVUIFND', 0.00, 123.00, 'No', 0, '', '2014-01-17 07:53:47', 'AFTER UPDATE', 0, 'package'),
(9, 2, 2, 10, 'DJFNSVJNDSFO', 0.00, 12.00, '', 0, '', '2014-01-17 07:53:25', 'BEFORE UPDATE', 0, 'package'),
(10, 2, 2, 10, 'DJFNSVJNDSFO', 0.00, 12.00, 'No', 0, '', '2014-01-17 07:53:57', 'AFTER UPDATE', 0, 'package'),
(11, 2, 2, 10, 'DJFNSVJNDSFO', 0.00, 12.00, 'No', 0, '', '2014-01-17 07:53:57', 'BEFORE UPDATE', 0, 'package'),
(12, 2, 2, 10, 'DJFNSVJNDSFO', 0.00, 12.00, 'No', 0, '', '2014-01-17 07:53:57', 'AFTER UPDATE', 0, 'package'),
(13, 4, 3, 23, 'Ante-Natal', 0.00, 300.00, 'No', 0, '', '2014-01-17 09:03:45', 'INSERT', 0, 'package'),
(14, 5, 2, 10, 'dnbvueidsniu', 12.00, 1.00, '', 0, '', '2014-01-20 05:46:14', 'INSERT', 0, 'package'),
(15, 5, 2, 10, 'dnbvueidsniu', 12.00, 1.00, '', 0, '', '2014-01-20 05:46:14', 'BEFORE UPDATE', 0, 'package'),
(16, 5, 2, 10, 'dnbvueidsniu', 12.00, 1.00, 'No', 0, '', '2014-01-20 05:46:26', 'AFTER UPDATE', 0, 'package'),
(17, 1, 5, 11, 'BV JDNXVUIFND', 0.00, 123.00, 'No', 0, '', '2014-01-17 07:53:47', 'BEFORE UPDATE', 0, 'package'),
(18, 1, 5, 11, 'BV JDNXVUIFND', 10.00, 123.00, 'No', 0, '', '2014-01-20 07:55:28', 'AFTER UPDATE', 0, 'package'),
(19, 6, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-20 08:52:49', 'INSERT', 0, 'package'),
(20, 1, 5, 11, 'BV JDNXVUIFND', 10.00, 123.00, 'No', 0, '', '2014-01-20 07:55:28', 'BEFORE UPDATE', 0, 'package'),
(21, 1, 5, 11, 'BV JDNXVUIFND', 10.00, 123.00, 'No', 0, '', '2014-01-20 09:37:39', 'AFTER UPDATE', 0, 'package'),
(22, 2, 2, 10, 'DJFNSVJNDSFO', 0.00, 12.00, 'No', 0, '', '2014-01-17 07:53:57', 'BEFORE UPDATE', 0, 'package'),
(23, 2, 2, 10, 'DJFNSVJNDSFO', 0.00, 12.00, 'No', 0, '', '2014-01-20 09:37:42', 'AFTER UPDATE', 0, 'package'),
(24, 4, 3, 23, 'Ante-Natal', 0.00, 300.00, 'No', 0, '', '2014-01-17 09:03:45', 'BEFORE UPDATE', 0, 'package'),
(25, 4, 3, 23, 'Ante-Natal', 0.00, 300.00, 'No', 0, '', '2014-01-20 09:37:44', 'AFTER UPDATE', 0, 'package'),
(26, 5, 2, 10, 'dnbvueidsniu', 12.00, 1.00, 'No', 0, '', '2014-01-20 05:46:26', 'BEFORE UPDATE', 0, 'package'),
(27, 5, 2, 10, 'dnbvueidsniu', 12.00, 1.00, 'No', 0, '', '2014-01-20 09:37:46', 'AFTER UPDATE', 0, 'package'),
(28, 6, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-20 08:52:49', 'BEFORE UPDATE', 0, 'package'),
(29, 6, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-20 09:37:48', 'AFTER UPDATE', 0, 'package'),
(30, 1, 3, 10, 'mdvoimfi', 0.00, 12.00, '', 8, 'dfingviof', '2014-01-20 10:05:06', 'INSERT', 0, 'package'),
(31, 2, 2, 24, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-20 10:27:46', 'INSERT', 0, 'package'),
(32, 3, 25, 25, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-20 10:51:45', 'INSERT', 0, 'package'),
(33, 4, 11, 26, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-20 10:53:56', 'INSERT', 0, 'package'),
(34, 5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-20 11:03:16', 'INSERT', 0, 'package'),
(35, 6, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-20 12:39:45', 'INSERT', 0, 'package'),
(36, 7, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-20 12:47:05', 'INSERT', 0, 'package'),
(37, 8, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-21 01:32:56', 'INSERT', 0, 'package'),
(38, 9, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-21 01:35:34', 'INSERT', 0, 'package'),
(39, 10, 23, 12, 'Mammogram', 0.00, 750.00, 'No', 8, 'Doctor', '2014-01-21 01:38:26', 'INSERT', 0, 'package'),
(40, 11, 23, 12, 'Malaria Test', 0.00, 150.00, 'No', 11, 'Laboratory', '2014-01-21 01:48:21', 'INSERT', 0, 'package'),
(41, 12, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 14, 'Radiology', '2014-01-21 02:58:51', 'INSERT', 0, 'package'),
(42, 16, 23, 12, 'Betapyn', 48.00, 1200.00, 'No', 10, 'Doctor', '2014-01-21 07:11:02', 'INSERT', 0, 'package'),
(43, 5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-20 11:03:16', 'BEFORE UPDATE', 0, 'package'),
(44, 5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-21 08:03:37', 'AFTER UPDATE', 0, 'medicine'),
(45, 5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-21 08:03:37', 'BEFORE UPDATE', 0, 'medicine'),
(46, 5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-21 08:03:37', 'AFTER UPDATE', 0, 'medicine'),
(47, 5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-21 08:03:37', 'BEFORE UPDATE', 0, 'medicine'),
(48, 5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-21 08:03:37', 'AFTER UPDATE', 0, 'medicine'),
(49, 6, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-20 12:39:45', 'BEFORE UPDATE', 0, 'package'),
(50, 6, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-21 08:03:53', 'AFTER UPDATE', 0, 'radiology'),
(51, 17, 7, 27, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-21 08:12:25', 'INSERT', 0, ''),
(52, 18, 10, 28, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-21 08:13:40', 'INSERT', 0, 'package'),
(53, 18, 10, 28, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-21 08:13:40', 'BEFORE UPDATE', 0, 'package'),
(54, 18, 10, 28, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-21 08:13:40', 'AFTER UPDATE', 0, 'package'),
(55, 17, 7, 27, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-21 08:12:25', 'BEFORE UPDATE', 0, ''),
(56, 17, 7, 27, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-21 08:12:25', 'AFTER UPDATE', 0, 'package'),
(57, 16, 23, 12, 'Betapyn', 48.00, 1200.00, 'No', 10, 'Doctor', '2014-01-21 07:11:02', 'BEFORE UPDATE', 0, 'package'),
(58, 16, 23, 12, 'Betapyn', 48.00, 1200.00, 'No', 10, 'Doctor', '2014-01-21 07:11:02', 'AFTER UPDATE', 0, 'medicine'),
(59, 12, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 14, 'Radiology', '2014-01-21 02:58:51', 'BEFORE UPDATE', 0, 'package'),
(60, 12, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 14, 'Radiology', '2014-01-21 02:58:51', 'AFTER UPDATE', 0, 'radiology'),
(61, 11, 23, 12, 'Malaria Test', 0.00, 150.00, 'No', 11, 'Laboratory', '2014-01-21 01:48:21', 'BEFORE UPDATE', 0, 'package'),
(62, 11, 23, 12, 'Malaria Test', 0.00, 150.00, 'No', 11, 'Laboratory', '2014-01-21 01:48:21', 'AFTER UPDATE', 0, 'laboratory'),
(63, 10, 23, 12, 'Mammogram', 0.00, 750.00, 'No', 8, 'Doctor', '2014-01-21 01:38:26', 'BEFORE UPDATE', 0, 'package'),
(64, 10, 23, 12, 'Mammogram', 0.00, 750.00, 'No', 8, 'Doctor', '2014-01-21 01:38:26', 'AFTER UPDATE', 0, 'radiology'),
(65, 9, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-21 01:35:34', 'BEFORE UPDATE', 0, 'package'),
(66, 9, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-21 01:35:34', 'AFTER UPDATE', 0, 'radiology'),
(67, 8, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-21 01:32:56', 'BEFORE UPDATE', 0, 'package'),
(68, 8, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-21 01:32:56', 'AFTER UPDATE', 0, 'radiology'),
(69, 7, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-20 12:47:05', 'BEFORE UPDATE', 0, 'package'),
(70, 7, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-20 12:47:05', 'AFTER UPDATE', 0, 'radiology'),
(71, 6, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-21 08:03:53', 'BEFORE UPDATE', 0, 'radiology'),
(72, 6, 23, 12, 'CT-Scan', 0.00, 500.00, 'No', 8, 'Doctor', '2014-01-21 08:03:53', 'AFTER UPDATE', 0, 'radiology'),
(73, 5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-21 08:03:37', 'BEFORE UPDATE', 0, 'medicine'),
(74, 5, 23, 12, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-21 08:03:37', 'AFTER UPDATE', 0, 'medicine'),
(75, 4, 11, 26, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-20 10:53:56', 'BEFORE UPDATE', 0, 'package'),
(76, 4, 11, 26, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-20 10:53:56', 'AFTER UPDATE', 0, 'package'),
(77, 3, 25, 25, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-20 10:51:45', 'BEFORE UPDATE', 0, 'package'),
(78, 3, 25, 25, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-20 10:51:45', 'AFTER UPDATE', 0, 'package'),
(79, 2, 2, 24, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-20 10:27:46', 'BEFORE UPDATE', 0, 'package'),
(80, 2, 2, 24, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-20 10:27:46', 'AFTER UPDATE', 0, 'package'),
(81, 1, 3, 10, 'mdvoimfi', 0.00, 12.00, '', 8, 'dfingviof', '2014-01-20 10:05:06', 'BEFORE UPDATE', 0, 'package'),
(82, 1, 3, 10, 'mdvoimfi', 0.00, 12.00, '', 8, 'dfingviof', '2014-01-20 10:05:06', 'AFTER UPDATE', 0, 'package'),
(83, 18, 10, 28, 'Ante-Natal', 0.00, 300.00, 'No', 2, 'Support', '2014-01-21 08:13:40', 'BEFORE UPDATE', 0, 'package'),
(84, 18, 10, 28, 'Ante-Natal', 0.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:02:13', 'AFTER UPDATE', 0, 'package'),
(85, 18, 10, 28, 'Ante-Natal', 0.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:02:13', 'BEFORE UPDATE', 0, 'package'),
(86, 18, 10, 28, 'Ante-Natal', 0.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:02:13', 'AFTER UPDATE', 0, 'package'),
(87, 19, 23, 12, 'Stool Test', 1.00, 450.00, 'No', 8, 'Doctor', '2014-01-21 14:03:10', 'INSERT', 0, 'laboratory'),
(88, 18, 10, 28, 'Ante-Natal', 0.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:02:13', 'BEFORE UPDATE', 0, 'package'),
(89, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:03:32', 'AFTER UPDATE', 0, 'package'),
(90, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:03:32', 'BEFORE UPDATE', 0, 'package'),
(91, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:03:32', 'AFTER UPDATE', 0, 'package'),
(92, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:03:32', 'BEFORE UPDATE', 0, 'package'),
(93, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:03:32', 'AFTER UPDATE', 0, 'package'),
(94, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-21 14:03:32', 'BEFORE UPDATE', 0, 'package'),
(95, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-22 14:03:32', 'AFTER UPDATE', 0, 'package'),
(96, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-22 14:03:32', 'BEFORE UPDATE', 0, 'package'),
(97, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-22 07:51:32', 'AFTER UPDATE', 0, 'package'),
(98, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-22 07:51:32', 'BEFORE UPDATE', 0, 'package'),
(99, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-22 07:51:32', 'AFTER UPDATE', 0, 'package'),
(100, 20, 10, 28, 'nidvnocfid', 1.00, 12.00, '', 8, 'Pharmacy', '2014-01-22 08:45:06', 'INSERT', 0, 'medicine'),
(101, 20, 10, 28, 'nidvnocfid', 1.00, 12.00, '', 8, 'Pharmacy', '2014-01-22 08:45:06', 'BEFORE UPDATE', 0, 'medicine'),
(102, 20, 10, 28, 'nidvnocfid', 1.00, 12.00, 'No', 8, 'Pharmacy', '2014-01-22 08:45:19', 'AFTER UPDATE', 0, 'medicine'),
(103, 20, 10, 28, 'nidvnocfid', 1.00, 12.00, 'No', 8, 'Pharmacy', '2014-01-22 08:45:19', 'BEFORE UPDATE', 0, 'medicine'),
(104, 20, 10, 28, 'nidvnocfid', 1.00, 12.00, 'No', 8, 'Pharmacy', '2014-01-22 08:45:19', 'AFTER UPDATE', 0, 'medicine'),
(105, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-22 07:51:32', 'BEFORE UPDATE', 0, 'package'),
(106, 18, 10, 28, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-22 13:58:39', 'AFTER UPDATE', 0, 'package'),
(107, 20, 10, 28, 'nidvnocfid', 1.00, 12.00, 'No', 8, 'Pharmacy', '2014-01-22 08:45:19', 'BEFORE UPDATE', 0, 'medicine'),
(108, 20, 10, 28, 'nidvnocfid', 1.00, 12.00, 'Yes', 8, 'Pharmacy', '2014-01-22 13:58:39', 'AFTER UPDATE', 0, 'medicine'),
(109, 21, 7, 29, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-23 06:45:09', 'INSERT', 0, 'package'),
(110, 22, 5, 30, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-23 10:30:27', 'INSERT', 0, 'package'),
(111, 23, 19, 31, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-23 11:55:01', 'INSERT', 0, 'package'),
(112, 24, 5, 32, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-24 06:58:40', 'INSERT', 0, 'package'),
(113, 25, 3, 33, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-29 06:42:25', 'INSERT', 0, 'package'),
(114, 26, 3, 33, 'Malaria Test', 1.00, 150.00, 'No', 8, 'Doctor', '2014-01-29 08:13:22', 'INSERT', 0, 'laboratory'),
(115, 25, 3, 33, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-29 06:42:25', 'BEFORE UPDATE', 0, 'package'),
(116, 25, 3, 33, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-29 10:46:51', 'AFTER UPDATE', 0, 'package'),
(117, 26, 3, 33, 'Malaria Test', 1.00, 150.00, 'No', 8, 'Doctor', '2014-01-29 08:13:22', 'BEFORE UPDATE', 0, 'laboratory'),
(118, 26, 3, 33, 'Malaria Test', 1.00, 150.00, 'Yes', 8, 'Doctor', '2014-01-29 10:46:51', 'AFTER UPDATE', 0, 'laboratory'),
(119, 27, 3, 33, 'Stool Test', 1.00, 450.00, 'No', 11, 'Laboratory', '2014-01-29 11:41:31', 'INSERT', 0, 'laboratory'),
(120, 25, 3, 33, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-29 10:46:51', 'BEFORE UPDATE', 0, 'package'),
(121, 25, 3, 33, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-29 11:56:32', 'AFTER UPDATE', 0, 'package'),
(122, 26, 3, 33, 'Malaria Test', 1.00, 150.00, 'Yes', 8, 'Doctor', '2014-01-29 10:46:51', 'BEFORE UPDATE', 0, 'laboratory'),
(123, 26, 3, 33, 'Malaria Test', 1.00, 150.00, 'Yes', 8, 'Doctor', '2014-01-29 11:56:32', 'AFTER UPDATE', 0, 'laboratory'),
(124, 27, 3, 33, 'Stool Test', 1.00, 450.00, 'No', 11, 'Laboratory', '2014-01-29 11:41:31', 'BEFORE UPDATE', 0, 'laboratory'),
(125, 27, 3, 33, 'Stool Test', 1.00, 450.00, 'Yes', 11, 'Laboratory', '2014-01-29 11:56:32', 'AFTER UPDATE', 0, 'laboratory'),
(126, 28, 3, 33, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-29 11:59:53', 'INSERT', 0, 'medicine'),
(127, 29, 3, 33, 'X-Ray', 1.00, 350.00, 'No', 8, 'Doctor', '2014-01-29 12:19:51', 'INSERT', 0, 'radiology'),
(128, 30, 3, 33, 'CT-Scan', 1.00, 500.00, 'No', 14, 'Radiology', '2014-01-29 12:31:17', 'INSERT', 0, 'radiology'),
(129, 31, 3, 33, 'Mammogram', 1.00, 750.00, 'No', 14, 'Radiology', '2014-01-29 12:36:28', 'INSERT', 0, 'radiology'),
(130, 25, 3, 33, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-29 11:56:32', 'BEFORE UPDATE', 0, 'package'),
(131, 25, 3, 33, 'Ante-Natal', 1.00, 300.00, 'Yes', 2, 'Support', '2014-01-29 11:56:32', 'AFTER UPDATE', 0, 'package'),
(132, 26, 3, 33, 'Malaria Test', 1.00, 150.00, 'Yes', 8, 'Doctor', '2014-01-29 11:56:32', 'BEFORE UPDATE', 0, 'laboratory'),
(133, 26, 3, 33, 'Malaria Test', 1.00, 150.00, 'Yes', 8, 'Doctor', '2014-01-29 11:56:32', 'AFTER UPDATE', 0, 'laboratory'),
(134, 27, 3, 33, 'Stool Test', 1.00, 450.00, 'Yes', 11, 'Laboratory', '2014-01-29 11:56:32', 'BEFORE UPDATE', 0, 'laboratory'),
(135, 27, 3, 33, 'Stool Test', 1.00, 450.00, 'Yes', 11, 'Laboratory', '2014-01-29 11:56:32', 'AFTER UPDATE', 0, 'laboratory'),
(136, 28, 3, 33, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-29 11:59:53', 'BEFORE UPDATE', 0, 'medicine'),
(137, 28, 3, 33, 'Betapyn', 24.00, 600.00, 'Yes', 8, 'Doctor', '2014-01-29 12:59:58', 'AFTER UPDATE', 0, 'medicine'),
(138, 29, 3, 33, 'X-Ray', 1.00, 350.00, 'No', 8, 'Doctor', '2014-01-29 12:19:51', 'BEFORE UPDATE', 0, 'radiology'),
(139, 29, 3, 33, 'X-Ray', 1.00, 350.00, 'Yes', 8, 'Doctor', '2014-01-29 12:59:58', 'AFTER UPDATE', 0, 'radiology'),
(140, 30, 3, 33, 'CT-Scan', 1.00, 500.00, 'No', 14, 'Radiology', '2014-01-29 12:31:17', 'BEFORE UPDATE', 0, 'radiology'),
(141, 30, 3, 33, 'CT-Scan', 1.00, 500.00, 'Yes', 14, 'Radiology', '2014-01-29 12:59:58', 'AFTER UPDATE', 0, 'radiology'),
(142, 31, 3, 33, 'Mammogram', 1.00, 750.00, 'No', 14, 'Radiology', '2014-01-29 12:36:28', 'BEFORE UPDATE', 0, 'radiology'),
(143, 31, 3, 33, 'Mammogram', 1.00, 750.00, 'Yes', 14, 'Radiology', '2014-01-29 12:59:58', 'AFTER UPDATE', 0, 'radiology'),
(144, 32, 3, 33, 'Ultra Sound', 1.00, 850.00, 'No', 14, 'Radiology', '2014-01-29 13:21:37', 'INSERT', 0, 'radiology'),
(145, 33, 3, 33, 'Betapyn', 24.00, 600.00, 'No', 8, 'Doctor', '2014-01-29 19:16:29', 'INSERT', 0, 'medicine'),
(146, 34, 3, 34, 'Ante-Natal', 1.00, 300.00, 'No', 2, 'Support', '2014-01-30 12:54:18', 'INSERT', 0, 'package');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_pharm_bin_card`
--

CREATE TABLE `trigger_pharm_bin_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bin_card_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `opening_bal` decimal(13,2) NOT NULL,
  `closing_bal` decimal(13,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `issues` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `identification_code` varchar(255) NOT NULL,
  `issuing_officer` int(11) NOT NULL,
  `change_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `trigger_pharm_bin_card`
--

INSERT INTO `trigger_pharm_bin_card` (`id`, `bin_card_id`, `commodity_name`, `batch_no`, `opening_bal`, `closing_bal`, `expiry_date`, `issues`, `date_added`, `description`, `department`, `identification_code`, `issuing_officer`, `change_type`) VALUES
(1, 1, 'dvcds', 'jniu', 54.00, 34.00, '0000-00-00', 21.00, '2014-01-09 13:08:14', '', '', '', 1, 'BEFORE UPDATE'),
(2, 1, 'dvcds', 'jniu', 54.00, 34.00, '2014-01-16', 21.00, '2014-01-16 08:06:53', '', '', '', 1, 'AFTER UPDATE'),
(3, 4, 'NOIBFNOID', 'CXJN', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:48:20', 'FKLDVJFM', 'Store', 'nvnod', 1, 'INSERT'),
(4, 4, 'NOIBFNOID', 'CXJN', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:48:20', 'FKLDVJFM', 'Store', 'nvnod', 1, 'BEFORE UPDATE'),
(5, 4, 'NOIBFNOID', 'NO_001', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:48:32', 'FKLDVJFM', 'Store', 'nvnod', 1, 'AFTER UPDATE'),
(6, 5, 'Betapyn', 'BET_002', 2.00, 1.00, '2015-12-31', 1.00, '2014-01-30 06:39:27', 'Commodity: Betapyndispensed to a patient:SHWARI_1000002_002', 'Patient Number:SHWARI_1000002_002', 'ISS:0SrsI', 10, 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_prescription_insert`
--

CREATE TABLE `trigger_prescription_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `quantity_requested` decimal(13,2) NOT NULL,
  `remarks` text NOT NULL,
  `is_dispensed` varchar(255) NOT NULL,
  `quantity_issued` decimal(13,2) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_prescription_update`
--

CREATE TABLE `trigger_prescription_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `quantity_requested` decimal(13,2) NOT NULL,
  `remarks` text NOT NULL,
  `is_dispensed` varchar(255) NOT NULL,
  `quantity_issued` decimal(13,2) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `trigger_prescription_update`
--

INSERT INTO `trigger_prescription_update` (`id`, `prescription_id`, `patient_id`, `visit_id`, `commodity_name`, `dosage`, `duration`, `quantity_requested`, `remarks`, `is_dispensed`, `quantity_issued`, `paid`, `date_added`, `user_id`, `changetype`, `transaction_date`) VALUES
(1, 1, 21, 10, 'Betapyn', '12', '12', 24.00, 'May cause drowsiness', 'Not Dispensed', 24.00, 'Not Paid', '2014-01-05 08:14:20', 10, 'INSERT', '0000-00-00 00:00:00'),
(2, 1, 21, 10, 'Betapyn', '12', '12', 24.00, 'May cause drowsiness', 'Not Dispensed', 24.00, 'Not Paid', '2014-01-05 08:14:20', 10, 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(3, 1, 8, 22, 'Betapyn', '12', '12', 24.00, 'May cause drowsiness', 'Not Dispensed', 24.00, 'Not Paid', '2014-01-08 03:29:48', 10, 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(8, 1, 8, 22, 'Betapyn', '12', '12', 24.00, 'May cause drowsiness', 'Not Dispensed', 24.00, 'Not Paid', '2014-01-08 03:29:48', 10, 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(9, 1, 8, 22, 'Betapyn', '12', '12', 24.00, 'May cause drowsiness', 'Not Dispensed', 24.00, 'Not Paid', '2014-01-08 03:29:48', 10, 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(10, 1, 8, 22, 'Betapyn', '12', '12', 24.00, 'May cause drowsiness', 'Not Dispensed', 24.00, 'Not Paid', '2014-01-08 03:29:48', 10, 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(11, 1, 8, 22, 'Betapyn', '12', '12', 24.00, 'May cause drowsiness', 'Not Dispensed', 24.00, 'Not Paid', '2014-01-08 03:29:48', 10, 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(12, 5, 23, 12, 'Betapyn', '3TDS', '12', 36.00, 'fnvicnfdiu', 'Dispensed', 0.00, 'Not Paid', '2014-01-20 08:50:53', 0, 'INSERT', '0000-00-00 00:00:00'),
(13, 6, 23, 12, 'Betapyn', '2TDS', '12', 24.00, 'dfsvncosdfnoiwas', 'Dispensed', 0.00, 'Not Paid', '2014-01-20 08:52:49', 0, 'INSERT', '0000-00-00 00:00:00'),
(17, 10, 23, 12, 'Betapyn', '2TDS', '12', 24.00, 'osnvcoidsncouids', 'Dispensed', 0.00, 'Not Paid', '2014-01-20 11:03:16', 0, 'INSERT', '0000-00-00 00:00:00'),
(18, 13, 23, 12, 'Betapyn', '4TDS', '12', 48.00, 'kfsmcoidnsfioc', 'Dispensed', 0.00, 'Not Paid', '2014-01-21 07:11:02', 0, 'INSERT', '0000-00-00 00:00:00'),
(19, 6, 23, 12, 'Betapyn', '2TDS', '12', 24.00, 'dfsvncosdfnoiwas', 'Dispensed', 0.00, 'Not Paid', '2014-01-20 08:52:49', 0, 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(20, 6, 23, 12, 'Betapyn', '2TDS', '12', 24.00, 'dfsvncosdfnoiwas', 'Not Dispensed', 0.00, 'Not Paid', '2014-01-21 07:30:12', 0, 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(21, 10, 23, 12, 'Betapyn', '2TDS', '12', 24.00, 'osnvcoidsncouids', 'Dispensed', 0.00, 'Not Paid', '2014-01-20 11:03:16', 0, 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(22, 10, 23, 12, 'Betapyn', '2TDS', '12', 24.00, 'osnvcoidsncouids', 'Not Dispensed', 0.00, 'Not Paid', '2014-01-21 07:30:17', 0, 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(23, 13, 23, 12, 'Betapyn', '4TDS', '12', 48.00, 'kfsmcoidnsfioc', 'Dispensed', 0.00, 'Not Paid', '2014-01-21 07:11:02', 0, 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(24, 13, 23, 12, 'Betapyn', '4TDS', '12', 48.00, 'kfsmcoidnsfioc', 'Not Dispensed', 0.00, 'Not Paid', '2014-01-21 07:30:21', 0, 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(25, 14, 3, 33, 'Betapyn', '2TDS', '12', 24.00, 'nvdnbuvnbfuid nvodfnbuxv dbvuodfbnuv', 'Not Dispensed', 0.00, 'Not Paid', '2014-01-29 11:59:53', 0, 'INSERT', '0000-00-00 00:00:00'),
(26, 14, 3, 33, 'Betapyn', '2TDS', '12', 24.00, 'nvdnbuvnbfuid nvodfnbuxv dbvuodfbnuv', 'Not Dispensed', 0.00, 'Not Paid', '2014-01-29 11:59:53', 0, 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(27, 14, 3, 33, 'Betapyn', '2TDS', '12', 24.00, 'nvdnbuvnbfuid nvodfnbuxv dbvuodfbnuv', 'Not Dispensed', 0.00, 'Paid', '2014-01-29 12:59:58', 0, 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(28, 15, 3, 33, 'Betapyn', '2TDS', '12', 24.00, 'jnvgdjfnvofdn', 'Not Dispensed', 0.00, 'Not Paid', '2014-01-29 19:16:29', 0, 'INSERT', '0000-00-00 00:00:00'),
(29, 14, 3, 33, 'Betapyn', '2TDS', '12', 24.00, 'nvdnbuvnbfuid nvodfnbuxv dbvuodfbnuv', 'Not Dispensed', 0.00, 'Paid', '2014-01-29 12:59:58', 0, 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(30, 14, 3, 33, 'Betapyn', '2TDS', '12', 24.00, 'nvdnbuvnbfuid nvodfnbuxv dbvuodfbnuv', 'Dispensed', 1.00, 'Paid', '2014-01-30 06:39:27', 10, 'AFTER_UPDATE', '0000-00-00 00:00:00'),
(31, 15, 3, 33, 'Betapyn', '2TDS', '12', 24.00, 'jnvgdjfnvofdn', 'Not Dispensed', 0.00, 'Not Paid', '2014-01-29 19:16:29', 0, 'BEFORE_UPDATE', '0000-00-00 00:00:00'),
(32, 15, 3, 33, 'Betapyn', '2TDS', '12', 24.00, 'jnvgdjfnvofdn', 'Dispensed', 1.00, 'Not Paid', '2014-01-30 06:39:27', 10, 'AFTER_UPDATE', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_rad_test_results_insert`
--

CREATE TABLE `trigger_rad_test_results_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rad_test_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_results` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_rad_test_results_update`
--

CREATE TABLE `trigger_rad_test_results_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rad_test_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_results` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `rad_tech_id` int(11) NOT NULL,
  `check` enum('0','1') NOT NULL,
  `payment_id` enum('0','1') NOT NULL,
  `paid` enum('not paid','paid') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_referral_insert`
--

CREATE TABLE `trigger_referral_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referral_id` int(11) NOT NULL,
  `referring_doctor` int(11) NOT NULL,
  `referring_doctor_email` varchar(255) NOT NULL,
  `referred_doctor` varchar(255) NOT NULL,
  `referred_doctor_email` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `trigger_referral_insert`
--

INSERT INTO `trigger_referral_insert` (`id`, `referral_id`, `referring_doctor`, `referring_doctor_email`, `referred_doctor`, `referred_doctor_email`, `subject`, `message`, `patient_id`, `visit_id`, `transaction_date`, `changetype`) VALUES
(1, 2, 0, 'doctor@doctor.com', 'vndfunv', 'ndofnbvdfu', 'sdfcds', 'fvsd', 21, 10, '2013-12-21 15:08:33', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_referral_update`
--

CREATE TABLE `trigger_referral_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referral_id` int(11) NOT NULL,
  `referring_doctor` int(11) NOT NULL,
  `referring_doctor_email` varchar(255) NOT NULL,
  `referred_doctor` varchar(255) NOT NULL,
  `referred_doctor_email` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `trigger_referral_update`
--

INSERT INTO `trigger_referral_update` (`id`, `referral_id`, `referring_doctor`, `referring_doctor_email`, `referred_doctor`, `referred_doctor_email`, `subject`, `message`, `patient_id`, `visit_id`, `transaction_date`, `changetype`) VALUES
(1, 1, 1, 'cfvncfdj', 'ndncd', 'ncdns', 'cnsvnc', 'cnfvdfiu', 2, 10, '2014-01-29 19:11:50', 'INSERT'),
(2, 2, 8, 'ndfvfd@oivdnoid.nfofvdn', 'dfnvod@dnvo.nvodno', 'dfnvod@dnvo.nvodno', 'dvnfvodfn', 'fvdnvodfn', 3, 33, '2014-01-29 19:15:38', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_request_insert`
--

CREATE TABLE `trigger_request_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `department_from` varchar(255) NOT NULL,
  `user_from` varchar(255) NOT NULL,
  `department_to` varchar(255) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `no_of_packs` decimal(13,2) NOT NULL,
  `total_quantity_requested` decimal(13,2) NOT NULL,
  `strength` varchar(255) NOT NULL,
  `total_quantity_issued` decimal(13,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `trigger_request_insert`
--

INSERT INTO `trigger_request_insert` (`id`, `request_id`, `stock_id`, `department_from`, `user_from`, `department_to`, `commodity_name`, `no_of_packs`, `total_quantity_requested`, `strength`, `total_quantity_issued`, `user_id`, `transaction_date`, `changetype`) VALUES
(1, 1, 4, 'Store', 'Store', 'Pharmacy', 'fnvidnbiv', 120.00, 120.00, '120', 120.00, 8, '2013-12-21 13:43:38', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_request_update`
--

CREATE TABLE `trigger_request_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `department_from` varchar(255) NOT NULL,
  `user_from` int(11) NOT NULL,
  `department_to` varchar(255) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `no_of_packs` decimal(13,2) NOT NULL,
  `total_quantity_requested` decimal(13,2) NOT NULL,
  `strength` decimal(13,2) NOT NULL,
  `total_quantity_issued` decimal(13,2) NOT NULL,
  `remarks` text NOT NULL,
  `request_order_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=436 ;

--
-- Dumping data for table `trigger_request_update`
--

INSERT INTO `trigger_request_update` (`id`, `request_id`, `stock_id`, `department_from`, `user_from`, `department_to`, `commodity_name`, `no_of_packs`, `total_quantity_requested`, `strength`, `total_quantity_issued`, `remarks`, `request_order_id`, `user_id`, `transaction_date`, `changetype`) VALUES
(1, 1, 4, 'Store', 0, 'Pharmacy', 'fnvidnbiv', 120.00, 120.00, 120.00, 120.00, '', '', 8, '2013-12-22 04:39:58', 'BEFORE_UPDATE'),
(2, 1, 4, 'Store', 0, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, 120.00, 1200.00, '', '', 8, '2013-12-22 04:39:58', 'AFTER_UPDATE'),
(3, 1, 4, 'Store', 0, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, 120.00, 1200.00, '', '12353vdfs', 8, '2013-12-22 05:59:03', 'BEFORE_UPDATE'),
(4, 1, 4, 'Store', 0, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, 120.00, 1200.00, '', '12353vdfs', 8, '2013-12-22 05:59:03', 'AFTER_UPDATE'),
(5, 1, 4, 'Store', 0, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, 120.00, 1200.00, '', '12353vdfs', 8, '2013-12-31 03:59:46', 'BEFORE_UPDATE'),
(6, 1, 4, 'Store', 0, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, 120.00, 1100.00, '', '12353vdfs', 8, '2013-12-31 03:59:46', 'AFTER_UPDATE'),
(7, 1, 4, 'Store', 0, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, 120.00, 1100.00, '', '12353vdfs', 8, '2013-12-31 04:06:14', 'BEFORE_UPDATE'),
(8, 1, 4, 'Store', 0, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, 120.00, 1100.00, '', '12353vdfs', 11, '2013-12-31 04:06:14', 'AFTER_UPDATE'),
(9, 1, 4, 'Store', 0, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, 120.00, 1100.00, '', '12353vdfs', 11, '2013-12-31 11:02:04', 'BEFORE_UPDATE'),
(10, 1, 4, 'Store', 2, 'Pharmacy', 'fnvidnbiv', 120.00, 1200.00, 120.00, 1100.00, '', '12353vdfs', 11, '2013-12-31 11:02:04', 'AFTER_UPDATE'),
(11, 4, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:0La9F', 0, '2013-12-31 11:12:51', 'INSERT'),
(12, 5, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:8hIgK', 0, '2013-12-31 11:12:52', 'INSERT'),
(13, 6, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 0.00, 'ndvinbdf ', 'REQ:0uRaY', 0, '2013-12-31 11:22:21', 'INSERT'),
(14, 7, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, ' nodfivndfio', 'REQ:HEnpC', 0, '2014-01-01 03:47:47', 'INSERT'),
(15, 8, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 0.00, ' jdvnjdn', 'REQ:0rSDi', 0, '2014-01-01 03:47:47', 'INSERT'),
(16, 9, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 12.00, 144.00, 0.00, 0.00, ' ncjfndsj', 'REQ:50F6T', 0, '2014-01-01 03:47:47', 'INSERT'),
(17, 10, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, '1 ', 'REQ:1bAwH', 0, '2014-01-01 03:49:48', 'INSERT'),
(18, 11, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 0.00, '2 ', 'REQ:HPpoH', 0, '2014-01-01 03:49:48', 'INSERT'),
(19, 12, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, '3 ', 'REQ:0XRNY', 0, '2014-01-01 03:49:48', 'INSERT'),
(20, 13, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'dvndufnv ', 'REQ:12ZPs', 0, '2014-01-02 08:33:08', 'INSERT'),
(21, 14, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'ndvufbdni ', 'REQ:1gAI9', 0, '2014-01-02 08:34:42', 'INSERT'),
(22, 15, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 0.00, 'ndfuivndfiu ', 'REQ:FXZU4', 0, '2014-01-02 08:34:42', 'INSERT'),
(23, 16, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 0.00, 'fnvubdfnu ', 'REQ:ufPvF', 0, '2014-01-02 08:35:32', 'INSERT'),
(24, 17, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'fnvuifdnbi ', 'REQ:bOkoL', 0, '2014-01-02 08:35:32', 'INSERT'),
(25, 18, 0, 'Pharmacist', 10, 'Store', 'nfgduinvd', 12.00, 156.00, 0.00, 0.00, 'djfnvdfiunsiu ', 'REQ:Dg1yt', 0, '2014-01-02 08:35:32', 'INSERT'),
(26, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 0.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 0, '2014-01-02 08:36:24', 'INSERT'),
(27, 20, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 19.00, 2280.00, 0.00, 0.00, 'FNVFUND ', 'REQ:zNRj3', 0, '2014-01-02 08:36:24', 'INSERT'),
(28, 21, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 14.00, 182.00, 0.00, 0.00, 'ENFUVINDUI ', 'REQ:y63TM', 0, '2014-01-02 08:36:24', 'INSERT'),
(29, 22, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'FMDIBVGMFDI ', 'REQ:3hvvr', 0, '2014-01-02 08:38:32', 'INSERT'),
(30, 23, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 0.00, 'FDMGOIDMF ', 'REQ:1i3V6', 0, '2014-01-02 08:38:32', 'INSERT'),
(31, 24, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGNOIVNFD ', 'REQ:Yl0mW', 0, '2014-01-02 08:38:32', 'INSERT'),
(32, 25, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 0.00, 'FNGDONFIOD ', 'REQ:b0gGa', 0, '2014-01-02 08:38:32', 'INSERT'),
(33, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'FVDS ', 'REQ:fBg5y', 0, '2014-01-02 08:39:23', 'INSERT'),
(34, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGDS ', 'REQ:1WzRV', 0, '2014-01-02 08:39:23', 'INSERT'),
(35, 28, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, '12RFEFD ', 'REQ:0Dqcz', 0, '2014-01-02 08:39:23', 'INSERT'),
(36, 29, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-02 08:39:23', 'INSERT'),
(37, 30, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-02 08:39:23', 'INSERT'),
(38, 24, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGNOIVNFD ', 'REQ:Yl0mW', 0, '2014-01-03 08:49:32', 'BEFORE_UPDATE'),
(39, 24, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGNOIVNFD ', 'REQ:Yl0mW', 0, '2014-01-03 08:49:32', 'AFTER_UPDATE'),
(40, 25, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 0.00, 'FNGDONFIOD ', 'REQ:b0gGa', 0, '2014-01-03 08:49:32', 'BEFORE_UPDATE'),
(41, 25, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 0.00, 'FNGDONFIOD ', 'REQ:b0gGa', 0, '2014-01-03 08:49:32', 'AFTER_UPDATE'),
(42, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'FVDS ', 'REQ:fBg5y', 0, '2014-01-03 08:49:32', 'BEFORE_UPDATE'),
(43, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'FVDS ', 'REQ:fBg5y', 0, '2014-01-03 08:49:32', 'AFTER_UPDATE'),
(44, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGDS ', 'REQ:1WzRV', 0, '2014-01-03 08:49:32', 'BEFORE_UPDATE'),
(45, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGDS ', 'REQ:1WzRV', 0, '2014-01-03 08:49:32', 'AFTER_UPDATE'),
(46, 28, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, '12RFEFD ', 'REQ:0Dqcz', 0, '2014-01-03 08:49:32', 'BEFORE_UPDATE'),
(47, 28, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, '12RFEFD ', 'REQ:0Dqcz', 0, '2014-01-03 08:49:32', 'AFTER_UPDATE'),
(48, 29, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-03 08:49:32', 'BEFORE_UPDATE'),
(49, 29, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-03 08:49:32', 'AFTER_UPDATE'),
(50, 30, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-03 08:49:32', 'BEFORE_UPDATE'),
(51, 30, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-03 08:49:32', 'AFTER_UPDATE'),
(52, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'FVDS ', 'REQ:fBg5y', 0, '2014-01-04 05:56:46', 'BEFORE_UPDATE'),
(53, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'FVDS ', 'REQ:fBg5y', 0, '2014-01-04 05:56:46', 'AFTER_UPDATE'),
(54, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGDS ', 'REQ:1WzRV', 0, '2014-01-04 05:56:46', 'BEFORE_UPDATE'),
(55, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGDS ', 'REQ:1WzRV', 0, '2014-01-04 05:56:46', 'AFTER_UPDATE'),
(56, 28, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, '12RFEFD ', 'REQ:0Dqcz', 0, '2014-01-04 05:56:46', 'BEFORE_UPDATE'),
(57, 28, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, '12RFEFD ', 'REQ:0Dqcz', 0, '2014-01-04 05:56:46', 'AFTER_UPDATE'),
(58, 29, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 05:56:46', 'BEFORE_UPDATE'),
(59, 29, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 05:56:46', 'AFTER_UPDATE'),
(60, 30, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 05:56:46', 'BEFORE_UPDATE'),
(61, 30, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 05:56:46', 'AFTER_UPDATE'),
(76, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'FVDS ', 'REQ:fBg5y', 0, '2014-01-04 08:24:48', 'BEFORE_UPDATE'),
(77, 26, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-04 08:24:48', 'AFTER_UPDATE'),
(78, 29, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 08:31:55', 'BEFORE_UPDATE'),
(79, 29, 0, 'Nurse', 10, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 08:31:55', 'AFTER_UPDATE'),
(80, 30, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 08:31:55', 'BEFORE_UPDATE'),
(81, 30, 0, 'Laboratory', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 08:31:55', 'AFTER_UPDATE'),
(82, 29, 0, 'Nurse', 10, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 08:43:42', 'BEFORE_UPDATE'),
(83, 29, 0, 'Nurse', 5, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 08:43:42', 'AFTER_UPDATE'),
(84, 30, 0, 'Laboratory', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 08:43:42', 'BEFORE_UPDATE'),
(85, 30, 0, 'Laboratory', 7, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 08:43:42', 'AFTER_UPDATE'),
(86, 29, 0, 'Nurse', 5, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:15:49', 'BEFORE_UPDATE'),
(87, 29, 0, 'Nurse', 7, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:15:49', 'AFTER_UPDATE'),
(88, 30, 0, 'Laboratory', 7, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 09:15:49', 'BEFORE_UPDATE'),
(89, 30, 0, 'Laboratory', 11, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 09:15:49', 'AFTER_UPDATE'),
(90, 29, 0, 'Nurse', 7, 'Store', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:17:02', 'BEFORE_UPDATE'),
(91, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:17:02', 'AFTER_UPDATE'),
(92, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:17:02', 'BEFORE_UPDATE'),
(93, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:17:02', 'AFTER_UPDATE'),
(94, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:17:04', 'BEFORE_UPDATE'),
(95, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:17:04', 'AFTER_UPDATE'),
(96, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:17:07', 'BEFORE_UPDATE'),
(97, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-04 09:17:07', 'AFTER_UPDATE'),
(98, 30, 0, 'Laboratory', 11, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 09:17:19', 'BEFORE_UPDATE'),
(99, 30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 09:17:19', 'AFTER_UPDATE'),
(100, 30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 09:17:23', 'BEFORE_UPDATE'),
(101, 30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-04 09:17:23', 'AFTER_UPDATE'),
(102, 26, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 14:26:23', 'BEFORE_UPDATE'),
(103, 26, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 14:26:23', 'AFTER_UPDATE'),
(104, 30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-05 14:26:33', 'BEFORE_UPDATE'),
(105, 30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-05 14:26:33', 'AFTER_UPDATE'),
(106, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGDS ', 'REQ:1WzRV', 0, '2014-01-05 14:26:58', 'BEFORE_UPDATE'),
(107, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGDS ', 'REQ:1WzRV', 0, '2014-01-05 14:26:58', 'AFTER_UPDATE'),
(108, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 0.00, 'FDGDS ', 'REQ:1WzRV', 0, '2014-01-05 14:48:31', 'BEFORE_UPDATE'),
(109, 27, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 20.00, 'FDGDS ', 'REQ:1WzRV', 13, '2014-01-05 14:48:31', 'AFTER_UPDATE'),
(110, 28, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, '12RFEFD ', 'REQ:0Dqcz', 0, '2014-01-05 14:52:06', 'BEFORE_UPDATE'),
(111, 28, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, '12RFEFD ', 'REQ:0Dqcz', 0, '2014-01-05 14:52:06', 'AFTER_UPDATE'),
(112, 18, 0, 'Pharmacist', 10, 'Store', 'nfgduinvd', 12.00, 156.00, 0.00, 0.00, 'djfnvdfiunsiu ', 'REQ:Dg1yt', 0, '2014-01-05 15:04:28', 'BEFORE_UPDATE'),
(113, 18, 0, 'Pharmacist', 10, 'Store', 'nfgduinvd', 12.00, 156.00, 0.00, 0.00, 'djfnvdfiunsiu ', 'REQ:Dg1yt', 0, '2014-01-05 15:04:28', 'AFTER_UPDATE'),
(114, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 0.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 0, '2014-01-05 15:04:28', 'BEFORE_UPDATE'),
(115, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 0.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 0, '2014-01-05 15:04:28', 'AFTER_UPDATE'),
(116, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 0.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 0, '2014-01-05 15:56:24', 'BEFORE_UPDATE'),
(117, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 14.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 15:56:24', 'AFTER_UPDATE'),
(118, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 14.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 15:59:23', 'BEFORE_UPDATE'),
(119, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 14.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 15:59:23', 'AFTER_UPDATE'),
(120, 26, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 15:59:23', 'BEFORE_UPDATE'),
(121, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 15:59:23', 'AFTER_UPDATE'),
(122, 27, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 20.00, 'FDGDS ', 'REQ:1WzRV', 13, '2014-01-05 15:59:23', 'BEFORE_UPDATE'),
(123, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 20.00, 'FDGDS ', 'REQ:1WzRV', 13, '2014-01-05 15:59:23', 'AFTER_UPDATE'),
(124, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 14.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 15:59:39', 'BEFORE_UPDATE'),
(125, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 14.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 15:59:39', 'AFTER_UPDATE'),
(126, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 15:59:39', 'BEFORE_UPDATE'),
(127, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 15:59:39', 'AFTER_UPDATE'),
(128, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 20.00, 'FDGDS ', 'REQ:1WzRV', 13, '2014-01-05 15:59:39', 'BEFORE_UPDATE'),
(129, 27, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 13.00, 1560.00, 0.00, 20.00, 'FDGDS ', 'REQ:1WzRV', 13, '2014-01-05 15:59:39', 'AFTER_UPDATE'),
(130, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 14.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:00:10', 'BEFORE_UPDATE'),
(131, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:00:10', 'AFTER_UPDATE'),
(132, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 16:03:17', 'BEFORE_UPDATE'),
(133, 26, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 16:03:17', 'AFTER_UPDATE'),
(134, 26, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 16:03:17', 'BEFORE_UPDATE'),
(135, 26, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 16:03:17', 'AFTER_UPDATE'),
(136, 4, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:0La9F', 0, '2014-01-05 16:08:30', 'BEFORE_UPDATE'),
(137, 4, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:0La9F', 0, '2014-01-05 16:08:30', 'AFTER_UPDATE'),
(138, 5, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:8hIgK', 0, '2014-01-05 16:08:30', 'BEFORE_UPDATE'),
(139, 5, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:8hIgK', 0, '2014-01-05 16:08:30', 'AFTER_UPDATE'),
(140, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:08:30', 'BEFORE_UPDATE'),
(141, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:08:30', 'AFTER_UPDATE'),
(142, 26, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 16:08:30', 'BEFORE_UPDATE'),
(143, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 16:08:30', 'AFTER_UPDATE'),
(144, 4, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:0La9F', 0, '2014-01-05 16:08:38', 'BEFORE_UPDATE'),
(145, 4, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:0La9F', 0, '2014-01-05 16:08:38', 'AFTER_UPDATE'),
(146, 5, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:8hIgK', 0, '2014-01-05 16:08:38', 'BEFORE_UPDATE'),
(147, 5, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, 'knfvuiofbnd ', 'REQ:8hIgK', 0, '2014-01-05 16:08:38', 'AFTER_UPDATE'),
(148, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:08:38', 'BEFORE_UPDATE'),
(149, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:08:38', 'AFTER_UPDATE'),
(150, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 16:08:38', 'BEFORE_UPDATE'),
(151, 26, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, 'FVDS ', 'REQ:fBg5y', 13, '2014-01-05 16:08:38', 'AFTER_UPDATE'),
(152, 19, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'BEFORE_UPDATE'),
(153, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'AFTER_UPDATE'),
(154, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'BEFORE_UPDATE'),
(155, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'AFTER_UPDATE'),
(156, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'BEFORE_UPDATE'),
(157, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'AFTER_UPDATE'),
(158, 19, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'BEFORE_UPDATE'),
(159, 19, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'AFTER_UPDATE'),
(160, 19, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'BEFORE_UPDATE'),
(161, 19, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'AFTER_UPDATE'),
(162, 19, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'BEFORE_UPDATE'),
(163, 19, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 14.00, 168.00, 120.00, 10.00, 'DFNVIUFDNUI ', 'REQ:0OWG9', 13, '2014-01-05 16:09:03', 'AFTER_UPDATE'),
(164, 31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, ' jniufdbncx', 'REQ:OQ21Z', 0, '2014-01-06 06:39:43', 'INSERT'),
(165, 32, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 12.00, 144.00, 0.00, 0.00, 'jfbivnc', 'REQ:LpW5X', 0, '2014-01-06 06:39:43', 'INSERT'),
(166, 33, 0, 'Pharmacist', 10, 'Store', 'nfgduinvd', 12.00, 144.00, 0.00, 0.00, 'jvbndicbn', 'REQ:01uI3', 0, '2014-01-06 06:39:43', 'INSERT'),
(167, 34, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 0.00, 'jnbivudbcx', 'REQ:19H6v', 0, '2014-01-06 06:39:43', 'INSERT'),
(168, 35, 0, 'Pharmacist', 10, 'Store', 'nbvigdunf', 13.00, 169.00, 0.00, 0.00, 'jbvdsicubsiu', 'REQ:9xyM7', 0, '2014-01-06 06:39:43', 'INSERT'),
(169, 31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, ' jniufdbncx', 'REQ:OQ21Z', 0, '2014-01-06 06:42:38', 'BEFORE_UPDATE'),
(170, 31, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-06 06:42:38', 'AFTER_UPDATE'),
(171, 34, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 0.00, 'jnbivudbcx', 'REQ:19H6v', 0, '2014-01-06 06:43:39', 'BEFORE_UPDATE'),
(172, 34, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 440.00, 'jnbivudbcx', 'REQ:19H6v', 13, '2014-01-06 06:43:39', 'AFTER_UPDATE'),
(173, 36, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 0.00, ' jdnvbjkdfn', 'REQ:plnLr', 0, '2014-01-06 07:34:09', 'INSERT'),
(174, 37, 0, 'Pharmacist', 10, 'Store', 'dnbuidb', 12.00, 144.00, 0.00, 0.00, 'ndgvundf', 'REQ:PWwWd', 0, '2014-01-06 07:34:09', 'INSERT'),
(175, 38, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 0.00, 'nvdfioun', 'REQ:CNgCQ', 0, '2014-01-06 07:34:09', 'INSERT'),
(176, 36, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 0.00, ' jdnvbjkdfn', 'REQ:plnLr', 0, '2014-01-06 07:34:41', 'BEFORE_UPDATE'),
(177, 36, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 30.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 07:34:41', 'AFTER_UPDATE'),
(178, 38, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 0.00, 'nvdfioun', 'REQ:CNgCQ', 0, '2014-01-06 07:35:49', 'BEFORE_UPDATE'),
(179, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'AFTER_UPDATE'),
(180, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'BEFORE_UPDATE'),
(181, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'AFTER_UPDATE'),
(182, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'BEFORE_UPDATE'),
(183, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'AFTER_UPDATE'),
(184, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'BEFORE_UPDATE'),
(185, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'AFTER_UPDATE'),
(186, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'BEFORE_UPDATE'),
(187, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'AFTER_UPDATE'),
(188, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'BEFORE_UPDATE'),
(189, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 07:35:49', 'AFTER_UPDATE'),
(190, 39, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, ' vnbiunvco', 'REQ:uF8f3', 0, '2014-01-06 07:58:37', 'INSERT'),
(191, 40, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, ' bviubfdiuv', 'REQ:qCID1', 0, '2014-01-06 07:58:37', 'INSERT'),
(192, 41, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, '', 'REQ:aP2IQ', 0, '2014-01-06 07:58:37', 'INSERT'),
(193, 39, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, ' vnbiunvco', 'REQ:uF8f3', 0, '2014-01-06 07:59:14', 'BEFORE_UPDATE'),
(194, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:14', 'AFTER_UPDATE'),
(195, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:14', 'BEFORE_UPDATE'),
(196, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:14', 'AFTER_UPDATE'),
(197, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:14', 'BEFORE_UPDATE'),
(198, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:14', 'AFTER_UPDATE'),
(199, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:14', 'BEFORE_UPDATE'),
(200, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:14', 'AFTER_UPDATE'),
(201, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(202, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(203, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(204, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(205, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(206, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(207, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(208, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(209, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(210, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(211, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(212, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(213, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(214, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(215, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(216, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(217, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(218, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(219, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(220, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(221, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(222, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(223, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(224, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(225, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(226, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(227, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(228, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(229, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(230, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(231, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(232, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(233, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(234, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(235, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(236, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(237, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(238, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(239, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'BEFORE_UPDATE'),
(240, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 07:59:15', 'AFTER_UPDATE'),
(241, 40, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, ' bviubfdiuv', 'REQ:qCID1', 0, '2014-01-06 08:03:28', 'BEFORE_UPDATE'),
(242, 40, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' bviubfdiuv', 'REQ:qCID1', 13, '2014-01-06 08:03:28', 'AFTER_UPDATE'),
(243, 41, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, '', 'REQ:aP2IQ', 0, '2014-01-06 08:14:37', 'BEFORE_UPDATE'),
(244, 41, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, '', 'REQ:aP2IQ', 13, '2014-01-06 08:14:37', 'AFTER_UPDATE'),
(245, 40, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' bviubfdiuv', 'REQ:qCID1', 13, '2014-01-06 08:18:58', 'BEFORE_UPDATE'),
(246, 40, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' bviubfdiuv', 'REQ:qCID1', 13, '2014-01-06 08:18:58', 'AFTER_UPDATE'),
(247, 41, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, '', 'REQ:aP2IQ', 13, '2014-01-06 08:18:58', 'BEFORE_UPDATE'),
(248, 41, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, '', 'REQ:aP2IQ', 13, '2014-01-06 08:18:58', 'AFTER_UPDATE'),
(249, 31, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-06 08:19:15', 'BEFORE_UPDATE'),
(250, 31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-06 08:19:15', 'AFTER_UPDATE'),
(251, 31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-06 08:19:34', 'BEFORE_UPDATE'),
(252, 31, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-06 08:19:34', 'AFTER_UPDATE'),
(253, 40, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' bviubfdiuv', 'REQ:qCID1', 13, '2014-01-06 08:22:41', 'BEFORE_UPDATE'),
(254, 40, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' bviubfdiuv', 'REQ:qCID1', 13, '2014-01-06 08:22:41', 'AFTER_UPDATE'),
(255, 41, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, '', 'REQ:aP2IQ', 13, '2014-01-06 08:29:46', 'BEFORE_UPDATE'),
(256, 41, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, '', 'REQ:aP2IQ', 13, '2014-01-06 08:29:46', 'AFTER_UPDATE'),
(257, 31, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-06 08:32:55', 'BEFORE_UPDATE'),
(258, 31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-06 08:32:55', 'AFTER_UPDATE'),
(259, 31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-06 08:33:05', 'BEFORE_UPDATE'),
(260, 31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-06 08:33:05', 'AFTER_UPDATE'),
(261, 34, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 440.00, 'jnbivudbcx', 'REQ:19H6v', 13, '2014-01-06 08:34:42', 'BEFORE_UPDATE'),
(262, 34, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 440.00, 'jnbivudbcx', 'REQ:19H6v', 13, '2014-01-06 08:34:42', 'AFTER_UPDATE'),
(263, 36, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 30.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:34:42', 'BEFORE_UPDATE'),
(264, 36, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 30.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:34:42', 'AFTER_UPDATE'),
(265, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 08:34:42', 'BEFORE_UPDATE'),
(266, 38, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 08:34:42', 'AFTER_UPDATE'),
(267, 39, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 08:34:42', 'BEFORE_UPDATE'),
(268, 39, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 08:34:42', 'AFTER_UPDATE'),
(269, 40, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' bviubfdiuv', 'REQ:qCID1', 13, '2014-01-06 08:34:42', 'BEFORE_UPDATE'),
(270, 40, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' bviubfdiuv', 'REQ:qCID1', 13, '2014-01-06 08:34:42', 'AFTER_UPDATE'),
(271, 41, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, '', 'REQ:aP2IQ', 13, '2014-01-06 08:34:42', 'BEFORE_UPDATE'),
(272, 41, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, '', 'REQ:aP2IQ', 13, '2014-01-06 08:34:42', 'AFTER_UPDATE'),
(273, 34, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 440.00, 'jnbivudbcx', 'REQ:19H6v', 13, '2014-01-06 08:35:35', 'BEFORE_UPDATE'),
(274, 34, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 10.00, 'jnbivudbcx', 'REQ:19H6v', 13, '2014-01-06 08:35:35', 'AFTER_UPDATE'),
(275, 34, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 10.00, 'jnbivudbcx', 'REQ:19H6v', 13, '2014-01-06 08:35:35', 'BEFORE_UPDATE'),
(276, 34, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 12.00, 1440.00, 0.00, 10.00, 'jnbivudbcx', 'REQ:19H6v', 13, '2014-01-06 08:35:35', 'AFTER_UPDATE'),
(277, 36, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 30.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'BEFORE_UPDATE'),
(278, 36, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 1.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'AFTER_UPDATE'),
(279, 36, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 1.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'BEFORE_UPDATE'),
(280, 36, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 1.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'AFTER_UPDATE'),
(281, 36, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 1.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'BEFORE_UPDATE'),
(282, 36, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 1.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'AFTER_UPDATE'),
(283, 36, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 1.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'BEFORE_UPDATE'),
(284, 36, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 10.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'AFTER_UPDATE'),
(285, 36, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 10.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'BEFORE_UPDATE'),
(286, 36, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 10.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'AFTER_UPDATE'),
(287, 36, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 10.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'BEFORE_UPDATE'),
(288, 36, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 10.00, 120.00, 120.00, 10.00, ' jdnvbjkdfn', 'REQ:plnLr', 13, '2014-01-06 08:40:20', 'AFTER_UPDATE'),
(289, 38, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 10.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 08:43:16', 'BEFORE_UPDATE'),
(290, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 4.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 08:43:16', 'AFTER_UPDATE'),
(291, 38, 5, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 4.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 08:43:16', 'BEFORE_UPDATE'),
(292, 38, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 13.00, 156.00, 120.00, 5.00, 'nvdfioun', 'REQ:CNgCQ', 13, '2014-01-06 08:43:16', 'AFTER_UPDATE'),
(293, 39, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 10.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 08:48:28', 'BEFORE_UPDATE'),
(294, 39, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 1.00, ' vnbiunvco', 'REQ:uF8f3', 13, '2014-01-06 08:48:28', 'AFTER_UPDATE'),
(295, 40, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' bviubfdiuv', 'REQ:qCID1', 13, '2014-01-06 08:49:16', 'BEFORE_UPDATE'),
(296, 40, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 1.00, ' bviubfdiuv', 'REQ:qCID1', 13, '2014-01-06 08:49:16', 'AFTER_UPDATE'),
(297, 41, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, '', 'REQ:aP2IQ', 13, '2014-01-06 08:55:26', 'BEFORE_UPDATE'),
(298, 41, 6, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 1.00, '', 'REQ:aP2IQ', 13, '2014-01-06 08:55:26', 'AFTER_UPDATE'),
(299, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-10 01:38:59', 'BEFORE_UPDATE'),
(300, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-10 01:38:59', 'AFTER_UPDATE'),
(301, 30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-10 01:39:08', 'BEFORE_UPDATE'),
(302, 30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-10 01:39:08', 'AFTER_UPDATE'),
(303, 29, 0, 'Nurse', 7, 'Pharmacy', 'nbvigdunf', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-10 10:13:46', 'BEFORE_UPDATE'),
(304, 29, 0, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-10 10:13:46', 'AFTER_UPDATE'),
(305, 29, 0, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-13 05:45:54', 'BEFORE_UPDATE'),
(306, 29, 0, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-13 05:45:54', 'AFTER_UPDATE'),
(307, 30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-13 05:45:59', 'BEFORE_UPDATE'),
(308, 30, 0, 'Laboratory', 11, 'Pharmacy', 'nbvigdunf', 13.00, 156.00, 0.00, 0.00, 'VFDMVFIODM ', 'REQ:1kGO0', 0, '2014-01-13 05:45:59', 'AFTER_UPDATE'),
(309, 31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-13 05:46:04', 'BEFORE_UPDATE'),
(310, 31, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 5.00, ' jniufdbncx', 'REQ:OQ21Z', 13, '2014-01-13 05:46:04', 'AFTER_UPDATE'),
(311, 29, 0, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 0.00, 'FDGEDS ', 'REQ:1POjL', 0, '2014-01-13 08:06:51', 'BEFORE_UPDATE'),
(312, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'AFTER_UPDATE'),
(313, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'BEFORE_UPDATE'),
(314, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'AFTER_UPDATE'),
(315, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'BEFORE_UPDATE'),
(316, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'AFTER_UPDATE'),
(317, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'BEFORE_UPDATE'),
(318, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'AFTER_UPDATE'),
(319, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'BEFORE_UPDATE'),
(320, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'AFTER_UPDATE'),
(321, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'BEFORE_UPDATE'),
(322, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:06:51', 'AFTER_UPDATE'),
(323, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'BEFORE_UPDATE'),
(324, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'AFTER_UPDATE'),
(325, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'BEFORE_UPDATE'),
(326, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'AFTER_UPDATE'),
(327, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'BEFORE_UPDATE'),
(328, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'AFTER_UPDATE'),
(329, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'BEFORE_UPDATE'),
(330, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'AFTER_UPDATE'),
(331, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'BEFORE_UPDATE'),
(332, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'AFTER_UPDATE'),
(333, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'BEFORE_UPDATE'),
(334, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:15:39', 'AFTER_UPDATE'),
(335, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 10.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'BEFORE_UPDATE'),
(336, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'AFTER_UPDATE'),
(337, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'BEFORE_UPDATE'),
(338, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'AFTER_UPDATE'),
(339, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'BEFORE_UPDATE'),
(340, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'AFTER_UPDATE'),
(341, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'BEFORE_UPDATE'),
(342, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'AFTER_UPDATE'),
(343, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'BEFORE_UPDATE'),
(344, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'AFTER_UPDATE'),
(345, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'BEFORE_UPDATE'),
(346, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:19:01', 'AFTER_UPDATE'),
(347, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:29:14', 'BEFORE_UPDATE'),
(348, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:29:14', 'AFTER_UPDATE'),
(349, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:29:14', 'BEFORE_UPDATE'),
(350, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:29:14', 'AFTER_UPDATE'),
(351, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:29:14', 'BEFORE_UPDATE'),
(352, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:29:14', 'AFTER_UPDATE'),
(353, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'BEFORE_UPDATE');
INSERT INTO `trigger_request_update` (`id`, `request_id`, `stock_id`, `department_from`, `user_from`, `department_to`, `commodity_name`, `no_of_packs`, `total_quantity_requested`, `strength`, `total_quantity_issued`, `remarks`, `request_order_id`, `user_id`, `transaction_date`, `changetype`) VALUES
(354, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'AFTER_UPDATE'),
(355, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'BEFORE_UPDATE'),
(356, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'AFTER_UPDATE'),
(357, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'BEFORE_UPDATE'),
(358, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'AFTER_UPDATE'),
(359, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'BEFORE_UPDATE'),
(360, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'AFTER_UPDATE'),
(361, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'BEFORE_UPDATE'),
(362, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'AFTER_UPDATE'),
(363, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'BEFORE_UPDATE'),
(364, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 08:34:37', 'AFTER_UPDATE'),
(365, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'BEFORE_UPDATE'),
(366, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 3.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'AFTER_UPDATE'),
(367, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 3.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'BEFORE_UPDATE'),
(368, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'AFTER_UPDATE'),
(369, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'BEFORE_UPDATE'),
(370, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'AFTER_UPDATE'),
(371, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'BEFORE_UPDATE'),
(372, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 3.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'AFTER_UPDATE'),
(373, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 3.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'BEFORE_UPDATE'),
(374, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'AFTER_UPDATE'),
(375, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'BEFORE_UPDATE'),
(376, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:08:07', 'AFTER_UPDATE'),
(377, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 6.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:09:52', 'BEFORE_UPDATE'),
(378, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:09:52', 'AFTER_UPDATE'),
(379, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:09:52', 'BEFORE_UPDATE'),
(380, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:09:52', 'AFTER_UPDATE'),
(381, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:09:53', 'BEFORE_UPDATE'),
(382, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:09:53', 'AFTER_UPDATE'),
(387, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'BEFORE_UPDATE'),
(388, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'AFTER_UPDATE'),
(389, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'BEFORE_UPDATE'),
(390, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'AFTER_UPDATE'),
(391, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'BEFORE_UPDATE'),
(392, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'AFTER_UPDATE'),
(393, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'BEFORE_UPDATE'),
(394, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'AFTER_UPDATE'),
(395, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'BEFORE_UPDATE'),
(396, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'AFTER_UPDATE'),
(397, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'BEFORE_UPDATE'),
(398, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:15:53', 'AFTER_UPDATE'),
(399, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'BEFORE_UPDATE'),
(400, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'AFTER_UPDATE'),
(401, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'BEFORE_UPDATE'),
(402, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'AFTER_UPDATE'),
(403, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'BEFORE_UPDATE'),
(404, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'AFTER_UPDATE'),
(405, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'BEFORE_UPDATE'),
(406, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'AFTER_UPDATE'),
(407, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'BEFORE_UPDATE'),
(408, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'AFTER_UPDATE'),
(409, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'BEFORE_UPDATE'),
(410, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:19:10', 'AFTER_UPDATE'),
(411, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:48:16', 'BEFORE_UPDATE'),
(412, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:48:16', 'AFTER_UPDATE'),
(413, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:48:16', 'BEFORE_UPDATE'),
(414, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:48:16', 'AFTER_UPDATE'),
(415, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:48:16', 'BEFORE_UPDATE'),
(416, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 09:48:16', 'AFTER_UPDATE'),
(417, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:13:38', 'BEFORE_UPDATE'),
(418, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:13:38', 'AFTER_UPDATE'),
(419, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:13:38', 'BEFORE_UPDATE'),
(420, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:13:38', 'AFTER_UPDATE'),
(421, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:13:38', 'BEFORE_UPDATE'),
(422, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:13:38', 'AFTER_UPDATE'),
(423, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:20:05', 'BEFORE_UPDATE'),
(424, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:20:05', 'AFTER_UPDATE'),
(425, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:20:05', 'BEFORE_UPDATE'),
(426, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:20:05', 'AFTER_UPDATE'),
(427, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:20:05', 'BEFORE_UPDATE'),
(428, 29, 6, 'Nurse', 7, 'Pharmacy', 'Betapyn', 53.00, 636.00, 0.00, 1.00, 'FDGEDS ', 'REQ:1POjL', 10, '2014-01-13 10:20:05', 'AFTER_UPDATE'),
(429, 42, 0, 'Pharmacist', 10, 'Store', 'Betapyn', 12.00, 144.00, 120.00, 0.00, ' Needed urgently', 'REQ:bVgy6', 0, '2014-01-30 09:44:16', 'INSERT'),
(430, 43, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 2.00, 240.00, 0.00, 0.00, ' Also needed urgently', 'REQ:1JRaD', 0, '2014-01-30 09:44:16', 'INSERT'),
(431, 44, 0, 'Pharmacy', 10, 'Store', 'nfgduinvd', 12.00, 144.00, 0.00, 0.00, 'fsknviodsfnvofid ', 'REQ:hcQAa', 0, '2014-01-30 10:50:20', 'INSERT'),
(432, 44, 0, 'Pharmacy', 10, 'Store', 'nfgduinvd', 12.00, 144.00, 0.00, 0.00, 'fsknviodsfnvofid ', 'REQ:hcQAa', 0, '2014-01-30 11:01:28', 'BEFORE_UPDATE'),
(433, 44, 14, 'Pharmacy', 10, 'Store', 'nfgduinvd', 12.00, 144.00, 0.00, 14.00, 'fsknviodsfnvofid ', 'REQ:hcQAa', 13, '2014-01-30 11:01:28', 'AFTER_UPDATE'),
(434, 43, 0, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 2.00, 240.00, 0.00, 0.00, ' Also needed urgently', 'REQ:1JRaD', 0, '2014-01-30 11:30:59', 'BEFORE_UPDATE'),
(435, 43, 4, 'Pharmacist', 10, 'Store', 'fnvidnbiv', 2.00, 240.00, 0.00, 40.00, ' Also needed urgently', 'REQ:1JRaD', 13, '2014-01-30 11:30:59', 'AFTER_UPDATE');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_stock_bin_card`
--

CREATE TABLE `trigger_stock_bin_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bin_card_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `opening_bal` decimal(13,2) NOT NULL,
  `closing_bal` decimal(13,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `issues` decimal(13,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_stock_log_insert`
--

CREATE TABLE `trigger_stock_log_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `delivery_no` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `expiry_date` date NOT NULL,
  `units_per_pack` decimal(13,2) NOT NULL,
  `no_of_packs` decimal(13,2) NOT NULL,
  `total_quantity` decimal(13,2) NOT NULL,
  `buying_price` decimal(13,4) NOT NULL,
  `selling_price` decimal(13,4) NOT NULL,
  `remarks` text NOT NULL,
  `available_quantity` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `trigger_stock_log_insert`
--

INSERT INTO `trigger_stock_log_insert` (`id`, `stock_id`, `commodity_name`, `commodity_id`, `delivery_no`, `supplier_name`, `batch_no`, `expiry_date`, `units_per_pack`, `no_of_packs`, `total_quantity`, `buying_price`, `selling_price`, `remarks`, `available_quantity`, `date_added`, `changetype`, `transaction_date`, `user_id`) VALUES
(1, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.0000, 15.0000, 'fsmviodmfvx', 120.00, '2013-12-21 13:37:40', 'INSERT', '0000-00-00 00:00:00', 8),
(2, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.0000, 15.0000, 'fsmviodmfvx', 120.00, '2013-12-22 04:42:03', 'BEFORE_UPDATE', '0000-00-00 00:00:00', 8);

-- --------------------------------------------------------

--
-- Table structure for table `trigger_stock_log_update`
--

CREATE TABLE `trigger_stock_log_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `delivery_no` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `expiry_date` date NOT NULL,
  `units_per_pack` decimal(13,2) NOT NULL,
  `no_of_packs` decimal(13,2) NOT NULL,
  `total_quantity` decimal(13,2) NOT NULL,
  `buying_price` decimal(13,2) NOT NULL,
  `selling_price` decimal(13,2) NOT NULL,
  `remarks` text NOT NULL,
  `available_quantity` decimal(13,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `has_expired` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=243 ;

--
-- Dumping data for table `trigger_stock_log_update`
--

INSERT INTO `trigger_stock_log_update` (`id`, `stock_id`, `commodity_name`, `commodity_id`, `delivery_no`, `supplier_name`, `batch_no`, `expiry_date`, `units_per_pack`, `no_of_packs`, `total_quantity`, `buying_price`, `selling_price`, `remarks`, `available_quantity`, `user_id`, `changetype`, `transaction_date`, `has_expired`) VALUES
(1, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2013-12-22 04:42:03', 'Yes'),
(2, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'INSERT', '2013-12-30 19:12:17', 'Yes'),
(3, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 0.00, 13, 'INSERT', '2013-12-30 19:15:52', 'Yes'),
(4, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'BEFORE_UPDATE', '2014-01-03 11:33:34', 'Yes'),
(5, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2014-01-03 11:33:34', 'No'),
(6, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'BEFORE_UPDATE', '2014-01-03 11:33:35', 'No'),
(7, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2014-01-03 11:33:35', 'No'),
(8, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'BEFORE_UPDATE', '2014-01-03 11:33:50', 'No'),
(9, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2014-01-03 11:33:50', 'No'),
(10, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'BEFORE_UPDATE', '2014-01-03 11:33:53', 'No'),
(11, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2014-01-03 11:33:53', 'No'),
(12, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-03 11:33:53', 'Yes'),
(13, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 0.00, 13, 'AFTER_UPDATE', '2014-01-03 11:33:53', 'No'),
(14, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'BEFORE_UPDATE', '2014-01-03 11:33:53', 'No'),
(15, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2014-01-03 11:33:53', 'No'),
(30, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-04 08:24:48', 'No'),
(31, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 134.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 0.00, 13, 'AFTER_UPDATE', '2014-01-04 08:24:48', 'No'),
(36, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 134.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-05 02:57:52', 'No'),
(37, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 38.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 38.00, 13, 'AFTER_UPDATE', '2014-01-05 02:57:52', 'No'),
(38, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 38.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 38.00, 13, 'BEFORE_UPDATE', '2014-01-05 03:04:40', 'No'),
(39, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 48.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 48.00, 13, 'AFTER_UPDATE', '2014-01-05 03:04:40', 'No'),
(40, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 48.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 48.00, 13, 'BEFORE_UPDATE', '2014-01-05 03:34:40', 'No'),
(41, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 58.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 58.00, 13, 'AFTER_UPDATE', '2014-01-05 03:34:40', 'No'),
(42, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 58.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 58.00, 13, 'BEFORE_UPDATE', '2014-01-05 03:35:25', 'No'),
(43, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 59.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 59.00, 13, 'AFTER_UPDATE', '2014-01-05 03:35:25', 'No'),
(44, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 59.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 59.00, 13, 'BEFORE_UPDATE', '2014-01-05 03:40:05', 'No'),
(45, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'AFTER_UPDATE', '2014-01-05 03:40:05', 'No'),
(46, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'BEFORE_UPDATE', '2014-01-05 03:55:59', 'No'),
(47, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'AFTER_UPDATE', '2014-01-05 03:55:59', 'Yes'),
(48, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-05 15:07:34', 'Yes'),
(49, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-05 15:07:34', 'No'),
(50, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-05 15:07:37', 'No'),
(51, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-05 15:07:37', 'No'),
(52, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'BEFORE_UPDATE', '2014-01-05 15:07:44', 'Yes'),
(53, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'AFTER_UPDATE', '2014-01-05 15:07:44', 'No'),
(54, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'BEFORE_UPDATE', '2014-01-05 15:07:46', 'No'),
(55, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'AFTER_UPDATE', '2014-01-05 15:07:46', 'No'),
(56, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 144.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-05 15:56:24', 'No'),
(57, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 130.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-05 15:56:24', 'No'),
(58, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 130.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-05 16:00:10', 'No'),
(59, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 120.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-05 16:00:10', 'No'),
(60, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 120.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-05 16:03:17', 'No'),
(61, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 110.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-05 16:03:17', 'No'),
(62, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'BEFORE_UPDATE', '2014-01-05 16:03:17', 'No'),
(63, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'AFTER_UPDATE', '2014-01-05 16:03:17', 'No'),
(64, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 110.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-05 16:09:03', 'No'),
(65, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 100.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-05 16:09:03', 'No'),
(66, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 100.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-05 16:09:03', 'No'),
(67, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 100.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-05 16:09:03', 'No'),
(68, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 100.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-05 16:09:03', 'No'),
(69, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 100.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-05 16:09:03', 'No'),
(70, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'BEFORE_UPDATE', '2014-01-05 16:09:03', 'No'),
(71, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'AFTER_UPDATE', '2014-01-05 16:09:03', 'No'),
(72, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'BEFORE_UPDATE', '2014-01-05 16:09:03', 'No'),
(73, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'AFTER_UPDATE', '2014-01-05 16:09:03', 'No'),
(74, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'BEFORE_UPDATE', '2014-01-05 16:09:03', 'No'),
(75, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'AFTER_UPDATE', '2014-01-05 16:09:03', 'No'),
(76, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 60.00, 13, 'BEFORE_UPDATE', '2014-01-06 06:40:14', 'No'),
(77, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 06:40:14', 'No'),
(78, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'No'),
(79, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(80, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(81, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(82, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(83, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(84, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(85, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(86, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(87, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(88, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(89, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(90, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 100.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 06:42:38', 'No'),
(91, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 90.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 06:42:38', 'No'),
(92, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1440.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'BEFORE_UPDATE', '2014-01-06 06:43:39', 'No'),
(93, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1000.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2014-01-06 06:43:39', 'No'),
(94, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 90.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:34:41', 'No'),
(95, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:34:41', 'No'),
(96, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 60.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:35:49', 'No'),
(97, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:35:49', 'No'),
(98, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:35:49', 'No'),
(99, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:35:49', 'No'),
(100, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:35:49', 'No'),
(101, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:35:49', 'No'),
(102, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:35:49', 'No'),
(103, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:35:49', 'No'),
(104, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:35:49', 'No'),
(105, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:35:49', 'No'),
(106, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:35:49', 'No'),
(107, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:35:49', 'No'),
(108, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:14', 'No'),
(109, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:14', 'No'),
(110, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:14', 'No'),
(111, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:14', 'No'),
(112, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:14', 'No'),
(113, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:14', 'No'),
(114, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:14', 'No'),
(115, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:14', 'No'),
(116, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(117, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(118, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(119, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(120, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(121, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(122, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(123, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(124, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(125, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(126, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(127, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(128, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(129, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(130, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(131, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(132, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(133, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(134, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(135, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(136, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(137, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(138, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(139, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(140, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(141, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(142, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(143, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(144, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(145, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(146, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(147, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(148, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(149, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(150, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(151, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(152, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(153, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(154, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 07:59:15', 'No'),
(155, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 07:59:15', 'No'),
(156, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:03:27', 'No'),
(157, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 30.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 08:03:27', 'No'),
(158, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 30.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:14:37', 'No'),
(159, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 20.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 08:14:37', 'No'),
(160, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 20.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:19:34', 'No'),
(161, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 15.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 08:19:34', 'No'),
(162, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 15.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:22:41', 'No'),
(163, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 10.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 08:22:41', 'No'),
(164, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 10.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:29:46', 'No'),
(165, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 5.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 08:29:46', 'No'),
(166, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 1000.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'BEFORE_UPDATE', '2014-01-06 08:35:35', 'No'),
(167, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 990.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2014-01-06 08:35:35', 'No'),
(168, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 990.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'BEFORE_UPDATE', '2014-01-06 08:35:35', 'No'),
(169, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 990.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2014-01-06 08:35:35', 'No'),
(170, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:39:29', 'Yes'),
(171, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 08:39:29', 'No'),
(172, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 5.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(173, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 4.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(174, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 4.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(175, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 4.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(176, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 4.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(177, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 4.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(178, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 50.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(179, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(180, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(181, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(182, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(183, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(184, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 4.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:43:16', 'No'),
(185, 5, 'Betapyn', 4, 'DEL_001', 'KEMSA', 'BET_001', '2014-12-31', 12.00, 12.00, 0.00, 15.00, 25.00, 'May cause drowsiness  ', 0.00, 13, 'AFTER_UPDATE', '2014-01-06 08:43:16', 'No'),
(186, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 40.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:43:16', 'No'),
(187, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 35.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 08:43:16', 'No'),
(188, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 35.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:48:28', 'No'),
(189, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 34.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 08:48:28', 'No'),
(190, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 34.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:49:16', 'No'),
(191, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 33.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 08:49:16', 'No'),
(192, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 33.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-06 08:55:26', 'No'),
(193, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 32.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-06 08:55:26', 'No'),
(218, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 32.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-13 07:36:19', 'No'),
(219, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 56.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-13 07:36:19', 'No'),
(220, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 56.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-13 07:36:19', 'No'),
(221, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 56.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'AFTER_UPDATE', '2014-01-13 07:36:19', 'No'),
(222, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 56.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 50.00, 13, 'BEFORE_UPDATE', '2014-01-13 12:22:42', 'No'),
(223, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 2.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 2.00, 13, 'AFTER_UPDATE', '2014-01-13 12:22:42', 'No'),
(227, 10, 'dnbuidb', 5, 'nsifnius', 'KEMSA', 'dnb_1', '2014-01-22', 12.00, 12.00, 144.00, 12.00, 14.00, 'vscdfsv ', 0.00, 13, 'INSERT', '2014-01-15 08:15:59', 'Yes'),
(229, 12, 'dnbuidb', 5, 'fgfd', 'KEMSA', 'dnb_2', '2014-01-24', 12.00, 13.00, 156.00, 13.00, 14.00, 'snnvfns ', 0.00, 13, 'INSERT', '2014-01-15 08:27:06', 'Yes'),
(230, 13, 'dnbuidb', 5, 'sjndfg', 'NDUVDFNJ', 'dnb_3', '2014-01-16', 12.00, 12.00, 144.00, 13.00, 13.00, 'sfer ', 0.00, 13, 'INSERT', '2014-01-15 09:03:00', 'No'),
(231, 14, 'nfgduinvd', 2, 'qw', 'KEMSA', 'nfg_1', '2014-01-09', 12.00, 12.00, 144.00, 12.00, 14.00, ' qw', 0.00, 13, 'INSERT', '2014-01-15 09:04:19', 'No'),
(232, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 2.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 2.00, 13, 'BEFORE_UPDATE', '2014-01-30 10:51:44', 'No'),
(233, 6, 'Betapyn', 4, 'DEL_002', 'KEMSA', 'BET_002', '2015-12-31', 12.00, 12.00, 1.00, 15.00, 25.00, 'May cause drowsiness be cautious please ', 1.00, 13, 'AFTER_UPDATE', '2014-01-30 10:51:44', 'No'),
(234, 14, 'nfgduinvd', 2, 'qw', 'KEMSA', 'nfg_1', '2014-01-09', 12.00, 12.00, 144.00, 12.00, 14.00, ' qw', 0.00, 13, 'BEFORE_UPDATE', '2014-01-30 11:01:28', 'No'),
(235, 14, 'nfgduinvd', 2, 'qw', 'KEMSA', 'nfg_1', '2014-01-09', 12.00, 12.00, 130.00, 12.00, 14.00, ' qw', 0.00, 13, 'AFTER_UPDATE', '2014-01-30 11:01:28', 'No'),
(236, 14, 'nfgduinvd', 2, 'qw', 'KEMSA', 'nfg_1', '2014-01-09', 12.00, 12.00, 130.00, 12.00, 14.00, ' qw', 0.00, 13, 'BEFORE_UPDATE', '2014-01-30 11:12:57', 'No'),
(237, 14, 'nfgduinvd', 2, 'qw', 'KEMSA', 'nfg_1', '2014-01-09', 12.00, 12.00, 130.00, 12.00, 14.00, ' qw', 1000.00, 13, 'AFTER_UPDATE', '2014-01-30 11:12:57', 'No'),
(238, 14, 'nfgduinvd', 2, 'qw', 'KEMSA', 'nfg_1', '2014-01-09', 12.00, 12.00, 130.00, 12.00, 14.00, ' qw', 1000.00, 13, 'BEFORE_UPDATE', '2014-01-30 11:13:53', 'No'),
(239, 14, 'nfgduinvd', 2, 'qw', 'KEMSA', 'nfg_1', '2014-01-09', 12.00, 12.00, 130.00, 12.00, 14.00, ' qw', 130.00, 13, 'AFTER_UPDATE', '2014-01-30 11:13:53', 'No'),
(240, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 990.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'BEFORE_UPDATE', '2014-01-30 11:30:59', 'No'),
(241, 4, 'fnvidnbiv', 1, 'n dfhvi fdj', 'fnsuivbcnd', '123890', '0000-00-00', 120.00, 12.00, 950.00, 12.00, 17.00, 'fsmviodmfvx', 120.00, 8, 'AFTER_UPDATE', '2014-01-30 11:30:59', 'No'),
(242, 15, 'nfgduinvd', 2, 'nboingfdoi', 'KEMSA', 'nfg_2', '2014-02-28', 12.00, 12.00, 144.00, 12.00, 15.00, ' knbvofdniovncfdiosn', 0.00, 13, 'INSERT', '2014-01-30 12:32:21', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_store_bin_card`
--

CREATE TABLE `trigger_store_bin_card` (
  `trigger_store_bin_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_bin_card_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `opening_bal` decimal(13,2) NOT NULL,
  `closing_bal` decimal(13,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `issues` decimal(13,2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `identification_code` varchar(255) NOT NULL,
  `issuing_officer` int(11) NOT NULL,
  `change_type` varchar(255) NOT NULL,
  PRIMARY KEY (`trigger_store_bin_card_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `trigger_store_bin_card`
--

INSERT INTO `trigger_store_bin_card` (`trigger_store_bin_card_id`, `store_bin_card_id`, `commodity_name`, `batch_no`, `opening_bal`, `closing_bal`, `expiry_date`, `issues`, `date_added`, `description`, `department`, `identification_code`, `issuing_officer`, `change_type`) VALUES
(1, 1, 'dnbuidb', 'dnb_2', 156.00, 156.00, '2014-01-24', 0.00, '2014-01-15 08:27:06', 'dnbuidbhas  been received into the store with the  Batch Number :dnb_2.', 'Store', 'REC:T5r88', 0, 'BEFORE UPDATE'),
(2, 1, 'dnbuidb', 'dnb_2', 156.00, 156.00, '2014-01-24', 0.00, '2014-01-16 08:11:05', 'dnbuidbhas  been received into the store with the  Batch Number :dnb_2.', 'Store', 'REC:T5r88', 1, 'AFTER UPDATE'),
(3, 4, 'NVJDFNX', '123890', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:49:03', 'DFVC', 'Store', 'nvnod', 1, 'INSERT'),
(4, 4, 'NVJDFNX', '123890', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:49:03', 'DFVC', 'Store', 'nvnod', 1, 'BEFORE UPDATE'),
(5, 4, 'NVJDFNX', 'NV_1', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:49:15', 'DFVC', 'Store', 'nvnod', 1, 'AFTER UPDATE'),
(6, 4, 'NVJDFNX', 'NV_1', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:49:15', 'DFVC', 'Store', 'nvnod', 1, 'BEFORE UPDATE'),
(7, 4, 'NVJDFNX', 'NV_1', 12.00, 12.00, '2014-01-31', 0.00, '2014-01-16 08:49:15', 'DFVC', 'Store', 'nvnod', 1, 'AFTER UPDATE'),
(8, 5, 'Betapyn', 'BET_002', 1.00, 1.00, '2015-12-31', 1.00, '2014-01-30 10:51:44', 'Return to the Main Store from Pharmacy Department', 'Store', 'RET:02QJx', 10, 'INSERT'),
(9, 6, 'nfgduinvd', 'nfg_1', 144.00, 130.00, '2014-01-09', 14.00, '2014-01-30 11:01:28', 'Commodity:nfgduinvdhas been dispensed from DepartmentPharmacyto DepartmentPharmacy', '', 'ISS:om0Pu', 13, 'INSERT'),
(10, 7, 'fnvidnbiv', '123890', 990.00, 950.00, '0000-00-00', 40.00, '2014-01-30 11:30:59', 'Commodity:fnvidnbivhas been dispensed from DepartmentPharmacistto DepartmentPharmacy', '', 'ISS:C3lrG', 13, 'INSERT'),
(11, 8, 'nfgduinvd', 'nfg_2', 144.00, 144.00, '2014-02-28', 0.00, '2014-01-30 12:32:21', 'nfgduinvd has  been received into the store with the  Batch Number :nfg_2.', 'Store', 'REC:0wXnD', 13, 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_supplier_insert`
--

CREATE TABLE `trigger_supplier_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `supplier_code` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `contact_person_phone_no` int(11) NOT NULL,
  `is_active` enum('Yes','No') NOT NULL,
  `remarks` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_supplier_update`
--

CREATE TABLE `trigger_supplier_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `supplier_code` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `contact_person_phone_no` int(11) NOT NULL,
  `is_active` enum('Yes','No') NOT NULL,
  `remarks` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `trigger_supplier_update`
--

INSERT INTO `trigger_supplier_update` (`id`, `supplier_id`, `supplier_code`, `supplier_name`, `phone_no`, `contact_person`, `contact_person_phone_no`, `is_active`, `remarks`, `transaction_date`, `changetype`) VALUES
(1, 1, 'SUP_1', 'KEMSA', 714339521, 'KEMSA', 712123456, '', 'Active\r\n', '2013-12-25 15:19:17', 'INSERT'),
(2, 2, 'SUP_2', 'MEDS', 712345678, 'MEDS', 712345678, '', 'Active', '2013-12-25 15:19:17', 'INSERT'),
(3, 4, 'SUP_3', 'NDUVDFNJ', 0, 'NFUISNIUD', 0, '', '', '2013-12-25 15:20:38', 'INSERT'),
(4, 5, 'SUP_4', 'Clinton Foundation', 2147483647, 'Clinton Foundation', 2147483647, '', '', '2013-12-25 15:27:52', 'INSERT'),
(5, 6, 'SUP_5', 'nbvydsibvyicu', 0, 'nviundiu', 0, '', '', '2014-01-06 06:45:40', 'INSERT'),
(6, 7, 'SUP_6', 'nvdiufnvuidf', 87564534, 'nfviundfiu', 867564542, '', '', '2014-01-30 11:42:41', 'INSERT'),
(7, 8, 'SUP_7', 'bnvdovindfoi', 48503, 'nfoinso', 60453048, '', '', '2014-01-30 12:04:53', 'INSERT'),
(8, 9, 'SUP_8', 'vnidgnviudf', 6453, 'dnbviufnd', 56450, '', '', '2014-01-30 12:06:33', 'INSERT'),
(9, 10, 'SUP_9', 'gbngfnd', 564543, 'ndfvin', 67654, '', '', '2014-01-30 12:08:05', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_test_update`
--

CREATE TABLE `trigger_test_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `test_price` decimal(13,4) NOT NULL,
  `test_type` enum('Laboratory','Radiology') NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `trigger_test_update`
--

INSERT INTO `trigger_test_update` (`id`, `test_id`, `test_name`, `test_price`, `test_type`, `transaction_date`, `changetype`) VALUES
(1, 1, 'Malaria Test', 150.0000, '', '2013-12-21 12:03:06', 'INSERT'),
(2, 2, 'Stool Test', 450.0000, '', '2013-12-21 12:03:06', 'INSERT'),
(3, 1, 'Malaria Test', 150.0000, '', '2014-01-07 08:16:03', 'BEFORE_UPDATE'),
(4, 1, 'Malaria Test', 150.0000, 'Laboratory', '2014-01-07 08:16:03', 'AFTER_UPDATE'),
(5, 2, 'Stool Test', 450.0000, '', '2014-01-07 08:16:12', 'BEFORE_UPDATE'),
(6, 2, 'Stool Test', 450.0000, 'Laboratory', '2014-01-07 08:16:12', 'AFTER_UPDATE'),
(7, 3, 'X-Ray', 350.0000, '', '2014-01-07 08:22:40', 'INSERT'),
(8, 4, 'CT-Scan', 500.0000, '', '2014-01-07 08:22:40', 'INSERT'),
(9, 6, 'Mammogram', 750.0000, 'Radiology', '2014-01-07 08:23:25', 'INSERT'),
(10, 7, 'Ultra Sound', 850.0000, 'Radiology', '2014-01-07 08:23:25', 'INSERT'),
(11, 3, 'X-Ray', 350.0000, '', '2014-01-07 08:23:46', 'BEFORE_UPDATE'),
(12, 3, 'X-Ray', 350.0000, 'Laboratory', '2014-01-07 08:23:46', 'AFTER_UPDATE'),
(13, 4, 'CT-Scan', 500.0000, '', '2014-01-07 08:23:46', 'BEFORE_UPDATE'),
(14, 4, 'CT-Scan', 500.0000, 'Radiology', '2014-01-07 08:23:46', 'AFTER_UPDATE'),
(15, 3, 'X-Ray', 350.0000, 'Laboratory', '2014-01-07 08:24:00', 'BEFORE_UPDATE'),
(16, 3, 'X-Ray', 350.0000, 'Radiology', '2014-01-07 08:24:00', 'AFTER_UPDATE');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_transaction_log_insert`
--

CREATE TABLE `trigger_transaction_log_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `no_of_pack` decimal(13,2) NOT NULL,
  `transaction_total_quantity` decimal(13,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `trigger_transaction_log_insert`
--

INSERT INTO `trigger_transaction_log_insert` (`id`, `transaction_id`, `request_id`, `destination`, `batch_no`, `no_of_pack`, `transaction_total_quantity`, `user_id`, `date_added`, `changetype`, `transaction_date`) VALUES
(1, 2, 1, 'Pharmacy', '123890', 120.00, 10.00, 8, '2013-12-21', 'INSERT', '2013-12-21 13:48:24');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_transaction_log_update`
--

CREATE TABLE `trigger_transaction_log_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `no_of_pack` decimal(13,2) NOT NULL,
  `transaction_total_quantity` decimal(13,2) NOT NULL,
  `available_quantity` decimal(13,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `changetype` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `has_expired` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=930 ;

--
-- Dumping data for table `trigger_transaction_log_update`
--

INSERT INTO `trigger_transaction_log_update` (`id`, `transaction_id`, `request_id`, `destination`, `batch_no`, `no_of_pack`, `transaction_total_quantity`, `available_quantity`, `user_id`, `date_added`, `changetype`, `transaction_date`, `has_expired`) VALUES
(1, 2, 1, 'Pharmacy', '123890', 120.00, 120.00, 0.00, 8, '2013-12-22', 'AFTER_UPDATE', '2013-12-22 04:42:46', 'Yes'),
(2, 2, 1, 'Pharmacy', '123890', 120.00, 120.00, 120.00, 8, '2013-12-22', 'AFTER_UPDATE', '2013-12-22 05:41:29', 'Yes'),
(3, 2, 1, 'Pharmacy', '123890', 120.00, 120.00, 120.00, 8, '2013-12-22', 'BEFORE_UPDATE', '2013-12-22 05:45:13', 'Yes'),
(4, 2, 1, 'Pharmacy', '123890', 120.00, 12.00, 120.00, 8, '2013-12-22', 'AFTER_UPDATE', '2013-12-22 05:45:13', 'Yes'),
(5, 2, 1, 'Pharmacy', '123890', 120.00, 12.00, 120.00, 8, '2013-12-22', 'BEFORE_UPDATE', '2013-12-22 05:45:19', 'Yes'),
(6, 2, 1, 'Pharmacy', '123890', 120.00, 120.00, 120.00, 8, '2013-12-22', 'AFTER_UPDATE', '2013-12-22 05:45:19', 'Yes'),
(7, 3, 10, 'Pharmacy', '123890', 120.00, 120.00, 120.00, 1, '2014-01-04', 'INSERT', '2014-01-04 08:19:46', 'No'),
(8, 4, 26, 'Pharmacy', 'BET_002', 12.00, 134.00, 0.00, 13, '2014-01-04', 'INSERT', '2014-01-04 08:24:48', 'No'),
(9, 4, 26, 'Pharmacy', 'BET_002', 12.00, 134.00, 0.00, 13, '2014-01-04', 'BEFORE_UPDATE', '2014-01-04 11:35:39', 'No'),
(10, 4, 26, 'Pharmacy', 'BET_002', 12.00, 134.00, 134.00, 13, '2014-01-04', 'AFTER_UPDATE', '2014-01-04 11:35:39', 'No'),
(11, 4, 26, 'Pharmacy', 'BET_002', 12.00, 134.00, 134.00, 13, '2014-01-04', 'BEFORE_UPDATE', '2014-01-04 11:35:42', 'No'),
(12, 4, 26, 'Pharmacy', 'BET_002', 12.00, 134.00, 134.00, 13, '2014-01-04', 'AFTER_UPDATE', '2014-01-04 11:35:42', 'No'),
(13, 4, 26, 'Pharmacy', 'BET_002', 12.00, 134.00, 134.00, 13, '2014-01-04', 'BEFORE_UPDATE', '2014-01-05 02:57:52', 'No'),
(14, 4, 26, 'Pharmacy', 'BET_002', 12.00, 134.00, 122.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 02:57:52', 'No'),
(15, 4, 26, 'Pharmacy', 'BET_002', 12.00, 134.00, 122.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-05 03:04:40', 'No'),
(16, 4, 26, 'Pharmacy', 'BET_002', 12.00, 122.00, 112.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 03:04:40', 'No'),
(17, 4, 26, 'Pharmacy', 'BET_002', 12.00, 122.00, 112.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-05 03:34:40', 'No'),
(18, 4, 26, 'Pharmacy', 'BET_002', 12.00, 112.00, 102.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 03:34:40', 'No'),
(19, 4, 26, 'Pharmacy', 'BET_002', 12.00, 112.00, 102.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-05 03:35:25', 'No'),
(20, 4, 26, 'Pharmacy', 'BET_002', 12.00, 102.00, 101.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 03:35:25', 'No'),
(21, 4, 26, 'Pharmacy', 'BET_002', 12.00, 102.00, 101.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-05 03:40:05', 'No'),
(22, 4, 26, 'Pharmacy', 'BET_002', 12.00, 101.00, 100.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 03:40:05', 'No'),
(23, 4, 26, 'Pharmacy', 'BET_002', 12.00, 101.00, 100.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-05 03:55:59', 'No'),
(24, 4, 26, 'Pharmacy', 'BET_002', 12.00, 101.00, 100.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 03:55:59', 'Yes'),
(29, 4, 26, 'Pharmacy', 'BET_002', 12.00, 101.00, 100.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-05 15:51:49', 'Yes'),
(30, 4, 26, 'Pharmacy', 'BET_001', 12.00, 101.00, 100.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 15:51:49', 'Yes'),
(31, 4, 26, 'Pharmacy', 'BET_001', 12.00, 101.00, 100.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-05 15:56:24', 'Yes'),
(32, 4, 26, 'Pharmacy', 'BET_001', 12.00, 130.00, 130.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 15:56:24', 'Yes'),
(33, 4, 26, 'Pharmacy', 'BET_001', 12.00, 130.00, 130.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-05 16:00:10', 'Yes'),
(34, 4, 26, 'Pharmacy', 'BET_001', 12.00, 120.00, 120.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 16:00:10', 'Yes'),
(35, 4, 26, 'Pharmacy', 'BET_001', 12.00, 120.00, 120.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-05 16:03:17', 'Yes'),
(36, 4, 26, 'Pharmacy', 'BET_001', 12.00, 110.00, 110.00, 13, '2014-01-05', 'AFTER_UPDATE', '2014-01-05 16:03:17', 'Yes'),
(37, 5, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 100.00, 13, '2014-01-05', 'INSERT', '2014-01-05 16:09:03', 'No'),
(38, 7, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 100.00, 13, '2014-01-05', 'INSERT', '2014-01-05 16:09:03', 'No'),
(39, 6, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 100.00, 13, '2014-01-05', 'INSERT', '2014-01-05 16:09:03', 'No'),
(40, 8, 19, 'Pharmacy', 'BET_002', 14.00, 40.00, 40.00, 13, '2014-01-05', 'INSERT', '2014-01-05 16:09:03', 'No'),
(41, 9, 19, 'Pharmacy', 'BET_002', 14.00, 40.00, 40.00, 13, '2014-01-05', 'INSERT', '2014-01-05 16:09:03', 'No'),
(42, 10, 19, 'Pharmacy', 'BET_002', 14.00, 40.00, 40.00, 13, '2014-01-05', 'INSERT', '2014-01-05 16:09:03', 'No'),
(43, 5, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 100.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-06 06:40:14', 'No'),
(44, 5, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 90.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 06:40:14', 'No'),
(45, 5, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 90.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'No'),
(46, 5, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 90.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(47, 6, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 100.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'No'),
(48, 6, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 100.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(49, 7, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 100.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'No'),
(50, 7, 19, 'Pharmacy', 'BET_001', 14.00, 100.00, 100.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(51, 8, 19, 'Pharmacy', 'BET_002', 14.00, 40.00, 40.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'No'),
(52, 8, 19, 'Pharmacy', 'BET_002', 14.00, 40.00, 40.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(53, 9, 19, 'Pharmacy', 'BET_002', 14.00, 40.00, 40.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'No'),
(54, 9, 19, 'Pharmacy', 'BET_002', 14.00, 40.00, 40.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(55, 10, 19, 'Pharmacy', 'BET_002', 14.00, 40.00, 40.00, 13, '2014-01-05', 'BEFORE_UPDATE', '2014-01-06 06:41:34', 'No'),
(56, 10, 19, 'Pharmacy', 'BET_002', 14.00, 40.00, 40.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 06:41:34', 'Yes'),
(57, 11, 31, 'Pharmacy', 'BET_001', 12.00, 90.00, 90.00, 13, '2014-01-06', 'INSERT', '2014-01-06 06:42:38', 'No'),
(58, 12, 34, 'Pharmacy', '123890', 12.00, 1000.00, 1000.00, 13, '2014-01-06', 'INSERT', '2014-01-06 06:43:39', 'No'),
(59, 13, 36, 'Pharmacy', 'BET_001', 10.00, 60.00, 60.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:34:41', 'No'),
(60, 14, 38, 'Pharmacy', 'BET_001', 13.00, 50.00, 50.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:35:49', 'No'),
(61, 15, 38, 'Pharmacy', 'BET_001', 13.00, 50.00, 50.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:35:49', 'No'),
(62, 16, 38, 'Pharmacy', 'BET_001', 13.00, 50.00, 50.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:35:49', 'No'),
(63, 17, 38, 'Pharmacy', 'BET_001', 13.00, 50.00, 50.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:35:49', 'No'),
(64, 18, 38, 'Pharmacy', 'BET_001', 13.00, 50.00, 50.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:35:49', 'No'),
(65, 19, 38, 'Pharmacy', 'BET_001', 13.00, 50.00, 50.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:35:49', 'No'),
(66, 20, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:14', 'No'),
(67, 21, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:14', 'No'),
(68, 22, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(69, 23, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(70, 24, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(71, 25, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(72, 26, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(73, 27, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(74, 28, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(75, 29, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(76, 30, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(77, 31, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(78, 32, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(79, 33, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(80, 34, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(81, 35, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(82, 36, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(83, 37, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(84, 38, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(85, 39, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(86, 40, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(87, 41, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(88, 42, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(89, 43, 39, 'Pharmacy', 'BET_001', 12.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 07:59:15', 'No'),
(90, 1, 40, 'Pharmacy', 'BET_001', 12.00, 30.00, 30.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:03:28', 'No'),
(91, 2, 41, 'Pharmacy', 'BET_001', 12.00, 20.00, 20.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:14:37', 'No'),
(92, 3, 31, 'Pharmacy', 'BET_001', 12.00, 15.00, 15.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:19:34', 'No'),
(93, 4, 40, 'Pharmacy', 'BET_001', 12.00, 10.00, 10.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:22:41', 'No'),
(94, 1, 40, 'Pharmacy', 'BET_001', 12.00, 30.00, 30.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:29:46', 'No'),
(95, 1, 40, 'Pharmacy', 'BET_001', 12.00, 35.00, 35.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:29:46', 'No'),
(96, 2, 41, 'Pharmacy', 'BET_001', 12.00, 20.00, 20.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:29:46', 'No'),
(97, 2, 41, 'Pharmacy', 'BET_001', 12.00, 35.00, 35.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:29:46', 'No'),
(98, 3, 31, 'Pharmacy', 'BET_001', 12.00, 15.00, 15.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:29:46', 'No'),
(99, 3, 31, 'Pharmacy', 'BET_001', 12.00, 35.00, 35.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:29:46', 'No'),
(100, 4, 40, 'Pharmacy', 'BET_001', 12.00, 10.00, 10.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:29:46', 'No'),
(101, 4, 40, 'Pharmacy', 'BET_001', 12.00, 35.00, 35.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:29:46', 'No'),
(102, 5, 34, 'Pharmacy', '123890', 12.00, 990.00, 990.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:35:35', 'No'),
(103, 6, 34, 'Pharmacy', '123890', 12.00, 990.00, 990.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:35:35', 'No'),
(104, 1, 40, 'Pharmacy', 'BET_001', 12.00, 35.00, 35.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(105, 1, 40, 'Pharmacy', 'BET_001', 12.00, 39.00, 39.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(106, 2, 41, 'Pharmacy', 'BET_001', 12.00, 35.00, 35.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(107, 2, 41, 'Pharmacy', 'BET_001', 12.00, 39.00, 39.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(108, 3, 31, 'Pharmacy', 'BET_001', 12.00, 35.00, 35.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(109, 3, 31, 'Pharmacy', 'BET_001', 12.00, 39.00, 39.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(110, 4, 40, 'Pharmacy', 'BET_001', 12.00, 35.00, 35.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(111, 4, 40, 'Pharmacy', 'BET_001', 12.00, 39.00, 39.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(112, 1, 40, 'Pharmacy', 'BET_001', 12.00, 39.00, 39.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(113, 1, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(114, 2, 41, 'Pharmacy', 'BET_001', 12.00, 39.00, 39.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(115, 2, 41, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(116, 3, 31, 'Pharmacy', 'BET_001', 12.00, 39.00, 39.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(117, 3, 31, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(118, 4, 40, 'Pharmacy', 'BET_001', 12.00, 39.00, 39.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(119, 4, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(120, 1, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(121, 1, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(122, 2, 41, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(123, 2, 41, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(124, 3, 31, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(125, 3, 31, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(126, 4, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:40:20', 'No'),
(127, 4, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:40:20', 'No'),
(128, 7, 36, 'Pharmacy', 'BET_002', 10.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:40:20', 'No'),
(129, 8, 36, 'Pharmacy', 'BET_002', 10.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:40:20', 'No'),
(130, 9, 36, 'Pharmacy', 'BET_002', 10.00, 40.00, 40.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:40:20', 'No'),
(131, 1, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:43:16', 'No'),
(132, 1, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:43:16', 'No'),
(133, 2, 41, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:43:16', 'No'),
(134, 2, 41, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:43:16', 'No'),
(135, 3, 31, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:43:16', 'No'),
(136, 3, 31, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:43:16', 'No'),
(137, 4, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:43:16', 'No'),
(138, 4, 40, 'Pharmacy', 'BET_001', 12.00, 43.00, 43.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:43:16', 'No'),
(139, 10, 38, 'Pharmacy', 'BET_002', 13.00, 35.00, 35.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:43:16', 'No'),
(140, 1, 39, 'Pharmacy', 'BET_002', 12.00, 34.00, 34.00, 13, '2014-01-06', 'INSERT', '2014-01-06 08:48:28', 'No'),
(141, 1, 39, 'Pharmacy', 'BET_002', 12.00, 34.00, 34.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:49:16', 'No'),
(142, 1, 39, 'Pharmacy', 'BET_002', 12.00, 67.00, 67.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:49:16', 'No'),
(143, 1, 39, 'Pharmacy', 'BET_002', 12.00, 67.00, 67.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-06 08:55:26', 'No'),
(144, 1, 39, 'Pharmacy', 'BET_002', 12.00, 68.00, 68.00, 13, '2014-01-06', 'AFTER_UPDATE', '2014-01-06 08:55:26', 'No'),
(149, 1, 39, 'Pharmacy', 'BET_002', 12.00, 68.00, 68.00, 13, '2014-01-06', 'BEFORE_UPDATE', '2014-01-09 13:17:23', 'No'),
(150, 1, 39, 'Pharmacy', 'BET_002', 12.00, 68.00, 44.00, 13, '2014-01-09', 'AFTER_UPDATE', '2014-01-09 13:17:23', 'No'),
(151, 1, 39, 'Pharmacy', 'BET_002', 12.00, 68.00, 44.00, 13, '2014-01-09', 'BEFORE_UPDATE', '2014-01-09 13:36:38', 'No'),
(152, 1, 39, 'Pharmacy', 'BET_002', 12.00, 68.00, 20.00, 13, '2014-01-09', 'AFTER_UPDATE', '2014-01-09 13:36:38', 'No'),
(153, 21, 29, 'Pharmacy', 'BET_002', 12.00, 56.00, 56.00, 10, '2014-01-13', 'INSERT', '2014-01-13 07:36:19', 'No'),
(154, 22, 29, 'Pharmacy', 'BET_002', 12.00, 56.00, 56.00, 10, '2014-01-13', 'INSERT', '2014-01-13 07:36:19', 'No'),
(155, 1, 39, 'Pharmacy', 'BET_002', 12.00, 68.00, 20.00, 13, '2014-01-09', 'BEFORE_UPDATE', '2014-01-13 07:57:46', 'No'),
(156, 1, 39, 'Pharmacy', 'BET_002', 12.00, 56.00, 12.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 07:57:46', 'No'),
(157, 21, 29, 'Pharmacy', 'BET_002', 12.00, 56.00, 56.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 07:57:46', 'No'),
(158, 21, 29, 'Pharmacy', 'BET_002', 12.00, 56.00, 12.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 07:57:46', 'No'),
(159, 22, 29, 'Pharmacy', 'BET_002', 12.00, 56.00, 56.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 07:57:46', 'No'),
(160, 22, 29, 'Pharmacy', 'BET_002', 12.00, 56.00, 12.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 07:57:46', 'No'),
(161, 23, 29, 'Nurse', 'BET_002', 12.00, 12.00, 12.00, 10, '2014-01-13', 'INSERT', '2014-01-13 07:57:46', 'No'),
(162, 1, 39, 'Pharmacy', 'BET_002', 12.00, 56.00, 12.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 07:57:46', 'No'),
(163, 1, 39, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 07:57:46', 'No'),
(164, 21, 29, 'Pharmacy', 'BET_002', 12.00, 56.00, 12.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 07:57:46', 'No'),
(165, 21, 29, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 07:57:46', 'No'),
(166, 22, 29, 'Pharmacy', 'BET_002', 12.00, 56.00, 12.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 07:57:46', 'No'),
(167, 22, 29, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 07:57:46', 'No'),
(168, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'INSERT', '2014-01-13 07:57:46', 'No'),
(169, 1, 39, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 07:57:46', 'No'),
(170, 1, 39, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 07:57:46', 'No'),
(171, 21, 29, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 07:57:46', 'No'),
(172, 21, 29, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 07:57:46', 'No'),
(173, 22, 29, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 07:57:46', 'No'),
(174, 22, 29, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 07:57:46', 'No'),
(175, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'INSERT', '2014-01-13 07:57:46', 'No'),
(176, 1, 39, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(177, 1, 39, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(178, 21, 29, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(179, 21, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(180, 22, 29, 'Pharmacy', 'BET_002', 12.00, 46.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(181, 22, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(182, 23, 29, 'Nurse', 'BET_002', 12.00, 12.00, 12.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(183, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(184, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(185, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(186, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(187, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(188, 1, 39, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(189, 1, 39, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(190, 21, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(191, 21, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(192, 22, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(193, 22, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(194, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(195, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(196, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(197, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(198, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(199, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(200, 1, 39, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(201, 1, 39, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(202, 21, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(203, 21, 29, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(204, 22, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(205, 22, 29, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(206, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(207, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(208, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(209, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(210, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(211, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(212, 1, 39, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(213, 1, 39, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(214, 21, 29, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(215, 21, 29, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(216, 22, 29, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(217, 22, 29, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(218, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(219, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(220, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(221, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(222, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(223, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(224, 1, 39, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(225, 1, 39, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(226, 21, 29, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(227, 21, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(228, 22, 29, 'Pharmacy', 'BET_002', 12.00, 40.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(229, 22, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(230, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(231, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(232, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(233, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(234, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(235, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(236, 1, 39, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(237, 1, 39, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(238, 21, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(239, 21, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(240, 22, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(241, 22, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(242, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(243, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(244, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(245, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(246, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:06:51', 'No'),
(247, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:06:51', 'No'),
(248, 1, 39, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(249, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(250, 21, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(251, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(252, 22, 29, 'Pharmacy', 'BET_002', 12.00, 36.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(253, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(254, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(255, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(256, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(257, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(258, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(259, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(260, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(261, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(262, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(263, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(264, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(265, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(266, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(267, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(268, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(269, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(270, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(271, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(272, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(273, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(274, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(275, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(276, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(277, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(278, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(279, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(280, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(281, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(282, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(283, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(284, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(285, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(286, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(287, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(288, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(289, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(290, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(291, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(292, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(293, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(294, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(295, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(296, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(297, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(298, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(299, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(300, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(301, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(302, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(303, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(304, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(305, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(306, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(307, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(308, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(309, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(310, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(311, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(312, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(313, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(314, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(315, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(316, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(317, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(318, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:15:39', 'No'),
(319, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:15:39', 'No'),
(320, 1, 39, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(321, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(322, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(323, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(324, 22, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(325, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(326, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(327, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(328, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(329, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(330, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(331, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(332, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(333, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(334, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(335, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(336, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(337, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(338, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(339, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(340, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(341, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(342, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(343, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(344, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(345, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(346, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(347, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(348, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(349, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(350, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(351, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(352, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(353, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(354, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(355, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(356, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(357, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(358, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(359, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(360, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(361, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(362, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(363, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(364, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(365, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(366, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(367, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(368, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(369, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(370, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(371, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(372, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(373, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(374, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(375, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(376, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(377, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(378, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(379, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(380, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(381, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(382, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(383, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(384, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(385, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(386, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(387, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(388, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(389, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(390, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:19:01', 'No'),
(391, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:19:01', 'No'),
(392, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:26:00', 'No'),
(393, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 30.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:26:00', 'No'),
(394, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:26:11', 'No'),
(395, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 30.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:26:11', 'No'),
(396, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:26:15', 'No'),
(397, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 13.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:26:15', 'No'),
(398, 1, 39, 'Pharmacy', 'BET_002', 12.00, 25.00, 30.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(399, 1, 39, 'Pharmacy', 'BET_002', 12.00, 24.00, 31.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(400, 21, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 30.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(401, 21, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 31.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(402, 22, 29, 'Pharmacy', 'BET_002', 12.00, 25.00, 13.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(403, 22, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 31.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(404, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(405, 23, 29, 'Nurse', 'BET_002', 12.00, 31.00, 31.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(406, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(407, 24, 29, 'Nurse', 'BET_002', 12.00, 31.00, 31.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(408, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(409, 25, 29, 'Nurse', 'BET_002', 12.00, 31.00, 31.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(410, 1, 39, 'Pharmacy', 'BET_002', 12.00, 24.00, 31.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(411, 1, 39, 'Pharmacy', 'BET_002', 12.00, 24.00, 32.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(412, 21, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 31.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(413, 21, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 32.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(414, 22, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 31.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(415, 22, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 32.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(416, 23, 29, 'Nurse', 'BET_002', 12.00, 31.00, 31.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(417, 23, 29, 'Nurse', 'BET_002', 12.00, 32.00, 32.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(418, 24, 29, 'Nurse', 'BET_002', 12.00, 31.00, 31.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(419, 24, 29, 'Nurse', 'BET_002', 12.00, 32.00, 32.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(420, 25, 29, 'Nurse', 'BET_002', 12.00, 31.00, 31.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(421, 25, 29, 'Nurse', 'BET_002', 12.00, 32.00, 32.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(422, 1, 39, 'Pharmacy', 'BET_002', 12.00, 24.00, 32.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(423, 1, 39, 'Pharmacy', 'BET_002', 12.00, 24.00, 33.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(424, 21, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 32.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(425, 21, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 33.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(426, 22, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 32.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(427, 22, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 33.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(428, 23, 29, 'Nurse', 'BET_002', 12.00, 32.00, 32.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(429, 23, 29, 'Nurse', 'BET_002', 12.00, 33.00, 33.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No');
INSERT INTO `trigger_transaction_log_update` (`id`, `transaction_id`, `request_id`, `destination`, `batch_no`, `no_of_pack`, `transaction_total_quantity`, `available_quantity`, `user_id`, `date_added`, `changetype`, `transaction_date`, `has_expired`) VALUES
(430, 24, 29, 'Nurse', 'BET_002', 12.00, 32.00, 32.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(431, 24, 29, 'Nurse', 'BET_002', 12.00, 33.00, 33.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(432, 25, 29, 'Nurse', 'BET_002', 12.00, 32.00, 32.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:29:14', 'No'),
(433, 25, 29, 'Nurse', 'BET_002', 12.00, 33.00, 33.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:29:14', 'No'),
(434, 1, 39, 'Pharmacy', 'BET_002', 12.00, 24.00, 33.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(435, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(436, 21, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 33.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(437, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(438, 22, 29, 'Pharmacy', 'BET_002', 12.00, 24.00, 33.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(439, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(440, 23, 29, 'Nurse', 'BET_002', 12.00, 33.00, 33.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(441, 23, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(442, 24, 29, 'Nurse', 'BET_002', 12.00, 33.00, 33.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(443, 24, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(444, 25, 29, 'Nurse', 'BET_002', 12.00, 33.00, 33.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(445, 25, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(446, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(447, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(448, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(449, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(450, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(451, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(452, 23, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(453, 23, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(454, 24, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(455, 24, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(456, 25, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(457, 25, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(458, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(459, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(460, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(461, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(462, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(463, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(464, 23, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(465, 23, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(466, 24, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(467, 24, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(468, 25, 29, 'Nurse', 'BET_002', 12.00, 34.00, 34.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(469, 25, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(470, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(471, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(472, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(473, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(474, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(475, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(476, 23, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(477, 23, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(478, 24, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(479, 24, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(480, 25, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(481, 25, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(482, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(483, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(484, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(485, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(486, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(487, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(488, 23, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(489, 23, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(490, 24, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(491, 24, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(492, 25, 29, 'Nurse', 'BET_002', 12.00, 35.00, 35.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(493, 25, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(494, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(495, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(496, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(497, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(498, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(499, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(500, 23, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(501, 23, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(502, 24, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(503, 24, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(504, 25, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:34:37', 'No'),
(505, 25, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:34:37', 'No'),
(506, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:37:31', 'No'),
(507, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:37:31', 'No'),
(508, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:37:35', 'No'),
(509, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 16.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:37:35', 'No'),
(510, 22, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 16.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:37:40', 'No'),
(511, 22, 29, 'Pharmacy', 'BET_002', 12.00, 16.00, 16.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:37:40', 'No'),
(512, 21, 29, 'Pharmacy', 'BET_002', 12.00, 23.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 08:37:45', 'No'),
(513, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 08:37:45', 'No'),
(514, 1, 39, 'Pharmacy', 'BET_002', 12.00, 23.00, 36.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(515, 1, 39, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(516, 21, 29, 'Pharmacy', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(517, 21, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(518, 22, 29, 'Pharmacy', 'BET_002', 12.00, 16.00, 16.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(519, 22, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(520, 23, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(521, 23, 29, 'Nurse', 'BET_002', 12.00, 39.00, 39.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(522, 24, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(523, 24, 29, 'Nurse', 'BET_002', 12.00, 39.00, 39.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(524, 25, 29, 'Nurse', 'BET_002', 12.00, 36.00, 36.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(525, 25, 29, 'Nurse', 'BET_002', 12.00, 39.00, 39.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(526, 1, 39, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(527, 1, 39, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(528, 21, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(529, 21, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(530, 22, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(531, 22, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(532, 23, 29, 'Nurse', 'BET_002', 12.00, 39.00, 39.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(533, 23, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(534, 24, 29, 'Nurse', 'BET_002', 12.00, 39.00, 39.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(535, 24, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(536, 25, 29, 'Nurse', 'BET_002', 12.00, 39.00, 39.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(537, 25, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(538, 1, 39, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(539, 1, 39, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(540, 21, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(541, 21, 29, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(542, 22, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(543, 22, 29, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(544, 23, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(545, 23, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(546, 24, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(547, 24, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(548, 25, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(549, 25, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(550, 1, 39, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(551, 1, 39, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(552, 21, 29, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(553, 21, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(554, 22, 29, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(555, 22, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(556, 23, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(557, 23, 29, 'Nurse', 'BET_002', 12.00, 23.00, 23.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(558, 24, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(559, 24, 29, 'Nurse', 'BET_002', 12.00, 23.00, 23.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(560, 25, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(561, 25, 29, 'Nurse', 'BET_002', 12.00, 23.00, 23.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(562, 1, 39, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(563, 1, 39, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(564, 21, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(565, 21, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(566, 22, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(567, 22, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(568, 23, 29, 'Nurse', 'BET_002', 12.00, 23.00, 23.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(569, 23, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(570, 24, 29, 'Nurse', 'BET_002', 12.00, 23.00, 23.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(571, 24, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(572, 25, 29, 'Nurse', 'BET_002', 12.00, 23.00, 23.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(573, 25, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(574, 1, 39, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(575, 1, 39, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(576, 21, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(577, 21, 29, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(578, 22, 29, 'Pharmacy', 'BET_002', 12.00, 20.00, 20.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(579, 22, 29, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(580, 23, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(581, 23, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(582, 24, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(583, 24, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(584, 25, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:08:07', 'No'),
(585, 25, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:08:07', 'No'),
(586, 1, 39, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:52', 'No'),
(587, 1, 39, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:52', 'No'),
(588, 21, 29, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:52', 'No'),
(589, 21, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:52', 'No'),
(590, 22, 29, 'Pharmacy', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:52', 'No'),
(591, 22, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:52', 'No'),
(592, 23, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:52', 'No'),
(593, 23, 29, 'Nurse', 'BET_002', 12.00, 11.00, 11.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:52', 'No'),
(594, 24, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:52', 'No'),
(595, 24, 29, 'Nurse', 'BET_002', 12.00, 11.00, 11.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:52', 'No'),
(596, 25, 29, 'Nurse', 'BET_002', 12.00, 26.00, 26.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:52', 'No'),
(597, 25, 29, 'Nurse', 'BET_002', 12.00, 11.00, 11.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:52', 'No'),
(598, 1, 39, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:52', 'No'),
(599, 1, 39, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:52', 'No'),
(600, 21, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:52', 'No'),
(601, 21, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:52', 'No'),
(602, 22, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:52', 'No'),
(603, 22, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:52', 'No'),
(604, 23, 29, 'Nurse', 'BET_002', 12.00, 11.00, 11.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:53', 'No'),
(605, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:53', 'No'),
(606, 24, 29, 'Nurse', 'BET_002', 12.00, 11.00, 11.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:53', 'No'),
(607, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:53', 'No'),
(608, 25, 29, 'Nurse', 'BET_002', 12.00, 11.00, 11.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:53', 'No'),
(609, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:53', 'No'),
(610, 1, 39, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:53', 'No'),
(611, 1, 39, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:53', 'No'),
(612, 21, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:53', 'No'),
(613, 21, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:53', 'No'),
(614, 22, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:53', 'No'),
(615, 22, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:53', 'No'),
(616, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:53', 'No'),
(617, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:53', 'No'),
(618, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:53', 'No'),
(619, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:53', 'No'),
(620, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:09:53', 'No'),
(621, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:09:53', 'No'),
(646, 1, 39, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(647, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(648, 21, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(649, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(650, 22, 29, 'Pharmacy', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(651, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(652, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(653, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(654, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(655, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(656, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(657, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(658, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(659, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(660, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(661, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(662, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(663, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(664, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(665, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(666, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(667, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(668, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(669, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(670, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(671, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(672, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(673, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(674, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(675, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(676, 23, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(677, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(678, 24, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(679, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(680, 25, 29, 'Nurse', 'BET_002', 12.00, 10.00, 10.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(681, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(682, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(683, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(684, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(685, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(686, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(687, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(688, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(689, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(690, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(691, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(692, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(693, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(694, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(695, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(696, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(697, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(698, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(699, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(700, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(701, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(702, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(703, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(704, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(705, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(706, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(707, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(708, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(709, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(710, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(711, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(712, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(713, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(714, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(715, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(716, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:15:53', 'No'),
(717, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:15:53', 'No'),
(718, 1, 39, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(719, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(720, 21, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(721, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(722, 22, 29, 'Pharmacy', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(723, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(724, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(725, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(726, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(727, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(728, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(729, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(730, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(731, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(732, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(733, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(734, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(735, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(736, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(737, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(738, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(739, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(740, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(741, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(742, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(743, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(744, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(745, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(746, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(747, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(748, 23, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(749, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(750, 24, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(751, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(752, 25, 29, 'Nurse', 'BET_002', 12.00, 9.00, 9.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(753, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(754, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(755, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(756, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(757, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(758, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(759, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(760, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(761, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(762, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(763, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(764, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(765, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(766, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(767, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(768, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(769, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(770, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(771, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(772, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(773, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(774, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(775, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(776, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(777, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(778, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(779, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(780, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(781, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(782, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(783, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(784, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(785, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(786, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(787, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(788, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:19:10', 'No'),
(789, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:19:10', 'No'),
(790, 1, 39, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(791, 1, 39, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(792, 21, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(793, 21, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(794, 22, 29, 'Pharmacy', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(795, 22, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(796, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(797, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(798, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(799, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(800, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(801, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(802, 1, 39, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(803, 1, 39, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(804, 21, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(805, 21, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(806, 22, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(807, 22, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(808, 23, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(809, 23, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(810, 24, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(811, 24, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(812, 25, 29, 'Nurse', 'BET_002', 12.00, 8.00, 8.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(813, 25, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(814, 1, 39, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(815, 1, 39, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(816, 21, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(817, 21, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(818, 22, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(819, 22, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(820, 23, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(821, 23, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(822, 24, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(823, 24, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(824, 25, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 09:48:16', 'No'),
(825, 25, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 09:48:16', 'No'),
(826, 1, 39, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(827, 1, 39, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(828, 21, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(829, 21, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(830, 22, 29, 'Pharmacy', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(831, 22, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(832, 23, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(833, 23, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(834, 24, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(835, 24, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(836, 25, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(837, 25, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(838, 1, 39, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(839, 1, 39, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(840, 21, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(841, 21, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(842, 22, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(843, 22, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(844, 23, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(845, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(846, 24, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(847, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(848, 25, 29, 'Nurse', 'BET_002', 12.00, 7.00, 7.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(849, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(850, 1, 39, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(851, 1, 39, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(852, 21, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(853, 21, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(854, 22, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(855, 22, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(856, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(857, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(858, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(859, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(860, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:13:38', 'No'),
(861, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:13:38', 'No'),
(862, 1, 39, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(863, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(864, 21, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(865, 21, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(866, 22, 29, 'Pharmacy', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(867, 22, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(868, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(869, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(870, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(871, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(872, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(873, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(874, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(875, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No');
INSERT INTO `trigger_transaction_log_update` (`id`, `transaction_id`, `request_id`, `destination`, `batch_no`, `no_of_pack`, `transaction_total_quantity`, `available_quantity`, `user_id`, `date_added`, `changetype`, `transaction_date`, `has_expired`) VALUES
(876, 21, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(877, 21, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(878, 22, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(879, 22, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(880, 23, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(881, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(882, 24, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(883, 24, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(884, 25, 29, 'Nurse', 'BET_002', 12.00, 6.00, 6.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(885, 25, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(886, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(887, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(888, 21, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(889, 21, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(890, 22, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(891, 22, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(892, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(893, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(894, 24, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(895, 24, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(896, 25, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 10:20:05', 'No'),
(897, 25, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 10:20:05', 'No'),
(898, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-13 12:22:42', 'No'),
(899, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 2.00, 13, '2014-01-13', 'AFTER_UPDATE', '2014-01-13 12:22:42', 'No'),
(900, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-29 05:20:31', 'No'),
(901, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-29 05:20:31', 'No'),
(902, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-29 05:26:37', 'No'),
(903, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'AFTER_UPDATE', '2014-01-29 05:26:37', 'No'),
(904, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-29 05:28:12', 'No'),
(905, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 3.00, 10, '2014-01-29', 'AFTER_UPDATE', '2014-01-29 05:28:12', 'No'),
(906, 23, 29, 'Nurse', 'BET_002', 12.00, 5.00, 3.00, 10, '2014-01-29', 'BEFORE_UPDATE', '2014-01-29 05:29:01', 'No'),
(907, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-29', 'AFTER_UPDATE', '2014-01-29 05:29:01', 'No'),
(908, 24, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-29 05:29:01', 'No'),
(909, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-29', 'AFTER_UPDATE', '2014-01-29 05:29:01', 'No'),
(910, 25, 29, 'Nurse', 'BET_002', 12.00, 5.00, 5.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-29 05:29:01', 'No'),
(911, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-29', 'AFTER_UPDATE', '2014-01-29 05:29:01', 'No'),
(912, 23, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-29', 'BEFORE_UPDATE', '2014-01-29 05:29:01', 'No'),
(913, 23, 29, 'Nurse', 'BET_002', 12.00, 3.00, 2.00, 10, '2014-01-29', 'AFTER_UPDATE', '2014-01-29 05:29:01', 'No'),
(914, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 2.00, 13, '2014-01-13', 'BEFORE_UPDATE', '2014-01-30 06:39:27', 'No'),
(915, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 1.00, 13, '2014-01-30', 'AFTER_UPDATE', '2014-01-30 06:39:27', 'No'),
(916, 21, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-30 06:39:27', 'No'),
(917, 21, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 1.00, 10, '2014-01-30', 'AFTER_UPDATE', '2014-01-30 06:39:27', 'No'),
(918, 22, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 4.00, 10, '2014-01-13', 'BEFORE_UPDATE', '2014-01-30 06:39:27', 'No'),
(919, 22, 29, 'Pharmacy', 'BET_002', 12.00, 4.00, 1.00, 10, '2014-01-30', 'AFTER_UPDATE', '2014-01-30 06:39:27', 'No'),
(920, 23, 29, 'Nurse', 'BET_002', 12.00, 3.00, 2.00, 10, '2014-01-29', 'BEFORE_UPDATE', '2014-01-30 06:39:27', 'No'),
(921, 23, 29, 'Nurse', 'BET_002', 12.00, 3.00, 1.00, 10, '2014-01-30', 'AFTER_UPDATE', '2014-01-30 06:39:27', 'No'),
(922, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-29', 'BEFORE_UPDATE', '2014-01-30 06:39:27', 'No'),
(923, 24, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-29', 'AFTER_UPDATE', '2014-01-30 06:39:27', 'No'),
(924, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-29', 'BEFORE_UPDATE', '2014-01-30 06:39:27', 'No'),
(925, 25, 29, 'Nurse', 'BET_002', 12.00, 1.00, 1.00, 10, '2014-01-29', 'AFTER_UPDATE', '2014-01-30 06:39:27', 'No'),
(926, 1, 39, 'Pharmacy', 'BET_002', 12.00, 4.00, 1.00, 13, '2014-01-30', 'BEFORE_UPDATE', '2014-01-30 10:51:44', 'No'),
(927, 1, 39, 'Pharmacy', 'BET_002', 12.00, 1.00, 0.00, 13, '2014-01-30', 'AFTER_UPDATE', '2014-01-30 10:51:44', 'No'),
(928, 26, 44, 'Pharmacy', 'nfg_1', 12.00, 130.00, 130.00, 13, '2014-01-30', 'INSERT', '2014-01-30 11:01:28', 'No'),
(929, 27, 43, 'Pharmacy', '123890', 2.00, 950.00, 950.00, 13, '2014-01-30', 'INSERT', '2014-01-30 11:30:59', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_triage_insert`
--

CREATE TABLE `trigger_triage_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `triage_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `weight` decimal(4,2) NOT NULL,
  `diastolic` decimal(4,2) NOT NULL,
  `systolic` decimal(4,2) NOT NULL,
  `temperature` decimal(2,2) NOT NULL,
  `height` decimal(2,2) NOT NULL,
  `respiratory_rate` decimal(4,2) NOT NULL,
  `pulse_rate` decimal(4,2) NOT NULL,
  `critical_symptoms` text NOT NULL,
  `allergy` text NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `trigger_triage_insert`
--

INSERT INTO `trigger_triage_insert` (`id`, `triage_id`, `patient_id`, `visit_id`, `weight`, `diastolic`, `systolic`, `temperature`, `height`, `respiratory_rate`, `pulse_rate`, `critical_symptoms`, `allergy`, `transaction_date`, `changetype`) VALUES
(1, 2, 21, 10, 10.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, 'none', 'none', '2013-12-20 09:14:51', 'INSERT'),
(2, 4, 21, 10, 10.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '2013-12-20 11:54:20', 'INSERT'),
(3, 8, 21, 10, 99.99, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '2013-12-20 12:42:01', 'INSERT'),
(4, 9, 21, 10, 99.99, 99.99, 99.99, 0.99, 0.99, 23.00, 24.00, '', '', '2013-12-20 13:17:13', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_triage_update`
--

CREATE TABLE `trigger_triage_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `triage_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `weight` decimal(4,2) NOT NULL,
  `diastolic` decimal(4,2) NOT NULL,
  `systolic` decimal(4,2) NOT NULL,
  `temperature` decimal(2,2) NOT NULL,
  `height` decimal(2,2) NOT NULL,
  `respiratory_rate` decimal(4,2) NOT NULL,
  `pulse_rate` decimal(4,2) NOT NULL,
  `critical_symptoms` text NOT NULL,
  `allergy` text NOT NULL,
  `transaction_date` datetime NOT NULL,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `trigger_triage_update`
--

INSERT INTO `trigger_triage_update` (`id`, `triage_id`, `patient_id`, `visit_id`, `weight`, `diastolic`, `systolic`, `temperature`, `height`, `respiratory_rate`, `pulse_rate`, `critical_symptoms`, `allergy`, `transaction_date`, `changetype`) VALUES
(1, 2, 21, 10, 10.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, 'none', 'none', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(2, 2, 21, 10, 10.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, 'none', 'none', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(3, 10, 23, 12, 80.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'INSERT'),
(4, 10, 23, 12, 80.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(5, 10, 23, 12, 80.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', 'dfnvuidfn', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(6, 11, 2, 14, 80.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'INSERT'),
(7, 12, 7, 29, 35.00, 12.00, 13.00, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'INSERT'),
(8, 17, 5, 30, 80.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'INSERT'),
(9, 18, 19, 31, 30.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'INSERT'),
(10, 19, 3, 33, 99.99, 12.00, 12.00, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'INSERT'),
(11, 20, 3, 33, 89.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'INSERT'),
(12, 21, 3, 33, 12.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'INSERT'),
(13, 22, 3, 33, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', '0000-00-00 00:00:00', 'INSERT'),
(14, 19, 3, 33, 99.99, 12.00, 12.00, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(15, 19, 3, 33, 99.99, 12.00, 12.00, 0.99, 0.99, 99.99, 99.99, '', 'dfbiubviudf', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(16, 20, 3, 33, 89.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(17, 20, 3, 33, 89.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', 'dfbiubviudf', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(18, 21, 3, 33, 12.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(19, 21, 3, 33, 12.00, 99.99, 99.99, 0.99, 0.99, 99.99, 99.99, '', 'dfbiubviudf', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(20, 22, 3, 33, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(21, 22, 3, 33, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 'dfbiubviudf', '0000-00-00 00:00:00', 'AFTER_UPDATE');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_visit_insert`
--

CREATE TABLE `trigger_visit_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `family_number` varchar(255) NOT NULL,
  `visit_date` date NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `nurse_queue` enum('active','in-active') NOT NULL,
  `nurse_start` time NOT NULL,
  `nurse_end` time NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `doctor_queue` enum('active','in-active') NOT NULL,
  `doctor_start` time NOT NULL,
  `doctor_end` time NOT NULL,
  `lab_id` int(11) NOT NULL,
  `lab_queue` enum('active','in-active') NOT NULL,
  `lab_start` time NOT NULL,
  `lab_end` time NOT NULL,
  `pharm_id` int(11) NOT NULL,
  `pharm_queue` enum('active','in-active') NOT NULL,
  `pharm_start` time NOT NULL,
  `pharm_end` time NOT NULL,
  `rad_id` int(11) NOT NULL,
  `rad_queue` enum('active','in-active') NOT NULL,
  `rad_start` time NOT NULL,
  `rad_end` time NOT NULL,
  `urgency` varchar(255) NOT NULL,
  `results` text NOT NULL,
  `day` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `trigger_visit_insert`
--

INSERT INTO `trigger_visit_insert` (`id`, `visit_id`, `patient_id`, `family_number`, `visit_date`, `nurse_id`, `nurse_queue`, `nurse_start`, `nurse_end`, `doctor_id`, `doctor_queue`, `doctor_start`, `doctor_end`, `lab_id`, `lab_queue`, `lab_start`, `lab_end`, `pharm_id`, `pharm_queue`, `pharm_start`, `pharm_end`, `rad_id`, `rad_queue`, `rad_start`, `rad_end`, `urgency`, `results`, `day`, `transaction_date`, `changetype`) VALUES
(1, 1, 2, 'SHWARI_1000002_1', '0000-00-00', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '2013-12-17 19:10:05', ''),
(2, 10, 21, 'SHWARI_1000002_3', '2013-12-18', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '2013-12-18 16:26:41', 'INSERT'),
(3, 11, 22, 'SHWARI_1000002_2', '2013-12-18', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '2013-12-18 16:29:35', 'INSERT'),
(4, 12, 23, 'SHWARI_1000002_3', '2013-12-18', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '2013-12-18 16:29:35', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_visit_update`
--

CREATE TABLE `trigger_visit_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `family_number` varchar(255) NOT NULL,
  `visit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nurse_id` int(11) NOT NULL,
  `nurse_queue` enum('active','in-active') NOT NULL,
  `nurse_start` time NOT NULL,
  `nurse_end` time NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `doctor_queue` enum('active','in-active') NOT NULL,
  `doctor_start` time NOT NULL,
  `doctor_end` time NOT NULL,
  `lab_id` int(11) NOT NULL,
  `lab_queue` enum('active','in-active') NOT NULL,
  `lab_start` time NOT NULL,
  `lab_end` time NOT NULL,
  `pharm_id` int(11) NOT NULL,
  `pharm_queue` enum('active','in-active') NOT NULL,
  `pharm_start` time NOT NULL,
  `pharm_end` time NOT NULL,
  `rad_id` int(11) NOT NULL,
  `rad_queue` enum('active','in-active') NOT NULL,
  `rad_start` time NOT NULL,
  `rad_end` time NOT NULL,
  `urgency` varchar(255) NOT NULL,
  `results` text NOT NULL,
  `day` varchar(255) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=304 ;

--
-- Dumping data for table `trigger_visit_update`
--

INSERT INTO `trigger_visit_update` (`id`, `visit_id`, `patient_id`, `family_number`, `visit_date`, `nurse_id`, `nurse_queue`, `nurse_start`, `nurse_end`, `doctor_id`, `doctor_queue`, `doctor_start`, `doctor_end`, `lab_id`, `lab_queue`, `lab_start`, `lab_end`, `pharm_id`, `pharm_queue`, `pharm_start`, `pharm_end`, `rad_id`, `rad_queue`, `rad_start`, `rad_end`, `urgency`, `results`, `day`, `transaction_date`, `changetype`) VALUES
(1, 10, 21, 'SHWARI_1000002_3', '2013-12-18 16:32:38', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(2, 10, 21, 'SHWARI_1000002_3', '2013-12-18 16:27:34', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(3, 10, 21, 'SHWARI_1000002_3', '2013-12-18 16:32:38', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(4, 10, 21, 'SHWARI_1000002_1', '2013-12-18 16:30:19', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(5, 10, 21, 'SHWARI_1000002_1', '2013-12-18 16:32:38', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(6, 10, 21, 'SHWARI_1000002_1', '2013-12-18 16:30:19', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(7, 10, 21, 'SHWARI_1000002_1', '2013-12-18 16:32:38', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(8, 10, 21, 'SHWARI_1000002_1', '2013-12-18 16:30:19', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(9, 10, 21, 'SHWARI_1000002_1', '2013-12-18 16:32:38', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(10, 10, 21, 'SHWARI_1000002_1', '2013-12-18 16:30:19', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(11, 10, 21, 'SHWARI_1000002_1', '2013-12-18 16:30:19', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(12, 10, 21, 'SHWARI_1000002_1', '2013-12-19 16:30:19', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(13, 11, 22, 'SHWARI_1000002_2', '2013-12-18 16:29:35', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(14, 11, 22, 'SHWARI_1000002_2', '2013-12-19 16:29:35', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(15, 12, 23, 'SHWARI_1000002_3', '2013-12-18 16:29:35', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(16, 12, 23, 'SHWARI_1000002_3', '2013-12-19 16:29:35', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(17, 10, 21, 'SHWARI_1000002_1', '2013-12-19 16:30:19', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(18, 10, 21, 'SHWARI_1000002_1', '2013-12-19 19:34:58', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(19, 10, 21, 'SHWARI_1000002_1', '2013-12-19 19:34:58', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(20, 10, 21, 'SHWARI_1000002_1', '2013-12-19 19:34:58', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(21, 10, 21, 'SHWARI_1000002_1', '2013-12-19 19:34:58', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(22, 10, 21, 'SHWARI_1000002_1', '2013-12-19 19:34:58', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(23, 11, 22, 'SHWARI_1000002_2', '2013-12-19 16:29:35', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(24, 11, 22, 'SHWARI_1000002_2', '2013-12-19 19:35:33', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(25, 12, 23, 'SHWARI_1000002_3', '2013-12-19 16:29:35', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 6, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(26, 12, 23, 'SHWARI_1000002_3', '2013-12-19 19:35:33', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(27, 10, 21, 'SHWARI_1000002_1', '2013-12-19 19:34:58', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(28, 10, 21, 'SHWARI_1000002_1', '2013-12-19 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(29, 11, 22, 'SHWARI_1000002_2', '2013-12-19 19:35:33', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(30, 11, 22, 'SHWARI_1000002_2', '2013-12-19 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(31, 12, 23, 'SHWARI_1000002_3', '2013-12-19 19:35:33', 5, 'active', '00:00:00', '00:00:00', 4, 'active', '00:00:00', '00:00:00', 7, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(32, 12, 23, 'SHWARI_1000002_3', '2013-12-19 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(33, 10, 21, 'SHWARI_1000002_1', '2013-12-19 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(34, 10, 21, 'SHWARI_1000002_1', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(35, 11, 22, 'SHWARI_1000002_2', '2013-12-19 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(36, 11, 22, 'SHWARI_1000002_2', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(37, 12, 23, 'SHWARI_1000002_3', '2013-12-19 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(38, 12, 23, 'SHWARI_1000002_3', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(39, 10, 21, 'SHWARI_1000002_1', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(40, 10, 21, 'SHWARI_1000002_1', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(41, 10, 21, 'SHWARI_1000002_1', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(42, 10, 21, 'SHWARI_1000002_1', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(43, 10, 21, 'SHWARI_1000002_1', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(44, 10, 21, 'SHWARI_1000002_1', '2013-12-21 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(45, 11, 22, 'SHWARI_1000002_2', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(46, 11, 22, 'SHWARI_1000002_2', '2013-12-21 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(47, 12, 23, 'SHWARI_1000002_3', '2013-12-20 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(48, 12, 23, 'SHWARI_1000002_3', '2013-12-21 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(49, 10, 21, 'SHWARI_1000002_1', '2013-12-21 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(50, 10, 21, 'SHWARI_1000002_1', '2013-12-21 03:21:09', 7, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(51, 10, 21, 'SHWARI_1000002_1', '2013-12-21 03:21:09', 7, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(52, 10, 21, 'SHWARI_1000002_1', '2013-12-21 03:21:09', 7, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(53, 10, 21, 'SHWARI_1000002_1', '2013-12-21 03:21:09', 7, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(54, 10, 21, 'SHWARI_1000002_1', '2013-12-21 03:31:04', 7, 'in-active', '00:00:00', '06:31:04', 10, 'active', '06:31:04', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(55, 11, 22, 'SHWARI_1000002_2', '2013-12-21 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(56, 11, 22, 'SHWARI_1000002_2', '2013-12-21 08:05:30', 7, 'in-active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(57, 11, 22, 'SHWARI_1000002_2', '2013-12-21 08:05:30', 7, 'in-active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(58, 11, 22, 'SHWARI_1000002_2', '2013-12-23 08:05:30', 7, 'in-active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(59, 10, 21, 'SHWARI_1000002_1', '2013-12-21 03:31:04', 7, 'in-active', '00:00:00', '06:31:04', 10, 'active', '06:31:04', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(60, 10, 21, 'SHWARI_1000002_1', '2014-01-05 03:31:04', 7, 'in-active', '00:00:00', '06:31:04', 10, 'active', '06:31:04', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(61, 11, 22, 'SHWARI_1000002_2', '2013-12-23 08:05:30', 7, 'in-active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(62, 11, 22, 'SHWARI_1000002_2', '2014-01-05 03:31:04', 7, 'in-active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(63, 12, 23, 'SHWARI_1000002_3', '2013-12-21 20:03:12', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(64, 12, 23, 'SHWARI_1000002_3', '2014-01-05 03:31:04', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(65, 12, 23, 'SHWARI_1000002_3', '2014-01-05 03:31:04', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(66, 12, 23, 'SHWARI_1000002_3', '2014-01-06 03:31:04', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(67, 12, 23, 'SHWARI_1000002_3', '2014-01-06 03:31:04', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(68, 12, 23, 'SHWARI_1000002_3', '2014-01-06 06:19:35', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(69, 12, 23, 'SHWARI_1000002_3', '2014-01-06 06:19:35', 7, 'active', '00:00:00', '00:00:00', 8, 'active', '00:00:00', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(70, 12, 23, 'SHWARI_1000002_3', '2014-01-06 06:19:41', 7, 'in-active', '00:00:00', '09:19:41', 0, 'active', '09:19:41', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(71, 12, 23, 'SHWARI_1000002_3', '2014-01-06 06:19:41', 7, 'in-active', '00:00:00', '09:19:41', 0, 'active', '09:19:41', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(72, 12, 23, 'SHWARI_1000002_3', '2014-01-06 06:25:38', 7, 'in-active', '00:00:00', '09:25:38', 8, 'active', '09:25:38', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(73, 14, 2, '', '2014-01-06 12:07:15', 0, 'active', '15:07:15', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(74, 15, 2, '', '2014-01-06 12:11:07', 0, 'active', '15:11:07', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(75, 16, 2, '', '2014-01-06 12:15:22', 0, 'active', '15:15:22', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(76, 17, 2, 'SHWARI_1000001_001', '2014-01-06 12:29:48', 0, 'active', '15:29:48', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(77, 12, 23, 'SHWARI_1000002_3', '2014-01-06 06:25:38', 7, 'in-active', '00:00:00', '09:25:38', 8, 'active', '09:25:38', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(78, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:16:08', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:16:08', 11, 'active', '16:16:08', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(79, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:16:08', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:16:08', 11, 'active', '16:16:08', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(80, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:18:33', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:18:33', 11, 'active', '16:18:33', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(81, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:18:33', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:18:33', 11, 'active', '16:18:33', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(82, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:19:20', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:19:20', 11, 'active', '16:19:20', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(83, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:19:20', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:19:20', 11, 'active', '16:19:20', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(84, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:19:42', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:19:42', 11, 'active', '16:19:42', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(85, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:19:42', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:19:42', 11, 'active', '16:19:42', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(86, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:24:47', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:24:47', 11, 'active', '16:24:47', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(87, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:24:47', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:24:47', 11, 'active', '16:24:47', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(88, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:34:13', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:34:13', 11, 'active', '16:34:13', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(89, 10, 21, 'SHWARI_1000002_1', '2014-01-05 03:31:04', 7, 'in-active', '00:00:00', '06:31:04', 10, 'active', '06:31:04', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(90, 10, 21, 'SHWARI_1000002_1', '2014-01-07 03:31:04', 7, 'in-active', '00:00:00', '06:31:04', 10, 'active', '06:31:04', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(91, 11, 22, 'SHWARI_1000002_2', '2014-01-05 03:31:04', 7, 'in-active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(92, 11, 22, 'SHWARI_1000002_2', '2014-01-07 03:31:04', 7, 'in-active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(93, 12, 23, 'SHWARI_1000002_3', '2014-01-06 13:34:13', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:34:13', 11, 'active', '16:34:13', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(94, 12, 23, 'SHWARI_1000002_3', '2014-01-07 13:34:13', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:34:13', 11, 'active', '16:34:13', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(95, 14, 2, '', '2014-01-06 12:07:15', 0, 'active', '15:07:15', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(96, 14, 2, '', '2014-01-07 12:07:15', 0, 'active', '15:07:15', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(97, 15, 2, '', '2014-01-06 12:11:07', 0, 'active', '15:11:07', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(98, 15, 2, '', '2014-01-07 12:11:07', 0, 'active', '15:11:07', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(99, 16, 2, '', '2014-01-06 12:15:22', 0, 'active', '15:15:22', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(100, 16, 2, '', '2014-01-07 12:15:22', 0, 'active', '15:15:22', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(101, 17, 2, 'SHWARI_1000001_001', '2014-01-06 12:29:48', 0, 'active', '15:29:48', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(102, 17, 2, 'SHWARI_1000001_001', '2014-01-07 12:29:48', 0, 'active', '15:29:48', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(103, 12, 23, 'SHWARI_1000002_3', '2014-01-07 13:34:13', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '16:34:13', 11, 'active', '16:34:13', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(104, 12, 23, 'SHWARI_1000002_3', '2014-01-07 11:01:30', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '14:01:30', 11, 'active', '16:34:13', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(105, 11, 22, 'SHWARI_1000002_2', '2014-01-07 03:31:04', 7, 'in-active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(106, 11, 22, 'SHWARI_1000002_2', '2014-01-07 12:15:35', 7, 'active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(107, 14, 2, '', '2014-01-07 12:07:15', 0, 'active', '15:07:15', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(108, 14, 2, '', '2014-01-07 12:36:42', 0, 'active', '15:07:15', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(109, 14, 2, '', '2014-01-07 12:36:42', 0, 'active', '15:07:15', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(110, 14, 2, '', '2014-01-07 12:36:58', 0, 'in-active', '15:07:15', '15:36:58', 8, 'active', '15:36:58', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(111, 14, 2, '', '2014-01-07 12:36:58', 0, 'in-active', '15:07:15', '15:36:58', 8, 'active', '15:36:58', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(112, 14, 2, '', '2014-01-07 13:43:32', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '15:36:58', '16:43:32', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '16:43:32', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(113, 14, 2, '', '2014-01-07 13:43:32', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '15:36:58', '16:43:32', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '16:43:32', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(114, 14, 2, '', '2014-01-07 13:44:07', 0, 'in-active', '15:07:15', '15:36:58', 8, 'active', '16:44:07', '16:43:32', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'in-active', '16:43:32', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(115, 11, 22, 'SHWARI_1000002_2', '2014-01-07 12:15:35', 7, 'active', '00:00:00', '11:05:30', 8, 'active', '11:05:30', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(116, 11, 22, 'SHWARI_1000002_2', '2014-01-07 13:56:20', 7, 'active', '00:00:00', '11:05:30', 8, '', '11:05:30', '16:56:20', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '16:56:20', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(117, 14, 2, '', '2014-01-07 13:44:07', 0, 'in-active', '15:07:15', '15:36:58', 8, 'active', '16:44:07', '16:43:32', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'in-active', '16:43:32', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(118, 14, 2, '', '2014-01-07 13:56:49', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '16:56:49', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '16:56:49', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(119, 14, 2, '', '2014-01-07 13:56:49', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '16:56:49', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '16:56:49', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(120, 14, 2, '', '2014-01-07 13:59:47', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '16:59:47', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '16:59:47', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(121, 14, 2, '', '2014-01-07 13:59:47', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '16:59:47', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '16:59:47', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(122, 14, 2, '', '2014-01-07 14:10:24', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:10:24', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:10:24', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(123, 14, 2, '', '2014-01-07 14:10:24', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:10:24', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:10:24', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(124, 14, 2, '', '2014-01-07 14:13:54', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:13:54', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:13:54', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(125, 14, 2, '', '2014-01-07 14:13:54', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:13:54', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:13:54', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(126, 14, 2, '', '2014-01-07 14:17:54', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:17:54', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:17:54', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(127, 14, 2, '', '2014-01-07 14:17:54', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:17:54', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:17:54', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(128, 14, 2, '', '2014-01-07 14:18:31', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:18:31', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:18:31', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(129, 14, 2, '', '2014-01-07 14:18:31', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:18:31', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:18:31', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(130, 14, 2, '', '2014-01-07 14:24:43', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:24:43', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:24:43', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(131, 14, 2, '', '2014-01-07 14:24:43', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:24:43', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:24:43', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(132, 14, 2, '', '2014-01-07 14:25:08', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:25:08', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:25:08', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(133, 14, 2, '', '2014-01-07 14:25:08', 0, 'in-active', '15:07:15', '15:36:58', 8, '', '16:44:07', '17:25:08', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '17:25:08', '16:44:07', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(134, 14, 2, '', '2014-01-07 14:43:32', 0, 'in-active', '15:07:15', '15:36:58', 8, 'active', '17:43:32', '17:25:08', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'in-active', '17:25:08', '17:43:32', 'urgent', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(135, 18, 2, 'SHWARI_1000001_001', '2014-01-08 01:19:29', 0, 'active', '04:19:29', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(136, 19, 2, 'SHWARI_1000001_001', '2014-01-08 01:22:06', 0, 'active', '04:22:06', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(137, 20, 6, 'SHWARI_1000002_005', '2014-01-08 01:41:41', 0, 'active', '04:41:41', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(138, 21, 3, 'SHWARI_1000002_002', '2014-01-08 01:49:29', 0, 'active', '04:49:29', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(139, 22, 8, 'SHWARI_1000001_013', '2014-01-08 01:53:02', 0, 'active', '04:53:02', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(140, 22, 8, 'SHWARI_1000001_013', '2014-01-08 01:53:02', 0, 'active', '04:53:02', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(141, 22, 8, 'SHWARI_1000001_013', '2014-01-08 02:07:55', 0, 'in-active', '04:53:02', '05:07:55', 8, 'active', '05:07:55', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(142, 22, 8, 'SHWARI_1000001_013', '2014-01-08 02:07:55', 0, 'in-active', '04:53:02', '05:07:55', 8, 'active', '05:07:55', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(143, 22, 8, 'SHWARI_1000001_013', '2014-01-08 03:19:07', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(144, 22, 8, 'SHWARI_1000001_013', '2014-01-08 03:19:07', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(145, 22, 8, 'SHWARI_1000001_013', '2014-01-08 05:34:50', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(146, 21, 3, 'SHWARI_1000002_002', '2014-01-08 01:49:29', 0, 'active', '04:49:29', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(147, 21, 3, 'SHWARI_1000002_002', '2014-01-09 01:49:29', 0, 'active', '04:49:29', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(148, 22, 8, 'SHWARI_1000001_013', '2014-01-08 05:34:50', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(149, 22, 8, 'SHWARI_1000001_013', '2014-01-09 05:34:50', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(150, 22, 8, 'SHWARI_1000001_013', '2014-01-09 05:34:50', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(151, 22, 8, 'SHWARI_1000001_013', '2014-01-09 07:26:20', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '10:26:19', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(152, 22, 8, 'SHWARI_1000001_013', '2014-01-09 07:26:20', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '10:26:19', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(153, 22, 8, 'SHWARI_1000001_013', '2014-01-09 07:46:56', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '10:46:56', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(154, 22, 8, 'SHWARI_1000001_013', '2014-01-09 07:46:56', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '10:46:56', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(155, 22, 8, 'SHWARI_1000001_013', '2014-01-09 08:37:38', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '06:19:07', '11:37:38', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(156, 22, 8, 'SHWARI_1000001_013', '2014-01-09 08:37:38', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '06:19:07', '11:37:38', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(157, 22, 8, 'SHWARI_1000001_013', '2014-01-09 10:21:27', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '11:37:38', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(158, 23, 3, 'SHWARI_1000002_002', '2014-01-17 09:03:45', 0, 'active', '12:03:45', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(159, 10, 21, 'SHWARI_1000002_1', '2014-01-07 03:31:04', 7, 'in-active', '00:00:00', '06:31:04', 10, 'active', '06:31:04', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(160, 10, 21, 'SHWARI_1000002_1', '2014-01-20 03:31:04', 7, 'in-active', '00:00:00', '06:31:04', 10, 'active', '06:31:04', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(161, 24, 2, 'SHWARI_1000001_001', '2014-01-20 10:27:46', 0, 'active', '13:27:46', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(162, 25, 25, 'SHWARI_1000007_0', '2014-01-20 10:51:45', 0, 'active', '13:51:45', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(163, 26, 11, 'SHWARI3_0', '2014-01-20 10:53:56', 0, 'active', '13:53:56', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(164, 12, 23, 'SHWARI_1000002_3', '2014-01-07 11:01:30', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '14:01:30', 11, 'active', '16:34:13', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(165, 12, 23, 'SHWARI_1000002_3', '2014-01-20 12:36:55', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '15:36:55', 11, 'active', '15:36:55', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(166, 12, 23, 'SHWARI_1000002_3', '2014-01-20 12:36:55', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '15:36:55', 11, 'active', '15:36:55', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(167, 12, 23, 'SHWARI_1000002_3', '2014-01-20 12:37:52', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '15:37:52', 11, 'active', '15:37:52', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(168, 12, 23, 'SHWARI_1000002_3', '2014-01-20 12:37:52', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '15:37:52', 11, 'active', '15:37:52', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(169, 12, 23, 'SHWARI_1000002_3', '2014-01-20 12:39:45', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '15:39:45', 11, 'active', '15:39:45', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE');
INSERT INTO `trigger_visit_update` (`id`, `visit_id`, `patient_id`, `family_number`, `visit_date`, `nurse_id`, `nurse_queue`, `nurse_start`, `nurse_end`, `doctor_id`, `doctor_queue`, `doctor_start`, `doctor_end`, `lab_id`, `lab_queue`, `lab_start`, `lab_end`, `pharm_id`, `pharm_queue`, `pharm_start`, `pharm_end`, `rad_id`, `rad_queue`, `rad_start`, `rad_end`, `urgency`, `results`, `day`, `transaction_date`, `changetype`) VALUES
(170, 12, 23, 'SHWARI_1000002_3', '2014-01-20 12:39:45', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '15:39:45', 11, 'active', '15:39:45', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(171, 12, 23, 'SHWARI_1000002_3', '2014-01-20 12:47:05', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '15:47:05', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(172, 12, 23, 'SHWARI_1000002_3', '2014-01-20 12:47:05', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '15:47:05', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '14:01:30', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(173, 12, 23, 'SHWARI_1000002_3', '2014-01-21 01:31:01', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '04:31:01', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:31:01', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(174, 12, 23, 'SHWARI_1000002_3', '2014-01-21 01:31:01', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '04:31:01', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:31:01', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(175, 12, 23, 'SHWARI_1000002_3', '2014-01-21 01:32:56', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '04:32:56', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:32:56', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(176, 12, 23, 'SHWARI_1000002_3', '2014-01-21 01:32:56', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '04:32:56', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:32:56', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(177, 12, 23, 'SHWARI_1000002_3', '2014-01-21 01:35:34', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '04:35:34', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:35:34', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(178, 12, 23, 'SHWARI_1000002_3', '2014-01-21 01:35:34', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '04:35:34', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:35:34', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(179, 12, 23, 'SHWARI_1000002_3', '2014-01-21 01:38:26', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '04:38:26', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:38:26', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(180, 27, 7, 'SHWARI_1000001_012', '2014-01-21 08:12:25', 0, 'active', '11:12:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(181, 28, 10, '1_0', '2014-01-21 08:13:40', 0, 'active', '11:13:40', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(182, 12, 23, 'SHWARI_1000002_3', '2014-01-21 01:38:26', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '04:38:26', 11, 'active', '15:47:05', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:38:26', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(183, 12, 23, 'SHWARI_1000002_3', '2014-01-21 14:03:10', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '17:03:10', 11, 'active', '17:03:10', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:38:26', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(184, 28, 10, '1_0', '2014-01-21 08:13:40', 0, 'active', '11:13:40', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(185, 28, 10, '1_0', '2014-01-22 08:13:40', 0, 'active', '11:13:40', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(186, 29, 7, 'SHWARI_1000001_012', '2014-01-23 06:45:09', 0, 'active', '09:45:09', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(187, 29, 7, 'SHWARI_1000001_012', '2014-01-23 06:45:09', 0, 'active', '09:45:09', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(188, 29, 7, 'SHWARI_1000001_012', '2014-01-23 06:46:04', 0, 'active', '09:45:09', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(189, 29, 7, 'SHWARI_1000001_012', '2014-01-23 06:46:04', 0, 'active', '09:45:09', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(190, 29, 7, 'SHWARI_1000001_012', '2014-01-23 06:46:28', 0, 'in-active', '09:45:09', '09:46:28', 8, 'active', '09:46:28', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(191, 29, 7, 'SHWARI_1000001_012', '2014-01-23 06:46:28', 0, 'in-active', '09:45:09', '09:46:28', 8, 'active', '09:46:28', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(192, 29, 7, 'SHWARI_1000001_012', '2014-01-23 06:46:29', 0, 'in-active', '09:45:09', '09:46:29', 8, 'active', '09:46:29', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(193, 29, 7, 'SHWARI_1000001_012', '2014-01-23 06:46:29', 0, 'in-active', '09:45:09', '09:46:29', 8, 'active', '09:46:29', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(194, 29, 7, 'SHWARI_1000001_012', '2014-01-23 06:46:29', 0, 'in-active', '09:45:09', '09:46:29', 8, 'active', '09:46:29', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(195, 30, 5, 'SHWARI_1000002_004', '2014-01-23 10:30:27', 0, 'active', '13:30:27', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(196, 30, 5, 'SHWARI_1000002_004', '2014-01-23 10:30:27', 0, 'active', '13:30:27', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(197, 30, 5, 'SHWARI_1000002_004', '2014-01-23 10:49:53', 0, 'active', '13:30:27', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(198, 30, 5, 'SHWARI_1000002_004', '2014-01-23 10:49:53', 0, 'active', '13:30:27', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(199, 30, 5, 'SHWARI_1000002_004', '2014-01-23 11:36:13', 0, 'in-active', '13:30:27', '14:36:13', 8, 'active', '14:36:13', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(200, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:55:01', 0, 'active', '14:55:01', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(201, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:55:01', 0, 'active', '14:55:01', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(202, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:55:52', 0, 'active', '14:55:01', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(203, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:55:52', 0, 'active', '14:55:01', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(204, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:53', 0, 'in-active', '14:55:01', '14:56:53', 8, 'active', '14:56:53', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(205, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:53', 0, 'in-active', '14:55:01', '14:56:53', 8, 'active', '14:56:53', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(206, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(207, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(208, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(209, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(210, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(211, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(212, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(213, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(214, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(215, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(216, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(217, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(218, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(219, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(220, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(221, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(222, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(223, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(224, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(225, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:56:54', 0, 'in-active', '14:55:01', '14:56:54', 8, 'active', '14:56:54', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(226, 31, 19, 'SHWARI_1000004_000', '2014-01-23 11:58:17', 0, 'in-active', '14:55:01', '14:56:54', 8, '', '14:56:54', '14:58:17', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '14:58:17', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(227, 30, 5, 'SHWARI_1000002_004', '2014-01-23 11:36:13', 0, 'in-active', '13:30:27', '14:36:13', 8, 'active', '14:36:13', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(228, 30, 5, 'SHWARI_1000002_004', '2014-01-23 12:00:08', 0, 'in-active', '13:30:27', '14:36:13', 8, '', '14:36:13', '15:00:08', 0, 'active', '15:00:08', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(229, 32, 5, 'SHWARI_1000002_004', '2014-01-24 06:58:40', 0, 'active', '09:58:40', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(230, 33, 3, 'SHWARI_1000002_002', '2014-01-29 06:42:25', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT'),
(231, 33, 3, 'SHWARI_1000002_002', '2014-01-29 06:42:25', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(232, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:18:34', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(233, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:18:34', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(234, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:18:34', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(235, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:18:34', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(236, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:18:34', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(237, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:18:34', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(238, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:50:11', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(239, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:50:11', 0, 'active', '09:42:25', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(240, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(241, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(242, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(243, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(244, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(245, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(246, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(247, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(248, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(249, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(250, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(251, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:43', 0, 'in-active', '09:42:25', '10:52:43', 8, 'active', '10:52:43', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(252, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(253, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(254, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(255, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(256, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(257, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(258, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(259, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(260, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(261, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(262, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(263, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:44', 0, 'in-active', '09:42:25', '10:52:44', 8, 'active', '10:52:44', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(264, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:45', 0, 'in-active', '09:42:25', '10:52:45', 8, 'active', '10:52:45', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(265, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:45', 0, 'in-active', '09:42:25', '10:52:45', 8, 'active', '10:52:45', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(266, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:45', 0, 'in-active', '09:42:25', '10:52:45', 8, 'active', '10:52:45', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(267, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:45', 0, 'in-active', '09:42:25', '10:52:45', 8, 'active', '10:52:45', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(268, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:45', 0, 'in-active', '09:42:25', '10:52:45', 8, 'active', '10:52:45', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(269, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:45', 0, 'in-active', '09:42:25', '10:52:45', 8, 'active', '10:52:45', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(270, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:45', 0, 'in-active', '09:42:25', '10:52:45', 8, 'active', '10:52:45', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(271, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:45', 0, 'in-active', '09:42:25', '10:52:45', 8, 'active', '10:52:45', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(272, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(273, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(274, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(275, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(276, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(277, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(278, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(279, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(280, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(281, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(282, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(283, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:52:46', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '10:52:46', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(284, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:54:47', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '10:52:46', '10:54:47', 0, 'active', '10:54:47', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(285, 33, 3, 'SHWARI_1000002_002', '2014-01-29 07:54:47', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '10:52:46', '10:54:47', 0, 'active', '10:54:47', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(286, 33, 3, 'SHWARI_1000002_002', '2014-01-29 08:05:53', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '10:52:46', '11:05:53', 0, 'active', '11:05:53', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(287, 33, 3, 'SHWARI_1000002_002', '2014-01-29 08:05:53', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '10:52:46', '11:05:53', 0, 'active', '11:05:53', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(288, 33, 3, 'SHWARI_1000002_002', '2014-01-29 08:09:06', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '10:52:46', '11:09:06', 0, 'active', '11:09:06', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(289, 33, 3, 'SHWARI_1000002_002', '2014-01-29 08:09:06', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '10:52:46', '11:09:06', 0, 'active', '11:09:06', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(290, 33, 3, 'SHWARI_1000002_002', '2014-01-29 08:13:21', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '10:52:46', '11:13:21', 0, 'active', '11:13:21', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(291, 33, 3, 'SHWARI_1000002_002', '2014-01-29 08:13:21', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '10:52:46', '11:13:21', 0, 'active', '11:13:21', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', '', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(292, 33, 3, 'SHWARI_1000002_002', '2014-01-29 11:57:54', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '14:57:54', '11:13:21', 0, 'in-active', '11:13:21', '14:57:54', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', 'Lab results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(293, 33, 3, 'SHWARI_1000002_002', '2014-01-29 11:57:54', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '14:57:54', '11:13:21', 0, 'in-active', '11:13:21', '14:57:54', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '0', 'Lab results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(294, 33, 3, 'SHWARI_1000002_002', '2014-01-29 12:19:51', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '14:57:54', '15:19:51', 0, 'in-active', '11:13:21', '14:57:54', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '15:19:51', '00:00:00', '0', 'Lab results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(295, 33, 3, 'SHWARI_1000002_002', '2014-01-29 12:19:51', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '14:57:54', '15:19:51', 0, 'in-active', '11:13:21', '14:57:54', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '15:19:51', '00:00:00', '0', 'Lab results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(296, 33, 3, 'SHWARI_1000002_002', '2014-01-29 13:46:10', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '16:46:10', '15:19:51', 0, 'in-active', '11:13:21', '14:57:54', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '15:19:51', '16:46:10', '0', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(297, 33, 3, 'SHWARI_1000002_002', '2014-01-29 13:46:10', 0, 'in-active', '09:42:25', '10:52:46', 8, 'active', '16:46:10', '15:19:51', 0, 'in-active', '11:13:21', '14:57:54', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '15:19:51', '16:46:10', '0', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(298, 33, 3, 'SHWARI_1000002_002', '2014-01-29 20:21:32', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '16:46:10', '23:21:32', 0, 'in-active', '11:13:21', '14:57:54', 0, 'active', '23:21:32', '00:00:00', 0, 'in-active', '15:19:51', '16:46:10', '0', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(299, 33, 3, 'SHWARI_1000002_002', '2014-01-29 20:21:32', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '16:46:10', '23:21:32', 0, 'in-active', '11:13:21', '14:57:54', 0, 'active', '23:21:32', '00:00:00', 0, 'in-active', '15:19:51', '16:46:10', '0', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(300, 33, 3, 'SHWARI_1000002_002', '2014-01-30 20:21:32', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '16:46:10', '23:21:32', 0, 'in-active', '11:13:21', '14:57:54', 0, 'active', '23:21:32', '00:00:00', 0, 'in-active', '15:19:51', '16:46:10', '0', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(301, 33, 3, 'SHWARI_1000002_002', '2014-01-30 20:21:32', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '16:46:10', '23:21:32', 0, 'in-active', '11:13:21', '14:57:54', 0, 'active', '23:21:32', '00:00:00', 0, 'in-active', '15:19:51', '16:46:10', '0', 'Radiology results ready', '', '0000-00-00 00:00:00', 'BEFORE_UPDATE'),
(302, 33, 3, 'SHWARI_1000002_002', '2014-01-30 20:21:32', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '16:46:10', '23:21:32', 0, 'in-active', '11:13:21', '14:57:54', 0, 'active', '23:21:32', '00:00:00', 0, 'in-active', '15:19:51', '16:46:10', '0', 'Radiology results ready', '', '0000-00-00 00:00:00', 'AFTER_UPDATE'),
(303, 34, 3, 'SHWARI_1000002_002', '2014-01-30 12:54:17', 0, 'active', '15:54:17', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '', '0000-00-00 00:00:00', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `trigger_walkin_insert`
--

CREATE TABLE `trigger_walkin_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `walkin_id` int(11) NOT NULL,
  `walkin_patient_name` varchar(255) NOT NULL,
  `walkin_department` varchar(255) NOT NULL,
  `walkin_check` varchar(255) NOT NULL,
  `walkin_phone_no` int(11) NOT NULL,
  `walkin_date` varchar(255) NOT NULL,
  `paid` enum('paid','not paid') NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_walkin_update`
--

CREATE TABLE `trigger_walkin_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `walkin_id` int(11) NOT NULL,
  `walkin_patient_name` varchar(255) NOT NULL,
  `walkin_department` varchar(255) NOT NULL,
  `walkin_check` varchar(255) NOT NULL,
  `walkin_phone_no` int(11) NOT NULL,
  `walkin_date` varchar(255) NOT NULL,
  `paid` enum('paid','not paid') NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `trigger_walkin_update`
--

INSERT INTO `trigger_walkin_update` (`id`, `walkin_id`, `walkin_patient_name`, `walkin_department`, `walkin_check`, `walkin_phone_no`, `walkin_date`, `paid`, `transaction_date`, `changetype`) VALUES
(1, 1, 'dnviudfnbiu', 'Pharmacy', '0', 0, '', 'not paid', '2014-01-06 12:35:11', 'INSERT'),
(2, 2, 'Dindi', 'Pharmacy', '0', 94854543, '', 'not paid', '2014-01-24 06:40:22', 'INSERT'),
(3, 3, 'phylis Sheerow', 'Pharmacy', '0', 712345678, '', 'not paid', '2014-01-24 06:52:47', 'INSERT'),
(4, 4, 'dfjnivdfjnsi', 'Pharmacy', '0', 765654342, '', 'not paid', '2014-01-24 07:16:20', 'INSERT'),
(5, 5, 'jndvxifdno', 'Pharmacy', '0', 2147483647, '', 'not paid', '2014-01-24 07:18:32', 'INSERT'),
(6, 6, 'vndiugvndfiu', 'Lab Tech', '0', 5439801, '', 'not paid', '2014-01-24 07:19:44', 'INSERT'),
(7, 7, 'vndfjinvo', 'Pharmacy', '0', 6755342, '', 'not paid', '2014-01-24 07:20:31', 'INSERT'),
(8, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'not paid', '2014-01-27 00:34:56', 'INSERT'),
(9, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'not paid', '2014-01-27 11:08:54', 'BEFORE_UPDATE'),
(10, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'paid', '2014-01-27 11:08:54', 'AFTER_UPDATE'),
(11, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'paid', '2014-01-27 11:09:38', 'BEFORE_UPDATE'),
(12, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'paid', '2014-01-27 11:09:38', 'AFTER_UPDATE'),
(13, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'paid', '2014-01-27 11:11:26', 'BEFORE_UPDATE'),
(14, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'paid', '2014-01-27 11:11:26', 'AFTER_UPDATE'),
(15, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'paid', '2014-01-27 11:11:27', 'BEFORE_UPDATE'),
(16, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'paid', '2014-01-27 11:11:27', 'AFTER_UPDATE'),
(17, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'paid', '2014-01-27 11:11:32', 'BEFORE_UPDATE'),
(18, 8, 'Dindi', 'Pharmacy', '0', 2147483647, '', 'paid', '2014-01-27 11:11:32', 'AFTER_UPDATE'),
(19, 9, 'nefioudsnvc', 'Pharmacy', '0', 712334568, '', 'not paid', '2014-01-27 11:49:58', 'INSERT'),
(20, 10, 'ndfivno', 'Laboratory', '0', 98305482, '', 'not paid', '2014-01-27 12:21:07', 'INSERT'),
(21, 11, 'nvbdinveurifnsv', 'Radiology', '0', 84539342, '', 'not paid', '2014-01-27 12:21:55', 'INSERT'),
(22, 10, 'ndfivno', 'Laboratory', '0', 98305482, '', 'not paid', '2014-01-28 02:12:32', 'BEFORE_UPDATE'),
(23, 10, 'ndfivno', 'Laboratory', '0', 98305482, '', 'not paid', '2014-01-28 02:12:32', 'AFTER_UPDATE'),
(24, 10, 'ndfivno', 'Laboratory', '0', 98305482, '', 'not paid', '2014-01-28 02:12:35', 'BEFORE_UPDATE'),
(25, 10, 'ndfivno', 'Laboratory', '0', 98305482, '', 'not paid', '2014-01-28 02:12:35', 'AFTER_UPDATE'),
(26, 11, 'nvbdinveurifnsv', 'Radiology', '0', 84539342, '', 'not paid', '2014-01-28 02:12:48', 'BEFORE_UPDATE'),
(27, 11, 'nvbdinveurifnsv', 'Radiology', '0', 84539342, '', 'not paid', '2014-01-28 02:12:48', 'AFTER_UPDATE'),
(28, 11, 'nvbdinveurifnsv', 'Radiology', '0', 84539342, '', 'not paid', '2014-01-28 02:12:50', 'BEFORE_UPDATE'),
(29, 11, 'nvbdinveurifnsv', 'Radiology', '0', 84539342, '', 'not paid', '2014-01-28 02:12:50', 'AFTER_UPDATE'),
(30, 12, 'djvdfjn', 'Laboratory', '0', 6543212, '', 'not paid', '2014-01-28 02:56:55', 'INSERT'),
(31, 13, 'ngdiungv', 'Laboratory', '0', 6553431, '', 'not paid', '2014-01-28 03:11:35', 'INSERT'),
(34, 10, 'ndfivno', 'Laboratory', '0', 98305482, '', 'not paid', '2014-01-28 05:46:41', 'BEFORE_UPDATE'),
(35, 10, 'ndfivno', 'Laboratory', '0', 98305482, '', 'paid', '2014-01-28 05:46:41', 'AFTER_UPDATE'),
(36, 14, 'gdfegvsaq', 'Radiology', '0', 9438563, '', 'not paid', '2014-01-28 07:41:37', 'INSERT'),
(37, 15, 'vdniovnf', 'Pharmacy', '0', 2147483647, '', 'not paid', '2014-01-29 06:42:44', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `family_number` varchar(255) NOT NULL,
  `visit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nurse_id` int(11) NOT NULL,
  `nurse_queue` enum('active','in-active') NOT NULL,
  `nurse_start` time NOT NULL,
  `nurse_end` time NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `doctor_queue` enum('active','in-acitve') NOT NULL,
  `doctor_start` time NOT NULL,
  `doctor_end` time NOT NULL,
  `lab_id` int(11) NOT NULL,
  `lab_queue` enum('active','in-active') NOT NULL,
  `lab_start` time NOT NULL,
  `lab_end` time NOT NULL,
  `pharm_id` int(11) NOT NULL,
  `pharm_queue` enum('active','in-active') NOT NULL,
  `pharm_start` time NOT NULL,
  `pharm_end` time NOT NULL,
  `rad_id` int(11) NOT NULL,
  `rad_queue` enum('active','in-active') NOT NULL,
  `rad_start` time NOT NULL,
  `rad_end` time NOT NULL,
  `urgency` varchar(255) NOT NULL,
  `results` text NOT NULL,
  `day` varchar(255) NOT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `patient_id` (`patient_id`),
  KEY `patient_id_2` (`patient_id`),
  KEY `nurse_id` (`nurse_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `lab_id` (`lab_id`),
  KEY `pharm_id` (`pharm_id`),
  KEY `rad_id` (`rad_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`visit_id`, `patient_id`, `family_number`, `visit_date`, `nurse_id`, `nurse_queue`, `nurse_start`, `nurse_end`, `doctor_id`, `doctor_queue`, `doctor_start`, `doctor_end`, `lab_id`, `lab_queue`, `lab_start`, `lab_end`, `pharm_id`, `pharm_queue`, `pharm_start`, `pharm_end`, `rad_id`, `rad_queue`, `rad_start`, `rad_end`, `urgency`, `results`, `day`) VALUES
(10, 21, 'SHWARI_1000002_1', '2014-01-20 03:31:04', 7, 'in-active', '00:00:00', '06:31:04', 10, 'active', '06:31:04', '00:00:00', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, '', '00:00:00', '00:00:00', 'urgent', '', ''),
(11, 22, 'SHWARI_1000002_2', '2014-01-07 13:56:20', 7, 'active', '00:00:00', '11:05:30', 8, '', '11:05:30', '16:56:20', 11, 'active', '00:00:00', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '16:56:20', '00:00:00', '', '', ''),
(12, 23, 'SHWARI_1000002_3', '2014-01-21 14:03:10', 7, 'in-active', '00:00:00', '09:25:38', 8, '', '09:25:38', '17:03:10', 11, 'active', '17:03:10', '00:00:00', 10, 'active', '00:00:00', '00:00:00', 0, 'active', '04:38:26', '00:00:00', 'urgent', '', ''),
(14, 2, '', '2014-01-07 14:43:32', 0, 'in-active', '15:07:15', '15:36:58', 8, 'active', '17:43:32', '17:25:08', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'in-active', '17:25:08', '17:43:32', 'urgent', 'Radiology results ready', ''),
(15, 2, '', '2014-01-07 12:11:07', 0, 'active', '15:11:07', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', ''),
(16, 2, '', '2014-01-07 12:15:22', 0, 'active', '15:15:22', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', ''),
(17, 2, 'SHWARI_1000001_001', '2014-01-07 12:29:48', 0, 'active', '15:29:48', '00:00:00', 0, '', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', ''),
(18, 2, 'SHWARI_1000001_001', '2014-01-08 01:19:29', 0, 'active', '04:19:29', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', ''),
(19, 2, 'SHWARI_1000001_001', '2014-01-08 01:22:06', 0, 'active', '04:22:06', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', ''),
(20, 6, 'SHWARI_1000002_005', '2014-01-08 01:41:41', 0, 'active', '04:41:41', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', ''),
(21, 3, 'SHWARI_1000002_002', '2014-01-09 01:49:29', 0, 'active', '04:49:29', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '00:00:00', '00:00:00', '', '', ''),
(22, 8, 'SHWARI_1000001_013', '2014-01-09 10:21:27', 0, 'in-active', '04:53:02', '05:07:55', 8, '', '05:07:55', '06:19:07', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '06:19:07', '11:37:38', 0, 'in-active', '00:00:00', '00:00:00', '', '', ''),
(23, 3, 'SHWARI_1000002_002', '2014-01-17 09:03:45', 0, 'active', '12:03:45', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', ''),
(24, 2, 'SHWARI_1000001_001', '2014-01-20 10:27:46', 0, 'active', '13:27:46', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', ''),
(25, 25, 'SHWARI_1000007_0', '2014-01-20 10:51:45', 0, 'active', '13:51:45', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', ''),
(26, 11, 'SHWARI3_0', '2014-01-20 10:53:56', 0, 'active', '13:53:56', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', ''),
(27, 7, 'SHWARI_1000001_012', '2014-01-21 08:12:25', 0, 'active', '11:12:25', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', ''),
(28, 10, '1_0', '2014-01-22 08:13:40', 0, 'active', '11:13:40', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', ''),
(29, 7, 'SHWARI_1000001_012', '2014-01-23 06:46:29', 0, 'in-active', '09:45:09', '09:46:29', 8, 'active', '09:46:29', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', ''),
(30, 5, 'SHWARI_1000002_004', '2014-01-23 12:00:08', 0, 'in-active', '13:30:27', '14:36:13', 8, '', '14:36:13', '15:00:08', 0, 'active', '15:00:08', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 'urgent', '', ''),
(31, 19, 'SHWARI_1000004_000', '2014-01-23 11:58:17', 0, 'in-active', '14:55:01', '14:56:54', 8, '', '14:56:54', '14:58:17', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'active', '14:58:17', '00:00:00', 'urgent', '', ''),
(32, 5, 'SHWARI_1000002_004', '2014-01-24 06:58:40', 0, 'active', '09:58:40', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', ''),
(33, 3, 'SHWARI_1000002_002', '2014-01-30 20:21:32', 0, 'in-active', '09:42:25', '10:52:46', 8, '', '16:46:10', '23:21:32', 0, 'in-active', '11:13:21', '14:57:54', 0, 'active', '23:21:32', '00:00:00', 0, 'in-active', '15:19:51', '16:46:10', '0', 'Radiology results ready', ''),
(34, 3, 'SHWARI_1000002_002', '2014-01-30 12:54:17', 0, 'active', '15:54:17', '00:00:00', 0, 'in-acitve', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', 0, 'in-active', '00:00:00', '00:00:00', '', '', '');

--
-- Triggers `visit`
--
DROP TRIGGER IF EXISTS `after_insert_visit`;
DELIMITER //
CREATE TRIGGER `after_insert_visit` AFTER INSERT ON `visit`
 FOR EACH ROW INSERT INTO trigger_visit_update (visit_id, patient_id, family_number,visit_date,nurse_id,nurse_queue,nurse_start,nurse_end,doctor_id,doctor_queue,doctor_start,doctor_end,lab_id,lab_queue,lab_start,lab_end,pharm_id,pharm_queue,pharm_start,pharm_end,rad_id,rad_queue,rad_start,rad_end,urgency,results,day,changetype)  
        VALUES (NEW.visit_id,NEW.patient_id,NEW.family_number,NEW.visit_date,NEW.nurse_id,NEW.nurse_queue,NEW.nurse_start,NEW.nurse_end,NEW.doctor_id,NEW.doctor_queue,NEW.doctor_start,NEW.doctor_end,NEW.lab_id,NEW.lab_queue,NEW.lab_start,NEW.lab_end,NEW.pharm_id,NEW.pharm_queue,NEW.pharm_start,NEW.pharm_end,NEW.rad_id,NEW.rad_queue,NEW.rad_start,NEW.rad_end,NEW.urgency,NEW.results,NEW.day,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_visit`;
DELIMITER //
CREATE TRIGGER `after_update_visit` AFTER UPDATE ON `visit`
 FOR EACH ROW INSERT INTO trigger_visit_update (visit_id, patient_id, family_number,visit_date,nurse_id,nurse_queue,nurse_start,nurse_end,doctor_id,doctor_queue,doctor_start,doctor_end,lab_id,lab_queue,lab_start,lab_end,pharm_id,pharm_queue,pharm_start,pharm_end,rad_id,rad_queue,rad_start,rad_end,urgency,results,day,changetype)  
        VALUES (NEW.visit_id,NEW.patient_id,NEW.family_number,NEW.visit_date,NEW.nurse_id,NEW.nurse_queue,NEW.nurse_start,NEW.nurse_end,NEW.doctor_id,NEW.doctor_queue,NEW.doctor_start,NEW.doctor_end,NEW.lab_id,NEW.lab_queue,NEW.lab_start,NEW.lab_end,NEW.pharm_id,NEW.pharm_queue,NEW.pharm_start,NEW.pharm_end,NEW.rad_id,NEW.rad_queue,NEW.rad_start,NEW.rad_end,NEW.urgency,NEW.results,NEW.day,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_visit`;
DELIMITER //
CREATE TRIGGER `before_update_visit` BEFORE UPDATE ON `visit`
 FOR EACH ROW INSERT INTO trigger_visit_update (visit_id, patient_id, family_number,visit_date,nurse_id,nurse_queue,nurse_start,nurse_end,doctor_id,doctor_queue,doctor_start,doctor_end,lab_id,lab_queue,lab_start,lab_end,pharm_id,pharm_queue,pharm_start,pharm_end,rad_id,rad_queue,rad_start,rad_end,urgency,results,day,changetype)  
        VALUES (OLD.visit_id,OLD.patient_id,OLD.family_number
        ,OLD.visit_date,OLD.nurse_id,OLD.nurse_queue,OLD.nurse_start
        ,OLD.nurse_end,OLD.doctor_id,OLD.doctor_queue,OLD.doctor_start,
        OLD.doctor_end,OLD.lab_id,OLD.lab_queue,OLD.lab_start,OLD.lab_end,
        OLD.pharm_id,OLD.pharm_queue,OLD.pharm_start,OLD.pharm_end,OLD.rad_id,
        OLD.rad_queue,OLD.rad_start,OLD.rad_end,OLD.urgency,OLD.results,OLD.day,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `walkin`
--

CREATE TABLE `walkin` (
  `walkin_id` int(11) NOT NULL AUTO_INCREMENT,
  `walkin_patient_name` varchar(255) NOT NULL,
  `walkin_department` varchar(255) NOT NULL,
  `walkin_check` enum('0','1') NOT NULL,
  `walkin_phone_no` int(11) NOT NULL,
  `walkin_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid` enum('not paid','paid') NOT NULL,
  PRIMARY KEY (`walkin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `walkin`
--

INSERT INTO `walkin` (`walkin_id`, `walkin_patient_name`, `walkin_department`, `walkin_check`, `walkin_phone_no`, `walkin_date`, `paid`) VALUES
(1, 'dnviudfnbiu', 'Pharmacy', '0', 0, '2014-01-06 12:35:11', 'not paid'),
(2, 'Dindi', 'Pharmacy', '0', 94854543, '2014-01-24 06:40:22', 'not paid'),
(3, 'phylis Sheerow', 'Pharmacy', '0', 712345678, '2014-01-24 06:52:47', 'not paid'),
(4, 'dfjnivdfjnsi', 'Pharmacy', '0', 765654342, '2014-01-24 07:16:20', 'not paid'),
(5, 'jndvxifdno', 'Pharmacy', '0', 2147483647, '2014-01-24 07:18:32', 'not paid'),
(6, 'vndiugvndfiu', 'Lab Tech', '0', 5439801, '2014-01-24 07:19:44', 'not paid'),
(7, 'vndfjinvo', 'Pharmacy', '0', 6755342, '2014-01-24 07:20:31', 'not paid'),
(8, 'Dindi', 'Pharmacy', '0', 2147483647, '2014-01-27 00:34:56', 'paid'),
(9, 'nefioudsnvc', 'Pharmacy', '0', 712334568, '2014-01-27 11:49:58', 'not paid'),
(10, 'ndfivno', 'Laboratory', '0', 98305482, '2014-01-28 12:21:07', 'paid'),
(11, 'nvbdinveurifnsv', 'Radiology', '0', 84539342, '2014-01-28 12:21:55', 'not paid'),
(12, 'djvdfjn', 'Laboratory', '0', 6543212, '2014-01-28 02:56:55', 'not paid'),
(13, 'ngdiungv', 'Laboratory', '0', 6553431, '2014-01-28 03:11:35', 'not paid'),
(14, 'gdfegvsaq', 'Radiology', '0', 9438563, '2014-01-28 07:41:37', 'not paid'),
(15, 'vdniovnf', 'Pharmacy', '0', 2147483647, '2014-01-29 06:42:44', 'not paid');

--
-- Triggers `walkin`
--
DROP TRIGGER IF EXISTS `after_insert_walkin`;
DELIMITER //
CREATE TRIGGER `after_insert_walkin` AFTER INSERT ON `walkin`
 FOR EACH ROW INSERT INTO trigger_walkin_update (walkin_id, walkin_patient_name,walkin_department,walkin_check,walkin_phone_no,paid,changetype)  
        VALUES (NEW.walkin_id,NEW.walkin_patient_name,NEW.walkin_department,NEW.walkin_check,NEW.walkin_phone_no,NEW.paid,'INSERT')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_walkin`;
DELIMITER //
CREATE TRIGGER `after_update_walkin` AFTER UPDATE ON `walkin`
 FOR EACH ROW INSERT INTO trigger_walkin_update (walkin_id, walkin_patient_name, walkin_department,walkin_check,walkin_phone_no,paid,changetype)  
       VALUES (NEW.walkin_id,NEW.walkin_patient_name,NEW.walkin_department,NEW.walkin_check,NEW.walkin_phone_no,NEW.paid,'AFTER_UPDATE')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_walkin`;
DELIMITER //
CREATE TRIGGER `before_update_walkin` BEFORE UPDATE ON `walkin`
 FOR EACH ROW INSERT INTO trigger_walkin_update (walkin_id, walkin_patient_name, walkin_department,walkin_check,walkin_phone_no,paid,changetype)  
       VALUES (OLD.walkin_id,OLD.walkin_patient_name,OLD.walkin_department,OLD.walkin_check,OLD.walkin_phone_no,OLD.paid,'BEFORE_UPDATE')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `walkin_lab`
--

CREATE TABLE `walkin_lab` (
  `walkin_lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `lab_tech_id` int(11) NOT NULL,
  `rad_tech_id` int(11) NOT NULL,
  `walkin_lab_test` varchar(255) NOT NULL,
  `walkin_lab_results` varchar(500) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `walkin_lab_check` enum('0','1') NOT NULL,
  `walkin_lab_paid` enum('No','Yes') NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`walkin_lab_id`),
  KEY `patient_id` (`patient_id`),
  KEY `lab_tech_id` (`lab_tech_id`),
  KEY `payment_id` (`payment_id`),
  KEY `patient_id_2` (`patient_id`),
  KEY `lab_tech_id_2` (`lab_tech_id`),
  KEY `payment_id_2` (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `walkin_lab`
--

INSERT INTO `walkin_lab` (`walkin_lab_id`, `patient_id`, `lab_tech_id`, `rad_tech_id`, `walkin_lab_test`, `walkin_lab_results`, `payment_id`, `walkin_lab_check`, `walkin_lab_paid`, `date_added`) VALUES
(1, 10, 11, 0, 'Malaria Test', '', '1', '0', 'Yes', '2014-01-28 05:46:41'),
(2, 12, 11, 0, 'Malaria Test', '', '1', '0', 'Yes', '2014-01-28 03:08:28'),
(3, 12, 11, 0, 'X-Ray', '', '1', '0', 'Yes', '2014-01-28 03:08:28'),
(4, 13, 11, 0, 'CT-Scan', '', '1', '0', 'Yes', '2014-01-28 05:38:00'),
(5, 13, 11, 0, 'Mammogram', '', '1', '0', 'Yes', '2014-01-28 05:38:00');

-- --------------------------------------------------------

--
-- Table structure for table `walkin_labs`
--

CREATE TABLE `walkin_labs` (
  `walkin_lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `lab_tech_id` int(11) NOT NULL,
  `walkin_lab_test` varchar(255) NOT NULL,
  `walkin_lab_results` varchar(500) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `walkin_lab_check` enum('1','0') NOT NULL,
  `walkin_lab_paid` enum('No','Yes') NOT NULL,
  PRIMARY KEY (`walkin_lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `walkin_patient_visit_statement`
--

CREATE TABLE `walkin_patient_visit_statement` (
  `walkin_patient_visit_statement_id` int(11) NOT NULL AUTO_INCREMENT,
  `walkin_patient_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `quantity` decimal(13,2) NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `charged` enum('No','Yes') NOT NULL,
  `department` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `walkin_patient_payment_id` int(11) NOT NULL,
  `revenue_type` enum('Radiology','Laboratory','Pharmacy') NOT NULL,
  `payment_code` varchar(25) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  PRIMARY KEY (`walkin_patient_visit_statement_id`),
  KEY `walkin_patient_id` (`walkin_patient_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `walkin_patient_visit_statement`
--

INSERT INTO `walkin_patient_visit_statement` (`walkin_patient_visit_statement_id`, `walkin_patient_id`, `description`, `quantity`, `amount`, `charged`, `department`, `user_id`, `date_added`, `walkin_patient_payment_id`, `revenue_type`, `payment_code`, `payment_method`) VALUES
(5, 8, 'Betapyn', 12.00, 12.00, 'Yes', 'Pharmacy', 10, '2014-01-27 11:11:26', 0, 'Pharmacy', '', 'Select Payment Means'),
(6, 8, 'Betapyn', 12.00, 12.00, 'Yes', 'Pharmacy', 10, '2014-01-27 11:11:26', 0, 'Pharmacy', '', 'Select Payment Means'),
(7, 12, 'X-Ray', 0.00, 350.00, 'No', 'Laboratory', 11, '2014-01-28 03:08:28', 0, 'Laboratory', '', ''),
(8, 13, 'Mammogram', 0.00, 750.00, 'No', 'Laboratory', 11, '2014-01-28 05:38:00', 0, 'Laboratory', '', ''),
(9, 14, 'Mammogram', 0.00, 750.00, 'No', 'Radiology', 14, '2014-01-28 08:29:54', 0, 'Radiology', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `walkin_payment`
--

CREATE TABLE `walkin_payment` (
  `walkin_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `faculty` enum('Pharmacy','Lab Tech') NOT NULL,
  `total` int(11) NOT NULL,
  `cash` int(11) NOT NULL,
  `cpay` int(11) NOT NULL,
  `mpesa` varchar(255) NOT NULL,
  `payment_id` enum('0','1') NOT NULL,
  `paid` enum('no','yes') NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`walkin_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `walkin_payments`
--

CREATE TABLE `walkin_payments` (
  `walkin_payments_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `faculty` enum('Pharmacy','Laboratory','Radiology') NOT NULL,
  `walkin_payments_total` int(11) NOT NULL,
  `walkin_payments_cash` int(11) NOT NULL,
  `walkin_payments_cpay` int(11) NOT NULL,
  `walkin_payments_mpesa` varchar(255) NOT NULL,
  `payment_id` enum('1','0') NOT NULL,
  `walkin_payments_paid` enum('no','yes') NOT NULL,
  PRIMARY KEY (`walkin_payments_id`),
  KEY `patient_id` (`patient_id`),
  KEY `payment_id` (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `walkin_payments`
--

INSERT INTO `walkin_payments` (`walkin_payments_id`, `patient_id`, `faculty`, `walkin_payments_total`, `walkin_payments_cash`, `walkin_payments_cpay`, `walkin_payments_mpesa`, `payment_id`, `walkin_payments_paid`) VALUES
(1, 8, 'Pharmacy', 1250, 0, 0, '', '1', 'no'),
(2, 8, 'Pharmacy', 1250, 0, 0, '', '1', 'no'),
(3, 10, 'Laboratory', 150, 0, 0, '', '1', 'yes'),
(4, 12, 'Laboratory', 500, 0, 0, '', '1', 'no'),
(7, 13, 'Laboratory', 1250, 0, 0, '', '1', 'no'),
(8, 14, 'Radiology', 1100, 0, 0, '', '1', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `walkin_pharm`
--

CREATE TABLE `walkin_pharm` (
  `walkin_pharm_id` int(11) NOT NULL AUTO_INCREMENT,
  `administered_status` enum('not dispensed','dispensed') NOT NULL,
  `pharm_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `remarks` varchar(660) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `paid` enum('no','yes') NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`walkin_pharm_id`),
  KEY `patient_id` (`patient_id`),
  KEY `pharm_id` (`pharm_id`),
  KEY `commodity_name` (`commodity_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `walkin_pharm`
--

INSERT INTO `walkin_pharm` (`walkin_pharm_id`, `administered_status`, `pharm_id`, `patient_id`, `commodity_name`, `dosage`, `duration`, `amount`, `remarks`, `payment_id`, `paid`, `date`) VALUES
(1, 'not dispensed', 8, 5, 'Betapyn', 'fvoidfmnio', 12, 12, 'fdmvpovfm', '', '', '2014-01-24 08:03:28'),
(2, 'not dispensed', 10, 3, 'Betapyn', '1234', 12, 12, 'ndfiovxncdsoic', '0', 'no', '2014-01-24 08:50:37'),
(3, 'not dispensed', 10, 3, 'Betapyn', '123', 12, 12, 'msfoivcfdnmsim', '', 'no', '2014-01-24 09:01:10'),
(4, 'not dispensed', 10, 3, 'Betapyn', '123', 12, 15, 'dfnvodnsdcdiosan', '', 'no', '2014-01-24 09:18:02'),
(5, 'not dispensed', 10, 3, 'Betapyn', '12', 12, 12, 'dngomsfnoi', '', 'no', '2014-01-24 09:22:37'),
(6, 'not dispensed', 10, 3, 'Betapyn', '12', 12, 12, 'dngomsfnoi', '', 'no', '2014-01-24 09:22:54'),
(7, 'not dispensed', 10, 3, 'Betapyn', '12', 13, 12, 'dfnvoidnfoiv', '', 'no', '2014-01-24 09:23:51'),
(11, 'not dispensed', 10, 3, 'Betapyn', '12', 12, 12, 'klmbnokdnvdfo', '', 'no', '2014-01-24 09:32:27'),
(12, 'not dispensed', 10, 3, 'Betapyn', '12', 12, 12, '12', '', 'no', '2014-01-24 09:33:43'),
(13, 'not dispensed', 10, 3, 'Betapyn', '12', 12, 12, '12', '', 'no', '2014-01-24 09:35:22'),
(14, 'not dispensed', 10, 3, 'Betapyn', '12', 14, 12, 'fdnvoidfv', '', 'no', '2014-01-24 09:36:32'),
(15, 'not dispensed', 10, 3, 'Betapyn', '12', 12, 12, 'efsncidfs', '', 'no', '2014-01-24 09:37:15'),
(16, 'not dispensed', 10, 8, 'Betapyn', '12', 12, 13, 'To be taken with water only ', '1', 'yes', '2014-01-27 01:10:40'),
(17, 'not dispensed', 10, 8, 'Betapyn', '12', 13, 13, 'To be taken with water only !', '1', 'yes', '2014-01-27 01:10:45'),
(23, 'not dispensed', 10, 8, 'Betapyn', '12', 12, 12, 'dfomnviodfnciovndsmoifvdf', '1', 'yes', '2014-01-27 01:18:46'),
(24, 'not dispensed', 10, 8, 'Betapyn', '12', 12, 12, 'No it is wrong! :', '1', 'yes', '2014-01-27 01:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `walkin_rad`
--

CREATE TABLE `walkin_rad` (
  `walkin_rad_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `rad_tech_id` int(11) NOT NULL,
  `walkin_rad_test` varchar(255) NOT NULL,
  `walkin_rad_results` text NOT NULL,
  `payment_id` enum('0','1') NOT NULL,
  `walkin_rad_check` enum('0','1') NOT NULL,
  `walkin_rad_paid` enum('No','Yes') NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`walkin_rad_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `walkin_rad`
--

INSERT INTO `walkin_rad` (`walkin_rad_id`, `patient_id`, `rad_tech_id`, `walkin_rad_test`, `walkin_rad_results`, `payment_id`, `walkin_rad_check`, `walkin_rad_paid`, `date_added`) VALUES
(1, 14, 14, 'X-Ray', '', '1', '0', 'No', '2014-01-28 08:55:52'),
(2, 14, 14, 'Mammogram', '', '1', '0', 'No', '2014-01-28 08:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `walkin_total_patient`
--

CREATE TABLE `walkin_total_patient` (
  `walkin_total_patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `walkin_patient_id` int(11) NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `paid` enum('No','Yes') NOT NULL,
  `revenue_type` enum('Pharmacy','Radiology','Laboratory') NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`walkin_total_patient_id`),
  KEY `walkin_patient_id` (`walkin_patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `commodity`
--
ALTER TABLE `commodity`
  ADD CONSTRAINT `commodity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `commodity_movement_bin_card`
--
ALTER TABLE `commodity_movement_bin_card`
  ADD CONSTRAINT `commodity_movement_bin_card_ibfk_1` FOREIGN KEY (`commodity_name`) REFERENCES `commodity` (`commodity_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `commodity_movement_bin_card_ibfk_2` FOREIGN KEY (`issuing_officer`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `consultation_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `member_branch` (`branch_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`employment_category`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `employee_profileimage`
--
ALTER TABLE `employee_profileimage`
  ADD CONSTRAINT `employee_profileimage_ibfk_1` FOREIGN KEY (`employee_profileimage_employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `lab_test_result`
--
ALTER TABLE `lab_test_result`
  ADD CONSTRAINT `lab_test_result_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `lab_test_result_ibfk_2` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `lab_test_result_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `lab_test_result_ibfk_4` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD CONSTRAINT `login_logs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `member_branch`
--
ALTER TABLE `member_branch`
  ADD CONSTRAINT `member_branch_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `patient_payments`
--
ALTER TABLE `patient_payments`
  ADD CONSTRAINT `patient_payments_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_payments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_payments_ibfk_3` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `patient_visit_statement`
--
ALTER TABLE `patient_visit_statement`
  ADD CONSTRAINT `patient_visit_statement_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_visit_statement_ibfk_2` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_visit_statement_ibfk_3` FOREIGN KEY (`patient_payment_id`) REFERENCES `patient_payments` (`patient_payment_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_visit_statement_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_ibfk_5` FOREIGN KEY (`commodity_name`) REFERENCES `commodity` (`commodity_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_ibfk_6` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `rad_test_results`
--
ALTER TABLE `rad_test_results`
  ADD CONSTRAINT `rad_test_results_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `consultation` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rad_test_results_ibfk_2` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `referral`
--
ALTER TABLE `referral`
  ADD CONSTRAINT `referral_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `referral_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`commodity_name`) REFERENCES `commodity` (`commodity_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_4` FOREIGN KEY (`user_from`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`commodity_name`) REFERENCES `commodity` (`commodity_name`),
  ADD CONSTRAINT `stock_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stock_audit`
--
ALTER TABLE `stock_audit`
  ADD CONSTRAINT `stock_audit_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_audit_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`batch_no`) REFERENCES `stock` (`batch_no`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `triage`
--
ALTER TABLE `triage`
  ADD CONSTRAINT `triage_ibfk_3` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `triage_ibfk_4` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `triage_ibfk_5` FOREIGN KEY (`nurse_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `walkin_lab`
--
ALTER TABLE `walkin_lab`
  ADD CONSTRAINT `walkin_lab_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `walkin_lab_ibfk_2` FOREIGN KEY (`lab_tech_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `walkin_patient_visit_statement`
--
ALTER TABLE `walkin_patient_visit_statement`
  ADD CONSTRAINT `walkin_patient_visit_statement_ibfk_1` FOREIGN KEY (`walkin_patient_id`) REFERENCES `walkin` (`walkin_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `walkin_patient_visit_statement_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `walkin_pharm`
--
ALTER TABLE `walkin_pharm`
  ADD CONSTRAINT `walkin_pharm_ibfk_1` FOREIGN KEY (`pharm_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `walkin_pharm_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `walkin` (`walkin_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `walkin_pharm_ibfk_4` FOREIGN KEY (`commodity_name`) REFERENCES `commodity` (`commodity_name`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `walkin_total_patient`
--
ALTER TABLE `walkin_total_patient`
  ADD CONSTRAINT `walkin_total_patient_ibfk_1` FOREIGN KEY (`walkin_patient_id`) REFERENCES `walkin` (`walkin_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
