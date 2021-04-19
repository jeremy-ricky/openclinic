-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 19, 2021 at 12:40 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ocstats_dbo`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `adminview`
-- (See below for the actual view)
--
CREATE TABLE `adminview` (
`personid` int(10)
,`immatold` varchar(25)
,`immatnew` varchar(25)
,`candidate` varchar(25)
,`lastname` varchar(255)
,`firstname` varchar(255)
,`gender` varchar(1)
,`dateofbirth` datetime
,`comment` varchar(5000)
,`sourceid` varchar(1)
,`language` char(2)
,`engagement` datetime
,`pension` datetime
,`statute` varchar(1)
,`claimant` varchar(1)
,`searchname` varchar(255)
,`updatetime` datetime
,`claimant_expiration` datetime
,`native_country` varchar(2)
,`native_town` varchar(255)
,`motive_end_of_service` varchar(3)
,`startdate_inactivity` datetime
,`enddate_inactivity` datetime
,`code_inactivity` varchar(3)
,`update_status` varchar(1)
,`person_type` varchar(1)
,`situation_end_of_service` varchar(1)
,`updateuserid` int(10)
,`comment1` varchar(100)
,`comment2` varchar(100)
,`comment3` varchar(100)
,`comment4` varchar(3000)
,`comment5` varchar(100)
,`natreg` varchar(50)
,`middlename` varchar(255)
,`begindate` datetime
,`enddate` datetime
,`updateserverid` int(10)
,`archiveFileCode` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `dc_activityvalues`
--

CREATE TABLE `dc_activityvalues` (
  `DC_ACTIVITYVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_ACTIVITYVALUE_OBJECTID` int(11) DEFAULT NULL,
  `DC_ACTIVITYVALUE_TYPE` varchar(50) DEFAULT NULL,
  `DC_ACTIVITYVALUE_YEAR` int(11) DEFAULT NULL,
  `DC_ACTIVITYVALUE_MONTH` int(11) DEFAULT NULL,
  `DC_ACTIVITYVALUE_USERCOUNT` int(11) DEFAULT NULL,
  `DC_ACTIVITYVALUE_MEAN` float DEFAULT NULL,
  `DC_ACTIVITYVALUE_MEANDEVIATION` float DEFAULT NULL,
  `DC_ACTIVITYVALUE_MEDIAN` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_bedoccupancyvalues`
--

