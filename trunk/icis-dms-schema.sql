-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 13, 2009 at 06:07 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `icis-dms`
--

-- --------------------------------------------------------

--
-- Table structure for table `atributs`
--

DROP TABLE IF EXISTS `atributs`;
CREATE TABLE IF NOT EXISTS `atributs` (
  `AID` int(11) DEFAULT NULL,
  `GID` int(11) NOT NULL,
  `ATYPE` int(11) NOT NULL,
  `AUID` int(11) NOT NULL,
  `AVAL` varchar(255) DEFAULT NULL,
  `ALOCN` int(11) DEFAULT NULL,
  `AREF` int(11) DEFAULT NULL,
  `ADATE` int(11) DEFAULT NULL,
  KEY `AID` (`AID`),
  KEY `ALOCN` (`ALOCN`),
  KEY `ATYPE` (`ATYPE`),
  KEY `AUID` (`AUID`),
  KEY `GID` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bibrefs`
--

DROP TABLE IF EXISTS `bibrefs`;
CREATE TABLE IF NOT EXISTS `bibrefs` (
  `REFID` int(11) NOT NULL,
  `PUBTYPE` int(11) DEFAULT NULL,
  `PUBDATE` int(11) DEFAULT NULL,
  `AUTHORS` varchar(100) DEFAULT NULL,
  `EDITORS` varchar(100) DEFAULT NULL,
  `ANALYT` varchar(255) DEFAULT NULL,
  `MONOGR` varchar(255) DEFAULT NULL,
  `SERIES` varchar(255) DEFAULT NULL,
  `VOLUME` varchar(10) DEFAULT NULL,
  `ISSUE` varchar(10) DEFAULT NULL,
  `PAGECOL` varchar(25) DEFAULT NULL,
  `PUBLISH` varchar(50) DEFAULT NULL,
  `PUCITY` varchar(30) DEFAULT NULL,
  `PUCNTRY` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`REFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
CREATE TABLE IF NOT EXISTS `changes` (
  `CID` int(11) NOT NULL,
  `CTABLE` varchar(16) NOT NULL,
  `CFIELD` varchar(16) NOT NULL,
  `CRECORD` int(11) NOT NULL,
  `CFROM` int(11) DEFAULT NULL,
  `CTO` int(11) DEFAULT NULL,
  `CDATE` int(11) DEFAULT NULL,
  `CTIME` int(11) DEFAULT NULL,
  `CGROUP` varchar(20) DEFAULT NULL,
  `CUID` int(11) DEFAULT NULL,
  `CREF` int(11) DEFAULT NULL,
  `CSTATUS` int(11) NOT NULL,
  `CDESC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CID`),
  KEY `CRECORD` (`CRECORD`),
  KEY `CID` (`CID`,`CRECORD`,`CTABLE`),
  KEY `CTABLE` (`CTABLE`,`CFIELD`,`CRECORD`,`CFROM`,`CTO`,`CSTATUS`),
  KEY `CTABLE_2` (`CTABLE`,`CRECORD`,`CFIELD`,`CFROM`,`CSTATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `datattr`
--

DROP TABLE IF EXISTS `datattr`;
CREATE TABLE IF NOT EXISTS `datattr` (
  `DATTRID` int(11) NOT NULL,
  `DATYPE` int(11) DEFAULT NULL,
  `DATABLE` varchar(2) DEFAULT NULL,
  `OUNITID` int(11) DEFAULT NULL,
  `VARIATID` int(11) DEFAULT NULL,
  `DATVAL` text,
  PRIMARY KEY (`DATTRID`),
  KEY `DATTRID` (`DATTRID`),
  KEY `OUNITID` (`OUNITID`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_c`
--

DROP TABLE IF EXISTS `data_c`;
CREATE TABLE IF NOT EXISTS `data_c` (
  `OUNITID` int(11) DEFAULT NULL,
  `VARIATID` int(11) DEFAULT NULL,
  `DVALUE` varchar(50) DEFAULT NULL,
  KEY `DVALUE` (`DVALUE`),
  KEY `OUNITID` (`OUNITID`),
  KEY `OUNITID_2` (`OUNITID`,`VARIATID`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_n`
--

DROP TABLE IF EXISTS `data_n`;
CREATE TABLE IF NOT EXISTS `data_n` (
  `OUNITID` int(11) DEFAULT NULL,
  `VARIATID` int(11) DEFAULT NULL,
  `DVALUE` double DEFAULT NULL,
  KEY `DVALUE` (`DVALUE`),
  KEY `OUNITID` (`OUNITID`,`VARIATID`),
  KEY `OUNITID_2` (`OUNITID`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_t`
--

DROP TABLE IF EXISTS `data_t`;
CREATE TABLE IF NOT EXISTS `data_t` (
  `OUNITID` int(11) DEFAULT NULL,
  `VARIATID` int(11) DEFAULT NULL,
  `DVALUE` text,
  KEY `OUNITID` (`OUNITID`,`VARIATID`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dmsattr`
--

DROP TABLE IF EXISTS `dmsattr`;
CREATE TABLE IF NOT EXISTS `dmsattr` (
  `DMSATID` int(11) NOT NULL,
  `DMSATYPE` int(11) DEFAULT NULL,
  `DMSATAB` varchar(10) DEFAULT NULL,
  `DMSATREC` int(11) DEFAULT NULL,
  `DMSATVAL` text,
  PRIMARY KEY (`DMSATID`),
  KEY `DMSATID` (`DMSATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dudflds`
--

DROP TABLE IF EXISTS `dudflds`;
CREATE TABLE IF NOT EXISTS `dudflds` (
  `FLDNO` int(11) DEFAULT NULL,
  `FTABLE` varchar(24) DEFAULT NULL,
  `FTYPE` varchar(12) DEFAULT NULL,
  `FCODE` varchar(8) DEFAULT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `FFMT` varchar(255) DEFAULT NULL,
  `FDESC` text,
  `LFLDNO` int(11) DEFAULT NULL,
  `FUID` int(11) DEFAULT NULL,
  `FDATE` int(11) DEFAULT NULL,
  `OldFLDNO` int(11) DEFAULT NULL,
  `OldFLDID` int(11) DEFAULT NULL,
  UNIQUE KEY `FLDNO` (`FLDNO`),
  KEY `FCODE` (`FCODE`),
  KEY `FUID` (`FUID`),
  KEY `OldFLDID` (`OldFLDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `effect`
--

DROP TABLE IF EXISTS `effect`;
CREATE TABLE IF NOT EXISTS `effect` (
  `REPRESNO` int(11) NOT NULL,
  `FACTORID` int(11) DEFAULT NULL,
  `EFFECTID` int(11) DEFAULT NULL,
  KEY `REPRESNO` (`REPRESNO`),
  KEY `EFFECTID` (`EFFECTID`),
  KEY `FACTORID` (`FACTORID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `factor`
--

DROP TABLE IF EXISTS `factor`;
CREATE TABLE IF NOT EXISTS `factor` (
  `LABELID` int(11) NOT NULL,
  `FACTORID` int(11) DEFAULT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `STUDYID` int(11) NOT NULL,
  `TRAITID` int(11) DEFAULT NULL,
  `SCALEID` int(11) DEFAULT NULL,
  `TMETHID` int(11) DEFAULT NULL,
  `LTYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`LABELID`),
  KEY `FACTORID` (`FACTORID`),
  KEY `STUDYID` (`STUDYID`,`FNAME`),
  KEY `TRAITID` (`TRAITID`,`SCALEID`,`TMETHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `georef`
--

DROP TABLE IF EXISTS `georef`;
CREATE TABLE IF NOT EXISTS `georef` (
  `LOCID` int(11) DEFAULT NULL,
  `LLPN` int(11) DEFAULT NULL,
  `LAT` double DEFAULT NULL,
  `LON` double DEFAULT NULL,
  `ALT` double DEFAULT NULL,
  KEY `LOCID` (`LOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `germplsm`
--

DROP TABLE IF EXISTS `germplsm`;
CREATE TABLE IF NOT EXISTS `germplsm` (
  `GID` int(11) NOT NULL,
  `METHN` int(11) DEFAULT NULL,
  `GNPGS` int(11) DEFAULT NULL,
  `GPID1` int(11) DEFAULT NULL,
  `GPID2` int(11) DEFAULT NULL,
  `GERMUID` int(11) DEFAULT NULL,
  `LGID` int(11) DEFAULT NULL,
  `GLOCN` int(11) DEFAULT NULL,
  `GDATE` int(11) DEFAULT NULL,
  `GREF` int(11) DEFAULT NULL,
  `GRPLCE` int(11) DEFAULT NULL,
  `MGID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GID`),
  KEY `GLOCN` (`GLOCN`),
  KEY `GPID1` (`GPID1`),
  KEY `GPID2` (`GPID2`),
  KEY `GERMUID` (`GERMUID`),
  KEY `LGID` (`LGID`),
  KEY `METHN` (`METHN`),
  KEY `MGID` (`MGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ims_labelinfo`
--

DROP TABLE IF EXISTS `ims_labelinfo`;
CREATE TABLE IF NOT EXISTS `ims_labelinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABELINFO_ID` int(11) NOT NULL,
  `GROUP_PREFIX` varchar(50) DEFAULT NULL,
  `LABELITEMCOUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`LABELINFO_ID`),
  KEY `ID` (`ID`),
  KEY `LABELINFO_ID` (`LABELINFO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `ims_label_otherinfo`
--

DROP TABLE IF EXISTS `ims_label_otherinfo`;
CREATE TABLE IF NOT EXISTS `ims_label_otherinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OTHERINFO_ID` int(11) NOT NULL,
  `LABELINFO_ID` int(11) DEFAULT NULL,
  `GROUP_PREFIX` varchar(50) DEFAULT NULL,
  `TABLENAME` varchar(50) DEFAULT NULL,
  `FIELDNAME` varchar(50) DEFAULT NULL,
  `FOREIGN_FIELDNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OTHERINFO_ID`),
  KEY `ID` (`ID`),
  KEY `LABELINFO_ID` (`LABELINFO_ID`),
  KEY `OTHERINFO_ID` (`OTHERINFO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `ims_lot`
--

DROP TABLE IF EXISTS `ims_lot`;
CREATE TABLE IF NOT EXISTS `ims_lot` (
  `LOTID` int(11) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `ETYPE` varchar(15) DEFAULT NULL,
  `EID` int(11) DEFAULT NULL,
  `LOCID` int(11) DEFAULT NULL,
  `SCALEID` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `SOURCEID` int(11) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  KEY `EID` (`EID`),
  KEY `LOCID` (`LOCID`),
  KEY `LOTID` (`LOTID`),
  KEY `SCALEID` (`SCALEID`),
  KEY `SOURCEID` (`SOURCEID`),
  KEY `USERID` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ims_transaction`
--

DROP TABLE IF EXISTS `ims_transaction`;
CREATE TABLE IF NOT EXISTS `ims_transaction` (
  `TRNID` int(11) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `LOTID` int(11) DEFAULT NULL,
  `TRNDATE` int(11) DEFAULT NULL,
  `TRNSTAT` int(11) DEFAULT NULL,
  `TRNQTY` double DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `CMTDATA` int(11) DEFAULT NULL,
  `SOURCETYPE` varchar(12) DEFAULT NULL,
  `SOURCEID` int(11) DEFAULT NULL,
  `RECORDID` int(11) DEFAULT NULL,
  `PREVAMOUNT` double DEFAULT NULL,
  `PERSONID` int(11) DEFAULT NULL,
  KEY `LOTID` (`LOTID`),
  KEY `PERSONID` (`PERSONID`),
  KEY `RECORDID` (`RECORDID`),
  KEY `SOURCEID` (`SOURCEID`),
  KEY `TRNID` (`TRNID`),
  KEY `USERID` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institut`
--

DROP TABLE IF EXISTS `institut`;
CREATE TABLE IF NOT EXISTS `institut` (
  `INSTITID` int(11) NOT NULL,
  `PINSID` int(11) NOT NULL,
  `INSNAME` varchar(150) NOT NULL,
  `INSACR` varchar(20) NOT NULL,
  `INSTYPE` int(11) NOT NULL,
  `STREET` varchar(125) NOT NULL,
  `POSTBOX` varchar(25) NOT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATEID` int(11) DEFAULT NULL,
  `CPOSTAL` varchar(10) NOT NULL,
  `CNTRYID` int(11) NOT NULL,
  `APHONE` varchar(25) NOT NULL,
  `AFAX` varchar(25) NOT NULL,
  `AEMAIL` varchar(40) NOT NULL,
  `WEBURL` varchar(60) NOT NULL,
  `SINS` int(11) NOT NULL,
  `EINS` int(11) NOT NULL,
  `ICHANGE` int(11) NOT NULL,
  PRIMARY KEY (`INSTITID`),
  KEY `CNTRYID` (`CNTRYID`),
  KEY `PINSID` (`PINSID`),
  KEY `STATEID` (`STATEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instln`
--

DROP TABLE IF EXISTS `instln`;
CREATE TABLE IF NOT EXISTS `instln` (
  `INSTALID` int(11) NOT NULL,
  `ADMIN` int(11) NOT NULL,
  `UDATE` int(11) NOT NULL,
  `UGID` int(11) NOT NULL,
  `ULOCN` int(11) NOT NULL,
  `UCID` int(11) DEFAULT NULL,
  `UNID` int(11) DEFAULT NULL,
  `UAID` int(11) DEFAULT NULL,
  `ULDID` int(11) DEFAULT NULL,
  `UMETHN` int(11) NOT NULL,
  `UFLDNO` int(11) NOT NULL,
  `UREFNO` int(11) NOT NULL,
  `UPID` int(11) DEFAULT NULL,
  `IDESC` varchar(255) DEFAULT NULL,
  `ULISTID` int(11) DEFAULT NULL,
  `DMS_STATUS` int(11) NOT NULL,
  `ULRECID` int(11) DEFAULT NULL,
  KEY `INSTALID` (`INSTALID`),
  KEY `ADMIN` (`ADMIN`),
  KEY `UCID` (`UCID`),
  KEY `UAID` (`UAID`),
  KEY `UGID` (`UGID`),
  KEY `ULDID` (`ULDID`),
  KEY `UNID` (`UNID`),
  KEY `UPID` (`UPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i_accession`
--

DROP TABLE IF EXISTS `i_accession`;
CREATE TABLE IF NOT EXISTS `i_accession` (
  `ACCID` varchar(50) DEFAULT NULL,
  `CULTNAME` varchar(50) DEFAULT NULL,
  `ALTNAME` varchar(50) DEFAULT NULL,
  `DERVNAME` varchar(50) DEFAULT NULL,
  `CROSS` varchar(50) DEFAULT NULL,
  `DNRNO` varchar(50) DEFAULT NULL,
  `ALTERID` varchar(50) DEFAULT NULL,
  `SRCACC` varchar(50) DEFAULT NULL,
  `SPECIES` varchar(50) DEFAULT NULL,
  `METHA` int(11) DEFAULT NULL,
  `METHS` int(11) DEFAULT NULL,
  `AORIG` int(11) DEFAULT NULL,
  `BORIG` int(11) DEFAULT NULL,
  `ADATE` varchar(50) DEFAULT NULL,
  `SDATE` varchar(50) DEFAULT NULL,
  `COLLID` varchar(50) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `COLLENV` varchar(50) DEFAULT NULL,
  `MISSCDE` varchar(50) DEFAULT NULL,
  `DNRID` varchar(50) DEFAULT NULL,
  `DNRCTY` varchar(50) DEFAULT NULL,
  `RECNO` int(11) DEFAULT NULL,
  `GID` int(11) DEFAULT NULL,
  UNIQUE KEY `RECNO` (`RECNO`),
  KEY `ALTERID` (`ALTERID`),
  KEY `DNRID` (`DNRID`),
  KEY `GID` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i_bchist`
--

DROP TABLE IF EXISTS `i_bchist`;
CREATE TABLE IF NOT EXISTS `i_bchist` (
  `BCID` varchar(50) DEFAULT NULL,
  `FEMALE_ORIG` varchar(50) DEFAULT NULL,
  `FEMALE` varchar(50) DEFAULT NULL,
  `MALE_ORIG` varchar(50) DEFAULT NULL,
  `MALE` varchar(50) DEFAULT NULL,
  `METHOD` int(11) DEFAULT NULL,
  `LOCATION` varchar(50) DEFAULT NULL,
  `DATE` int(11) DEFAULT NULL,
  `RECNO` int(11) DEFAULT NULL,
  `GID` int(11) DEFAULT NULL,
  KEY `BCID` (`BCID`),
  KEY `GID` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i_cultlist`
--

DROP TABLE IF EXISTS `i_cultlist`;
CREATE TABLE IF NOT EXISTS `i_cultlist` (
  `NAME` varchar(50) DEFAULT NULL,
  `NTYPE` int(11) DEFAULT NULL,
  `DATE` int(11) DEFAULT NULL,
  `LOCATION` int(11) DEFAULT NULL,
  `METHOD` int(11) DEFAULT NULL,
  `CROSS` varchar(150) DEFAULT NULL,
  `CROSSDATE` int(11) DEFAULT NULL,
  `ALTNAME` varchar(50) DEFAULT NULL,
  `ANTYPE` int(11) DEFAULT NULL,
  `RECNO` int(11) DEFAULT NULL,
  `GID` int(11) DEFAULT NULL,
  KEY `NAME` (`NAME`),
  KEY `GID` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
CREATE TABLE IF NOT EXISTS `levels` (
  `LEVELNO` int(11) NOT NULL,
  `FACTORID` int(11) NOT NULL,
  PRIMARY KEY (`LEVELNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `level_c`
--

DROP TABLE IF EXISTS `level_c`;
CREATE TABLE IF NOT EXISTS `level_c` (
  `LABELID` int(11) DEFAULT NULL,
  `FACTORID` int(11) DEFAULT NULL,
  `LEVELNO` int(11) DEFAULT NULL,
  `LVALUE` varchar(255) DEFAULT NULL,
  KEY `LABELID` (`LABELID`),
  KEY `FACTORID` (`FACTORID`,`LEVELNO`),
  KEY `FACTORID_2` (`FACTORID`),
  KEY `FACTORID_3` (`FACTORID`,`LVALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `level_n`
--

DROP TABLE IF EXISTS `level_n`;
CREATE TABLE IF NOT EXISTS `level_n` (
  `LABELID` int(11) DEFAULT NULL,
  `FACTORID` int(11) DEFAULT NULL,
  `LEVELNO` int(11) DEFAULT NULL,
  `LVALUE` double DEFAULT NULL,
  KEY `LABELID` (`LABELID`),
  KEY `FACTORID` (`FACTORID`,`LEVELNO`),
  KEY `FACTORID_2` (`FACTORID`,`LVALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `level_t`
--

DROP TABLE IF EXISTS `level_t`;
CREATE TABLE IF NOT EXISTS `level_t` (
  `FACTORID` int(11) DEFAULT NULL,
  `LEVELNO` int(11) DEFAULT NULL,
  `LVALUE` text,
  `LABELID` int(11) DEFAULT NULL,
  KEY `FACTORID` (`FACTORID`,`LEVELNO`),
  KEY `FACTORID_2` (`FACTORID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listdata`
--

DROP TABLE IF EXISTS `listdata`;
CREATE TABLE IF NOT EXISTS `listdata` (
  `LISTID` int(11) NOT NULL,
  `GID` int(11) DEFAULT NULL,
  `ENTRYID` int(11) NOT NULL,
  `ENTRYCD` varchar(47) DEFAULT NULL,
  `SOURCE` varchar(255) DEFAULT NULL,
  `DESIG` varchar(255) DEFAULT NULL,
  `GRPNAME` varchar(255) DEFAULT NULL,
  `LRSTATUS` int(11) DEFAULT NULL,
  `LRECID` int(11) NOT NULL,
  `LLRECID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LISTID`,`LRECID`),
  KEY `ENTRYCD` (`ENTRYCD`),
  KEY `ENTRYID` (`ENTRYID`),
  KEY `GID` (`GID`),
  KEY `LISTID` (`LISTID`,`GID`,`LRSTATUS`),
  KEY `LISTID_2` (`LISTID`,`ENTRYID`,`LRSTATUS`),
  KEY `LISTID_3` (`LISTID`),
  KEY `SOURCE` (`SOURCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listnms`
--

DROP TABLE IF EXISTS `listnms`;
CREATE TABLE IF NOT EXISTS `listnms` (
  `LISTID` int(11) NOT NULL,
  `LISTNAME` varchar(47) NOT NULL,
  `LISTDATE` int(11) DEFAULT NULL,
  `LISTTYPE` varchar(7) NOT NULL DEFAULT 'LST',
  `LISTUID` int(11) DEFAULT NULL,
  `LISTDESC` varchar(255) DEFAULT NULL,
  `LISTSTATUS` int(11) DEFAULT NULL,
  `LHIERARCHY` int(11) DEFAULT NULL,
  PRIMARY KEY (`LISTID`),
  UNIQUE KEY `LISTID_2` (`LISTID`),
  KEY `LISTID` (`LISTID`,`LHIERARCHY`),
  KEY `LISTUID` (`LISTUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `LOCID` int(11) NOT NULL,
  `LTYPE` int(11) DEFAULT NULL,
  `NLLP` int(11) DEFAULT NULL,
  `LNAME` varchar(60) DEFAULT NULL,
  `LABBR` varchar(8) DEFAULT NULL,
  `SNL3ID` int(11) DEFAULT NULL,
  `SNL2ID` int(11) DEFAULT NULL,
  `SNL1ID` int(11) DEFAULT NULL,
  `CNTRYID` int(11) DEFAULT NULL,
  `LRPLCE` int(11) DEFAULT NULL,
  PRIMARY KEY (`LOCID`),
  KEY `CNTRYID` (`CNTRYID`),
  KEY `SNL1ID` (`SNL1ID`),
  KEY `SNL2ID` (`SNL2ID`),
  KEY `SNL3ID` (`SNL3ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `locdes`
--

DROP TABLE IF EXISTS `locdes`;
CREATE TABLE IF NOT EXISTS `locdes` (
  `LDID` int(11) DEFAULT NULL,
  `LOCID` int(11) NOT NULL,
  `DTYPE` int(11) NOT NULL,
  `DUID` int(11) NOT NULL,
  `DVAL` varchar(255) DEFAULT NULL,
  `DDATE` int(11) DEFAULT NULL,
  `DREF` int(11) DEFAULT NULL,
  KEY `DTYPE` (`DTYPE`),
  KEY `DUID` (`DUID`),
  KEY `LOCID` (`LOCID`),
  KEY `LDID` (`LDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `methods`
--

DROP TABLE IF EXISTS `methods`;
CREATE TABLE IF NOT EXISTS `methods` (
  `MID` int(11) NOT NULL,
  `MTYPE` varchar(3) DEFAULT NULL,
  `MGRP` varchar(3) DEFAULT NULL,
  `MCODE` varchar(8) DEFAULT NULL,
  `MNAME` varchar(50) DEFAULT NULL,
  `MDESC` varchar(255) DEFAULT NULL,
  `MREF` int(11) DEFAULT NULL,
  `MPRGN` int(11) DEFAULT NULL,
  `MFPRG` int(11) DEFAULT NULL,
  `MATTR` int(11) DEFAULT NULL,
  `GENEQ` int(11) DEFAULT NULL,
  `MUID` int(11) DEFAULT NULL,
  `LMID` int(11) DEFAULT NULL,
  `MDATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`MID`),
  KEY `LMID` (`LMID`),
  KEY `MCODE` (`MCODE`),
  KEY `MUID` (`MUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `names`
--

DROP TABLE IF EXISTS `names`;
CREATE TABLE IF NOT EXISTS `names` (
  `NID` int(11) DEFAULT NULL,
  `GID` int(11) DEFAULT NULL,
  `NTYPE` int(11) DEFAULT NULL,
  `NSTAT` int(11) DEFAULT NULL,
  `NUID` int(11) DEFAULT NULL,
  `NVAL` varchar(255) DEFAULT NULL,
  `NLOCN` int(11) DEFAULT NULL,
  `NDATE` int(11) DEFAULT NULL,
  `NREF` int(11) DEFAULT NULL,
  KEY `GID` (`GID`),
  KEY `NID` (`NID`),
  KEY `NLOCN` (`NLOCN`),
  KEY `NTYPE` (`NTYPE`),
  KEY `NUID` (`NUID`),
  KEY `NVAL` (`NVAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `obsunit`
--

DROP TABLE IF EXISTS `obsunit`;
CREATE TABLE IF NOT EXISTS `obsunit` (
  `OUNITID` int(11) NOT NULL,
  `EFFECTID` int(11) NOT NULL,
  PRIMARY KEY (`OUNITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oindex`
--

DROP TABLE IF EXISTS `oindex`;
CREATE TABLE IF NOT EXISTS `oindex` (
  `OUNITID` int(11) DEFAULT NULL,
  `FACTORID` int(11) DEFAULT NULL,
  `LEVELNO` int(11) DEFAULT NULL,
  `REPRESNO` int(11) DEFAULT NULL,
  KEY `FACTORID` (`FACTORID`,`LEVELNO`),
  KEY `OUNITID` (`OUNITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
CREATE TABLE IF NOT EXISTS `persons` (
  `PERSONID` int(11) NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `LNAME` varchar(50) NOT NULL,
  `IONAME` varchar(15) NOT NULL,
  `INSTITID` int(11) NOT NULL,
  `PTITLE` varchar(25) NOT NULL,
  `PONAME` varchar(50) NOT NULL,
  `PLANGU` int(11) NOT NULL,
  `PPHONE` varchar(20) NOT NULL,
  `PEXTENT` varchar(20) NOT NULL,
  `PFAX` varchar(20) NOT NULL,
  `PEMAIL` varchar(40) NOT NULL,
  `PROLE` int(11) NOT NULL,
  `SPERSON` int(11) NOT NULL,
  `EPERSON` int(11) NOT NULL,
  `PSTATUS` int(11) NOT NULL,
  `PNOTES` text,
  `CONTACT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERSONID`),
  KEY `INSTITID` (`INSTITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `progntrs`
--

DROP TABLE IF EXISTS `progntrs`;
CREATE TABLE IF NOT EXISTS `progntrs` (
  `GID` int(11) DEFAULT NULL,
  `PNO` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  KEY `GID` (`GID`),
  KEY `PID` (`PID`),
  KEY `PNO` (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reflinks`
--

DROP TABLE IF EXISTS `reflinks`;
CREATE TABLE IF NOT EXISTS `reflinks` (
  `BREFLID` int(11) NOT NULL,
  `BTABLE` int(11) NOT NULL,
  `BRECORD` int(11) NOT NULL,
  KEY `BREFLID` (`BREFLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `represtn`
--

DROP TABLE IF EXISTS `represtn`;
CREATE TABLE IF NOT EXISTS `represtn` (
  `REPRESNO` int(11) NOT NULL,
  `EFFECTID` int(11) NOT NULL,
  `REPRESNAME` varchar(150) NOT NULL,
  PRIMARY KEY (`REPRESNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scale`
--

DROP TABLE IF EXISTS `scale`;
CREATE TABLE IF NOT EXISTS `scale` (
  `SCALEID` int(11) NOT NULL,
  `SCNAME` varchar(50) DEFAULT NULL,
  `TRAITID` int(11) DEFAULT NULL,
  `SCTYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCALEID`),
  KEY `SCALEID` (`SCALEID`),
  KEY `TRAITID` (`TRAITID`,`SCNAME`),
  KEY `TRAITID_2` (`TRAITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scalecon`
--

DROP TABLE IF EXISTS `scalecon`;
CREATE TABLE IF NOT EXISTS `scalecon` (
  `SCALEID` int(11) NOT NULL,
  `SLEVEL` double NOT NULL,
  `ELEVEL` double NOT NULL,
  KEY `SCALEID` (`SCALEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scaledis`
--

DROP TABLE IF EXISTS `scaledis`;
CREATE TABLE IF NOT EXISTS `scaledis` (
  `SCALEID` int(11) NOT NULL,
  `VALUE` varchar(10) NOT NULL,
  `VALDESC` varchar(255) NOT NULL,
  KEY `SCALEID` (`SCALEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scaletab`
--

DROP TABLE IF EXISTS `scaletab`;
CREATE TABLE IF NOT EXISTS `scaletab` (
  `SCALEID` int(11) NOT NULL,
  `SSQL` varchar(250) NOT NULL,
  `SMODULE` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scale_bak`
--

DROP TABLE IF EXISTS `scale_bak`;
CREATE TABLE IF NOT EXISTS `scale_bak` (
  `SCALEID` int(11) NOT NULL,
  `SCNAME` varchar(30) DEFAULT NULL,
  `TRAITID` int(11) DEFAULT NULL,
  `SCTYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCALEID`),
  KEY `SCALEID` (`SCALEID`),
  KEY `TRAITID` (`TRAITID`,`SCNAME`),
  KEY `TRAITID_2` (`TRAITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `steffect`
--

DROP TABLE IF EXISTS `steffect`;
CREATE TABLE IF NOT EXISTS `steffect` (
  `EFFECTID` int(11) NOT NULL,
  `STUDYID` int(11) NOT NULL,
  `EFFECTNAME` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `study`
--

DROP TABLE IF EXISTS `study`;
CREATE TABLE IF NOT EXISTS `study` (
  `STUDYID` int(11) NOT NULL,
  `SNAME` varchar(50) DEFAULT NULL,
  `PMKEY` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `OBJECTIV` text,
  `INVESTID` int(11) DEFAULT NULL,
  `STYPE` varchar(1) DEFAULT NULL,
  `SDATE` int(11) DEFAULT NULL,
  `EDATE` int(11) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `SSTATUS` int(11) DEFAULT '1',
  `SHIERARCHY` int(11) DEFAULT NULL,
  PRIMARY KEY (`STUDYID`),
  KEY `INVESTID` (`INVESTID`),
  KEY `PMKEY` (`PMKEY`),
  KEY `SNAME` (`SNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tmethod`
--

DROP TABLE IF EXISTS `tmethod`;
CREATE TABLE IF NOT EXISTS `tmethod` (
  `TMETHID` int(11) NOT NULL,
  `TMNAME` varchar(50) DEFAULT NULL,
  `TRAITID` int(11) DEFAULT NULL,
  `TMABBR` varchar(6) DEFAULT NULL,
  `TMDESC` text,
  PRIMARY KEY (`TMETHID`),
  KEY `TMETHID` (`TMETHID`),
  KEY `TRAITID` (`TRAITID`,`TMNAME`),
  KEY `TRAITID_2` (`TRAITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trait`
--

DROP TABLE IF EXISTS `trait`;
CREATE TABLE IF NOT EXISTS `trait` (
  `TID` int(11) DEFAULT NULL,
  `TRAITID` int(11) DEFAULT NULL,
  `TRNAME` varchar(50) DEFAULT NULL,
  `TRABBR` varchar(6) DEFAULT NULL,
  `TRDESC` text,
  `SCALEID` int(11) DEFAULT NULL,
  `TMETHID` int(11) DEFAULT NULL,
  `TNSTAT` int(11) DEFAULT NULL,
  KEY `TMETHID` (`TMETHID`),
  KEY `SCALEID` (`SCALEID`),
  KEY `TID` (`TID`),
  KEY `TRAITID` (`TRAITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `udflds`
--

DROP TABLE IF EXISTS `udflds`;
CREATE TABLE IF NOT EXISTS `udflds` (
  `FLDNO` int(11) NOT NULL,
  `FTABLE` varchar(24) DEFAULT NULL,
  `FTYPE` varchar(12) DEFAULT NULL,
  `FCODE` varchar(50) DEFAULT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `FFMT` varchar(255) DEFAULT NULL,
  `FDESC` varchar(255) DEFAULT NULL,
  `LFLDNO` int(11) DEFAULT NULL,
  `FUID` int(11) DEFAULT NULL,
  `FDATE` int(11) DEFAULT NULL,
  `SCALEID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FLDNO`),
  KEY `FCODE` (`FCODE`),
  KEY `FUID` (`FUID`),
  KEY `SCALEID` (`SCALEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `USERID` int(11) NOT NULL,
  `INSTALID` int(11) DEFAULT NULL,
  `USTATUS` int(11) DEFAULT NULL,
  `UACCESS` int(11) DEFAULT NULL,
  `UTYPE` int(11) DEFAULT NULL,
  `UNAME` varchar(30) DEFAULT NULL,
  `UPSWD` varchar(10) DEFAULT NULL,
  `PERSONID` int(11) DEFAULT NULL,
  `ADATE` int(11) DEFAULT NULL,
  `CDATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`USERID`),
  KEY `INSTALID` (`INSTALID`),
  KEY `PERSONID` (`PERSONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `variate`
--

DROP TABLE IF EXISTS `variate`;
CREATE TABLE IF NOT EXISTS `variate` (
  `VARIATID` int(11) NOT NULL,
  `VNAME` varchar(50) DEFAULT NULL,
  `STUDYID` int(11) DEFAULT NULL,
  `VTYPE` varchar(2) DEFAULT NULL,
  `TRAITID` int(11) DEFAULT NULL,
  `SCALEID` int(11) DEFAULT NULL,
  `TMETHID` int(11) DEFAULT NULL,
  `DTYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`VARIATID`),
  KEY `STUDYID` (`STUDYID`,`VNAME`),
  KEY `TRAITID` (`TRAITID`,`SCALEID`,`TMETHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `veffect`
--

DROP TABLE IF EXISTS `veffect`;
CREATE TABLE IF NOT EXISTS `veffect` (
  `REPRESNO` int(11) NOT NULL,
  `VARIATID` int(11) DEFAULT NULL,
  KEY `REPRESNO` (`REPRESNO`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