CREATE TABLE `dc_bedoccupancyvalues` (
  `DC_BEDOCCUPANCYVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_BEDOCCUPANCYVALUE_OBJECTID` int(11) DEFAULT NULL,
  `DC_BEDOCCUPANCYVALUE_SERVICEUID` varchar(50) DEFAULT NULL,
  `DC_BEDOCCUPANCYVALUE_DATE` datetime DEFAULT NULL,
  `DC_BEDOCCUPANCYVALUE_TOTALBEDS` int(11) DEFAULT NULL,
  `DC_BEDOCCUPANCYVALUE_OCCUPIEDBEDS` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_dhis2deathdiagnosisvalues`
--

CREATE TABLE `dc_dhis2deathdiagnosisvalues` (
  `DC_DIAGNOSISVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_OBJECTID` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_SERVICEUID` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_GENDER` varchar(5) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_AGE` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_CODETYPE` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_CODE` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_YEAR` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_MONTH` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_COUNT` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_DHIS2EXPORTDATETIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_dhis2diagnosisvalues`
--

CREATE TABLE `dc_dhis2diagnosisvalues` (
  `DC_DIAGNOSISVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_OBJECTID` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_SERVICEUID` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_ENCOUNTERTYPE` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_GENDER` varchar(5) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_AGE` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_CODETYPE` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_CODE` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_YEAR` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_MONTH` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_COUNT` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_DHIS2EXPORTDATETIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_diagnosisvalues`
--

CREATE TABLE `dc_diagnosisvalues` (
  `DC_DIAGNOSISVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_OBJECTID` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_CODETYPE` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_CODE` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_YEAR` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_MONTH` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_COUNT` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_encounterdiagnosisvalues`
--

CREATE TABLE `dc_encounterdiagnosisvalues` (
  `DC_DIAGNOSISVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_OBJECTID` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_CODETYPE` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_CODE` varchar(50) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_YEAR` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_MONTH` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_COUNT` int(11) DEFAULT NULL,
  `DC_DIAGNOSISVALUE_ENCOUNTERTYPE` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_financialvalues`
--

CREATE TABLE `dc_financialvalues` (
  `DC_FINANCIALVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_FINANCIALVALUE_OBJECTID` int(11) DEFAULT NULL,
  `DC_FINANCIALVALUE_PARAMETERID` varchar(50) DEFAULT NULL,
  `DC_FINANCIALVALUE_CLASS` varchar(50) DEFAULT NULL,
  `DC_FINANCIALVALUE_YEAR` int(11) DEFAULT NULL,
  `DC_FINANCIALVALUE_MONTH` int(11) DEFAULT NULL,
  `DC_FINANCIALVALUE_VALUE` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_hrvalues`
--

CREATE TABLE `dc_hrvalues` (
  `DC_HR_SERVERID` int(11) DEFAULT NULL,
  `DC_HR_OBJECTID` int(11) DEFAULT NULL,
  `DC_HR_GROUP` varchar(255) DEFAULT NULL,
  `DC_HR_YEAR` int(11) DEFAULT NULL,
  `DC_HR_MONTH` int(11) DEFAULT NULL,
  `DC_HR_COUNT` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_monitorparameters`
--

CREATE TABLE `dc_monitorparameters` (
  `DC_MONITORPARAMETER_SERVERUID` varchar(50) DEFAULT NULL,
  `DC_MONITORPARAMETER_UPDATETIME` datetime DEFAULT NULL,
  `DC_MONITORPARAMETER_PARAMETER` varchar(250) DEFAULT NULL,
  `DC_MONITORPARAMETER_VALUE` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_monitorservers`
--

CREATE TABLE `dc_monitorservers` (
  `DC_MONITORSERVER_SERVERID` int(11) DEFAULT NULL,
  `DC_MONITORSERVER_SERVERUID` varchar(50) DEFAULT NULL,
  `DC_MONITORSERVER_NAME` varchar(255) DEFAULT NULL,
  `DC_MONITORSERVER_COUNTRY` varchar(5) DEFAULT NULL,
  `DC_MONITORSERVER_CITY` varchar(255) DEFAULT NULL,
  `DC_MONITORSERVER_EMAIL` varchar(255) DEFAULT NULL,
  `DC_MONITORSERVER_CONTACT` varchar(255) DEFAULT NULL,
  `DC_MONITORSERVER_TYPE` varchar(50) DEFAULT NULL,
  `DC_MONITORSERVER_LEVEL` varchar(50) DEFAULT NULL,
  `DC_MONITORSERVER_BEDS` varchar(50) DEFAULT NULL,
  `DC_MONITORSERVER_UPDATETIME` datetime DEFAULT NULL,
  `DC_MONITORSERVER_LATITUDE` varchar(50) DEFAULT NULL,
  `DC_MONITORSERVER_LONGITUDE` varchar(50) DEFAULT NULL,
  `DC_MONITORSERVER_SOFTWAREVERSION` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_monitorvalues`
--

CREATE TABLE `dc_monitorvalues` (
  `DC_MONITORVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_MONITORVALUE_DATE` datetime DEFAULT NULL,
  `DC_MONITORVALUE_PATIENTCOUNT` int(11) DEFAULT NULL,
  `DC_MONITORVALUE_VISITCOUNT` int(11) DEFAULT NULL,
  `DC_MONITORVALUE_ADMISSIONCOUNT` int(11) DEFAULT NULL,
  `DC_MONITORVALUE_TRANSACTIONCOUNT` int(11) DEFAULT NULL,
  `DC_MONITORVALUE_LABANALYSESCOUNT` int(11) DEFAULT NULL,
  `DC_MONITORVALUE_PATIENTINVOICECOUNT` int(11) DEFAULT NULL,
  `DC_MONITORVALUE_DEBETCOUNT` int(11) DEFAULT NULL,
  `DC_MONITORVALUE_UPDATETIME` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_mortalityvalues`
--

CREATE TABLE `dc_mortalityvalues` (
  `DC_MORTALITYVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_MORTALITYVALUE_OBJECTID` int(11) DEFAULT NULL,
  `DC_MORTALITYVALUE_CODETYPE` varchar(50) DEFAULT NULL,
  `DC_MORTALITYVALUE_CODE` varchar(50) DEFAULT NULL,
  `DC_MORTALITYVALUE_YEAR` int(11) DEFAULT NULL,
  `DC_MORTALITYVALUE_MONTH` int(11) DEFAULT NULL,
  `DC_MORTALITYVALUE_COUNT` int(11) DEFAULT NULL,
  `DC_MORTALITYVALUE_DIAGNOSISCOUNT` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_patientrecords`
--

CREATE TABLE `dc_patientrecords` (
  `DC_PATIENTRECORD_SERVERID` int(11) DEFAULT NULL,
  `DC_PATIENTRECORD_PERSONID` int(11) DEFAULT NULL,
  `DC_PATIENTRECORD_FIRSTNAME` varchar(255) DEFAULT NULL,
  `DC_PATIENTRECORD_LASTNAME` varchar(255) DEFAULT NULL,
  `DC_PATIENTRECORD_GENDER` varchar(50) DEFAULT NULL,
  `DC_PATIENTRECORD_DATEOFBIRTH` varchar(50) DEFAULT NULL,
  `DC_PATIENTRECORD_ARCHIVEFILE` varchar(50) DEFAULT NULL,
  `DC_PATIENTRECORD_PROCESSED` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_simplevalues`
--

CREATE TABLE `dc_simplevalues` (
  `DC_SIMPLEVALUE_SERVERID` int(11) DEFAULT NULL,
  `DC_SIMPLEVALUE_OBJECTID` int(11) DEFAULT NULL,
  `DC_SIMPLEVALUE_PARAMETERID` varchar(50) DEFAULT NULL,
  `DC_SIMPLEVALUE_CREATEDATETIME` datetime DEFAULT NULL,
  `DC_SIMPLEVALUE_SENTDATETIME` datetime DEFAULT NULL,
  `DC_SIMPLEVALUE_RECEIVEDATETIME` datetime DEFAULT NULL,
  `DC_SIMPLEVALUE_IMPORTDATETIME` datetime DEFAULT NULL,
  `DC_SIMPLEVALUE_DATA` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_unknowndiagnoses`
--

CREATE TABLE `dc_unknowndiagnoses` (
  `DC_UNKNOWNDIAGNOSIS_SERVERID` varchar(50) DEFAULT NULL,
  `DC_UNKNOWNDIAGNOSIS_DATASETUID` varchar(50) DEFAULT NULL,
  `DC_UNKNOWNDIAGNOSIS_CODE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dc_vaccinations`
--

CREATE TABLE `dc_vaccinations` (
  `DC_VACCINATION_SERVERUID` int(11) DEFAULT NULL,
  `DC_VACCINATION_PATIENTUID` int(11) DEFAULT NULL,
  `DC_VACCINATION_BIRTH` datetime DEFAULT NULL,
  `DC_VACCINATION_MODEL` varchar(50) DEFAULT NULL,
  `DC_VACCINATION_TYPE` varchar(50) DEFAULT NULL,
  `DC_VACCINATION_DATE` datetime DEFAULT NULL,
  `DC_VACCINATION_BATCHNUMBER` varchar(50) DEFAULT NULL,
  `DC_VACCINATION_EXPIRY` varchar(50) DEFAULT NULL,
  `DC_VACCINATION_LOCATION` varchar(50) DEFAULT NULL,
  `DC_VACCINATION_UPDATETIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ghb_messages`
--

CREATE TABLE `ghb_messages` (
  `GHB_MESSAGE_ID` int(11) DEFAULT NULL,
  `GHB_MESSAGE_SOURCESERVERID` int(11) DEFAULT NULL,
  `GHB_MESSAGE_SOURCEIP` varchar(20) DEFAULT NULL,
  `GHB_MESSAGE_TARGETSERVERID` int(11) DEFAULT NULL,
  `GHB_MESSAGE_TARGETIP` varchar(20) DEFAULT NULL,
  `GHB_MESSAGE_RECEIVEDDATETIME` datetime DEFAULT NULL,
  `GHB_MESSAGE_DELIVEREDDATETIME` datetime DEFAULT NULL,
  `GHB_MESSAGE_TOKEN` longblob DEFAULT NULL,
  `GHB_MESSAGE_DATA` longblob DEFAULT NULL,
  `GHB_MESSAGE_ERROR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ghb_servers`
--

CREATE TABLE `ghb_servers` (
  `GHB_SERVER_ID` int(11) DEFAULT NULL,
  `GHB_SERVER_DOMAIN` varchar(255) DEFAULT NULL,
  `GHB_SERVER_NAME` varchar(255) DEFAULT NULL,
  `GHB_SERVER_CONTACT` varchar(255) DEFAULT NULL,
  `GHB_SERVER_PHONE` varchar(50) DEFAULT NULL,
  `GHB_SERVER_EMAIL` varchar(255) DEFAULT NULL,
  `GHB_SERVER_PUBKEY` longblob DEFAULT NULL,
  `GHB_SERVER_UPDATETIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ghb_tokens`
--

CREATE TABLE `ghb_tokens` (
  `GHB_TOKEN` varchar(255) DEFAULT NULL,
  `GHB_TOKEN_COUNT` int(11) DEFAULT NULL,
  `GHB_TOKEN_DOMAIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ghb_tokens`
--

INSERT INTO `ghb_tokens` (`GHB_TOKEN`, `GHB_TOKEN_COUNT`, `GHB_TOKEN_DOMAIN`) VALUES
('Lowie4ever', 100, NULL),
('Test', 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_config`
--

CREATE TABLE `oc_config` (
  `OC_KEY` varchar(255) DEFAULT NULL,
  `OC_VALUE` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `updatestats1`
--

CREATE TABLE `updatestats1` (
  `OC_ENCOUNTERUID` varchar(50) DEFAULT NULL,
  `OC_PATIENTUID` varchar(50) DEFAULT NULL,
  `OC_BEGINDATE` datetime DEFAULT NULL,
  `OC_ENDDATE` datetime DEFAULT NULL,
  `OC_SERVICEUID` varchar(50) DEFAULT NULL,
  `OC_INSURAR` varchar(255) DEFAULT NULL,
  `OC_TYPE` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `updatestats2`
--

CREATE TABLE `updatestats2` (
  `OC_ENCOUNTER_SERVERID` int(11) DEFAULT NULL,
  `OC_ENCOUNTER_OBJECTID` int(11) DEFAULT NULL,
  `OC_ENCOUNTER_PATIENTUID` varchar(50) DEFAULT NULL,
  `OC_ENCOUNTER_BEGINDATE` datetime DEFAULT NULL,
  `OC_ENCOUNTER_ENDDATE` datetime DEFAULT NULL,
  `OC_ENCOUNTER_OUTCOME` varchar(50) DEFAULT NULL,
  `OC_ENCOUNTER_TYPE` varchar(50) DEFAULT NULL,
  `OC_ENCOUNTER_SERVICEUID` varchar(50) DEFAULT NULL,
  `OC_DIAGNOSIS_CODE` varchar(50) DEFAULT NULL,
  `OC_DIAGNOSIS_CODETYPE` varchar(50) DEFAULT NULL,
  `OC_DIAGNOSIS_GRAVITY` int(11) DEFAULT NULL,
  `OC_DIAGNOSIS_CERTAINTY` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `updatestats3`
--

CREATE TABLE `updatestats3` (
  `OC_ENCOUNTERUID` varchar(50) DEFAULT NULL,
  `OC_ENCOUNTERTYPE` varchar(50) DEFAULT NULL,
  `OC_INSURAR` varchar(255) DEFAULT NULL,
  `OC_DATE` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `updatestats4`
--

CREATE TABLE `updatestats4` (
  `OC_INSURAR` varchar(255) DEFAULT NULL,
  `OC_DEBETOBJECTID` int(11) DEFAULT NULL,
  `OC_PRESTATIONREFTYPE` varchar(50) DEFAULT NULL,
  `OC_PRESTATIONCODE` varchar(50) DEFAULT NULL,
  `OC_SERVICEUID` varchar(50) DEFAULT NULL,
  `OC_ENCOUNTERTYPE` varchar(50) DEFAULT NULL,
  `OC_ENCOUNTERUID` varchar(50) DEFAULT NULL,
  `OC_AMOUNT` float DEFAULT NULL,
  `OC_BEGINDATE` datetime DEFAULT NULL,
  `OC_ENDDATE` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `adminview`
--
DROP TABLE IF EXISTS `adminview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`openclinic`@`localhost` SQL SECURITY DEFINER VIEW `adminview`  AS  select `ocadmin_dbo`.`admin`.`personid` AS `personid`,`ocadmin_dbo`.`admin`.`immatold` AS `immatold`,`ocadmin_dbo`.`admin`.`immatnew` AS `immatnew`,`ocadmin_dbo`.`admin`.`candidate` AS `candidate`,`ocadmin_dbo`.`admin`.`lastname` AS `lastname`,`ocadmin_dbo`.`admin`.`firstname` AS `firstname`,`ocadmin_dbo`.`admin`.`gender` AS `gender`,`ocadmin_dbo`.`admin`.`dateofbirth` AS `dateofbirth`,`ocadmin_dbo`.`admin`.`comment` AS `comment`,`ocadmin_dbo`.`admin`.`sourceid` AS `sourceid`,`ocadmin_dbo`.`admin`.`language` AS `language`,`ocadmin_dbo`.`admin`.`engagement` AS `engagement`,`ocadmin_dbo`.`admin`.`pension` AS `pension`,`ocadmin_dbo`.`admin`.`statute` AS `statute`,`ocadmin_dbo`.`admin`.`claimant` AS `claimant`,`ocadmin_dbo`.`admin`.`searchname` AS `searchname`,`ocadmin_dbo`.`admin`.`updatetime` AS `updatetime`,`ocadmin_dbo`.`admin`.`claimant_expiration` AS `claimant_expiration`,`ocadmin_dbo`.`admin`.`native_country` AS `native_country`,`ocadmin_dbo`.`admin`.`native_town` AS `native_town`,`ocadmin_dbo`.`admin`.`motive_end_of_service` AS `motive_end_of_service`,`ocadmin_dbo`.`admin`.`startdate_inactivity` AS `startdate_inactivity`,`ocadmin_dbo`.`admin`.`enddate_inactivity` AS `enddate_inactivity`,`ocadmin_dbo`.`admin`.`code_inactivity` AS `code_inactivity`,`ocadmin_dbo`.`admin`.`update_status` AS `update_status`,`ocadmin_dbo`.`admin`.`person_type` AS `person_type`,`ocadmin_dbo`.`admin`.`situation_end_of_service` AS `situation_end_of_service`,`ocadmin_dbo`.`admin`.`updateuserid` AS `updateuserid`,`ocadmin_dbo`.`admin`.`comment1` AS `comment1`,`ocadmin_dbo`.`admin`.`comment2` AS `comment2`,`ocadmin_dbo`.`admin`.`comment3` AS `comment3`,`ocadmin_dbo`.`admin`.`comment4` AS `comment4`,`ocadmin_dbo`.`admin`.`comment5` AS `comment5`,`ocadmin_dbo`.`admin`.`natreg` AS `natreg`,`ocadmin_dbo`.`admin`.`middlename` AS `middlename`,`ocadmin_dbo`.`admin`.`begindate` AS `begindate`,`ocadmin_dbo`.`admin`.`enddate` AS `enddate`,`ocadmin_dbo`.`admin`.`updateserverid` AS `updateserverid`,`ocadmin_dbo`.`admin`.`archiveFileCode` AS `archiveFileCode` from `ocadmin_dbo`.`admin` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dc_activityvalues`
--
ALTER TABLE `dc_activityvalues`
  ADD KEY `DC_ACTIVITYVALUE_OBJECTID` (`DC_ACTIVITYVALUE_OBJECTID`),
  ADD KEY `DC_ACTIVITYVALUE_TYPE` (`DC_ACTIVITYVALUE_TYPE`),
  ADD KEY `DC_ACTIVITYVALUE_YEARMONTH` (`DC_ACTIVITYVALUE_YEAR`,`DC_ACTIVITYVALUE_MONTH`);

--
-- Indexes for table `dc_bedoccupancyvalues`
--
ALTER TABLE `dc_bedoccupancyvalues`
  ADD KEY `DC_BEDOCCUPANCYVALUE_OBJECTID` (`DC_BEDOCCUPANCYVALUE_OBJECTID`),
  ADD KEY `DC_BEDOCCUPANCYVALUE_SERVICEUID` (`DC_BEDOCCUPANCYVALUE_SERVICEUID`),
  ADD KEY `DC_BEDOCCUPANCYVALUE_DATE` (`DC_BEDOCCUPANCYVALUE_DATE`);

--
-- Indexes for table `dc_dhis2deathdiagnosisvalues`
--
ALTER TABLE `dc_dhis2deathdiagnosisvalues`
  ADD KEY `DC_DHIS2DIAGNOSISVALUE_OBJECTID` (`DC_DIAGNOSISVALUE_OBJECTID`),
  ADD KEY `DC_DHIS2DIAGNOSISVALUE_CODE` (`DC_DIAGNOSISVALUE_CODE`),
  ADD KEY `DC_DIAGNOSISVALUE_DHIS2EXPORTDATETIME` (`DC_DIAGNOSISVALUE_DHIS2EXPORTDATETIME`),
  ADD KEY `DC_DHIS2DIAGNOSISVALUE_YEARMONTH` (`DC_DIAGNOSISVALUE_YEAR`,`DC_DIAGNOSISVALUE_MONTH`);

--
-- Indexes for table `dc_dhis2diagnosisvalues`
--
ALTER TABLE `dc_dhis2diagnosisvalues`
  ADD KEY `DC_DHIS2DIAGNOSISVALUE_OBJECTID` (`DC_DIAGNOSISVALUE_OBJECTID`),
  ADD KEY `DC_DHIS2DIAGNOSISVALUE_CODE` (`DC_DIAGNOSISVALUE_CODE`),
  ADD KEY `DC_DIAGNOSISVALUE_DHIS2EXPORTDATETIME` (`DC_DIAGNOSISVALUE_DHIS2EXPORTDATETIME`),
  ADD KEY `DC_DHIS2DIAGNOSISVALUE_YEARMONTH` (`DC_DIAGNOSISVALUE_YEAR`,`DC_DIAGNOSISVALUE_MONTH`);

--
-- Indexes for table `dc_diagnosisvalues`
--
ALTER TABLE `dc_diagnosisvalues`
  ADD KEY `DC_DIAGNOSISVALUE_OBJECTID` (`DC_DIAGNOSISVALUE_OBJECTID`),
  ADD KEY `DC_DIAGNOSISVALUE_CODE` (`DC_DIAGNOSISVALUE_CODE`),
  ADD KEY `DC_DIAGNOSISVALUE_YEARMONTH` (`DC_DIAGNOSISVALUE_YEAR`,`DC_DIAGNOSISVALUE_MONTH`);

--
-- Indexes for table `dc_encounterdiagnosisvalues`
--
ALTER TABLE `dc_encounterdiagnosisvalues`
  ADD KEY `DC_DIAGNOSISVALUE_OBJECTID` (`DC_DIAGNOSISVALUE_OBJECTID`),
  ADD KEY `DC_DIAGNOSISVALUE_CODE` (`DC_DIAGNOSISVALUE_CODE`),
  ADD KEY `DC_DIAGNOSISVALUE_YEARMONTH` (`DC_DIAGNOSISVALUE_YEAR`,`DC_DIAGNOSISVALUE_MONTH`);

--
-- Indexes for table `dc_financialvalues`
--
ALTER TABLE `dc_financialvalues`
  ADD KEY `DC_FINANCIALVALUE_OBJECTID` (`DC_FINANCIALVALUE_OBJECTID`),
  ADD KEY `DC_FINANCIALVALUE_YEARMONTH` (`DC_FINANCIALVALUE_YEAR`,`DC_FINANCIALVALUE_MONTH`);

--
-- Indexes for table `dc_hrvalues`
--
ALTER TABLE `dc_hrvalues`
  ADD KEY `DC_HR_OBJECTID` (`DC_HR_OBJECTID`),
  ADD KEY `DC_HR_GROUP` (`DC_HR_GROUP`),
  ADD KEY `DC_HR_YEARMONTH` (`DC_HR_YEAR`,`DC_HR_MONTH`);

--
-- Indexes for table `dc_monitorparameters`
--
ALTER TABLE `dc_monitorparameters`
  ADD KEY `DC_MONITORPARAMETER_SERVERUID` (`DC_MONITORPARAMETER_SERVERUID`);

--
-- Indexes for table `dc_monitorservers`
--
ALTER TABLE `dc_monitorservers`
  ADD KEY `DC_MONITORSERVER_SERVERID` (`DC_MONITORSERVER_SERVERID`),
  ADD KEY `DC_MONITORSERVER_SERVERUID` (`DC_MONITORSERVER_SERVERID`);

--
-- Indexes for table `dc_monitorvalues`
--
ALTER TABLE `dc_monitorvalues`
  ADD KEY `DC_MONITORVALUE_SERVERID_DATE` (`DC_MONITORVALUE_SERVERID`,`DC_MONITORVALUE_DATE`);

--
-- Indexes for table `dc_mortalityvalues`
--
ALTER TABLE `dc_mortalityvalues`
  ADD KEY `DC_MORTALITYVALUE_OBJECTID` (`DC_MORTALITYVALUE_OBJECTID`),
  ADD KEY `DC_MORTALITYVALUE_CODE` (`DC_MORTALITYVALUE_CODE`),
  ADD KEY `DC_MORTALITYVALUE_YEARMONTH` (`DC_MORTALITYVALUE_YEAR`,`DC_MORTALITYVALUE_MONTH`);

--
-- Indexes for table `dc_patientrecords`
--
ALTER TABLE `dc_patientrecords`
  ADD KEY `DC_PATIENTRECORD_PERSONID` (`DC_PATIENTRECORD_PERSONID`);

--
-- Indexes for table `dc_simplevalues`
--
ALTER TABLE `dc_simplevalues`
  ADD KEY `DC_SIMPLEVALUE_OBJECTID` (`DC_SIMPLEVALUE_OBJECTID`),
  ADD KEY `DC_SIMPLEVALUE_PARAMETERID` (`DC_SIMPLEVALUE_PARAMETERID`),
  ADD KEY `DC_SIMPLEVALUE_CREATEDATETIME` (`DC_SIMPLEVALUE_CREATEDATETIME`);

--
-- Indexes for table `dc_vaccinations`
--
ALTER TABLE `dc_vaccinations`
  ADD KEY `DC_VACCINATION_PATIENTUID` (`DC_VACCINATION_PATIENTUID`),
  ADD KEY `DC_VACCINATION_UPDATETIME` (`DC_VACCINATION_UPDATETIME`),
  ADD KEY `DC_VACCINATION_DATE` (`DC_VACCINATION_DATE`);

--
-- Indexes for table `ghb_messages`
--
ALTER TABLE `ghb_messages`
  ADD KEY `GHB_MESSAGE_SOURCESERVERID` (`GHB_MESSAGE_SOURCESERVERID`),
  ADD KEY `GHB_MESSAGE_TARGETSERVERID` (`GHB_MESSAGE_TARGETSERVERID`),
  ADD KEY `GHB_MESSAGE_DELIVEREDDATETIME` (`GHB_MESSAGE_DELIVEREDDATETIME`);

--
-- Indexes for table `ghb_servers`
--
ALTER TABLE `ghb_servers`
  ADD KEY `GHB_SERVER_ID` (`GHB_SERVER_ID`),
  ADD KEY `GHB_SERVER_DOMAIN` (`GHB_SERVER_DOMAIN`);

--
-- Indexes for table `ghb_tokens`
--
ALTER TABLE `ghb_tokens`
  ADD KEY `GHB_TOKEN` (`GHB_TOKEN`);

--
-- Indexes for table `updatestats1`
--
ALTER TABLE `updatestats1`
  ADD KEY `STATS1_ENCOUNTERUID` (`OC_ENCOUNTERUID`),
  ADD KEY `STATS1_BEGINDATE` (`OC_BEGINDATE`);

--
-- Indexes for table `updatestats2`
--
ALTER TABLE `updatestats2`
  ADD KEY `STATS2_ENCOUNTEROBJECTID` (`OC_ENCOUNTER_OBJECTID`),
  ADD KEY `STATS2_BEGINDATE` (`OC_ENCOUNTER_BEGINDATE`),
  ADD KEY `STATS2_ENDDATE` (`OC_ENCOUNTER_ENDDATE`);

--
-- Indexes for table `updatestats3`
--
ALTER TABLE `updatestats3`
  ADD KEY `STATS3_ENCOUNTERUID` (`OC_ENCOUNTERUID`),
  ADD KEY `STATS3_DATE` (`OC_DATE`);

--
-- Indexes for table `updatestats4`
--
ALTER TABLE `updatestats4`
  ADD KEY `STATS3_BEGINDATE` (`OC_BEGINDATE`),
  ADD KEY `STATS3_ENDDATE` (`OC_ENDDATE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
