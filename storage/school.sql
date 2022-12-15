-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2022 at 12:10 AM
-- Server version: 10.6.8-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `horizondb_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
                            `id` int(11) NOT NULL,
                            `name` varchar(255) NOT NULL,
                            `number` varchar(255) NOT NULL,
                            `description` text NOT NULL,
                            `balance` double(18,2) NOT NULL DEFAULT 0.00,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `advance_salary`
--

CREATE TABLE `advance_salary` (
                                  `id` int(11) NOT NULL,
                                  `staff_id` int(11) NOT NULL,
                                  `amount` decimal(18,2) NOT NULL,
                                  `deduct_month` varchar(20) DEFAULT NULL,
                                  `year` varchar(20) NOT NULL,
                                  `reason` text CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
                                  `request_date` datetime DEFAULT NULL,
                                  `paid_date` varchar(20) NOT NULL,
                                  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=pending,2=paid,3=rejected',
                                  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `issued_by` varchar(200) DEFAULT NULL,
                                  `comments` varchar(255) DEFAULT NULL,
                                  `branch_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
                               `id` int(11) NOT NULL,
                               `title` varchar(255) NOT NULL,
                               `remarks` text NOT NULL,
                               `type_id` int(11) NOT NULL,
                               `uploader_id` varchar(20) NOT NULL,
                               `class_id` varchar(20) DEFAULT 'unfiltered',
                               `file_name` varchar(255) NOT NULL,
                               `enc_name` varchar(255) NOT NULL,
                               `subject_id` varchar(200) DEFAULT 'unfiltered',
                               `session_id` int(11) NOT NULL,
                               `date` date NOT NULL,
                               `branch_id` int(11) DEFAULT NULL,
                               `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                               `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attachments_type`
--

CREATE TABLE `attachments_type` (
                                    `id` int(11) NOT NULL,
                                    `name` longtext NOT NULL,
                                    `branch_id` int(11) DEFAULT NULL,
                                    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                    `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
                         `id` int(11) NOT NULL,
                         `name` varchar(255) NOT NULL,
                         `user_id` int(11) NOT NULL,
                         `role_id` int(11) DEFAULT NULL,
                         `gift_item` varchar(255) NOT NULL,
                         `award_amount` decimal(18,2) NOT NULL,
                         `award_reason` text NOT NULL,
                         `given_date` date NOT NULL,
                         `session_id` int(11) NOT NULL,
                         `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
                        `id` int(11) NOT NULL,
                        `title` varchar(255) NOT NULL,
                        `cover` varchar(255) DEFAULT NULL,
                        `author` varchar(255) NOT NULL,
                        `isbn_no` varchar(255) NOT NULL,
                        `category_id` int(11) NOT NULL,
                        `publisher` varchar(255) NOT NULL,
                        `edition` varchar(255) NOT NULL,
                        `purchase_date` date NOT NULL,
                        `description` text NOT NULL,
                        `price` decimal(18,2) NOT NULL,
                        `total_stock` varchar(20) NOT NULL,
                        `issued_copies` varchar(20) NOT NULL DEFAULT '0',
                        `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                        `updated_at` datetime DEFAULT NULL,
                        `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
                                 `id` int(11) NOT NULL,
                                 `name` longtext NOT NULL,
                                 `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
                               `id` int(11) NOT NULL,
                               `book_id` int(11) NOT NULL,
                               `user_id` int(11) NOT NULL,
                               `role_id` int(11) NOT NULL,
                               `date_of_issue` date DEFAULT NULL,
                               `date_of_expiry` date DEFAULT NULL,
                               `return_date` date DEFAULT NULL,
                               `fine_amount` decimal(18,2) NOT NULL,
                               `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = accepted, 2 = rejected, 3 = returned',
                               `issued_by` varchar(255) DEFAULT NULL,
                               `return_by` int(11) DEFAULT NULL,
                               `session_id` int(11) NOT NULL,
                               `branch_id` int(11) DEFAULT NULL,
                               `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
                          `id` int(11) NOT NULL,
                          `name` varchar(255) DEFAULT NULL,
                          `school_name` varchar(255) NOT NULL,
                          `email` varchar(100) NOT NULL,
                          `mobileno` varchar(100) NOT NULL,
                          `currency` varchar(100) NOT NULL,
                          `symbol` varchar(25) NOT NULL,
                          `city` varchar(255) NOT NULL,
                          `state` varchar(255) NOT NULL,
                          `address` text NOT NULL,
                          `stu_generate` tinyint(3) DEFAULT 0,
                          `stu_username_prefix` varchar(255) NOT NULL,
                          `stu_default_password` varchar(255) NOT NULL,
                          `grd_generate` tinyint(3) DEFAULT 0,
                          `grd_username_prefix` varchar(255) NOT NULL,
                          `grd_default_password` varchar(255) NOT NULL,
                          `teacher_restricted` tinyint(1) NOT NULL DEFAULT 1,
                          `due_days` float NOT NULL DEFAULT 30,
                          `due_with_fine` tinyint(4) NOT NULL DEFAULT 1,
                          `unique_roll` tinyint(4) NOT NULL DEFAULT 1,
                          `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                          `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `school_name`, `email`, `mobileno`, `currency`, `symbol`, `city`, `state`, `address`, `stu_generate`, `stu_username_prefix`, `stu_default_password`, `grd_generate`, `grd_username_prefix`, `grd_default_password`, `teacher_restricted`, `due_days`, `due_with_fine`, `unique_roll`, `created_at`, `updated_at`) VALUES
    (1, 'Mongalkandi Islamia Kamil Madrasah', 'Mongalkandi Islamia Kamil Madrasah', 'admin@gmail.com', '01830747554', 'BDT', 'Tk', 'Dhaka,Bangladesh', 'Dhaka,Bangladesh', 'Motijheel,Dhaka,Bangladesh', 1, 'st', '12345', 1, 'st', '12345', 1, 30, 1, 1, '2022-08-31 15:05:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bulk_msg_category`
--

CREATE TABLE `bulk_msg_category` (
                                     `id` int(11) NOT NULL,
                                     `name` varchar(255) NOT NULL,
                                     `body` longtext NOT NULL,
                                     `type` tinyint(4) NOT NULL COMMENT 'sms=1, email=2',
                                     `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `bulk_sms_email`
--

CREATE TABLE `bulk_sms_email` (
                                  `id` int(11) NOT NULL,
                                  `campaign_name` varchar(255) DEFAULT NULL,
                                  `sms_gateway` varchar(55) DEFAULT '0',
                                  `message` text DEFAULT NULL,
                                  `email_subject` varchar(255) DEFAULT NULL,
                                  `message_type` tinyint(3) DEFAULT 0 COMMENT 'sms=1, email=2',
                                  `recipient_type` tinyint(3) NOT NULL COMMENT 'group=1, individual=2, class=3',
                                  `recipients_details` longtext DEFAULT NULL,
                                  `additional` longtext DEFAULT NULL,
                                  `schedule_time` datetime DEFAULT NULL,
                                  `posting_status` tinyint(3) NOT NULL COMMENT 'schedule=1,competed=2',
                                  `total_thread` int(11) NOT NULL,
                                  `successfully_sent` int(11) NOT NULL,
                                  `branch_id` int(11) DEFAULT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `bulk_sms_email`
--

INSERT INTO `bulk_sms_email` (`id`, `campaign_name`, `sms_gateway`, `message`, `email_subject`, `message_type`, `recipient_type`, `recipients_details`, `additional`, `schedule_time`, `posting_status`, `total_thread`, `successfully_sent`, `branch_id`, `created_at`) VALUES
    (1, 'test', 'mydokani', 'demo', NULL, 1, 2, '', '', '2022-10-09 14:23:58', 2, 1, 0, 1, '2022-10-09 08:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `call_log`
--

CREATE TABLE `call_log` (
                            `id` int(11) NOT NULL,
                            `name` varchar(255) DEFAULT NULL,
                            `number` varchar(255) DEFAULT NULL,
                            `purpose_id` int(11) DEFAULT NULL,
                            `call_type` tinyint(1) DEFAULT NULL,
                            `date` date NOT NULL,
                            `start_time` time DEFAULT NULL,
                            `end_time` time DEFAULT NULL,
                            `follow_up` date DEFAULT NULL,
                            `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
                            `branch_id` int(11) NOT NULL,
                            `created_by` int(11) NOT NULL,
                            `created_at` datetime NOT NULL,
                            `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `call_purpose`
--

CREATE TABLE `call_purpose` (
                                `id` int(11) NOT NULL,
                                `name` varchar(255) NOT NULL,
                                `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `card_templete`
--

CREATE TABLE `card_templete` (
                                 `id` int(11) NOT NULL,
                                 `card_type` tinyint(1) NOT NULL DEFAULT 0,
                                 `name` varchar(255) NOT NULL,
                                 `user_type` tinyint(1) NOT NULL,
                                 `background` varchar(355) DEFAULT NULL,
                                 `logo` varchar(355) DEFAULT NULL,
                                 `signature` varchar(255) DEFAULT NULL,
                                 `content` text NOT NULL,
                                 `layout_width` varchar(11) NOT NULL DEFAULT '54',
                                 `layout_height` varchar(11) NOT NULL DEFAULT '86',
                                 `photo_style` tinyint(1) NOT NULL,
                                 `photo_size` varchar(25) NOT NULL,
                                 `top_space` varchar(25) NOT NULL,
                                 `bottom_space` varchar(25) NOT NULL,
                                 `right_space` varchar(25) NOT NULL,
                                 `left_space` varchar(25) NOT NULL,
                                 `qr_code` varchar(25) NOT NULL,
                                 `branch_id` int(11) NOT NULL,
                                 `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `card_templete`
--

INSERT INTO `card_templete` (`id`, `card_type`, `name`, `user_type`, `background`, `logo`, `signature`, `content`, `layout_width`, `layout_height`, `photo_style`, `photo_size`, `top_space`, `bottom_space`, `right_space`, `left_space`, `qr_code`, `branch_id`, `created_at`) VALUES
                                                                                                                                                                                                                                                                                     (1, 1, 'ID Card Design', 1, 'Id_card11.jpg', '', '', '<div style=\"text-align: center; line-height: 1.4;\"><div><br></div><div><br></div><div><br></div><div><br></div><div>{student_photo}<br></div><div><font color=\"#ff0000\"><b><br></b></font></div><div><font color=\"#ff0000\"><b>Name:</b></font> {name}</div><div>Roll: {roll} </div><div><div>{class} </div><div>ID No :  {register_no} </div><div>Session&nbsp; : 2022</div></div><div><br></div><div><br style=\"color: rgb(238, 238, 238); background-color: rgb(56, 56, 56);\"></div></div>', '60.452', '93.856', 1, '80', '20', '20', '12', '12', 'name', 1, '2022-12-04 17:44:07'),
                                                                                                                                                                                                                                                                                     (2, 2, 'Examination', 1, 'w-bg.jpg', '', '', '<div style=\"text-align: center;\"><div style=\"\"><div style=\"\"><div style=\"text-align: center; margin-left: 25px;\"><div><b><span style=\"font-size: 28px;\">{institute_name}</span></b><br></div><div>{institute_email} | {mobileno}&nbsp;</div><div>{institute_address}</div><p style=\"text-align: left;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{student_photo}</p><div style=\"text-align: center;\"><b style=\"font-size: 18px;\">ADMIT CARD&nbsp; Year Final EXAMINATION-2022</b></div><div><span style=\"font-size: 18px;\"><b><br></b></span></div><table class=\"table table-bordered table-condensed mb-none\" style=\"width: 686.69px; text-align: start;\"><tbody><tr><td style=\"line-height: 1.42857;\"><b>Student Name:&nbsp;</b>{name}<br></td><td style=\"line-height: 1.42857;\"><b>Exam Name:&nbsp;</b>{exam_name}<br></td></tr><tr><td style=\"line-height: 1.42857;\"><b>Father\'s Name:&nbsp;</b>{father_name}<br></td><td style=\"line-height: 1.42857;\"><b>Class:&nbsp;</b>{class}<br></td></tr><tr><td style=\"line-height: 1.42857;\"><b>Gender:&nbsp;</b>{gender}<br></td><td style=\"line-height: 1.42857;\"><b>Roll:</b>&nbsp;{roll}<br></td></tr><tr><td style=\"line-height: 1.42857;\"><b>Date Of Birth:&nbsp;</b>{birthday}<br></td><td style=\"line-height: 1.42857;\"><b>Admission On:</b>&nbsp;{admission_date}<br></td></tr><tr><td style=\"line-height: 1.42857;\"><b>Email:&nbsp;</b>{email}<br></td><td style=\"line-height: 1.42857;\"><b>Student Group:&nbsp;</b>{category}<br></td></tr><tr><td style=\"line-height: 1.42857;\"><b>Contact No:&nbsp;</b>{mobileno}<br></td><td style=\"line-height: 1.42857;\"><b>Blood Group</b>: {blood_group}&nbsp;<br></td></tr></tbody></table><div style=\"\"><br><div style=\"text-align: left;\"><b>Subject Details :</b></div><div style=\"text-align: left;\"><span style=\"font-size: 18px;\">{subject_list_table}</span></div><div style=\"text-align: left; line-height: 1.2;\"><div style=\"text-align: justify; line-height: 1.2;\"><span style=\"text-align: left; color: rgb(34, 34, 34); font-size: 14px;\">পরীক্ষার নিয়মাবলীঃ</span><br></div><div style=\"text-align: center; line-height: 1.2;\"><span style=\"color: rgb(34, 34, 34); font-size: 12px; text-align: start;\"><div style=\"line-height: 1.2;\"><span style=\"font-size: 14px;\">* পরীক্ষার্থীকে অবশ্যই নির্ধারিত সময়ের ১৫মিঃ পূর্বে পরীক্ষার হলে উপস্থিত হতে হবে। * প্রবেশ পত্র ছাড়া পরীক্ষার&nbsp;হলে প্রবেশ করা যাবে না। * প্রবেশ পত্র ছাড়া কোন লিখিত কাগজ বা বই সঙ্গে আনতে পারবে না। * দুই ঘন্টার পূর্বে কোন পরীক্ষার্থী&nbsp;হল ত্যাগ করতে পারবে না।* পরীক্ষার্থ&nbsp;ীকে অবশ্যই কলম, কালি এবং জ্যামিতি বক্স সাথে রাখতে হবে। * প্রত্যেক পরীক মাদ্রাসার নিয়ম কানুন-মানিয়া চলিতে বাধ্য থাকবে। * কোন পরীক্ষাথীর&nbsp;কাছে অবৈধ কাগজ বা বইয়ের কপি খুঁজে পেলে পরীক্ষার হল থেকে তাকে বহিস্কার করা হবে। * অন্য কোন পরীক্ষার্থীর উত্তর পত্রের প্রতি তাকাইতে পারবে না। * পরীক্ষার্থীকে প্রত্যেক পরীক্ষার জন্য অবশ্যই হাজিরা দিতে হবে। * হল ছাড়িয়া যাইবার সময় পরিদর্শকের নিকট অবশ্যই উত্তরপত্র জমা দিতে হইবে।&nbsp;</span></div><div style=\"line-height: 1.4;\"><br></div></span></div></div><div><br></div><div>Date of Publication of&nbsp; Admit card : {print_date}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {signature}</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Principal Signature</div></div></div></div></div></div>', '297', '380', 1, '100', '80', '60', '80', '80', 'name', 1, '2022-12-04 17:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `certificates_templete`
--

CREATE TABLE `certificates_templete` (
                                         `id` int(11) NOT NULL,
                                         `name` varchar(255) NOT NULL,
                                         `user_type` tinyint(1) NOT NULL,
                                         `background` varchar(355) DEFAULT NULL,
                                         `logo` varchar(355) DEFAULT NULL,
                                         `signature` varchar(255) NOT NULL,
                                         `content` text NOT NULL,
                                         `page_layout` tinyint(1) NOT NULL,
                                         `photo_style` tinyint(1) NOT NULL,
                                         `photo_size` varchar(25) NOT NULL,
                                         `top_space` varchar(25) NOT NULL,
                                         `bottom_space` varchar(25) NOT NULL,
                                         `right_space` varchar(25) NOT NULL,
                                         `left_space` varchar(25) NOT NULL,
                                         `qr_code` varchar(25) NOT NULL,
                                         `branch_id` int(11) NOT NULL,
                                         `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `certificates_templete`
--

INSERT INTO `certificates_templete` (`id`, `name`, `user_type`, `background`, `logo`, `signature`, `content`, `page_layout`, `photo_style`, `photo_size`, `top_space`, `bottom_space`, `right_space`, `left_space`, `qr_code`, `branch_id`, `created_at`) VALUES
    (1, 'CERTIFICATE (A4 Landscape)', 1, 'certificate_bg.jpg', '', '', '<div style=\"text-align: center;\"><b style=\"\"><span style=\"font-size: 28px;\">{institute_name}</span><span style=\"font-size: 28px;\"> </span></b></div><div style=\"text-align: center;\">{institute_email} | {mobileno} </div><div style=\"text-align: center;\">{institute_address}</div><div style=\"text-align: center;\"><br></div><div style=\"text-align: center;\"><b>Registration No</b>: {register_no}                                              {student_photo}                                         <b>Admission On</b>: {admission_date}</div><div style=\"text-align: center;\"><br></div><div style=\"text-align: center;\"><span style=\"font-size: 24px;\"><b>SCHOOL CERTIFICATE EXAMINATION-2022</b></span></div><div style=\"text-align: center; line-height: 1.2;\"><span style=\"font-size: 24px;\"><b><br></b></span><div style=\"line-height: 1.2;\"><font face=\"Pinyon Script\"><span style=\"font-size: 28px;\">This Is To Certify That  <b>{name} </b>And Of He/she Is Gender As <b>{gender}</b> Son/daughter Of  <b>{father_name}</b> & <b>{mother_name}</b> Of <b>{institute_name}</b> And <b>{institute_address}</b> Bearing Roll- <b>{roll} </b>& Exam Center Campus-04 And Class <b>{class} </b>Dulg Passed The Final</span></font></div><div style=\"line-height: 1.2;\"><font face=\"Pinyon Script\"><span style=\"font-size: 28px;\">school Certificate Examination Of 2020  <b>{category}</b>  And His/her Date Of Birth As Recorded Is <b>{birthday}</b> Obtained  G.p.a <b>      </b> In The Scale Of        </span></font></div><div style=\"line-height: 1.2;\"><font face=\"Arial\"><br></font></div><div style=\"line-height: 1.2;\"><font face=\"Arial\"><br></font></div><div style=\"line-height: 1.2;\"><font face=\"Arial\">Date of Publication of Result: {print_date}                                                                                                                      </font><span style=\"font-family: Arial;\">Principal signature</span></div><div style=\"line-height: 1.2;\">                                                                                                                                                                                         {signature}<span style=\"font-family: Arial;\"><br></span></div><div style=\"line-height: 1.2;\"><font face=\"Arial\" style=\"\">                                             <br></font></div></div>', 2, 1, '100', '80', '80', '80', '80', 'register_no', 1, '2022-12-04 17:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
                         `id` int(11) NOT NULL,
                         `name` varchar(255) NOT NULL,
                         `name_numeric` varchar(255) NOT NULL,
                         `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                         `updated_at` datetime DEFAULT NULL,
                         `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`, `name_numeric`, `created_at`, `updated_at`, `branch_id`) VALUES
    (1, 'One', '1', '2022-12-04 17:52:28', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
                             `id` int(11) NOT NULL,
                             `name` varchar(255) DEFAULT NULL,
                             `number` varchar(255) DEFAULT NULL,
                             `type_id` int(11) DEFAULT NULL,
                             `date` date NOT NULL,
                             `assigned_id` int(11) DEFAULT NULL,
                             `action` varchar(255) NOT NULL,
                             `date_of_solution` date DEFAULT NULL,
                             `file` varchar(500) NOT NULL,
                             `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
                             `branch_id` int(11) NOT NULL,
                             `created_by` int(11) NOT NULL,
                             `created_at` datetime NOT NULL,
                             `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
                                  `id` int(11) NOT NULL,
                                  `name` varchar(255) NOT NULL,
                                  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE `custom_field` (
                                `id` int(11) NOT NULL,
                                `form_to` varchar(50) DEFAULT NULL,
                                `field_label` varchar(100) NOT NULL,
                                `default_value` text DEFAULT NULL,
                                `field_type` enum('text','textarea','dropdown','date','checkbox','number','url','email') NOT NULL,
                                `required` varchar(5) NOT NULL DEFAULT 'false',
                                `status` tinyint(4) NOT NULL DEFAULT 1,
                                `show_on_table` varchar(5) DEFAULT NULL,
                                `field_order` int(11) NOT NULL,
                                `bs_column` int(11) NOT NULL,
                                `branch_id` int(11) NOT NULL,
                                `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_online_values`
--

CREATE TABLE `custom_fields_online_values` (
                                               `id` int(11) NOT NULL,
                                               `relid` int(11) NOT NULL,
                                               `field_id` int(11) NOT NULL,
                                               `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_values`
--

CREATE TABLE `custom_fields_values` (
                                        `id` int(11) NOT NULL,
                                        `relid` int(11) NOT NULL,
                                        `field_id` int(11) NOT NULL,
                                        `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
                                `id` int(11) NOT NULL,
                                `email` varchar(255) DEFAULT NULL,
                                `protocol` varchar(255) NOT NULL,
                                `smtp_host` varchar(255) DEFAULT NULL,
                                `smtp_user` varchar(255) DEFAULT NULL,
                                `smtp_pass` varchar(255) DEFAULT NULL,
                                `smtp_port` varchar(100) DEFAULT NULL,
                                `smtp_encryption` varchar(10) DEFAULT NULL,
                                `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
                                   `id` int(11) NOT NULL,
                                   `name` varchar(255) NOT NULL,
                                   `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `tags`) VALUES
                                                         (1, 'account_registered', '{institute_name}, {name}, {login_username}, {password}, {user_role}, {login_url}'),
                                                         (2, 'forgot_password', '{institute_name}, {username}, {email}, {reset_url}'),
                                                         (3, 'change_password', '{institute_name}, {name}, {email}, {password}'),
                                                         (4, 'new_message_received', '{institute_name}, {recipient}, {message}, {message_url}'),
                                                         (5, 'payslip_generated', '{institute_name}, {username}, {month_year}, {payslip_url}'),
                                                         (6, 'award', '{institute_name}, {winner_name}, {award_name}, {gift_item}, {award_reason}, {given_date}'),
                                                         (7, 'leave_approve', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
                                                         (8, 'leave_reject', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
                                                         (9, 'advance_salary_approve', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}'),
                                                         (10, 'advance_salary_reject', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}'),
                                                         (11, 'apply_online_admission', '{institute_name}, {admission_id}, {applicant_name}, {applicant_mobile}, {class}, {section}, {apply_date}, {payment_url}, {admission_copy_url}, {paid_amount}'),
                                                         (12, 'student_admission', '{institute_name}, {academic_year}, {admission_date}, {admission_no}, {roll}, {category}, {student_name}, {student_mobile}, {class}, {section}, {login_username}, {password}, {login_url}');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_details`
--

CREATE TABLE `email_templates_details` (
                                           `id` int(11) NOT NULL,
                                           `template_id` int(11) NOT NULL,
                                           `subject` varchar(255) NOT NULL,
                                           `template_body` text NOT NULL,
                                           `notified` tinyint(1) NOT NULL DEFAULT 1,
                                           `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
                           `id` int(11) NOT NULL,
                           `name` varchar(255) NOT NULL,
                           `birthday` date DEFAULT NULL,
                           `gender` tinyint(1) DEFAULT 0,
                           `father_name` varchar(255) DEFAULT NULL,
                           `mother_name` varchar(255) DEFAULT NULL,
                           `mobile_no` varchar(255) NOT NULL,
                           `email` varchar(255) NOT NULL,
                           `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
                           `previous_school` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
                           `reference_id` int(11) NOT NULL,
                           `response_id` int(11) NOT NULL,
                           `response` varchar(255) NOT NULL,
                           `date` date NOT NULL,
                           `note` varchar(255) NOT NULL,
                           `assigned_id` int(11) NOT NULL,
                           `created_by` int(11) NOT NULL,
                           `no_of_child` float NOT NULL,
                           `class_id` int(11) NOT NULL,
                           `status` tinyint(1) NOT NULL DEFAULT 1,
                           `branch_id` int(11) NOT NULL,
                           `created_at` date NOT NULL,
                           `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_follow_up`
--

CREATE TABLE `enquiry_follow_up` (
                                     `id` int(11) NOT NULL,
                                     `enquiry_id` int(11) NOT NULL,
                                     `date` date NOT NULL,
                                     `next_date` date NOT NULL,
                                     `response` varchar(255) DEFAULT NULL,
                                     `status` tinyint(1) NOT NULL,
                                     `note` varchar(255) NOT NULL,
                                     `follow_up_by` int(11) NOT NULL,
                                     `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_reference`
--

CREATE TABLE `enquiry_reference` (
                                     `id` int(11) NOT NULL,
                                     `name` varchar(255) NOT NULL,
                                     `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_response`
--

CREATE TABLE `enquiry_response` (
                                    `id` int(11) NOT NULL,
                                    `name` varchar(255) NOT NULL,
                                    `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
                          `id` int(11) NOT NULL,
                          `student_id` int(11) NOT NULL,
                          `class_id` int(11) NOT NULL,
                          `section_id` int(11) NOT NULL,
                          `roll` int(11) NOT NULL,
                          `session_id` int(11) NOT NULL,
                          `branch_id` tinyint(3) NOT NULL,
                          `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                          `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
                         `id` int(11) NOT NULL,
                         `title` varchar(255) NOT NULL,
                         `remark` text NOT NULL,
                         `status` tinyint(1) NOT NULL,
                         `type` text NOT NULL,
                         `audition` longtext NOT NULL,
                         `selected_list` longtext NOT NULL,
                         `start_date` date DEFAULT NULL,
                         `end_date` date DEFAULT NULL,
                         `image` varchar(255) NOT NULL,
                         `created_by` varchar(200) NOT NULL,
                         `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                         `updated_at` datetime DEFAULT NULL,
                         `branch_id` int(11) DEFAULT NULL,
                         `show_web` tinyint(3) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
                               `id` int(11) NOT NULL,
                               `name` varchar(255) NOT NULL,
                               `icon` varchar(200) NOT NULL,
                               `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
                        `id` int(11) NOT NULL,
                        `name` longtext NOT NULL,
                        `term_id` int(11) DEFAULT NULL,
                        `type_id` tinyint(4) NOT NULL COMMENT '1=mark,2=gpa,3=both',
                        `session_id` int(11) NOT NULL,
                        `branch_id` int(11) DEFAULT NULL,
                        `remark` text NOT NULL,
                        `mark_distribution` text NOT NULL,
                        `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                        `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `name`, `term_id`, `type_id`, `session_id`, `branch_id`, `remark`, `mark_distribution`, `created_at`, `updated_at`) VALUES
    (1, 'Year Final 2022', 1, 3, 3, 1, '', '[\"1\",\"2\",\"3\"]', '2022-12-04 17:58:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_attendance`
--

CREATE TABLE `exam_attendance` (
                                   `id` int(11) NOT NULL,
                                   `student_id` int(11) NOT NULL,
                                   `exam_id` int(11) NOT NULL,
                                   `subject_id` int(11) NOT NULL,
                                   `status` varchar(4) DEFAULT NULL COMMENT 'P=Present, A=Absent, L=Late',
                                   `remark` varchar(255) DEFAULT NULL,
                                   `branch_id` int(11) DEFAULT NULL,
                                   `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                   `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `exam_hall`
--

CREATE TABLE `exam_hall` (
                             `id` int(11) NOT NULL,
                             `hall_no` longtext NOT NULL,
                             `seats` int(11) NOT NULL,
                             `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `exam_hall`
--

INSERT INTO `exam_hall` (`id`, `hall_no`, `seats`, `branch_id`) VALUES
    (1, '101', 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_mark_distribution`
--

CREATE TABLE `exam_mark_distribution` (
                                          `id` int(11) NOT NULL,
                                          `name` longtext NOT NULL,
                                          `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `exam_mark_distribution`
--

INSERT INTO `exam_mark_distribution` (`id`, `name`, `branch_id`) VALUES
                                                                     (1, 'Written', 1),
                                                                     (2, 'Objective', 1),
                                                                     (3, 'Practical', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_term`
--

CREATE TABLE `exam_term` (
                             `id` int(11) NOT NULL,
                             `name` longtext NOT NULL,
                             `branch_id` int(11) DEFAULT NULL,
                             `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `exam_term`
--

INSERT INTO `exam_term` (`id`, `name`, `branch_id`, `session_id`) VALUES
    (1, 'Final Exam', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fees_reminder`
--

CREATE TABLE `fees_reminder` (
                                 `id` int(11) NOT NULL,
                                 `frequency` varchar(255) NOT NULL,
                                 `days` varchar(20) NOT NULL,
                                 `message` text NOT NULL,
                                 `student` tinyint(3) NOT NULL,
                                 `guardian` tinyint(3) NOT NULL,
                                 `branch_id` int(11) NOT NULL,
                                 `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `fees_type`
--

CREATE TABLE `fees_type` (
                             `id` int(11) NOT NULL,
                             `name` varchar(255) NOT NULL,
                             `fee_code` varchar(255) NOT NULL,
                             `description` text NOT NULL,
                             `branch_id` int(11) NOT NULL DEFAULT 0,
                             `system` tinyint(4) NOT NULL DEFAULT 0,
                             `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `fee_allocation`
--

CREATE TABLE `fee_allocation` (
                                  `id` int(11) NOT NULL,
                                  `student_id` int(11) NOT NULL,
                                  `group_id` int(11) NOT NULL,
                                  `branch_id` int(11) NOT NULL,
                                  `session_id` int(11) NOT NULL,
                                  `prev_due` decimal(18,2) NOT NULL DEFAULT 0.00,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `fee_fine`
--

CREATE TABLE `fee_fine` (
                            `id` int(11) NOT NULL,
                            `group_id` int(11) NOT NULL,
                            `type_id` int(11) NOT NULL,
                            `fine_value` varchar(20) NOT NULL,
                            `fine_type` varchar(20) NOT NULL,
                            `fee_frequency` varchar(20) NOT NULL,
                            `branch_id` int(11) NOT NULL,
                            `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups`
--

CREATE TABLE `fee_groups` (
                              `id` int(11) NOT NULL,
                              `name` varchar(255) DEFAULT NULL,
                              `description` text DEFAULT NULL,
                              `session_id` int(11) NOT NULL,
                              `system` tinyint(4) NOT NULL DEFAULT 0,
                              `branch_id` int(11) NOT NULL,
                              `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups_details`
--

CREATE TABLE `fee_groups_details` (
                                      `id` int(11) NOT NULL,
                                      `fee_groups_id` int(11) NOT NULL,
                                      `fee_type_id` int(11) NOT NULL,
                                      `amount` decimal(18,2) NOT NULL,
                                      `due_date` date DEFAULT NULL,
                                      `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `fee_payment_history`
--

CREATE TABLE `fee_payment_history` (
                                       `id` int(11) NOT NULL,
                                       `allocation_id` int(11) NOT NULL,
                                       `type_id` int(11) NOT NULL,
                                       `collect_by` varchar(20) DEFAULT NULL,
                                       `amount` decimal(18,2) NOT NULL,
                                       `discount` decimal(18,2) NOT NULL,
                                       `fine` decimal(18,2) NOT NULL,
                                       `pay_via` varchar(20) NOT NULL,
                                       `remarks` longtext NOT NULL,
                                       `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_about`
--

CREATE TABLE `front_cms_about` (
                                   `id` int(11) NOT NULL,
                                   `title` varchar(255) DEFAULT NULL,
                                   `subtitle` varchar(255) DEFAULT NULL,
                                   `page_title` varchar(255) NOT NULL,
                                   `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
                                   `banner_image` varchar(255) DEFAULT NULL,
                                   `about_image` varchar(255) NOT NULL,
                                   `elements` mediumtext NOT NULL,
                                   `meta_description` text NOT NULL,
                                   `meta_keyword` text NOT NULL,
                                   `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_about`
--

INSERT INTO `front_cms_about` (`id`, `title`, `subtitle`, `page_title`, `content`, `banner_image`, `about_image`, `elements`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
    (1, 'Welcome to School', 'Best Education Mangment Systems', 'About Us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut volutpat rutrum eros amet sollicitudin interdum. Suspendisse pulvinar, velit nec pharetra interdum, ante tellus ornare mi, et mollis tellus neque vitae elit. Mauris adipiscing mauris fringilla turpis interdum sed pulvinar nisi malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n                        </p>\r\n                        <p>\r\n                            Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula. Mauris sit amet neque nec nunc gravida. \r\n                        </p>\r\n                        <div class=\"row\">\r\n                            <div class=\"col-sm-6 col-12\">\r\n                                <ul class=\"list-unstyled list-style-3\">\r\n                                    <li><a href=\"#\">Cardiothoracic Surgery</a></li>\r\n                                    <li><a href=\"#\">Cardiovascular Diseases</a></li>\r\n                                    <li><a href=\"#\">Ophthalmology</a></li>\r\n                                    <li><a href=\"#\">Dermitology</a></li>\r\n                                </ul>\r\n                            </div>\r\n                            <div class=\"col-sm-6 col-12\">\r\n                                <ul class=\"list-unstyled list-style-3\">\r\n                                    <li><a href=\"#\">Cardiothoracic Surgery</a></li>\r\n                                    <li><a href=\"#\">Cardiovascular Diseases</a></li>\r\n                                    <li><a href=\"#\">Ophthalmology</a></li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>', 'about1.jpg', 'about1.png', '{\"cta_title\":\"Get in touch to join our community\",\"button_text\":\"Contact Our Office\",\"button_url\":\"contact\"}', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_admission`
--

CREATE TABLE `front_cms_admission` (
                                       `id` int(11) NOT NULL,
                                       `title` varchar(255) DEFAULT NULL,
                                       `description` text DEFAULT NULL,
                                       `page_title` varchar(255) DEFAULT NULL,
                                       `terms_conditions_title` varchar(255) DEFAULT NULL,
                                       `terms_conditions_description` text NOT NULL,
                                       `fee_elements` text DEFAULT NULL,
                                       `banner_image` varchar(255) DEFAULT NULL,
                                       `meta_description` text NOT NULL,
                                       `meta_keyword` text NOT NULL,
                                       `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_admission`
--

INSERT INTO `front_cms_admission` (`id`, `title`, `description`, `page_title`, `terms_conditions_title`, `terms_conditions_description`, `fee_elements`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
    (1, 'Make An Admission', '<p>Lorem ipsum dolor sit amet, eum illum dolore concludaturque ex, ius latine adipisci no. Pro at nullam laboramus definitiones. Mandamusconceptam omittantur cu cum. Brute appetere it scriptorem ei eam, ne vim velit novum nominati. Causae volutpat percipitur at sed ne.</p>\r\n', 'Admission', '', '', '', 'admission1.jpg', 'Ramom - School Management System With CMS', 'Ramom  Admission Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_admitcard`
--

CREATE TABLE `front_cms_admitcard` (
                                       `id` int(11) NOT NULL,
                                       `page_title` varchar(255) DEFAULT NULL,
                                       `templete_id` int(11) NOT NULL,
                                       `banner_image` varchar(255) DEFAULT NULL,
                                       `description` text NOT NULL,
                                       `meta_description` text NOT NULL,
                                       `meta_keyword` text NOT NULL,
                                       `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_admitcard`
--

INSERT INTO `front_cms_admitcard` (`id`, `page_title`, `templete_id`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
    (1, 'Admit Card', 1, 'admit_card1.jpg', 'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.', 'Ramom - School Management System With CMS', 'Ramom Admit Card Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_certificates`
--

CREATE TABLE `front_cms_certificates` (
                                          `id` int(11) NOT NULL,
                                          `page_title` varchar(255) DEFAULT NULL,
                                          `banner_image` varchar(255) DEFAULT NULL,
                                          `description` text NOT NULL,
                                          `meta_description` text NOT NULL,
                                          `meta_keyword` text NOT NULL,
                                          `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_certificates`
--

INSERT INTO `front_cms_certificates` (`id`, `page_title`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
    (1, 'Certificates', 'certificates1.jpg', 'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.', 'Ramom - School Management System With CMS', 'Ramom Admit Card Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_contact`
--

CREATE TABLE `front_cms_contact` (
                                     `id` int(11) NOT NULL,
                                     `box_title` varchar(255) DEFAULT NULL,
                                     `box_description` varchar(500) DEFAULT NULL,
                                     `box_image` varchar(255) DEFAULT NULL,
                                     `form_title` varchar(355) DEFAULT NULL,
                                     `address` varchar(355) DEFAULT NULL,
                                     `phone` varchar(355) DEFAULT NULL,
                                     `email` varchar(355) DEFAULT NULL,
                                     `submit_text` varchar(355) NOT NULL,
                                     `map_iframe` text DEFAULT NULL,
                                     `page_title` varchar(255) NOT NULL,
                                     `banner_image` varchar(255) DEFAULT NULL,
                                     `meta_description` text NOT NULL,
                                     `meta_keyword` text NOT NULL,
                                     `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_contact`
--

INSERT INTO `front_cms_contact` (`id`, `box_title`, `box_description`, `box_image`, `form_title`, `address`, `phone`, `email`, `submit_text`, `map_iframe`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
    (1, 'WE\'D LOVE TO HEAR FROM YOU', 'Fusce convallis diam vitae velit tempus rutrum. Donec nisl nisl, vulputate eu sapien sed, adipiscing vehicula massa. Mauris eget commodo neque, id molestie enim.', 'contact-info-box1.png', 'Get in touch by filling the form below', '4896  Romrog Way, LOS ANGELES,\r\nCalifornia', '954-648-1802, \r\n963-612-1782', 'info@example.com\r\nsupport@example.com', 'Send', '<iframe width=\"100%\" height=\"350\" id=\"gmap_canvas\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3313.3833161665298!2d-118.03745848530627!3d33.85401093559897!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80dd2c6c97f8f3ed%3A0x47b1bde165dcc056!2sOak+Dr%2C+La+Palma%2C+CA+90623%2C+USA!5e0!3m2!1sen!2sbd!4v1544238752504\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\"></iframe>', 'Contact Us', 'contact1.jpg', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_events`
--

     CREATE TABLE `front_cms_events` (
     `id` int(11) NOT NULL,
     `title` varchar(255) NOT NULL,
     `description` text NOT NULL,
     `page_title` varchar(255) DEFAULT NULL,
     `banner_image` varchar(255) DEFAULT NULL,
     `meta_description` text NOT NULL,
     `meta_keyword` text NOT NULL,
     `branch_id` int(11) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_events`
--

INSERT INTO `front_cms_events` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
    (1, 'Upcoming Events', '<div class=\"col-md-12 text-center\" style=\"width: 1170px; font-family: Karla, sans-serif;\"><h1 style=\"margin-top: 0px; font-size: 2em; font-family: &quot;Siyam Rupali&quot;; font-weight: 700;\">সুবর্ণজয়ন্তী কর্ণার</h1></div><div class=\"col-md-12\" style=\"width: 1170px; font-family: Karla, sans-serif; text-align: center;\"><div class=\"headline\" style=\"border-top: 1px solid rgb(204, 204, 204); border-bottom: 1px solid rgb(204, 204, 204); background: rgb(221, 221, 221); padding: 5px; font-size: 17px; font-weight: bold;\">বঙ্গবন্ধুর ৭ই মার্চের ভাষণ</div><div class=\"row\" style=\"margin-top: 5px;\"><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/1.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/2.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/3.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div></div></div><div class=\"col-md-12\" style=\"width: 1170px; font-family: Karla, sans-serif; text-align: center; margin-top: 20px;\"><div class=\"headline\" style=\"border-top: 1px solid rgb(204, 204, 204); border-bottom: 1px solid rgb(204, 204, 204); background: rgb(221, 221, 221); padding: 5px; font-size: 17px; font-weight: bold;\">সাত জন বীরশ্রেষ্ঠ</div><div class=\"row\" style=\"margin-top: 5px;\"><div class=\"col-md-১২\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/Seven-Bir-Shreshtha.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div></div></div><div class=\"col-md-12\" style=\"width: 1170px; font-family: Karla, sans-serif; text-align: center; margin-top: 20px;\"><div class=\"headline\" style=\"border-top: 1px solid rgb(204, 204, 204); border-bottom: 1px solid rgb(204, 204, 204); background: rgb(221, 221, 221); padding: 5px; font-size: 17px; font-weight: bold;\">ভিডিও চিত্র</div><div class=\"row\" style=\"margin-top: 5px;\"><div class=\"col-md-4\" style=\"width: 390px;\"><iframe width=\"350\" height=\"200\" src=\"https://www.youtube.com/embed/XFG0i1cv2zY\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe></div><div class=\"col-md-4\" style=\"width: 390px;\"><iframe width=\"350\" height=\"200\" src=\"https://www.youtube.com/embed/188hvm_fW7E\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe></div><div class=\"col-md-4\" style=\"width: 390px;\"><iframe width=\"350\" height=\"200\" src=\"https://www.youtube.com/embed/CUD9sNkt2RI\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe></div><div class=\"col-md-4\" style=\"width: 390px;\"><iframe width=\"350\" height=\"200\" src=\"https://www.youtube.com/embed/6IdCJTs4VwE\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe></div><div class=\"col-md-4\" style=\"width: 390px;\"><iframe width=\"350\" height=\"200\" src=\"https://www.youtube.com/embed/PFCrooJ4CaA\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe></div><div class=\"col-md-4\" style=\"width: 390px;\"><iframe width=\"350\" height=\"200\" src=\"https://www.youtube.com/embed/8k-zVwskPHw\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe></div></div></div><div class=\"col-md-12\" style=\"width: 1170px; font-family: Karla, sans-serif; text-align: center; margin-top: 20px;\"><div class=\"headline\" style=\"border-top: 1px solid rgb(204, 204, 204); border-bottom: 1px solid rgb(204, 204, 204); background: rgb(221, 221, 221); padding: 5px; font-size: 17px; font-weight: bold;\">মুক্তিযুদ্ধের স্থিরচিত্র</div><div class=\"row\" style=\"margin-top: 5px;\"><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/4.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/5.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/6.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div></div><div class=\"row\"><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/7.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/8.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/9.webp\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div></div><div class=\"row\"><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/10.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/11.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/12.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div></div><div class=\"row\"><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/13.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/14.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/15.webp\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div></div><div class=\"row\"><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/16.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/17.jpeg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div><div class=\"col-md-4\" style=\"width: 390px;\"><img class=\"courser\" src=\"https://rapid.com.bd/resource/education_management/golden_jubilee/18.jpg\" alt=\"\" style=\"max-width: 100%; height: auto; cursor: url(&quot;https://rapid.com.bd/resource/education_management/golden_jubilee/mujib.cur&quot;), auto;\"></div></div></div>', 'Events', 'events1.jpg', 'Ramom - School Management System With CMS', 'Ramom Events Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_exam_results`
--

CREATE TABLE `front_cms_exam_results` (
                                          `id` int(11) NOT NULL,
                                          `page_title` varchar(255) DEFAULT NULL,
                                          `grade_scale` tinyint(1) NOT NULL,
                                          `attendance` tinyint(1) NOT NULL,
                                          `banner_image` varchar(255) DEFAULT NULL,
                                          `description` text NOT NULL,
                                          `meta_description` text NOT NULL,
                                          `meta_keyword` text NOT NULL,
                                          `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_exam_results`
--

INSERT INTO `front_cms_exam_results` (`id`, `page_title`, `grade_scale`, `attendance`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
    (1, 'Exam Results', 1, 1, 'exam_results1.jpg', 'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.', 'Ramom - School Management System With CMS', 'Ramom Admit Card Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq`
--

CREATE TABLE `front_cms_faq` (
                                 `id` int(11) NOT NULL,
                                 `title` varchar(255) DEFAULT NULL,
                                 `description` text DEFAULT NULL,
                                 `page_title` varchar(255) DEFAULT NULL,
                                 `banner_image` varchar(255) DEFAULT NULL,
                                 `meta_description` text NOT NULL,
                                 `meta_keyword` text NOT NULL,
                                 `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_faq`
--

INSERT INTO `front_cms_faq` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
    (1, 'Frequently Asked Questions', '<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p>\r\n\r\n<p>Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</p>', 'Faq', 'faq1.jpg', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq_list`
--

CREATE TABLE `front_cms_faq_list` (
                                      `id` int(11) NOT NULL,
                                      `title` varchar(255) DEFAULT NULL,
                                      `description` text DEFAULT NULL,
                                      `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_faq_list`
--

INSERT INTO `front_cms_faq_list` (`id`, `title`, `description`, `branch_id`) VALUES
                                                                                 (1, 'Any Information you provide on applications for disability, life or accidental insurance ?', '<p>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\r\n</p>\r\n<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>\r\n<li>Sed do eiusmod tempor incididunt ut labore et dolore magna aliq.</li>\r\n<li>Ut enim ad minim veniam, quis nostrud exercitation ullamco quat. It is a long established fact.</li>\r\n<li>That a reader will be distracted by the readable content of a page when looking at its layout.</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>\r\n<li>Eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</li>\r\n<li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n<li>Readable content of a page when looking at its layout.</li>\r\n<li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n<li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n</ul>', 1),
                                                                                 (2, 'Readable content of a page when looking at its layout ?', '<p>\r\n                                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\r\n                            </p>\r\n                            <ol>\r\n                                <li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n                                <li>Readable content of a page when looking at its layout.</li>\r\n                                <li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n                                <li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n                            </ol>\r\n                            <p>\r\n                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.\r\n                            </p>', 1),
(3, 'Opposed to using \'Content here, content here\', making it look like readable English ?', '<p>\r\n                                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\r\n                            </p>\r\n                            <ol>\r\n                                <li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n                                <li>Readable content of a page when looking at its layout.</li>\r\n                                <li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n                                <li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n                            </ol>\r\n                            <p>\r\n                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.\r\n                            </p>', 1),
                                                                                 (4, 'Readable content of a page when looking at its layout ?', '<p>\r\n                                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\r\n                            </p>\r\n                            <ol>\r\n                                <li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n                                <li>Readable content of a page when looking at its layout.</li>\r\n                                <li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n                                <li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n                            </ol>\r\n                            <p>\r\n                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.\r\n                            </p>', 1),
(5, 'What types of documents are required to travel?', '<p><strong>Lorem ipsum</strong> dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis. Sea ocurreret principes ne. At nonumy aperiri pri, nam quodsi copiosae intellegebat et, ex deserunt euripidis usu. Per ad ullum lobortis. Duo volutpat imperdiet ut, postea salutatus imperdiet ut per, ad utinam debitis invenire has.</p>\r\n\r\n<ol>\r\n	<li>labores explicari qui</li>\r\n	<li>labores explicari qui</li>\r\n	<li>labores explicari quilabores explicari qui</li>\r\n	<li>labores explicari qui</li>\r\n</ol>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_gallery`
--

CREATE TABLE `front_cms_gallery` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_gallery`
--

INSERT INTO `front_cms_gallery` (`id`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Gallery', 'gallery1.jpg', 'Ramom - School Management System With CMS', 'Ramom Gallery  Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_gallery_category`
--

CREATE TABLE `front_cms_gallery_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_gallery_category`
--

INSERT INTO `front_cms_gallery_category` (`id`, `name`, `branch_id`) VALUES
(1, 'catagory', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_gallery_content`
--

CREATE TABLE `front_cms_gallery_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb_image` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `elements` longtext NOT NULL,
  `show_web` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_gallery_content`
--

INSERT INTO `front_cms_gallery_content` (`id`, `title`, `alias`, `description`, `thumb_image`, `date`, `category_id`, `added_by`, `file_type`, `elements`, `show_web`, `branch_id`, `created_at`) VALUES
(1, 'lover', 'lover', 'dsf', 'gallery-1670181107.jpg', '2022-12-05', 1, 1, '', '{\"1\":{\"image\":\"album-1670181166.jpg\",\"type\":\"1\",\"video_url\":null,\"date\":\"2022-12-05 01:12:46\"}}', 1, 1, '2022-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home`
--

CREATE TABLE `front_cms_home` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `item_type` varchar(20) NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `elements` mediumtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `active` tinyint(3) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_home`
--

INSERT INTO `front_cms_home` (`id`, `title`, `subtitle`, `item_type`, `description`, `elements`, `branch_id`, `active`) VALUES
                                                                                                                            (1, 'প্রতিষ্ঠানের ইতিহাস', NULL, 'wellcome', '১৯৭৯  সালে প্রতিষ্ঠিত মঙলকান্দি ইসলামিয়া ফাযিল (ডিগ্রি) মাদ্রাসা  এর ধারাবাহিক সাফল্যে এলাকাবসীর দাবী ও শিক্ষার্থীদের চাহিদার প্রেক্ষিতে ডিজিটাল বাংলাদেশ গড়ার প্রত্যয়ে প্রতিষ্ঠিত করা হয়েছে। এই প্রতিষ্ঠানটি বর্তমানে কুমিল্লা জেলার অন্যতম শিক্ষা প্রতিষ্ঠানে পরিনত হয়েছে। এটি প্রতিষ্ঠানের পরিচালকবৃন্দ, শিক্ষকবৃন্দ, অভিভাবকবৃন্দ, শিক্ষার্থীদের ও সর্বোপরি এলাকাবাসীর সমন্বিত প্রচেষ্টার ফল। এলাকাবাসীর সেবার মনোভাব নিয়ে মান সম্পন্ন শিক্ষা প্রসারে এবং কৃতিত্বপূর্ণ ফল অর্জন করে এই প্রতিষ্ঠানটি ইতিমধ্যে একটি স্থান করে নিয়েছে। প্রতিষ্ঠানের সার্বিক ক্ষেত্রে সফলতার জন্য মানুষের মাঝে এক ধরনের চাহিদা সৃষ্টি হওয়ায় তাঁরা তাঁদের কোমলমতি ছেলে মেয়েদের এই প্রতিষ্ঠানে পড়াশুনা করাতে যথেষ্ট আগ্রহী হয়ে উঠেছেন। প্রতিষ্ঠানের সাফল্যে অভিভাকগণের মধ্যে ইতিবাচক প্রভাব ছাড়াও বিভিন্ন পর্যায়ে বেশ প্রসংশনীয় অবদান রাখছে। সবকিছুর মূলে রয়েছে প্রতিষ্ঠানের অটুট শৃঙ্খলা, শিক্ষকগণের একাগ্রতা, শিক্ষক-শিক্ষার্থী ও অভিভাবকগণের মধ্যে সমন্বয় সাধন। শিক্ষার্থীদেরকে উপযুক্তভাবে গড়ে তোলাই আমাদের লক্ষ্য। এই লক্ষ্য বাস্তবায়নের জন্য আমাদের রয়েছে বিরামহীন চেষ্টা ও পরিকল্পনা।', '{\"image\":\"wellcome1.png\"}', 1, 1),
                                                                                                                            (2, 'সভাপতির বাণী', NULL, 'teachers', 'পড়! তোমার রবের নামে যিনি সৃষ্টি করেছেন (সূরা-আল্লাক্ব :১)। ডিজিটাল বাংলাদেশ গড়ার লক্ষ্যে মাদরাসা শিক্ষা শিক্ষাব্যবস্থাকে বেগবান ও আধুনিকায়ন করতে মাল্টিমিডিয়া ক্লাসসহ বিভিন্ন স্তরে তথ্য-প্রযুক্তি যে অবদান রাখছে তার জন্য বর্তমান গণপ্রজাতন্ত্রী বাংলাদেশ সরকার তথা মাননীয় প্রধানমন্ত্রী ও শিক্ষামন্ত্রীসহ সংশ্লিষ্ট সকলকে  জানাই আন্তরিক মোবারকবাদ। দেশের দ্বিমুখী শিক্ষা ব্যবস্থার প্রেক্ষাপটে ইসলামী ও আধুনিক শিক্ষার বাস্তব সমন্বয় সাধন কারে সঠিক ইসলামী আদর্শের বুনিয়াদে ১৩৭৯ সালে মাদরাসাটির শুভ সূচনা করেন আমার পিতা মরহুম অধ্যাপকা মাওলানা মুহাম্মদ ইয়াছীন। তারপর কালের বিবর্তনে মহান আল্লাহ্র মেহেরবাণীতে আজ তা পত্র-পল্লবে সুশোভিত হয়ে বিরাট মহীরূহে পরিণত হয়েছে। যাদের প্রচেষ্টা, অনুপ্রেরণা ও সহযোগিতায় মঙ্গলকান্দি ইসলামিয়া ফাজিল মাদরাসা বর্তমান অবস্থানে পৌঁছেছে এবং এগিয়ে চলেছে, বিশেষ করে গভর্ণিং বডির সম্মানিত সদস্যবৃন্দ, শিক্ষকম-লী, ছাত্র-ছাত্রী, অভিভাবক, এলাকাবাসী ও সর্বস্তরের জনগণ, তাঁদের সকলকে কৃতজ্ঞতারসহিত আন্তরিক মুবারকবাদ জ্ঞাপন করছি । ইসলামী জীবনদর্শ, সংস্কৃতি, ঐতিহ্য, মূল্যবোধ, অর্থনীতি ও সমাজনীতি ইত্যাদি ক্ষেত্রে মসলিম সন্তানদেরকে আদর্শ নাগরিক রূপে গড়ে তোলা, বিশেষ করে নৈতিক অবক্ষয় থেকে তরুন সমাজকে রক্ষা ও নারীকে পরিপূর্ণ দ্বীনি শিক্ষায় শিক্ষিত করে চারিত্রি উৎকর্ষ ও মূল্যবোধ তৈরীর বাস্তব উদ্যোগই হোক এ প্রতিষ্ঠানের দায়বদ্ধতা -এ দোয়াই করছি আমিন।', '{\"teacher_start\":null,\"image\":\"featured-parallax1.png\"}', 1, 1),
                                                                                                                            (3, 'WHY CHOOSE US', NULL, 'services', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '', 1, 1),
                                                                                                                            (4, 'Our Facebook Page', 'Medical Services', 'cta', '', '{\"mobile_no\":\"https:\\/\\/www.facebook.com\\/profile.php?id=100063965958469\",\"button_text\":null,\"button_url\":null}', 1, 1),
                                                                                                                            (5, '#', NULL, 'slider', '#', '{\"position\":\"c-left\",\"button_text1\":\"#\",\"button_url1\":\"#\",\"button_text2\":\"#\",\"button_url2\":\"#\",\"image\":\"home-slider-1592582779.jpg\"}', 1, 1),
                                                                                                                            (6, '#', NULL, 'slider', '#', '{\"position\":\"c-left\",\"button_text1\":\"#\",\"button_url1\":\"#\",\"button_text2\":\"#\",\"button_url2\":\"#\",\"image\":\"home-slider-1592582805.jpg\"}', 1, 1),
                                                                                                                            (7, 'Online Classes', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-video\"}', 1, 1),
                                                                                                                            (8, 'Scholarship', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-graduation-cap\"}', 1, 1),
                                                                                                                            (9, 'Books & Liberary', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-book-reader\"}', 1, 1),
                                                                                                                            (10, 'Trending Courses', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fab fa-discourse\"}', 1, 1),
                                                                                                                            (11, 'WHAT PEOPLE SAYS', NULL, 'testimonial', 'Fusce sem dolor, interdum in efficitur at, faucibus nec lorem. Sed nec molestie justo.', '', 1, 1),
                                                                                                                            (12, 'অধ্যক্ষের বাণী', NULL, 'statistics', 'প্রিয়,\r\nসচেতন অভিভাকবৃন্দ।\r\nমানব জাতির সূচনা লগ্ন থেকে প্রাকৃতিক পরিবেশ ও বাস্তব অভিজ্ঞতা থেকে মানুষ প্রতিনিয়ত জ্ঞান ও কৌশল আয়ত্ব করে চলছে। আর শত সহস্র বছরের সঞ্চিত ও অর্জিত জ্ঞান শেখানো হয় শিক্ষা প্রতিষ্ঠানে। যুগের প্রয়োজনে মানবের কল্যাণে সমাজ হিতৈষী ব্যক্তিরা কখনো কখনো শিক্ষা প্রতিষ্ঠানের ভূমিকায় অবতীর্ণ হন। এমনিই ভাবেই দক্ষ, অভিজ্ঞ, জ্ঞানে সু-গভীর ও বিদ্যানুরাগী এক মহাপুরুষ মরহুম অধ্যাপক মাওলানা মোঃ ইয়াছীন সাহেবও ভবিষ্যৎ প্রজন্মকে দক্ষ, যোগ্য, আদর্শ ও সুনাগরিক রূপে গড়ে তোলার অভিপ্রায় নিয়ে এলাকাবাসীর সহযোগিতায়, কুমিল্লা জেলার তিতাস উপজেলাধীন সাতানী ইউনিয়নস্থ মঙ্গলকান্দি গ্রামে প্রাকৃতিক ও সু-নিবিড় পরিবেশে মানসম্মত ধর্মীয় ও আধুনিক বিদ্যাপীঠ হিসাবে ১৯৭৯ খ্রিস্টাব্দে প্রতিষ্ঠা করেছেন মঙ্গলকান্দি ইসলামিয়া ফাযিল (ডিগ্রি) মাদ্রাসা। সঠিক ধর্মীয়, নৈতিক শিক্ষা ও যুগোপযোগী আধুনিক শিক্ষার সমন্বয়ে বর্তমানে প্রতিষ্ঠানটি গুনগত ও মানসম্মত শিক্ষাদানে সক্ষম। বর্তমান সরকারের শিক্ষা বিষয়ক নির্দেশনা ও সার্বিক তত্ত্বাবধানে শিক্ষকবৃন্দের ঐকান্তিক প্রচেষ্টায়, শিক্ষার্থীদের নিরলস অধ্যয়ন ও অধ্যবসায় এবং অভিভাবক ও সংশ্লিষ্ট সকলের সম্মিলিত পরামর্শে প্রতিষ্ঠানটি ক্রমান্বয়ে কামিল (মাস্টার্স) পর্যন্ত উন্নীত হবে ইনশাআল্লাহ্। আল্লাহ তা’য়ালা এই প্রতিষ্ঠানটিকে সঠিক ইসলাম ও আধুনিক বিজ্ঞান সম্মত শিক্ষার মারকায হিসাবে কবুল করে নিন। আমিন!!!', '{\"image\":\"counter-parallax1.png\",\"widget_title_1\":\"\\u0985\\u09a8\\u09b2\\u09be\\u0987\\u09a8 \\u09ad\\u09b0\\u09cd\\u09a4\\u09bf\",\"widget_icon_1\":\"http:\\/\\/horizondb.xyz\\/home\\/admission\",\"type_1\":null,\"widget_title_2\":\"\\u09aa\\u09b0\\u09bf\\u0995\\u09cd\\u09b7\\u09be \\u098f\\u09a1\\u09ae\\u09bf\\u099f \\u0995\\u09be\\u09b0\\u09cd\\u09a1\",\"widget_icon_2\":\"http:\\/\\/horizondb.xyz\\/home\\/admit_card\",\"type_2\":null,\"widget_title_3\":\"\\u09b8\\u09be\\u09b0\\u09cd\\u099f\\u09bf\\u09ab\\u09bf\\u0995\\u09c7\\u099f\",\"widget_icon_3\":\"http:\\/\\/horizondb.xyz\\/home\\/certificates\",\"type_3\":null,\"widget_title_4\":\"\\u09b0\\u09c7\\u099c\\u09be\\u09b2\\u09cd\\u099f (\\u09ae\\u0999\\u09cd\\u0997\\u09b2\\u0995\\u09be\\u09a8\\u09cd\\u09a6\\u09bf \\u0987\\u09b8\\u09b2\\u09be\\u09ae\\u09bf\\u09df\\u09be \\u09ab\\u09be\\u099c\\u09bf\\u09b2 \\u09ae\\u09be\\u09a6\\u09cd\\u09b0\\u09be\\u09b8\\u09be)\",\"widget_icon_4\":\"#\",\"type_4\":null,\"widget_title_5\":\"\",\"widget_icon_5\":\"\",\"type_5\":null,\"widget_title_6\":\"\\u0987\\u09b8\\u09b2\\u09be\\u09ae\\u09bf\\u0995 \\u09ac\\u0987\",\"widget_icon_6\":\"https:\\/\\/www.islamicboisomahar.in\\/2017\\/04\\/blog-post_10.html\",\"type_6\":null,\"widget_title_7\":\"\\u09b8\\u09bf\\u09b2\\u09c7\\u09ac\\u09be\\u09b8 (BMEB)\",\"widget_icon_7\":\"http:\\/\\/bmeb.gov.bd\\/site\\/view\\/commondoc\\/Syllabus and Marks Distribution\",\"type_7\":null,\"widget_title_8\":\"\\u09b8\\u09bf\\u09b2\\u09c7\\u09ac\\u09be\\u09b8 (IAU)\",\"widget_icon_8\":\"https:\\/\\/iau.edu.bd\\/notice\\/academic\\/\",\"type_8\":null,\"widget_title_9\":\"\\u09a6\\u09be\\u0996\\u09bf\\u09b2 \\u09b8\\u09cd\\u09a4\\u09b0\",\"widget_icon_9\":\"#\",\"type_9\":null,\"widget_title_10\":\"\\u0987\\u09ac\\u09a4\\u09c7\\u09a6\\u09be\\u09df\\u09bf \\u09b8\\u09cd\\u09a4\\u09b0\",\"widget_icon_10\":\"#\",\"type_10\":null,\"widget_title_11\":\"\\u09ad\\u09b0\\u09cd\\u09a4\\u09bf \\u09a4\\u09a5\\u09cd\\u09af\",\"widget_icon_11\":\"#\",\"type_11\":null,\"widget_title_12\":\"\\u09ad\\u09b0\\u09cd\\u09a4\\u09bf \\u09ab\\u09b0\\u09ae\",\"widget_icon_12\":\"#\",\"type_12\":null,\"widget_title_13\":\"\\u09ab\\u099f\\u09cb\\u0997\\u09cd\\u09af\\u09be\\u09b2\\u09be\\u09b0\\u09c0\",\"widget_icon_13\":\"#\",\"type_13\":null,\"widget_title_14\":\"\\u09ad\\u09bf\\u09a1\\u09bf\\u0993 \\u0997\\u09cd\\u09af\\u09be\\u09b2\\u09be\\u09b0\\u09c0\",\"widget_icon_14\":\"#\",\"type_14\":null,\"widget_title_15\":\"\",\"widget_icon_15\":\"\",\"type_15\":null,\"widget_title_16\":\"\\u09a8\\u09cb\\u099f\\u09bf\\u09b6 (\\u0987\\u09b8\\u09b2\\u09be\\u09ae\\u09bf \\u0986\\u09b0\\u09ac\\u09bf \\u09ac\\u09bf\\u09b6\\u09cd\\u09ac\\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09be\\u09b2\\u09df)\",\"widget_icon_16\":\"https:\\/\\/iau.edu.bd\\/notice\\/\",\"type_16\":null,\"widget_title_17\":\"http:\\/\\/www.dme.gov.bd\\/site\\/view\\/notices\",\"widget_icon_17\":\"\\u09a8\\u09cb\\u099f\\u09bf\\u09b6 (\\u09ae\\u09be\\u09a6\\u09cd\\u09b0\\u09be\\u09be\\u09b8\\u09be \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09be \\u0985\\u09a7\\u09bf\\u09a6\\u09aa\\u09cd\\u09a4\\u09b0)\",\"type_17\":null,\"widget_title_18\":\"\\u09a8\\u09cb\\u099f\\u09bf\\u09b6 (\\u09ac\\u09be\\u0982\\u09b2\\u09be\\u09a6\\u09c7\\u09b6 \\u09ae\\u09be\\u09a6\\u09cd\\u09b0\\u09be\\u09b8\\u09be \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09be \\u09ac\\u09cb\\u09b0\\u09cd\\u09a1)\",\"widget_icon_18\":\"http:\\/\\/www.bmeb.gov.bd\\/site\\/view\\/notices\",\"type_18\":null,\"widget_title_19\":\"\\u09a8\\u09cb\\u099f\\u09bf\\u09b6 (\\u0989\\u09aa\\u09ac\\u09c3\\u09a4\\u09cd\\u09a4\\u09bf)\",\"widget_icon_19\":\"http:\\/\\/www.pmeat.gov.bd\\/site\\/view\\/notices\",\"type_19\":null,\"widget_title_20\":\"\\u09a8\\u09cb\\u099f\\u09bf\\u09b6 (\\u098f\\u09a8\\u099f\\u09bf\\u0986\\u09b0\\u09b8\\u09bf\\u098f)\",\"widget_icon_20\":\"http:\\/\\/www.ntrca.gov.bd\\/site\\/view\\/notices\",\"type_20\":null,\"widget_title_21\":\"\",\"widget_icon_21\":\"\",\"type_21\":null}', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home_seo`
--

CREATE TABLE `front_cms_home_seo` (
                                      `id` int(11) NOT NULL,
                                      `page_title` varchar(255) NOT NULL,
                                      `meta_keyword` text NOT NULL,
                                      `meta_description` text NOT NULL,
                                      `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_home_seo`
--

INSERT INTO `front_cms_home_seo` (`id`, `page_title`, `meta_keyword`, `meta_description`, `branch_id`) VALUES
    (1, 'Home', 'Ramom  Home Page', 'Ramom - School Management System With CMS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu`
--

CREATE TABLE `front_cms_menu` (
                                  `id` int(11) NOT NULL,
                                  `title` varchar(100) NOT NULL,
                                  `alias` varchar(100) NOT NULL,
                                  `ordering` int(11) NOT NULL,
                                  `parent_id` int(11) DEFAULT 0,
                                  `open_new_tab` int(11) NOT NULL DEFAULT 0,
                                  `ext_url` tinyint(3) NOT NULL DEFAULT 0,
                                  `ext_url_address` text DEFAULT NULL,
                                  `publish` tinyint(3) NOT NULL,
                                  `system` tinyint(3) NOT NULL,
                                  `branch_id` int(11) NOT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_menu`
--

INSERT INTO `front_cms_menu` (`id`, `title`, `alias`, `ordering`, `parent_id`, `open_new_tab`, `ext_url`, `ext_url_address`, `publish`, `system`, `branch_id`, `created_at`) VALUES
                                                                                                                                                                                 (1, 'Home', 'index', 1, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
                                                                                                                                                                                 (2, 'Events', 'events', 3, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
                                                                                                                                                                                 (3, 'Teachers', 'teachers', 2, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
                                                                                                                                                                                 (6, 'Online Admission', 'admission', 6, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
                                                                                                                                                                                 (8, 'Pages', 'pages', 8, 0, 0, 1, '#', 1, 1, 0, '2019-08-09 12:18:54'),
                                                                                                                                                                                 (9, 'Admit Card', 'admit_card', 10, 8, 0, 0, '', 1, 1, 0, '2021-03-16 04:24:32'),
                                                                                                                                                                                 (10, 'Exam Results', 'exam_results', 11, 8, 0, 0, '', 1, 1, 0, '2021-03-16 04:24:32'),
                                                                                                                                                                                 (13, 'Certificates', 'certificates', 14, 8, 0, 0, '', 1, 1, 0, '2021-03-21 12:04:44'),
                                                                                                                                                                                 (14, 'Gallery', 'gallery', 7, 0, 0, 0, '', 1, 1, 0, '2021-03-21 12:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu_visible`
--

CREATE TABLE `front_cms_menu_visible` (
                                          `id` int(11) NOT NULL,
                                          `name` varchar(100) DEFAULT NULL,
                                          `menu_id` int(11) NOT NULL,
                                          `parent_id` varchar(11) DEFAULT NULL,
                                          `ordering` varchar(20) DEFAULT NULL,
                                          `invisible` tinyint(2) NOT NULL DEFAULT 1,
                                          `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_menu_visible`
--

INSERT INTO `front_cms_menu_visible` (`id`, `name`, `menu_id`, `parent_id`, `ordering`, `invisible`, `branch_id`) VALUES
                                                                                                                      (1, 'প্রচ্ছদ', 1, '0', '1', 0, 1),
                                                                                                                      (2, 'সুবর্ণজয়ন্তী কর্ণার', 2, '0', '3', 0, 1),
                                                                                                                      (3, 'Contact Us', 7, '0', '9', 0, 1),
                                                                                                                      (4, 'শিক্ষক মন্ডলি', 3, '0', '2', 0, 1),
                                                                                                                      (5, NULL, 4, NULL, NULL, 1, 1),
                                                                                                                      (6, NULL, 5, NULL, NULL, 1, 1),
                                                                                                                      (7, 'পরিক্ষা সংক্রান্ত', 8, NULL, '8', 0, 1),
                                                                                                                      (8, 'অনলাইন ভর্তি', 6, '0', '6', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
                                   `id` int(11) NOT NULL,
                                   `page_title` varchar(255) NOT NULL,
                                   `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
                                   `menu_id` int(11) NOT NULL,
                                   `banner_image` varchar(255) DEFAULT NULL,
                                   `meta_description` text NOT NULL,
                                   `meta_keyword` text NOT NULL,
                                   `branch_id` int(11) NOT NULL,
                                   `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_pages`
--

INSERT INTO `front_cms_pages` (`id`, `page_title`, `content`, `menu_id`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`, `created_at`) VALUES
    (2, 'demo', '<p>hiiiii</p>', 16, 'page_16.png', '', '', 1, '2022-12-05 15:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services`
--

CREATE TABLE `front_cms_services` (
                                      `id` int(11) NOT NULL,
                                      `title` varchar(255) DEFAULT NULL,
                                      `subtitle` varchar(255) DEFAULT NULL,
                                      `parallax_image` varchar(255) DEFAULT NULL,
                                      `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_services`
--

INSERT INTO `front_cms_services` (`id`, `title`, `subtitle`, `parallax_image`, `branch_id`) VALUES
    (1, 'Get Well Soon', 'Our Best <span>Services</span>', 'service_parallax1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services_list`
--

CREATE TABLE `front_cms_services_list` (
                                           `id` int(11) NOT NULL,
                                           `title` varchar(255) DEFAULT NULL,
                                           `description` text DEFAULT NULL,
                                           `icon` varchar(255) DEFAULT NULL,
                                           `image` varchar(255) DEFAULT NULL,
                                           `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_services_list`
--

INSERT INTO `front_cms_services_list` (`id`, `title`, `description`, `icon`, `image`, `branch_id`) VALUES
                                                                                                       (1, 'Online Course Facilities', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.', NULL, 'home-service-1670252988.png', 1),
                                                                                                       (2, 'Modern Book Library', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover.', NULL, 'home-service-1670262238.jpg', 1),
                                                                                                       (3, 'Be Industrial Leader', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model.', 'fas fa-industry', NULL, 1),
                                                                                                       (4, 'Programming Courses', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will.', 'fas fa-code', NULL, 1),
                                                                                                       (5, 'Foreign Languages', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover.', 'fas fa-language', NULL, 1),
                                                                                                       (6, 'Alumni Directory', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a for \'lorem ipsum\' will uncover.', 'fas fa-user-graduate', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_setting`
--

CREATE TABLE `front_cms_setting` (
                                     `id` int(11) NOT NULL,
                                     `application_title` varchar(255) NOT NULL,
                                     `url_alias` varchar(255) DEFAULT NULL,
                                     `cms_active` tinyint(4) NOT NULL DEFAULT 0,
                                     `online_admission` tinyint(4) NOT NULL DEFAULT 0,
                                     `theme` varchar(255) NOT NULL,
                                     `captcha_status` varchar(20) NOT NULL,
                                     `recaptcha_site_key` varchar(255) NOT NULL,
                                     `recaptcha_secret_key` varchar(255) NOT NULL,
                                     `address` varchar(350) NOT NULL,
                                     `mobile_no` varchar(60) NOT NULL,
                                     `fax` varchar(60) NOT NULL,
                                     `receive_contact_email` varchar(255) NOT NULL,
                                     `email` varchar(60) NOT NULL,
                                     `copyright_text` varchar(255) NOT NULL,
                                     `fav_icon` varchar(255) NOT NULL,
                                     `logo` varchar(255) NOT NULL,
                                     `footer_about_text` varchar(300) NOT NULL,
                                     `working_hours` varchar(300) NOT NULL,
                                     `facebook_url` varchar(100) NOT NULL,
                                     `twitter_url` varchar(100) NOT NULL,
                                     `youtube_url` varchar(100) NOT NULL,
                                     `google_plus` varchar(100) NOT NULL,
                                     `linkedin_url` varchar(100) NOT NULL,
                                     `pinterest_url` varchar(100) NOT NULL,
                                     `instagram_url` varchar(100) NOT NULL,
                                     `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_setting`
--

INSERT INTO `front_cms_setting` (`id`, `application_title`, `url_alias`, `cms_active`, `online_admission`, `theme`, `captcha_status`, `recaptcha_site_key`, `recaptcha_secret_key`, `address`, `mobile_no`, `fax`, `receive_contact_email`, `email`, `copyright_text`, `fav_icon`, `logo`, `footer_about_text`, `working_hours`, `facebook_url`, `twitter_url`, `youtube_url`, `google_plus`, `linkedin_url`, `pinterest_url`, `instagram_url`, `branch_id`) VALUES
    (1, 'Mongalkandi Islamia Kamil Madrasah', 'mkm', 1, 1, 'blue', 'disable', '', '', 'Gazipur,Titas,Cumilla.', '01830747554', '01830747554', 'admin@gmail.com', 'admin@gmail.com', 'Copyright © 2022 <span>Edusofto</span>. All Rights Reserved.', 'fav_icon1.png', 'logo1.png', '.', '<span>Hours : </span>  Mon To Fri - 10AM - 04PM,  Sunday Closed', 'https://facebook.com', 'https://twitter.com', 'https://youtube.com', 'https://google.com', 'https://linkedin.com', 'https://pinterest.com', 'https://instagram.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_teachers`
--

CREATE TABLE `front_cms_teachers` (
                                      `id` int(11) NOT NULL,
                                      `page_title` varchar(255) DEFAULT NULL,
                                      `banner_image` varchar(255) DEFAULT NULL,
                                      `meta_description` text NOT NULL,
                                      `meta_keyword` text NOT NULL,
                                      `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_teachers`
--

INSERT INTO `front_cms_teachers` (`id`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
    (1, 'Teachers', 'teachers1.jpg', 'Ramom - School Management System With CMS', 'Ramom  Teachers Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_testimonial`
--

CREATE TABLE `front_cms_testimonial` (
                                         `id` int(11) NOT NULL,
                                         `name` varchar(255) NOT NULL,
                                         `surname` varchar(355) NOT NULL,
                                         `image` varchar(255) NOT NULL,
                                         `description` text NOT NULL,
                                         `rank` int(5) NOT NULL,
                                         `branch_id` int(11) NOT NULL,
                                         `created_by` int(11) NOT NULL,
                                         `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_testimonial`
--

INSERT INTO `front_cms_testimonial` (`id`, `name`, `surname`, `image`, `description`, `rank`, `branch_id`, `created_by`, `created_at`) VALUES
                                                                                                                                           (1, 'শিক্ষা মন্ত্রণালয়', 'https://www.moedu.gov.bd/', 'defualt.png', 'Intexure have done an excellent job presenting the analysis & insights. I am confident in saying  have helped encounter  is to be welcomed and every pain avoided”.', 1, 1, 1, '2019-08-23 12:26:42'),
                                                                                                                                           (2, 'মাদ্রাসা শিক্ষা অধিদপ্তর', 'http://www.dme.gov.bd/', 'defualt.png', '“Owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted always holds”.', 4, 1, 1, '2019-08-23 12:26:42'),
                                                                                                                                           (3, 'ইসলামি আরবী বিশ্ববিদ্যালয়', 'http://iau.edu.bd/', 'defualt.png', '“Intexure have done an excellent job presenting the analysis & insights. I am confident in saying  have helped encounter  is to be welcomed and every pain avoided”.', 5, 1, 1, '2019-08-23 12:26:42'),
                                                                                                                                           (4, 'বাংলাদেশ মাদ্রাসা শিক্ষা বোর্ড', 'http://www.bmeb.gov.bd/', 'defualt.png', '“Owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted always holds”.', 3, 1, 1, '2019-08-23 12:26:42'),
                                                                                                                                           (5, 'প্রধানমন্ত্রীর শিক্ষা সহায়তা ট্রাস্ট', 'http://www.pmeat.gov.bd/', 'defualt.png', '“Owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted always holds”.', 4, 1, 1, '2019-08-23 12:26:42'),
                                                                                                                                           (6, '(এনটিআরসিএ)', 'http://www.ntrca.gov.bd/', '', '', 0, 1, 1, '2022-12-04 18:25:24'),
                                                                                                                                           (7, 'তিতাস উপজেলা', 'http://titas.comilla.gov.bd/', '', '', 0, 1, 1, '2022-12-04 18:25:51'),
                                                                                                                                           (8, 'সকল অনলাইন পত্রিকা', 'https://www.w3newspapers.com/bangladesh/', '', '', 0, 1, 1, '2022-12-04 18:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
                                   `id` int(11) NOT NULL,
                                   `institute_name` varchar(255) NOT NULL,
                                   `institution_code` varchar(255) NOT NULL,
                                   `reg_prefix` varchar(255) NOT NULL,
                                   `institute_email` varchar(100) NOT NULL,
                                   `address` text NOT NULL,
                                   `mobileno` varchar(100) NOT NULL,
                                   `currency` varchar(100) NOT NULL,
                                   `currency_symbol` varchar(100) NOT NULL,
                                   `sms_service_provider` varchar(100) NOT NULL,
                                   `session_id` int(11) NOT NULL,
                                   `translation` varchar(100) NOT NULL,
                                   `footer_text` varchar(255) NOT NULL,
                                   `animations` varchar(100) NOT NULL,
                                   `timezone` varchar(100) NOT NULL,
                                   `date_format` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
                                   `facebook_url` varchar(255) NOT NULL,
                                   `twitter_url` varchar(255) NOT NULL,
                                   `linkedin_url` varchar(255) NOT NULL,
                                   `youtube_url` varchar(255) NOT NULL,
                                   `cron_secret_key` varchar(255) DEFAULT NULL,
                                   `preloader_backend` tinyint(1) NOT NULL DEFAULT 1,
                                   `cms_default_branch` int(11) NOT NULL,
                                   `image_extension` text DEFAULT NULL,
                                   `image_size` float NOT NULL DEFAULT 1024,
                                   `file_extension` text DEFAULT NULL,
                                   `file_size` float NOT NULL DEFAULT 1024,
                                   `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                   `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `institute_name`, `institution_code`, `reg_prefix`, `institute_email`, `address`, `mobileno`, `currency`, `currency_symbol`, `sms_service_provider`, `session_id`, `translation`, `footer_text`, `animations`, `timezone`, `date_format`, `facebook_url`, `twitter_url`, `linkedin_url`, `youtube_url`, `cron_secret_key`, `preloader_backend`, `cms_default_branch`, `image_extension`, `image_size`, `file_extension`, `file_size`, `created_at`, `updated_at`) VALUES
    (1, 'Mongalkandi Islamia Kamil Madrasah', '', '0', 'ramom@example.com', 'Dhaka,Bangladesh', '01830747554', 'BDT', 'Tk', 'disabled', 3, 'english', '© 2022 EduSofto School Management - Developed by Edusofto', 'fadeInLeft', 'Asia/Dhaka', 'd.M.Y', '', '', '', '', '', 2, 1, 'jpeg, jpg, bmp, png', 1024, 'txt, pdf, doc, xls, docx, xlsx, jpg, jpeg, png, gif, bmp, zip, mp4, 7z, wmv, rar', 1024, '2018-10-22 09:07:49', '2020-05-01 22:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
                         `id` int(11) NOT NULL,
                         `name` varchar(255) NOT NULL,
                         `grade_point` varchar(255) NOT NULL,
                         `lower_mark` int(11) NOT NULL,
                         `upper_mark` int(11) NOT NULL,
                         `remark` text NOT NULL,
                         `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `hall_allocation`
--

CREATE TABLE `hall_allocation` (
                                   `id` int(11) NOT NULL,
                                   `student_id` int(11) NOT NULL,
                                   `hall_no` int(11) NOT NULL,
                                   `class_id` int(11) NOT NULL,
                                   `section_id` int(11) NOT NULL,
                                   `exam_id` int(11) NOT NULL,
                                   `branch_id` int(11) NOT NULL,
                                   `session_id` int(11) NOT NULL,
                                   `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
                            `id` int(11) NOT NULL,
                            `class_id` int(11) NOT NULL,
                            `section_id` int(11) NOT NULL,
                            `session_id` int(11) NOT NULL,
                            `subject_id` int(11) NOT NULL,
                            `date_of_homework` date NOT NULL,
                            `date_of_submission` date NOT NULL,
                            `description` text NOT NULL,
                            `created_by` int(11) NOT NULL,
                            `create_date` date NOT NULL,
                            `status` varchar(10) NOT NULL,
                            `sms_notification` tinyint(2) NOT NULL,
                            `schedule_date` date DEFAULT NULL,
                            `document` varchar(255) NOT NULL,
                            `evaluation_date` date DEFAULT NULL,
                            `evaluated_by` int(11) NOT NULL,
                            `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `homework_evaluation`
--

CREATE TABLE `homework_evaluation` (
                                       `id` int(11) NOT NULL,
                                       `homework_id` int(11) NOT NULL,
                                       `student_id` int(11) NOT NULL,
                                       `remark` text NOT NULL,
                                       `rank` int(11) NOT NULL,
                                       `date` date NOT NULL,
                                       `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `homework_submit`
--

CREATE TABLE `homework_submit` (
                                   `id` int(11) NOT NULL,
                                   `homework_id` int(11) NOT NULL,
                                   `student_id` int(11) NOT NULL,
                                   `message` varchar(355) NOT NULL,
                                   `enc_name` varchar(355) DEFAULT NULL,
                                   `file_name` varchar(355) DEFAULT NULL,
                                   `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
                          `id` int(11) NOT NULL,
                          `name` longtext NOT NULL,
                          `category_id` int(11) NOT NULL,
                          `address` longtext NOT NULL,
                          `watchman` longtext NOT NULL,
                          `remarks` longtext DEFAULT NULL,
                          `branch_id` int(11) DEFAULT 0,
                          `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                          `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_category`
--

CREATE TABLE `hostel_category` (
                                   `id` int(11) NOT NULL,
                                   `name` longtext NOT NULL,
                                   `description` longtext DEFAULT NULL,
                                   `branch_id` int(11) DEFAULT NULL,
                                   `type` text DEFAULT NULL,
                                   `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                   `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_room`
--

CREATE TABLE `hostel_room` (
                               `id` int(11) NOT NULL,
                               `name` longtext NOT NULL,
                               `hostel_id` int(11) NOT NULL,
                               `no_beds` int(11) NOT NULL,
                               `category_id` int(11) DEFAULT NULL,
                               `bed_fee` decimal(18,2) NOT NULL,
                               `remarks` longtext NOT NULL,
                               `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
                             `id` int(11) NOT NULL,
                             `word` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
                             `english` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
                             `bengali` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `word`, `english`, `bengali`) VALUES
                                                                 (1, 'language', 'Language', 'ভাষা'),
                                                                 (2, 'attendance_overview', 'Attendance Overview', 'উপস্থিতি পরিদর্শন'),
                                                                 (3, 'annual_fee_summary', 'Annual Fee Summary', 'বার্ষিক ফি সংক্ষিপ্ত বিবরণ'),
                                                                 (4, 'my_annual_attendance_overview', 'My Annual Attendance Overview', 'আমার বার্ষিক উপস্থিতি পরিদর্শন'),
                                                                 (5, 'schedule', 'Schedule', 'সময়সূচী'),
                                                                 (6, 'student_admission', 'Student Admission', 'ছাত্র ভর্তি'),
                                                                 (7, 'returned', 'Returned', 'ফেরৎ'),
                                                                 (8, 'user_name', 'User Name', 'ব্যবহারকারীর নাম'),
                                                                 (9, 'rejected', 'Rejected', 'প্রত্যাখ্যাত'),
                                                                 (10, 'route_name', 'Route Name', 'রুট নাম'),
                                                                 (11, 'route_fare', 'Route Fare', 'রুট ভাড়া'),
                                                                 (12, 'edit_route', 'Edit Route', 'সম্পাদন করা রুট'),
                                                                 (13, 'this_value_is_required', 'This value is required.', 'এই মান প্রয়োজন'),
                                                                 (14, 'vehicle_no', 'Vehicle No', 'যানবাহন নং'),
                                                                 (15, 'insurance_renewal_date', 'Insurance Renewal Date', 'বীমা নবায়ন তারিখ'),
                                                                 (16, 'driver_name', 'Driver Name', 'ড্রাইভারের নাম'),
                                                                 (17, 'driver_license', 'Driver License', 'চালকের অনুমোদন'),
                                                                 (18, 'select_route', 'Select Route', 'রুট নির্বাচন করুন'),
                                                                 (19, 'edit_vehicle', 'Edit Vehicle', 'যানবাহন সম্পাদনা করুন'),
                                                                 (20, 'add_students', 'Add Students', 'ছাত্রদের যোগ করুন'),
                                                                 (21, 'vehicle_number', 'Vehicle Number', 'যানবাহন সংখ্যা'),
                                                                 (22, 'select_route_first', 'Select Route First', 'রুট প্রথম নির্বাচন করুন'),
                                                                 (23, 'transport_fee', 'Transport Fee', 'পরিবহন ফি'),
                                                                 (24, 'control', 'Control', 'নিয়ন্ত্রণ'),
                                                                 (25, 'set_students', 'Set Students', 'ছাত্রদের সেট করুন'),
                                                                 (26, 'hostel_list', 'Hostel List', 'হোস্টেল তালিকা'),
                                                                 (27, 'watchman_name', 'Watchman Name', 'ওয়াচম্যান নাম'),
                                                                 (28, 'hostel_address', 'Hostel Address', 'হোস্টেল ঠিকানা'),
                                                                 (29, 'edit_hostel', 'Edit Hostel', 'হোস্টেল সম্পাদনা করুন'),
                                                                 (30, 'room_name', 'Room Name', 'রুমের নাম'),
                                                                 (31, 'no_of_beds', 'No Of Beds', 'শয্যা সংখ্যা'),
                                                                 (32, 'select_hostel_first', 'Select Hostel First', 'হোস্টেল প্রথম নির্বাচন করুন'),
                                                                 (33, 'remaining', 'Remaining', 'অবশিষ্ট'),
                                                                 (34, 'hostel_fee', 'Hostel Fee', 'হোস্টেল ফি'),
                                                                 (35, 'accountant_list', 'Accountant List', 'অ্যাকাউন্টেন্ট তালিকা'),
                                                                 (36, 'students_fees', 'Students Fees', 'ছাত্র ফি'),
                                                                 (37, 'fees_status', 'Fees Status', 'ফি স্থিতি'),
                                                                 (38, 'books', 'Books', 'বই'),
                                                                 (39, 'home_page', 'Home Page', 'হোম পেজ'),
                                                                 (40, 'collected', 'Collected', 'সংগৃহীত'),
                                                                 (41, 'student_mark', 'Student Mark', 'ছাত্র মার্ক'),
                                                                 (42, 'select_exam_first', 'Select Exam First', 'নির্বাচন প্রথম নির্বাচন করুন'),
                                                                 (43, 'transport_details', 'Transport Details', 'পরিবহন বিবরণ'),
                                                                 (44, 'no_of_teacher', 'No of Teacher', 'শিক্ষকের সংখ্যা'),
                                                                 (45, 'basic_details', 'Basic Details', 'মৌলিক বিবরণ'),
                                                                 (46, 'fee_progress', 'Fee Progress', 'ফি অগ্রগতি'),
                                                                 (47, 'word', 'Word', 'শব্দ'),
                                                                 (48, 'book_category', 'Book Category', 'বই বিভাগ'),
                                                                 (49, 'driver_phone', 'Driver Phone', 'ড্রাইভার ফোন'),
                                                                 (50, 'invalid_csv_file', 'Invalid / Corrupted CSV File', 'অবৈধ / দূষিত CSV ফাইল'),
                                                                 (51, 'requested_book_list', 'Requested Book List', 'অনুরোধকৃত বইয়ের তালিকা'),
                                                                 (52, 'request_status', 'Request Status', 'অনুরোধ স্থিতি'),
                                                                 (53, 'book_request', 'Book Request', 'বইয়ের অনুরোধ'),
                                                                 (54, 'logout', 'Logout', 'প্রস্থান'),
                                                                 (55, 'select_payment_method', 'Select Payment Method', 'পেমেন্ট পদ্ধতি নির্বাচন করুন'),
                                                                 (56, 'select_method', 'Select Method', 'পদ্ধতি নির্বাচন করুন'),
                                                                 (57, 'payment', 'Payment', 'প্রদান'),
                                                                 (58, 'filter', 'Filter', 'ছাঁকনি'),
                                                                 (59, 'status', 'Status', 'অবস্থা'),
                                                                 (60, 'paid', 'Paid', 'অর্থ প্রদান'),
                                                                 (61, 'unpaid', 'Unpaid', 'অবৈতনিক'),
                                                                 (62, 'method', 'Method', 'পদ্ধতি'),
                                                                 (63, 'cash', 'Cash', 'নগদ'),
                                                                 (64, 'check', 'Check', 'চেক'),
                                                                 (65, 'card', 'Card', 'কার্ড'),
                                                                 (66, 'payment_history', 'Payment History', 'অর্থ প্রদান ইতিহাস'),
                                                                 (67, 'category', 'Category', 'বিভাগ'),
                                                                 (68, 'book_list', 'Book List', 'পাঠ্যতালিকা'),
                                                                 (69, 'author', 'Author', 'লেখক'),
                                                                 (70, 'price', 'Price', 'মূল্য'),
                                                                 (71, 'available', 'Available', 'সহজলভ্য'),
                                                                 (72, 'unavailable', 'Unavailable', 'অপ্রাপ্য'),
                                                                 (73, 'transport_list', 'Transport List', 'পরিবহন তালিকা'),
                                                                 (74, 'edit_transport', 'Edit Transport', 'পরিবহন সম্পাদনা'),
                                                                 (75, 'hostel_name', 'Hostel Name', 'হোস্টেল নাম'),
                                                                 (76, 'number_of_room', 'Hostel Of Room', 'রুম নম্বর'),
                                                                 (77, 'yes', 'Yes', 'হাঁ'),
                                                                 (78, 'no', 'No', 'না'),
                                                                 (79, 'messages', 'Messages', 'বার্তা'),
                                                                 (80, 'compose', 'Compose', 'নতুন বার্তা লিখতে'),
                                                                 (81, 'recipient', 'Recipient', 'প্রাপক'),
                                                                 (82, 'select_a_user', 'Select A User', 'নির্বাচন একটি ব্যবহারকারী'),
                                                                 (83, 'send', 'Send', 'পাঠান'),
                                                                 (84, 'global_settings', 'Global Settings', 'সার্বজনীন নির্ধারণ'),
                                                                 (85, 'currency', 'Currency', 'মুদ্রা'),
                                                                 (86, 'system_email', 'System Email', 'সিস্টেম ইমেইল'),
                                                                 (87, 'create', 'Create', 'সৃষ্টি'),
                                                                 (88, 'save', 'Save', 'সংরক্ষণ করুন'),
                                                                 (89, 'file', 'File', 'ফাইল'),
                                                                 (90, 'theme_settings', 'Theme Settings', 'থিম সেটিংস'),
                                                                 (91, 'default', 'Default', 'ডিফল্ট'),
                                                                 (92, 'select_theme', 'Select Theme', 'থিম নির্বাচন কর'),
                                                                 (93, 'upload_logo', 'Upload Logo', 'লোগো আপলোড করুন'),
                                                                 (94, 'upload', 'Upload', 'আপলোড'),
                                                                 (95, 'remember', 'Remember', 'স্মরণ করা'),
                                                                 (96, 'not_selected', 'Not Selected', 'অনির্বাচিত'),
                                                                 (97, 'disabled', 'Disabled', 'অক্ষম'),
                                                                 (98, 'inactive_account', 'Inactive Account', 'নিষ্ক্রিয় অ্যাকাউন্ট'),
                                                                 (99, 'update_translations', 'Update Translations', 'আপডেট অনুবাদ'),
                                                                 (100, 'language_list', 'Language List', 'নতুন ভাষাটি তালিকায় আগে'),
                                                                 (101, 'option', 'Option', 'পছন্দ'),
                                                                 (102, 'edit_word', 'Edit Word', 'শব্দ সম্পাদনা করুন'),
                                                                 (103, 'update_profile', 'Update Profile', 'প্রফাইল হালনাগাদ'),
                                                                 (104, 'current_password', 'Current Password', 'বর্তমান পাসওয়ার্ড'),
                                                                 (105, 'new_password', 'New Password', 'নতুন পাসওয়ার্ড'),
                                                                 (106, 'login', 'Login', 'লগইন'),
                                                                 (107, 'reset_password', 'Reset Password', 'পাসওয়ার্ড রিসেট করুন'),
                                                                 (108, 'present', 'Present', 'হাজির'),
                                                                 (109, 'absent', 'Absent', 'অনুপস্থিত'),
                                                                 (110, 'update_attendance', 'Update Attendance', 'আপডেট এ্যাটেনডেন্স'),
                                                                 (111, 'undefined', 'Undefined', 'অনির্দিষ্ট'),
                                                                 (112, 'back', 'Back', 'পিছনে'),
                                                                 (113, 'save_changes', 'Save Changes', 'পরিবর্তনগুলোর সংরক্ষন'),
                                                                 (114, 'uploader', 'Uploader', 'আপলোডার'),
                                                                 (115, 'download', 'Download', 'ডাউনলোড'),
                                                                 (116, 'remove', 'Remove', 'অপসারণ'),
                                                                 (117, 'print', 'Print', 'ছাপানো'),
                                                                 (118, 'select_file_type', 'Select File Type', 'নির্বাচন ফাইল টাইপ'),
                                                                 (119, 'excel', 'Excel', 'সীমা অতিক্রম করা'),
                                                                 (120, 'other', 'Other', 'অন্যান্য'),
                                                                 (121, 'students_of_class', 'Students Of Class', 'ক্লাস ছাত্রদের'),
                                                                 (122, 'marks_obtained', 'Marks Obtained', 'প্রাপ্ত নম্বর'),
                                                                 (123, 'attendance_for_class', 'Attendance For Class', 'এ্যাটেনডেন্স বর্গ জন্য'),
                                                                 (124, 'receiver', 'Receiver', 'গ্রাহক'),
                                                                 (125, 'please_select_receiver', 'Please Select Receiver', 'দয়া করে রিসিভার নির্বাচন'),
                                                                 (126, 'session_changed', 'Session Changed', 'সেশন পরিবর্তিত'),
                                                                 (127, 'exam_marks', 'Exam Marks', 'পরীক্ষার মার্কস'),
                                                                 (128, 'total_mark', 'Total Mark', 'মোট মার্ক'),
                                                                 (129, 'mark_obtained', 'Mark Obtained', 'মার্ক প্রাপ্ত'),
                                                                 (130, 'invoice/payment_list', 'Invoice / Payment List', 'ইনভয়েস / পেমেন্ট তালিকা'),
                                                                 (131, 'obtained_marks', 'Obtained Marks', 'প্রাপ্ত মার্কস'),
                                                                 (132, 'highest_mark', 'Highest Mark', 'সর্বোচ্চ মার্ক'),
                                                                 (133, 'grade', 'Grade (GPA)', 'শ্রেণী'),
                                                                 (134, 'dashboard', 'Dashboard', 'ড্যাশবোর্ড'),
                                                                 (135, 'student', 'Student', 'ছাত্র'),
                                                                 (136, 'rename', 'Rename', 'নামান্তর'),
                                                                 (137, 'class', 'Class', 'শ্রেণী'),
                                                                 (138, 'teacher', 'Teacher', 'শিক্ষক'),
                                                                 (139, 'parents', 'Parents', 'মাতাপিতা'),
                                                                 (140, 'subject', 'Subject', 'বিষয়'),
                                                                 (141, 'student_attendance', 'Student Attendance', 'ছাত্র উপস্থিতি'),
                                                                 (142, 'exam_list', 'Exam List', 'পরীক্ষার তালিকা'),
                                                                 (143, 'grades_range', 'Grades Range', 'গ্রেড পরিসীমা'),
                                                                 (144, 'loading', 'Loading', 'বোঝাই'),
                                                                 (145, 'library', 'Library', 'লাইব্রেরি'),
                                                                 (146, 'hostel', 'Hostel', 'ছাত্রাবাস'),
                                                                 (147, 'events', 'Events', 'সূচনাফলক'),
                                                                 (148, 'message', 'Message', 'বার্তা'),
                                                                 (149, 'translations', 'Translations', 'অনুবাদের'),
                                                                 (150, 'account', 'Account', 'হিসাব'),
                                                                 (151, 'selected_session', 'Selected Session', 'নির্বাচিত সেশন'),
                                                                 (152, 'change_password', 'Change Password', 'পাসওয়ার্ড পরিবর্তন করুন'),
                                                                 (153, 'section', 'Section', 'অধ্যায়'),
                                                                 (154, 'edit', 'Edit', 'সম্পাদন করা'),
                                                                 (155, 'delete', 'Delete', 'মুছে ফেলা'),
                                                                 (156, 'cancel', 'Cancel', 'বাতিল'),
                                                                 (157, 'parent', 'Parent', 'মাতা'),
                                                                 (158, 'attendance', 'Attendance', 'উপস্থিতি'),
                                                                 (159, 'addmission_form', 'Admission Form', 'ভর্তির ফর্ম'),
                                                                 (160, 'name', 'Name', 'নাম'),
                                                                 (161, 'select', 'Select', 'নির্বাচন করা'),
                                                                 (162, 'roll', 'Roll', 'রোল'),
                                                                 (163, 'birthday', 'Date Of Birth', 'জন্ম তারিখ'),
                                                                 (164, 'gender', 'Gender', 'লিঙ্গ'),
                                                                 (165, 'male', 'Male', 'পুরুষ'),
                                                                 (166, 'female', 'Female', 'মহিলা'),
                                                                 (167, 'address', 'Address', 'ঠিকানা'),
                                                                 (168, 'phone', 'Phone', 'ফোন'),
                                                                 (169, 'email', 'Email', 'ই-মেইল'),
                                                                 (170, 'password', 'Password', 'পাসওয়ার্ড'),
                                                                 (171, 'transport_route', 'Transport Route', 'পরিবহন রুট'),
                                                                 (172, 'photo', 'Photo', 'ছবি'),
                                                                 (173, 'select_class', 'Select Class', 'ক্লাস নির্বাচন'),
                                                                 (174, 'username_password_incorrect', 'Username Or Password Is Incorrect', 'ব্যাবহারকারীর নাম অথবা গোপন নাম্বারটি ভুল'),
                                                                 (175, 'select_section', 'Select Section', 'অনুচ্ছেদ নির্বাচন'),
                                                                 (176, 'options', 'Options', 'বিকল্প'),
                                                                 (177, 'mark_sheet', 'Mark Sheet', 'নাম্বার শিট'),
                                                                 (178, 'profile', 'Profile', 'প্রোফাইলে'),
                                                                 (179, 'select_all', 'Select All', 'সবগুলো নির্বাচন করা'),
                                                                 (180, 'select_none', 'Select None', 'কিছুই না'),
                                                                 (181, 'average', 'Average', 'গড়'),
                                                                 (182, 'transfer', 'Transfer', 'হস্তান্তর'),
                                                                 (183, 'edit_teacher', 'Edit Teacher', 'গুরু সম্পাদনা'),
                                                                 (184, 'sex', 'Sex', 'লিঙ্গ'),
                                                                 (185, 'marksheet_for', 'Marksheet For', 'মার্ক শীট'),
                                                                 (186, 'total_marks', 'Total Marks', 'মোট মার্কস'),
                                                                 (187, 'parent_phone', 'Parent Phone', 'পেরেন্ট ফোন'),
                                                                 (188, 'subject_author', 'Subject Author', 'বিষয় লেখক'),
                                                                 (189, 'update', 'Update', 'হালনাগাদ'),
                                                                 (190, 'class_list', 'Class List', 'ক্লাস তালিকা'),
                                                                 (191, 'class_name', 'Class Name', 'শ্রেণির নাম'),
                                                                 (192, 'name_numeric', 'Name Numeric', 'নাম সংখ্যাসূচক'),
                                                                 (193, 'select_teacher', 'Select Teacher', 'গুরু নির্বাচন'),
                                                                 (194, 'edit_class', 'Edit Class', 'ক্লাস সম্পাদনা'),
                                                                 (195, 'section_name', 'Section Name', 'অনুচ্ছেদ নাম'),
                                                                 (196, 'add_section', 'Add Section', 'অনুচ্ছেদ যোগ'),
                                                                 (197, 'subject_list', 'Subject List', 'বিষয় তালিকা'),
                                                                 (198, 'subject_name', 'Subject Name', 'বিষয় নাম'),
                                                                 (199, 'edit_subject', 'Edit Subject', 'বিষয় সম্পাদনা'),
                                                                 (200, 'day', 'Day', 'দিন'),
                                                                 (201, 'starting_time', 'Starting Time', 'সময় শুরু'),
                                                                 (202, 'hour', 'Hour', 'ঘন্টা'),
                                                                 (203, 'minutes', 'Minutes', 'মিনিট'),
                                                                 (204, 'ending_time', 'Ending Time', 'সময় শেষ'),
                                                                 (205, 'select_subject', 'Select Subject', 'বিষয় নির্বাচন করুন'),
                                                                 (206, 'select_date', 'Select Date', 'তারিখ নির্বাচন করুন'),
                                                                 (207, 'select_month', 'Select Month', 'মাস নির্বাচন করুন'),
                                                                 (208, 'select_year', 'Select Year', 'নির্বাচন বছর'),
                                                                 (209, 'add_language', 'Add Language', 'ভাষা যোগ করুন'),
                                                                 (210, 'exam_name', 'Exam Name', 'পরীক্ষার নাম'),
                                                                 (211, 'date', 'Date', 'তারিখ'),
                                                                 (212, 'comment', 'Comment', 'মন্তব্য'),
                                                                 (213, 'edit_exam', 'Edit Exam', 'পরীক্ষার সম্পাদনা'),
                                                                 (214, 'grade_list', 'Grade List', 'গ্রেড তালিকা'),
                                                                 (215, 'grade_name', 'Grade Name', 'গ্রেড নাম'),
                                                                 (216, 'grade_point', 'Grade Point', 'গ্রেড পয়েন্ট'),
                                                                 (217, 'select_exam', 'Select Exam', 'পরীক্ষার নির্বাচন'),
                                                                 (218, 'students', 'Students', 'শিক্ষার্থীরা'),
                                                                 (219, 'subjects', 'Subjects', 'প্রজাদের'),
                                                                 (220, 'total', 'Total', 'মোট'),
                                                                 (221, 'select_academic_session', 'Select Academic Session', 'একাডেমিক সেশন নির্বাচন'),
                                                                 (222, 'invoice_informations', 'Invoice Informations', 'চালান ইনফরমেশন'),
                                                                 (223, 'title', 'Title', 'খেতাব'),
                                                                 (224, 'description', 'Description', 'বিবরণ'),
                                                                 (225, 'payment_informations', 'Payment Informations', 'পেমেন্ট তথ্য'),
                                                                 (226, 'view_invoice', 'View Invoice', 'দেখুন চালান'),
                                                                 (227, 'payment_to', 'Payment To', 'পরিশোদ করা'),
                                                                 (228, 'bill_to', 'Bill To', 'বিল করতে'),
                                                                 (229, 'total_amount', 'Total Amount', 'সর্বমোট পরিমাণ'),
                                                                 (230, 'paid_amount', 'Paid Amount', 'দেওয়া পরিমাণ'),
                                                                 (231, 'due', 'Due', 'দরুন'),
                                                                 (232, 'amount_paid', 'Amount Paid', 'পরিমাণ অর্থ প্রদান করা'),
                                                                 (233, 'payment_successfull', 'Payment has been successful', 'পেমেন্ট সফল হয়েছে'),
                                                                 (234, 'add_invoice/payment', 'Add Invoice/payment', 'ইনভয়েস / পেমেন্ট যোগ'),
                                                                 (235, 'invoices', 'Invoices', 'ইনভয়েস বা চালান'),
                                                                 (236, 'action', 'Action', 'কর্ম'),
                                                                 (237, 'required', 'Required', 'প্রয়োজনীয়'),
                                                                 (238, 'info', 'Info', 'তথ্য'),
                                                                 (239, 'month', 'Month', 'মাস'),
                                                                 (240, 'details', 'Details', 'বিস্তারিত'),
                                                                 (241, 'new', 'New', 'নতুন'),
                                                                 (242, 'reply_message', 'Reply Message', 'বার্তা উত্তর'),
                                                                 (243, 'message_sent', 'Message Sent', 'বার্তা পাঠানো'),
                                                                 (244, 'search', 'Search', 'অনুসন্ধান'),
                                                                 (245, 'religion', 'Religion', 'ধর্ম'),
                                                                 (246, 'blood_group', 'Blood group', 'রক্তের গ্রুপ'),
                                                                 (247, 'database_backup', 'Database Backup', 'ডাটাবেজ ব্যাকআপ'),
                                                                 (248, 'search', 'Search', 'অনুসন্ধান'),
                                                                 (249, 'payments_history', 'Fees Pay / Invoice', 'ফি পরিশোধ / চালান'),
                                                                 (250, 'message_restore', 'Message Restore', 'বার্তা পুনরুদ্ধার'),
                                                                 (251, 'write_new_message', 'Write New Message', 'নতুন বার্তা লিখতে'),
                                                                 (252, 'attendance_sheet', 'Attendance Sheet', 'এ্যাটেনডেন্স শীট'),
                                                                 (253, 'holiday', 'Holiday', 'ছুটির দিন'),
                                                                 (254, 'exam', 'Exam', 'পরীক্ষা'),
                                                                 (255, 'successfully', 'Successfully', 'সফলভাবে'),
                                                                 (256, 'admin', 'Admin', 'অ্যাডমিন'),
                                                                 (257, 'inbox', 'Inbox', 'ইনবক্স'),
                                                                 (258, 'sent', 'Sent', 'প্রেরিত'),
                                                                 (259, 'important', 'Important', 'গুরুত্বপূর্ণ'),
                                                                 (260, 'trash', 'Trash', 'আবর্জনা'),
                                                                 (261, 'error', 'Unsuccessful', 'ব্যার্থ'),
                                                                 (262, 'sessions_list', 'Sessions List', 'সেশন তালিকা'),
                                                                 (263, 'session_settings', 'Session Settings', 'সেশন সেটিংস'),
                                                                 (264, 'add_designation', 'Add Designation', 'পদবী যোগ করুন'),
                                                                 (265, 'users', 'Users', 'ব্যবহারকারীরা'),
                                                                 (266, 'librarian', 'Librarian', 'গ্রন্থাগারিক'),
                                                                 (267, 'accountant', 'Accountant', 'হিসাবরক্ষক'),
                                                                 (268, 'academics', 'Academics', 'বিদ্যালয় সংক্রান্ত'),
                                                                 (269, 'employees_attendance', 'Employees Attendance', 'কর্মচারী উপস্থিতি'),
                                                                 (270, 'set_exam_term', 'Set Exam Term', 'টার্ম সেট করুন'),
                                                                 (271, 'set_attendance', 'Set Attendance', 'উপস্থিতি সেট করুন'),
                                                                 (272, 'marks', 'Marks', 'মার্কস'),
                                                                 (273, 'books_category', 'Books Category', 'বই বিভাগ'),
                                                                 (274, 'transport', 'Transport', 'পরিবহন'),
                                                                 (275, 'fees', 'Fees', 'ফি'),
                                                                 (276, 'fees_allocation', 'Fees Allocation', 'ফি বরাদ্দকরণ'),
                                                                 (277, 'fee_category', 'Fee Category', 'ফি বিভাগ'),
                                                                 (278, 'report', 'Report', 'প্রতিবেদন'),
                                                                 (279, 'employee', 'Employee', 'কর্মচারী'),
                                                                 (280, 'invoice', 'Invoice', 'চালান'),
                                                                 (281, 'event_catalogue', 'Event Catalogue', 'ইভেন্ট ক্যাটালগ'),
                                                                 (282, 'total_paid', 'Total Paid', 'মোট দেওয়া'),
                                                                 (283, 'total_due', 'Total Due', 'মোট বাকি'),
                                                                 (284, 'fees_collect', 'Fees Collect', 'ফি সংগ্রহ'),
                                                                 (285, 'total_school_students_attendance', 'Total School Students Attendance', 'মোট স্কুলের ছাত্র উপস্থিতি'),
                                                                 (286, 'overview', 'Overview', 'সংক্ষিপ্ত বিবরণ'),
                                                                 (287, 'currency_symbol', 'Currency Symbol', 'মুদ্রা প্রতীক'),
                                                                 (288, 'enable', 'Enable', 'সক্ষম করা'),
                                                                 (289, 'disable', 'Disable', 'অক্ষম'),
                                                                 (290, 'payment_settings', 'Payment Settings', 'পেমেন্ট সেটিংস'),
                                                                 (291, 'student_attendance_report', 'Student Attendance Report', 'ছাত্র উপস্থিতি রিপোর্ট'),
                                                                 (292, 'attendance_type', 'Attendance Type', 'উপস্থিতি প্রকার'),
                                                                 (293, 'late', 'Late', 'বিলম্বে'),
                                                                 (294, 'employees_attendance_report', 'Employees Attendance Report', 'কর্মচারী উপস্থিতি রিপোর্ট'),
                                                                 (295, 'attendance_report_of', 'Attendance Report Of', 'উপস্থিতি রিপোর্ট'),
                                                                 (296, 'fee_paid_report', 'Fee Paid Report', 'ফি প্রদান প্রতিবেদন'),
                                                                 (297, 'invoice_no', 'Invoice No', 'চালান নং'),
                                                                 (298, 'payment_mode', 'Payment Mode', 'পরিশোধের মাধ্যম'),
                                                                 (299, 'payment_type', 'Payment Type', 'পেমেন্ট টাইপ'),
                                                                 (300, 'done', 'Done', 'সম্পন্ন'),
                                                                 (301, 'select_fee_category', 'Select Fee Category', 'ফি বিভাগ নির্বাচন করুন'),
                                                                 (302, 'discount', 'Discount', 'ডিসকাউন্ট'),
                                                                 (303, 'enter_discount_amount', 'Enter Discount Amount', 'ছাড়ের পরিমাণ লিখুন'),
                                                                 (304, 'online_payment', 'Online Payment', 'দূরবর্তী অর্থ প্রদান'),
                                                                 (305, 'student_name', 'Student Name', 'শিক্ষার্থীর নাম'),
                                                                 (306, 'invoice_history', 'Invoice History', 'চালান ইতিহাস'),
                                                                 (307, 'discount_amount', 'Discount Amount', 'হ্রাসকৃত মুল্য'),
                                                                 (308, 'invoice_list', 'Invoice List', 'চালান তালিকা'),
                                                                 (309, 'partly_paid', 'Partly Paid', 'আংশিক পরিশোধিত'),
                                                                 (310, 'fees_list', 'Fees List', 'ফি তালিকা'),
                                                                 (311, 'voucher_id', 'Voucher ID', 'ভউচার আইডি'),
                                                                 (312, 'transaction_date', 'Transaction Date', 'লেনদেন তারিখ'),
                                                                 (313, 'admission_date', 'Admission Date', 'ভর্তির তারিখ'),
                                                                 (314, 'user_status', 'User Status', 'ব্যবহারকারীর স্থিতি'),
                                                                 (315, 'nationality', 'Nationality', 'জাতীয়তা'),
                                                                 (316, 'register_no', 'Register/ID', 'রেজিস্টার নং'),
                                                                 (317, 'first_name', 'First Name', 'প্রথম নাম'),
                                                                 (318, 'last_name', 'Last Name', 'নামের শেষাংশ'),
                                                                 (319, 'state', 'State', 'রাষ্ট্র'),
                                                                 (320, 'transport_vehicle_no', 'Transport Vehicle No', 'পরিবহন যানবাহন নং'),
                                                                 (321, 'percent', 'Percent', 'শতাংশ'),
                                                                 (322, 'average_result', 'Average Result', 'গড় ফলাফল'),
                                                                 (323, 'student_category', 'Student Category', 'ছাত্র বিভাগ'),
                                                                 (324, 'category_name', 'Category Name', 'বিভাগ নাম'),
                                                                 (325, 'category_list', 'Category List', 'বিভাগ তালিকা'),
                                                                 (326, 'please_select_student_first', 'Please Select Students First', 'প্রথমে ছাত্রদের দয়া করে নির্বাচন করুন'),
                                                                 (327, 'designation', 'Designation', 'উপাধি'),
                                                                 (328, 'qualification', 'Qualification', 'যোগ্যতা'),
                                                                 (329, 'account_deactivated', 'Account Deactivated', 'অ্যাকাউন্ট নিষ্ক্রিয়'),
                                                                 (330, 'account_activated', 'Account Activated', 'অ্যাকাউন্ট সক্রিয়'),
                                                                 (331, 'designation_list', 'Designation List', 'পদবী তালিকা'),
                                                                 (332, 'joining_date', 'Joining Date', 'যোগদান তারিখ'),
                                                                 (333, 'relation', 'Relation', 'সম্পর্ক'),
                                                                 (334, 'father_name', 'Father Name', 'বাবার নাম'),
                                                                 (335, 'librarian_list', 'Librarian List', 'গ্রন্থাগারিক তালিকা'),
                                                                 (336, 'class_numeric', 'Class Numeric', 'ক্লাস সাংখ্যিক'),
                                                                 (337, 'maximum_students', 'Maximum Students', 'সর্বোচ্চ ছাত্র'),
                                                                 (338, 'class_room', 'Class Room', 'ক্লাস রুমে'),
                                                                 (339, 'pass_mark', 'Pass Mark', 'পাশ নম্বর'),
                                                                 (340, 'exam_time', 'Exam Time (Min)', 'পরীক্ষার সময় (মিনিট)'),
                                                                 (341, 'time', 'Time', 'সময়'),
                                                                 (342, 'subject_code', 'Subject Code', 'বিষয় কোড'),
                                                                 (343, 'full_mark', 'Full Mark', 'পুরো নম্বর'),
                                                                 (344, 'subject_type', 'Subject Type', 'বিষয় প্রকার'),
                                                                 (345, 'date_of_publish', 'Date Of Publish', 'প্রকাশের তারিখ'),
                                                                 (346, 'file_name', 'File Name', 'ফাইলের নাম'),
                                                                 (347, 'students_list', 'Students List', 'ছাত্র তালিকা'),
                                                                 (348, 'start_date', 'Start Date', 'শুরুর তারিখ'),
                                                                 (349, 'end_date', 'End Date', 'শেষ তারিখ'),
                                                                 (350, 'term_name', 'Term Name', 'টার্ম নাম'),
                                                                 (351, 'grand_total', 'Grand Total', 'সর্বমোট'),
                                                                 (352, 'result', 'Result', 'ফল'),
                                                                 (353, 'books_list', 'Books List', 'বই তালিকা'),
                                                                 (354, 'book_isbn_no', 'Book ISBN No', 'বই ISBN নং'),
                                                                 (355, 'total_stock', 'Total Stock', 'মোট স্টক'),
                                                                 (356, 'issued_copies', 'Issued Copies', 'ইস্যু করা কপি'),
                                                                 (357, 'publisher', 'Publisher', 'প্রকাশক'),
                                                                 (358, 'books_issue', 'Books Issue', 'বই ইস্যু'),
                                                                 (359, 'user', 'User', 'ব্যবহারকারী'),
                                                                 (360, 'fine', 'Fine', 'জরিমানা'),
                                                                 (361, 'pending', 'Pending', 'অনিষ্পন্ন'),
                                                                 (362, 'return_date', 'Return Date', 'প্রত্যাবর্তন তারিখ'),
                                                                 (363, 'accept', 'Accept', 'গ্রহণ করা'),
                                                                 (364, 'reject', 'Reject', 'প্রত্যাখ্যান'),
                                                                 (365, 'issued', 'Issued', 'ইস্যু করা'),
                                                                 (366, 'return', 'Return', 'প্রত্যাবর্তন'),
                                                                 (367, 'renewal', 'Renewal', 'পুনরারম্ভ'),
                                                                 (368, 'fine_amount', 'Fine Amount', 'জরিমানা পরিমাণ'),
                                                                 (369, 'password_mismatch', 'Password Mismatch', 'পাসওয়ার্ড মেলেনি'),
                                                                 (370, 'settings_updated', 'Settings Update', 'সেটিংস আপডেট করুন'),
                                                                 (371, 'pass', 'Pass', 'পাস'),
                                                                 (372, 'event_to', 'Event To', 'ইভেন্টের জন্য'),
                                                                 (373, 'all_users', 'All Users', 'সকল ব্যবহারকারী'),
                                                                 (374, 'employees_list', 'Employees List', 'কর্মচারী তালিকা'),
                                                                 (375, 'on', 'On', 'উপর'),
                                                                 (376, 'timezone', 'Timezone', 'সময় অঞ্চল'),
                                                                 (377, 'get_result', 'Get Result', 'ফলাফল পেতে'),
                                                                 (378, 'apply', 'Apply', 'প্রয়োগ করা'),
                                                                 (379, 'hrm', 'Human Resource', 'মানব সম্পদ'),
                                                                 (380, 'payroll', 'Payroll', 'বেতনের'),
                                                                 (381, 'salary_assign', 'Salary Assign', 'বেতন বরাদ্দ'),
                                                                 (382, 'employee_salary', 'Payment Salary', 'পেমেন্ট বেতন'),
                                                                 (383, 'application', 'Application', 'আবেদন'),
                                                                 (384, 'award', 'Award', 'পুরস্কার'),
                                                                 (385, 'basic_salary', 'Basic Salary', 'মূল বেতন'),
                                                                 (386, 'employee_name', 'Employee Name', 'কর্মকর্তার নাম'),
                                                                 (387, 'name_of_allowance', 'Name Of Allowance', 'ভাতা নাম'),
                                                                 (388, 'name_of_deductions', 'Name Of Deductions', 'কর্তনের নাম'),
                                                                 (389, 'all_employees', 'All Employees', 'সমস্ত কর্মচারী'),
                                                                 (390, 'total_allowance', 'Total Allowance', 'মোট ভাতা'),
                                                                 (391, 'total_deduction', 'Total Deductions', 'মোট কর্তন'),
                                                                 (392, 'net_salary', 'Net Salary', 'মোট বেতন'),
                                                                 (393, 'payslip', 'Payslip', 'স্লিপে'),
                                                                 (394, 'days', 'Days', 'দিন'),
                                                                 (395, 'category_name_already_used', 'Category Name Already Used', 'বিভাগের নাম ইতিমধ্যে ব্যবহৃত'),
                                                                 (396, 'leave_list', 'Leave List', 'তালিকা ছেড়ে'),
                                                                 (397, 'leave_category', 'Leave Category', 'বিভাগ ছেড়ে'),
                                                                 (398, 'applied_on', 'Applied On', 'প্রয়োগ করা'),
                                                                 (399, 'accepted', 'Accepted', 'গৃহীত'),
                                                                 (400, 'leave_statistics', 'Leave Statistics', 'ছুটি পরিসংখ্যান'),
                                                                 (401, 'leave_type', 'Leave Type', 'ছুটি টাইপ'),
                                                                 (402, 'reason', 'Reason', 'কারণ'),
                                                                 (403, 'close', 'Close', 'বন্ধ'),
                                                                 (404, 'give_award', 'Give Award', 'পুরস্কার দাও'),
                                                                 (405, 'list', 'List', 'তালিকা'),
                                                                 (406, 'award_name', 'Award Name', 'পুরস্কারের নাম'),
                                                                 (407, 'gift_item', 'Gift Item', 'উপহার আইটেম'),
                                                                 (408, 'cash_price', 'Cash Price', 'নগদ মূল্য'),
                                                                 (409, 'award_reason', 'Award Reason', 'পুরস্কার কারণ'),
                                                                 (410, 'given_date', 'Given Date', 'প্রদত্ত তারিখ'),
                                                                 (411, 'apply_leave', 'Apply Leave', 'ছুটি প্রয়োগ করুন'),
                                                                 (412, 'leave_application', 'Leave Application', 'ছুটি আবেদন'),
                                                                 (413, 'allowances', 'Allowances', 'তৃপ্তি'),
                                                                 (414, 'add_more', 'Add More', 'আরো যোগ করো'),
                                                                 (415, 'deductions', 'Deductions', 'কর্তন'),
                                                                 (416, 'salary_details', 'Salary Details', 'বেতন বিবরণ'),
                                                                 (417, 'salary_month', 'Salary Month', 'বেতন মাস'),
                                                                 (418, 'leave_data_update_successfully', 'Leave Data Updated Successfully', 'ছুটি ডেটা সফলভাবে আপডেট করা হয়েছে'),
                                                                 (419, 'fees_history', 'Fees History', 'ফি ইতিহাস'),
                                                                 (420, 'bank_name', 'Bank Name', 'ব্যাংকের নাম'),
                                                                 (421, 'branch', 'Branch', 'শাখা'),
                                                                 (422, 'bank_address', 'Bank Address', 'ব্যাংকের ঠিকানা'),
                                                                 (423, 'ifsc_code', 'IFSC Code', 'আইএফসিসি কোড'),
                                                                 (424, 'account_no', 'Account No', 'হিসাব নাম্বার'),
                                                                 (425, 'add_bank', 'Add Bank', 'ব্যাংক জুড়ুন'),
                                                                 (426, 'account_name', 'Account Holder', 'হিসাবের নাম'),
                                                                 (427, 'database_backup_completed', 'Database Backup Completed', 'ডাটাবেস ব্যাকআপ সম্পন্ন'),
                                                                 (428, 'restore_database', 'Restore Database', 'ডাটাবেস পুনঃস্থাপন'),
                                                                 (429, 'template', 'Template', 'টেমপ্লেট'),
                                                                 (430, 'time_and_date', 'Time And Date', 'সময় এবং তারিখ'),
                                                                 (431, 'everyone', 'Everyone', 'সবাই'),
                                                                 (432, 'invalid_amount', 'Invalid Amount', 'অকার্যকর পরিমাণ'),
                                                                 (433, 'leaving_date_is_not_available_for_you', 'Leaving Date Is Not Available For You', 'তারিখ রেখে আপনার জন্য উপলব্ধ নয়'),
                                                                 (434, 'animations', 'Animations', 'অ্যানিমেশন'),
                                                                 (435, 'email_settings', 'Email Settings', 'ইমেল সেটিংস'),
                                                                 (436, 'deduct_month', 'Deduct Month', 'কেটে মাস'),
                                                                 (437, 'no_employee_available', 'No Employee Available', 'কোন কর্মচারী প্রাপ্তিসাধ্য'),
                                                                 (438, 'advance_salary_application_submitted', 'Advance Salary Application Submitted', 'অগ্রিম বেতন আবেদন জমা'),
                                                                 (439, 'date_format', 'Date Format', 'তারিখ বিন্যাস'),
                                                                 (440, 'id_card_generate', 'ID Card Generate', 'আইডি কার্ড তৈরি করুন'),
                                                                 (441, 'issue_salary', 'Issue Salary', 'বেতন ইস্যু'),
                                                                 (442, 'advance_salary', 'Advance Salary', 'বেতন অগ্রিম'),
                                                                 (443, 'logo', 'Logo', 'লোগো'),
                                                                 (444, 'book_request', 'Book Request', 'বই অনুরোধ'),
                                                                 (445, 'reporting', 'Reporting', 'প্রতিবেদন'),
                                                                 (446, 'paid_salary', 'Paid Salary', 'বেতন দেওয়া'),
                                                                 (447, 'due_salary', 'Due Salary', 'বাকি বেতন'),
                                                                 (448, 'route', 'Route', 'রুট'),
                                                                 (449, 'academic_details', 'Academic Details', 'একাডেমিক বিবরণ'),
                                                                 (450, 'guardian_details', 'Guardian Details', 'অভিভাবক বিস্তারিত'),
                                                                 (451, 'due_amount', 'Due Amount', 'বাকি টাকা'),
                                                                 (452, 'fee_due_report', 'Fee Due Report', 'ফি প্রতিবেদনের রিপোর্ট'),
                                                                 (453, 'other_details', 'Other Details', 'অন্যান্য বিস্তারিত'),
                                                                 (454, 'last_exam_report', 'Last Exam Report', 'শেষ পরীক্ষার রিপোর্ট'),
                                                                 (455, 'book_issued', 'Book Issued', 'বই ইস্যু করা'),
                                                                 (456, 'interval_month', 'Interval 30 Days', 'অন্তর 30 দিন'),
                                                                 (457, 'attachments', 'Attachments', 'সংযুক্তিসমূহ'),
                                                                 (458, 'fees_payment', 'Fees Payment', 'ফি প্রদান'),
                                                                 (459, 'fees_summary', 'Fees Summary', 'ফি সংক্ষিপ্ত বিবরণ'),
                                                                 (460, 'total_fees', 'Total Fees', 'মোট ফি'),
                                                                 (461, 'weekend_attendance_inspection', 'Weekend Attendance Inspection', 'সপ্তাহান্তে উপস্থিতি পরিদর্শন'),
                                                                 (462, 'book_issued_list', 'Book Issued List', 'বুক ইস্যু তালিকা'),
                                                                 (463, 'lose_your_password', 'Lose Your Password?', 'আপনার পাসওয়ার্ড হারান?'),
                                                                 (464, 'all_branch_dashboard', 'All Branch Dashboard', 'সমস্ত শাখা ড্যাশবোর্ড'),
                                                                 (465, 'academic_session', 'Academic Session', 'একাডেমিক সেশন'),
                                                                 (466, 'all_branches', 'All Branches', 'সমস্ত শাখা'),
                                                                 (467, 'admission', 'Admission', 'ভর্তি'),
                                                                 (468, 'create_admission', 'Create Admission', 'ভর্তি তৈরি করুন'),
                                                                 (469, 'multiple_import', 'Multiple Import', 'একাধিক আমদানি'),
                                                                 (470, 'student_details', 'Student Details', 'ছাত্র বিস্তারিত'),
                                                                 (471, 'student_list', 'Student List', 'ছাত্র তালিকা'),
                                                                 (472, 'login_deactivate', 'Login Deactivate', 'লগইন নিষ্ক্রিয় করুন'),
                                                                 (473, 'parents_list', 'Parents List', 'পিতামাতার তালিকা'),
                                                                 (474, 'add_parent', 'Add Parent', 'মূল যোগ করুন'),
                                                                 (475, 'employee_list', 'Employee List', 'কর্মচারী তালিকা'),
                                                                 (476, 'add_department', 'Add Department', 'বিভাগ যোগ করুন'),
                                                                 (477, 'add_employee', 'Add Employee', 'কর্মচারী যোগ করুন'),
                                                                 (478, 'salary_template', 'Salary Template', 'বেতন টেমপ্লেট'),
                                                                 (479, 'salary_payment', 'Salary Payment', 'বেতন পেমেন্ট'),
                                                                 (480, 'payroll_summary', 'Payroll Summary', 'বেতন সারসংক্ষেপ'),
                                                                 (481, 'academic', 'Academic', 'বিদ্যালয় সংক্রান্ত'),
                                                                 (482, 'control_classes', 'Control Classes', 'নিয়ন্ত্রণ ক্লাস'),
                                                                 (483, 'assign_class_teacher', 'Assign Class Teacher', 'ক্লাস শিক্ষক নিয়োগ\n\n'),
                                                                 (484, 'class_assign', 'Class Assign', 'ক্লাস বরাদ্দ'),
                                                                 (485, 'assign', 'Assign', 'দায়িত্ব অর্পণ করা'),
                                                                 (486, 'promotion', 'Promotion', 'পদোন্নতি'),
                                                                 (487, 'attachments_book', 'Attachments Book', 'সংযুক্তি বই'),
                                                                 (488, 'upload_content', 'Upload Content', 'আপলোড কন্টেন্ট'),
                                                                 (489, 'attachment_type', 'Attachment Type', 'সংযুক্তি প্রকার'),
                                                                 (490, 'exam_master', 'Exam Master', 'পরীক্ষা মাস্টার'),
                                                                 (491, 'exam_hall', 'Exam Hall', 'পরীক্ষা হল'),
                                                                 (492, 'mark_entries', 'Mark Entries', 'মার্ক এন্ট্রি'),
                                                                 (493, 'tabulation_sheet', 'Tabulation Sheet', 'ট্যাবলেট শীট'),
                                                                 (494, 'supervision', 'Supervision', 'রক্ষণাবেক্ষণ'),
                                                                 (495, 'hostel_master', 'Hostel Master', 'হোস্টেল মাস্টার'),
                                                                 (496, 'hostel_room', 'Hostel Room', 'হোস্টেল রুম'),
                                                                 (497, 'allocation_report', 'Allocation Report', 'বরাদ্দ রিপোর্ট'),
                                                                 (498, 'route_master', 'Route Master', 'রুট মাস্টার'),
                                                                 (499, 'vehicle_master', 'Vehicle Master', 'যানবাহন মাস্টার'),
                                                                 (500, 'stoppage', 'Stoppage', 'বিরতি'),
                                                                 (501, 'assign_vehicle', 'Assign Vehicle', 'যানবাহন বরাদ্দ করুন'),
                                                                 (502, 'reports', 'Reports', 'প্রতিবেদন'),
                                                                 (503, 'books_entry', 'Books Entry', 'বই এন্ট্রি'),
                                                                 (504, 'event_type', 'Event Type', 'ইভেন্টের ধরণ'),
                                                                 (505, 'add_events', 'Add Events', 'ইভেন্ট যোগ করুন'),
                                                                 (506, 'student_accounting', 'Student Accounting', 'ছাত্র অ্যাকাউন্টিং'),
                                                                 (507, 'create_single_invoice', 'Create Single Invoice', 'একক চালান মোট রুট তৈরি করুন'),
                                                                 (508, 'create_multi_invoice', 'Create Multi Invoice', 'মাল্টি চালান তৈরি করুন'),
                                                                 (509, 'summary_report', 'Summary Report', 'সারসংক্ষেপ প্রতিবেদন'),
                                                                 (510, 'office_accounting', 'Office Accounting', 'অফিস একাউন্টিং'),
                                                                 (511, 'under_group', 'Under Group', 'দলের অধীনে'),
                                                                 (512, 'bank_account', 'Bank Account', 'ব্যাংক হিসাব'),
                                                                 (513, 'ledger_account', 'Ledger Account', 'লেজার অ্যাকাউন্ট'),
                                                                 (514, 'create_voucher', 'Create Voucher', 'ভাউচার তৈরি করুন'),
                                                                 (515, 'day_book', 'Day Book', 'জাবেদা'),
                                                                 (516, 'cash_book', 'Cash Book', 'নগদ বই'),
                                                                 (517, 'bank_book', 'Bank Book', 'ব্যাংক বই'),
                                                                 (518, 'ledger_book', 'Ledger Book', 'খতিয়ান বই'),
                                                                 (519, 'trial_balance', 'Trial Balance', 'ট্রায়াল ব্যালেন্স'),
                                                                 (520, 'settings', 'Settings', 'স্থাপন'),
                                                                 (521, 'sms_settings', 'Sms Settings', 'এসএমএস সেটিংস'),
                                                                 (522, 'cash_book_of', 'Cash Book Of', 'ক্যাশ বুক'),
                                                                 (523, 'by_cash', 'By Cash', 'নগদে'),
                                                                 (524, 'by_bank', 'By Bank', 'ব্যাংক দ্বারা'),
                                                                 (525, 'total_strength', 'Total Strength', 'মোট শক্তি'),
                                                                 (526, 'teachers', 'Teachers', 'শিক্ষক'),
                                                                 (527, 'student_quantity', 'Student Quantity', 'ছাত্র পরিমাণ'),
                                                                 (528, 'voucher', 'Voucher', 'রসিদ'),
                                                                 (529, 'total_number', 'Total Number', 'মোট সংখ্যা'),
                                                                 (530, 'total_route', 'Total Route', 'মোট রুট'),
                                                                 (531, 'total_room', 'Total Room', 'মোট কক্ষ'),
                                                                 (532, 'amount', 'Amount', 'পরিমাণ'),
                                                                 (533, 'branch_dashboard', 'Branch Dashboard', 'শাখা ড্যাশবোর্ড'),
                                                                 (534, 'branch_list', 'Branch List', 'শাখা তালিকা'),
                                                                 (535, 'create_branch', 'Create Branch', 'শাখা তৈরি করুন'),
                                                                 (536, 'branch_name', 'Branch Name', 'শাখার নাম'),
                                                                 (537, 'school_name', 'School Name', 'স্কুল নাম'),
                                                                 (538, 'mobile_no', 'Mobile No', 'মোবাইল নাম্বার'),
                                                                 (539, 'symbol', 'Symbol', 'পরিমাণ'),
                                                                 (540, 'city', 'City', 'শহর'),
                                                                 (541, 'academic_year', 'Academic Year', 'একাডেমিক বছর'),
                                                                 (542, 'select_branch_first', 'First Select The Branch', 'প্রথমে শাখা নির্বাচন করুন'),
                                                                 (543, 'select_class_first', 'Select Class First', 'ক্লাস প্রথম নির্বাচন করুন'),
                                                                 (544, 'select_country', 'Select Country', 'দেশ নির্বাচন করুন'),
                                                                 (545, 'mother_tongue', 'Mother Tongue', 'মাতৃভাষা'),
                                                                 (546, 'caste', 'Caste', 'বর্ণ'),
                                                                 (547, 'present_address', 'Present Address', 'বর্তমান ঠিকানা'),
                                                                 (548, 'permanent_address', 'Permanent Address', 'স্থায়ী ঠিকানা'),
                                                                 (549, 'profile_picture', 'Profile Picture', 'প্রোফাইল ছবি'),
                                                                 (550, 'login_details', 'Login Details', 'লগ ইন তথ্য'),
                                                                 (551, 'retype_password', 'Retype Password', 'পাসওয়ার্ড আবার টাইপ'),
                                                                 (552, 'occupation', 'Occupation', 'পেশা'),
                                                                 (553, 'income', 'Income', 'আয়'),
                                                                 (554, 'education', 'Education', 'শিক্ষা'),
                                                                 (555, 'first_select_the_route', 'First Select The Route', 'প্রথম রুট নির্বাচন করুন'),
                                                                 (556, 'hostel_details', 'Hostel Details', 'হোটেল বিবরণ'),
                                                                 (557, 'first_select_the_hostel', 'First Select The Hostel', 'প্রথম ছাত্রাবাস নির্বাচন'),
                                                                 (558, 'previous_school_details', 'Previous School Details', 'পূর্ববর্তী স্কুল বিবরণ'),
                                                                 (559, 'book_name', 'Book Name', 'বইয়ের নাম'),
                                                                 (560, 'select_ground', 'Select Ground', 'গ্রাউন্ড নির্বাচন করুন'),
                                                                 (561, 'import', 'Import', 'আমদানি'),
                                                                 (562, 'add_student_category', 'Add Student Category', 'ছাত্র বিভাগ যোগ করুন'),
                                                                 (563, 'id', 'Id', 'আইডি'),
                                                                 (564, 'edit_category', 'Edit Category', 'বিভাগ সম্পাদনা করুন'),
                                                                 (565, 'deactivate_account', 'Deactivate Account', 'অ্যাকাউন্ট নিষ্ক্রিয় করুন'),
                                                                 (566, 'all_sections', 'All Sections', 'সব বিভাগ'),
                                                                 (567, 'authentication_activate', 'Authentication Activate', 'প্রমাণীকরণ সক্রিয় করুন'),
                                                                 (568, 'department', 'Department', 'বিভাগ'),
                                                                 (569, 'salary_grades', 'Salary Grades', 'বেতন গ্রেড'),
                                                                 (570, 'overtime', 'Overtime Rate (Per Hour)', 'ওভারটাইম হার (প্রতি ঘন্টা)'),
                                                                 (571, 'salary_grade', 'Salary Grade', 'বেতন গ্রেড'),
                                                                 (572, 'payable_type', 'Payable Type', 'প্রদেয় প্রকার'),
                                                                 (573, 'edit_type', 'Edit Type', 'টাইপ সম্পাদনা করুন'),
                                                                 (574, 'role', 'Role', 'ভূমিকা'),
                                                                 (575, 'remuneration_info_for', 'Remuneration Info For', 'বেতন জন্য তথ্য'),
                                                                 (576, 'salary_paid', 'Salary Paid', 'বেতন দেওয়া'),
                                                                 (577, 'salary_unpaid', 'Salary Unpaid', 'বেতন পরিশোধ না'),
                                                                 (578, 'pay_now', 'Pay Now', 'এখন পরিশোধ করুন'),
                                                                 (579, 'employee_role', 'Employee Role', 'কর্মচারী ভূমিকা'),
                                                                 (580, 'create_at', 'Create At', 'এ তৈরি করুন'),
                                                                 (581, 'select_employee', 'Select Employee', 'কর্মচারী নির্বাচন করুন'),
                                                                 (582, 'review', 'Review', 'পর্যালোচনা'),
                                                                 (583, 'reviewed_by', 'Reviewed By', 'দ্বারা পর্যালোচনা'),
                                                                 (584, 'submitted_by', 'Submitted By', 'দ্বারা জমা দেওয়া'),
                                                                 (585, 'employee_type', 'Employee Type', 'কর্মচারী টাইপ'),
                                                                 (586, 'approved', 'Approved', 'অনুমোদিত'),
                                                                 (587, 'unreviewed', 'Unreviewed', 'পর্যালোচনা না করা'),
                                                                 (588, 'creation_date', 'Creation Date', 'তৈরির তারিখ'),
                                                                 (589, 'no_information_available', 'No Information Available', 'কোন তথ্য নেই'),
                                                                 (590, 'continue_to_payment', 'Continue To Payment', 'পেমেন্ট অবিরত'),
                                                                 (591, 'overtime_total_hour', 'Overtime Total Hour', 'ওভারটাইম মোট ঘন্টা'),
                                                                 (592, 'overtime_amount', 'Overtime Amount', 'ওভারটাইম পরিমাণ'),
                                                                 (593, 'remarks', 'Remarks', 'মন্তব্য'),
                                                                 (594, 'view', 'View', 'দৃশ্য'),
                                                                 (595, 'leave_appeal', 'Leave Appeal', 'আবেদন ছেড়ে'),
                                                                 (596, 'create_leave', 'Create Leave', 'ছুটি তৈরি করুন'),
                                                                 (597, 'user_role', 'User Role', 'ব্যবহারকারী ভূমিকা'),
                                                                 (598, 'date_of_start', 'Date Of Start', 'শুরু তারিখ'),
                                                                 (599, 'date_of_end', 'Date Of End', 'শেষ তারিখ'),
                                                                 (600, 'winner', 'Winner', 'বিজয়ী'),
                                                                 (601, 'select_user', 'Select User', 'ব্যবহারকারী নির্বাচন করুন'),
                                                                 (602, 'create_class', 'Create Class', 'ক্লাস তৈরি করুন'),
                                                                 (603, 'class_teacher_allocation', 'Class Teacher Allocation', 'ক্লাস শিক্ষক বরাদ্দ'),
                                                                 (604, 'class_teacher', 'Class Teacher', 'শ্রেণী শিক্ষক'),
                                                                 (605, 'create_subject', 'Create Subject', 'সাবজেক্ট তৈরি করুন'),
                                                                 (606, 'select_multiple_subject', 'Select Multiple Subject', 'একাধিক বিষয় নির্বাচন করুন'),
                                                                 (607, 'teacher_assign', 'Teacher Assign', 'শিক্ষক নিয়োগ'),
                                                                 (608, 'teacher_assign_list', 'Teacher Assign List', 'শিক্ষক নিয়োগ তালিকা'),
                                                                 (609, 'select_department_first', 'Select Department First', 'প্রথম বিভাগ নির্বাচন করুন'),
                                                                 (610, 'create_book', 'Create Book', 'বই তৈরি করুন'),
                                                                 (611, 'book_title', 'Book Title', 'বইয়ের শিরোনাম'),
                                                                 (612, 'cover', 'Cover', 'আবরণ'),
                                                                 (613, 'edition', 'Edition', 'সংস্করণ'),
                                                                 (614, 'isbn_no', 'ISBN No', 'আইএসবিএন নং'),
                                                                 (615, 'purchase_date', 'Purchase Date', 'ক্রয় তারিখ'),
                                                                 (616, 'cover_image', 'Cover Image', 'চিত্র কভার'),
                                                                 (617, 'book_issue', 'Book Issue', 'বই ইস্যু'),
                                                                 (618, 'date_of_issue', 'Date Of Issue', 'প্রদান এর তারিখ'),
                                                                 (619, 'date_of_expiry', 'Date Of Expiry', 'মেয়াদ শেষ হওয়ার তারিখ'),
                                                                 (620, 'select_category_first', 'Select Category First', 'প্রথম বিভাগ নির্বাচন করুন'),
                                                                 (621, 'type_name', 'Type Name', 'নাম টাইপ করুন'),
                                                                 (622, 'type_list', 'Type List', 'প্রকারের তালিকা'),
                                                                 (623, 'icon', 'Icon', 'আইকন'),
                                                                 (624, 'event_list', 'Event List', 'ইভেন্ট তালিকা'),
                                                                 (625, 'create_event', 'Create Event', 'ইভেন্ট তৈরি করা'),
                                                                 (626, 'type', 'Type', 'আদর্শ'),
                                                                 (627, 'audience', 'Audience', 'শ্রোতা'),
                                                                 (628, 'created_by', 'Created By', 'দ্বারা সৃষ্টি'),
                                                                 (629, 'publish', 'Publish', 'প্রকাশ করা'),
                                                                 (630, 'everybody', 'Everybody', 'সবাই'),
                                                                 (631, 'selected_class', 'Selected Class', 'নির্বাচিত ক্লাস'),
                                                                 (632, 'selected_section', 'Selected Section', 'নির্বাচিত বিভাগ'),
                                                                 (633, 'information_has_been_updated_successfully', 'Information Has Been Updated Successfully', 'তথ্য সফলভাবে আপডেট হয়েছে Updated'),
                                                                 (634, 'create_invoice', 'Create Invoice', 'চালান তৈরি করুন'),
                                                                 (635, 'invoice_entry', 'Invoice Entry', 'চালানের এন্ট্রি'),
                                                                 (636, 'quick_payment', 'Quick Payment', 'দ্রুত অর্থ প্রদান'),
                                                                 (637, 'write_your_remarks', 'Write Your Remarks', 'আপনার মন্তব্য লিখুন'),
                                                                 (638, 'reset', 'Reset', 'রিসেট'),
                                                                 (639, 'fees_payment_history', 'Fees Payment History', 'ফি প্রদানের ইতিহাস'),
                                                                 (640, 'fees_summary_report', 'Fees Summary Report', 'ফি সংক্ষিপ্তসার প্রতিবেদন'),
                                                                 (641, 'add_account_group', 'Add Account Group', 'অ্যাকাউন্ট গ্রুপ যুক্ত করুন'),
                                                                 (642, 'account_group', 'Account Group', 'অ্যাকাউন্ট গ্রুপ'),
                                                                 (643, 'account_group_list', 'Account Group List', 'অ্যাকাউন্ট গ্রুপ তালিকা'),
                                                                 (644, 'mailbox', 'Mailbox', 'ডাকবাক্স'),
                                                                 (645, 'refresh_mail', 'Refresh Mail', 'রিফ্রেশ মেল'),
                                                                 (646, 'sender', 'Sender', 'প্রেরকের'),
                                                                 (647, 'general_settings', 'General Settings', 'সাধারণ সেটিংস'),
                                                                 (648, 'institute_name', 'Institute Name', 'প্রতিষ্ঠানের নাম'),
                                                                 (649, 'institution_code', 'Institution Code', 'প্রতিষ্ঠান কোড'),
                                                                 (650, 'sms_service_provider', 'Sms Service Provider', 'এসএমএস পরিষেবা সরবরাহকারী'),
                                                                 (651, 'footer_text', 'Footer Text', 'পাদচরণ'),
                                                                 (652, 'payment_control', 'Payment Control', 'পেমেন্ট কন্ট্রোল'),
                                                                 (653, 'sms_config', 'Sms Config', 'এসএমএস কনফিগার'),
                                                                 (654, 'sms_triggers', 'Sms Triggers', 'এসএমএস ট্রিগার'),
                                                                 (655, 'authentication_token', 'Authentication Token', 'প্রমাণীকরণ টোকেন'),
                                                                 (656, 'sender_number', 'Sender Number', 'প্রেরকের নম্বর'),
                                                                 (657, 'username', 'Username', 'ব্যবহারকারীর নাম'),
                                                                 (658, 'api_key', 'Api Key', 'এপি কি'),
                                                                 (659, 'authkey', 'Authkey', 'Authkey'),
                                                                 (660, 'sender_id', 'Sender Id', 'প্রেরকের আইডি'),
                                                                 (661, 'sender_name', 'Sender Name', 'প্রেরক নাম'),
                                                                 (662, 'hash_key', 'Hash Key', 'হ্যাশ কী'),
                                                                 (663, 'notify_enable', 'Notify Enable', 'সক্ষমকে অবহিত করুন'),
                                                                 (664, 'exam_attendance', 'Exam Attendance', 'পরীক্ষার উপস্থিতি'),
                                                                 (665, 'exam_results', 'Exam Results', 'পরীক্ষার ফলাফল'),
                                                                 (666, 'email_config', 'Email Config', 'ইমেল কনফিগারেশন'),
                                                                 (667, 'email_triggers', 'Email Triggers', 'ইমেল ট্রিগার'),
                                                                 (668, 'account_registered', 'Account Registered', 'অ্যাকাউন্ট নিবন্ধিত'),
                                                                 (669, 'forgot_password', 'Forgot Password', 'পাসওয়ার্ড ভুলে গেছেন'),
                                                                 (670, 'new_message_received', 'New Message Received', 'নতুন বার্তা গৃহীত হয়েছে'),
                                                                 (671, 'payslip_generated', 'Payslip Generated', 'পেইলিপ জেনারেটেড'),
                                                                 (672, 'leave_approve', 'Leave Approve', 'ছাড়ুন'),
                                                                 (673, 'leave_reject', 'Leave Reject', 'প্রত্যাখ্যান ছেড়ে দিন'),
                                                                 (674, 'advance_salary_approve', 'Leave Reject', 'প্রত্যাখ্যান ছেড়ে দিন'),
                                                                 (675, 'advance_salary_reject', 'Advance Salary Reject', 'অগ্রিম বেতন প্রত্যাখ্যান'),
                                                                 (676, 'add_session', 'Add Session', 'সেশন যোগ করুন'),
                                                                 (677, 'session', 'Session', 'সেশন'),
                                                                 (678, 'created_at', 'Created At', 'এ নির্মিত'),
                                                                 (679, 'sessions', 'Sessions', 'দায়রা'),
                                                                 (680, 'flag', 'Flag', 'পতাকা'),
                                                                 (681, 'stats', 'Stats', 'পরিসংখ্যান'),
                                                                 (682, 'updated_at', 'Updated At', 'এ আপডেট'),
                                                                 (683, 'flag_icon', 'Flag Icon', 'পতাকা আইকন'),
                                                                 (684, 'password_restoration', 'Password Restoration', 'পাসওয়ার্ড পুনরুদ্ধার'),
                                                                 (685, 'forgot', 'Forgot', 'ভুলে গেছেন'),
                                                                 (686, 'back_to_login', 'Back To Login', 'প্রবেশ করতে পেছান'),
                                                                 (687, 'database_list', 'Database List', 'ডাটাবেস তালিকা'),
                                                                 (688, 'create_backup', 'Create Backup', 'ব্যাকআপ তৈরি'),
                                                                 (689, 'backup', 'Backup', 'ব্যাকআপ'),
                                                                 (690, 'backup_size', 'Backup Size', 'ব্যাকআপ আকার'),
                                                                 (691, 'file_upload', 'File Upload', 'ফাইল আপলোড'),
                                                                 (692, 'parents_details', 'Parents Details', 'পিতামাতার বিশদ'),
                                                                 (693, 'social_links', 'Social Links', 'সামাজিক বন্ধন'),
                                                                 (694, 'create_hostel', 'Create Hostel', 'হোস্টেল তৈরি করুন'),
                                                                 (695, 'allocation_list', 'Allocation List', 'বরাদ্দ তালিকা'),
                                                                 (696, 'payslip_history', 'Payslip History', 'পেইলিপ ইতিহাস'),
                                                                 (697, 'my_attendance_overview', 'My Attendance Overview', 'আমার উপস্থিতি ওভারভিউ'),
                                                                 (698, 'total_present', 'Total Present', 'মোট উপস্থিত'),
                                                                 (699, 'total_absent', 'Total Absent', 'মোট অনুপস্থিত'),
                                                                 (700, 'total_late', 'Total Late', 'মোট লেট'),
                                                                 (701, 'class_teacher_list', 'Class Teacher List', 'শ্রেণি শিক্ষকের তালিকা'),
                                                                 (702, 'section_control', 'Section Control', 'বিভাগ নিয়ন্ত্রণ'),
                                                                 (703, 'capacity ', 'Capacity', 'ধারণক্ষমতা'),
                                                                 (704, 'request', 'Request', 'অনুরোধ'),
                                                                 (705, 'salary_year', 'Salary Year', 'বেতন বছর'),
                                                                 (706, 'create_attachments', 'Create Attachments', 'সংযুক্তি তৈরি করুন'),
                                                                 (707, 'publish_date', 'Publish Date', 'প্রকাশের তারিখ'),
                                                                 (708, 'attachment_file', 'Attachment File', 'উচ্চ স্বরে পড়া'),
                                                                 (709, 'age', 'Age', 'Age'),
                                                                 (710, 'student_profile', 'Student Profile', 'ছাত্র প্রোফাইল'),
                                                                 (711, 'authentication', 'Authentication', 'প্রমাণীকরণ'),
                                                                 (712, 'parent_information', 'Parent Information', 'মূল তথ্য'),
                                                                 (713, 'full_marks', 'Full Marks', 'পুরোপুরি লক্ষ্য'),
                                                                 (714, 'passing_marks', 'Passing Marks', 'পাসিং মার্কস'),
                                                                 (715, 'highest_marks', 'Highest Marks', 'সর্বোচ্চ নম্বর'),
                                                                 (716, 'unknown', 'Unknown', 'অজানা'),
                                                                 (717, 'unpublish', 'Unpublish', 'অপ্রকাশিত'),
                                                                 (718, 'login_authentication_deactivate', 'Login Authentication Deactivate', 'লগইন প্রমাণীকরণ নিষ্ক্রিয় করুন'),
                                                                 (719, 'employee_profile', 'Employee Profile', 'কর্মচারী প্রোফাইল'),
                                                                 (720, 'employee_details', 'Employee Details', 'কর্মচারীর বিবরণ'),
                                                                 (721, 'salary_transaction', 'Salary Transaction', 'বেতন লেনদেন'),
                                                                 (722, 'documents', 'Documents', 'কাগজপত্র'),
                                                                 (723, 'actions', 'Actions', 'ক্রিয়াকলাপ'),
                                                                 (724, 'activity', 'Activity', 'কার্যকলাপ'),
                                                                 (725, 'department_list', 'Department List', 'বিভাগ তালিকা'),
                                                                 (726, 'manage_employee_salary', 'Manage Employee Salary', 'কর্মচারীদের বেতন পরিচালনা করুন'),
                                                                 (727, 'the_configuration_has_been_updated', 'The Configuration Has Been Updated', 'কনফিগারেশন আপডেট হয়েছে'),
                                                                 (728, 'add', 'Add', 'যোগ'),
                                                                 (729, 'create_exam', 'Create Exam', 'পরীক্ষা তৈরি করুন'),
                                                                 (730, 'term', 'Term', 'শব্দ'),
                                                                 (731, 'add_term', 'Add Term', 'টার্ম যুক্ত করুন'),
                                                                 (732, 'create_grade', 'Create Grade', 'গ্রেড তৈরি করুন'),
                                                                 (733, 'mark_starting', 'Mark Starting', 'শুরুর চিহ্ন'),
                                                                 (734, 'mark_until', 'Mark Until', 'অবধি চিহ্নিত করুন'),
                                                                 (735, 'room_list', 'Room List', 'রুম তালিকা'),
                                                                 (736, 'room', 'Room', 'ঘর'),
                                                                 (737, 'route_list', 'Route List', 'রুটের তালিকা'),
                                                                 (738, 'create_route', 'Create Route', 'রুট তৈরি করুন'),
                                                                 (739, 'vehicle_list', 'Vehicle List', 'যানবাহনের তালিকা'),
                                                                 (740, 'create_vehicle', 'Create Vehicle', 'যানবাহন তৈরি করুন'),
                                                                 (741, 'stoppage_list', 'Stoppage List', 'স্টপেজ তালিকা'),
                                                                 (742, 'create_stoppage', 'Create Stoppage', 'স্টপেজ তৈরি করুন'),
                                                                 (743, 'stop_time', 'Stop Time', 'সময় বন্ধ'),
                                                                 (744, 'employee_attendance', 'Employee Attendance', 'কর্মচারী উপস্থিতি'),
                                                                 (745, 'attendance_report', 'Attendance Report', 'উপস্থিতি রিপোর্ট'),
                                                                 (746, 'opening_balance', 'Opening Balance', 'খোলার ভারসাম্য'),
                                                                 (747, 'add_opening_balance', 'Add Opening Balance', 'উদ্বোধনী ব্যালেন্স যুক্ত করুন'),
                                                                 (748, 'credit', 'Credit', 'ধার'),
                                                                 (749, 'debit', 'Debit', 'খরচ'),
                                                                 (750, 'opening_balance_list', 'Opening Balance List', 'খোলার ভারসাম্য তালিকা'),
                                                                 (751, 'voucher_list', 'Voucher List', 'ভাউচার তালিকা'),
                                                                 (752, 'voucher_head', 'Voucher Head', 'ভাউচার হেড'),
                                                                 (753, 'payment_method', 'Payment Method', 'মূল্যপরিশোধ পদ্ধতি'),
                                                                 (754, 'credit_ledger_account', 'Credit Ledger Account', 'ক্রেডিট লেজার অ্যাকাউন্ট'),
                                                                 (755, 'debit_ledger_account', 'Debit Ledger Account', 'ডেবিট লেজার অ্যাকাউন্ট'),
                                                                 (756, 'voucher_no', 'Voucher No', 'ভাউচার নং'),
                                                                 (757, 'balance', 'Balance', 'ভারসাম্য'),
                                                                 (758, 'event_details', 'Event Details', 'অনুষ্ঠানের বিবরণ'),
                                                                 (759, 'welcome_to', 'Welcome To', 'স্বাগতম'),
                                                                 (760, 'report_card', 'Report Card', 'রিপোর্ট কার্ড'),
                                                                 (761, 'online_pay', 'Online Pay', 'অনলাইন পে'),
                                                                 (762, 'annual_fees_summary', 'Annual Fees Summary', 'বার্ষিক ফি সংক্ষিপ্তসার'),
                                                                 (763, 'my_children', 'My Children', 'আমার শিশু'),
                                                                 (764, 'assigned', 'Assigned', 'বরাদ্দ'),
                                                                 (765, 'confirm_password', 'Confirm Password', 'পাসওয়ার্ড নিশ্চিত করুন'),
                                                                 (766, 'searching_results', 'Searching Results', 'অনুসন্ধান ফলাফল'),
                                                                 (767, 'information_has_been_saved_successfully', 'Information Has Been Saved Successfully', 'তথ্য সাফল্যের সাথে সংরক্ষণ করা হয়েছে'),
                                                                 (768, 'information_deleted', 'The information has been successfully deleted', 'তথ্য সফলভাবে মুছে ফেলা হয়েছে'),
                                                                 (769, 'deleted_note', '*Note : This data will be permanently deleted', '* দ্রষ্টব্য: এই তথ্য স্থায়ীভাবে মুছে ফেলা হবে'),
                                                                 (770, 'are_you_sure', 'Are You Sure?', 'তুমি কি নিশ্চিত?'),
                                                                 (771, 'delete_this_information', 'Do You Want To Delete This Information?', 'আপনি এই তথ্য মুছে ফেলতে চান?'),
                                                                 (772, 'yes_continue', 'Yes, Continue', 'হ্যাঁ, চালিয়ে যান'),
                                                                 (773, 'deleted', 'Deleted', 'মুছে ফেলা'),
                                                                 (774, 'collect', 'Collect', 'সংগ্রহ'),
                                                                 (775, 'school_setting', 'School Setting', 'স্কুল সেটিং'),
                                                                 (776, 'set', 'Set', 'সেট'),
                                                                 (777, 'quick_view', 'Quick View', 'তারাতারি দেখা'),
                                                                 (778, 'due_fees_invoice', 'Due Fees Invoice', 'পারিশ্রমিক ফি চালান'),
                                                                 (779, 'my_application', 'My Application', 'আমার আবেদন'),
                                                                 (780, 'manage_application', 'Manage Application', 'অ্যাপ্লিকেশন পরিচালনা করুন'),
                                                                 (781, 'leave', 'Leave', 'ছুটি'),
                                                                 (782, 'live_class_rooms', 'Live Class Rooms', 'লাইভ ক্লাস রুম'),
                                                                 (783, 'homework', 'Homework', 'বাড়ির কাজ'),
                                                                 (784, 'evaluation_report', 'Evaluation Report', 'মূল্যায়ন প্রতিবেদন'),
                                                                 (785, 'exam_term', 'Exam Term', 'পরীক্ষার মেয়াদ'),
                                                                 (786, 'distribution', 'Distribution', 'বিতরণ'),
                                                                 (787, 'exam_setup', 'Exam Setup', 'পরীক্ষা সেটআপ'),
                                                                 (788, 'sms', 'Sms', ''),
                                                                 (789, 'fees_type', 'Fees Type', 'ফি প্রকার'),
                                                                 (790, 'fees_group', 'Fees Group', 'ফি গ্রুপ'),
                                                                 (791, 'fine_setup', 'Fine Setup', 'ফাইন সেটআপ'),
                                                                 (792, 'fees_reminder', 'Fees Reminder', 'ফি অনুস্মারক'),
                                                                 (793, 'new_deposit', 'New Deposit', 'নতুন আমানত'),
                                                                 (794, 'new_expense', 'New Expense', 'নতুন ব্যয়'),
                                                                 (795, 'all_transactions', 'All Transactions', 'সমস্ত লেনদেন'),
                                                                 (796, 'head', 'Head', 'মাথা'),
                                                                 (797, 'fees_reports', 'Fees Reports', 'ফি প্রতিবেদন'),
                                                                 (798, 'fees_report', 'Fees Report', 'ফি রিপোর্ট'),
                                                                 (799, 'receipts_report', 'Receipts Report', 'প্রাপ্তি রিপোর্ট'),
                                                                 (800, 'due_fees_report', 'Due Fees Report', 'বকেয়া ফি রিপোর্ট'),
                                                                 (801, 'fine_report', 'Fine Report', 'ফাইন রিপোর্ট'),
                                                                 (802, 'financial_reports', 'Financial Reports', 'আর্থিক প্রতিবেদন'),
                                                                 (803, 'statement', 'Statement', 'বিবৃতি'),
                                                                 (804, 'repots', 'Repots', ''),
                                                                 (805, 'expense', 'Expense', 'ব্যয়'),
                                                                 (806, 'transitions', 'Transitions', 'স্থানান্তর'),
                                                                 (807, 'sheet', 'Sheet', 'চাদর'),
                                                                 (808, 'income_vs_expense', 'Income Vs Expense', 'আয় বনাম ব্যয়'),
                                                                 (809, 'attendance_reports', 'Attendance Reports', 'উপস্থিতি রিপোর্ট'),
                                                                 (810, 'examination', 'Examination', 'পরীক্ষা'),
                                                                 (811, 'school_settings', 'School Settings', 'স্কুল সেটিংস'),
                                                                 (812, 'role_permission', 'Role Permission', 'ভূমিকা অনুমতি'),
                                                                 (813, 'cron_job', 'Cron Job', 'ক্রোন জব'),
                                                                 (814, 'custom_field', 'Custom Field', 'কাস্টম ক্ষেত্র'),
                                                                 (815, 'enter_valid_email', 'Enter Valid Email', 'সঠিক ইমেইল এড্রেস প্রদান করুন'),
                                                                 (816, 'lessons', 'Lessons', 'পাঠ'),
                                                                 (817, 'live_class', 'Live Class', 'লাইভ ক্লাস'),
                                                                 (818, 'sl', 'Sl', ''),
                                                                 (819, 'meeting_id', 'Meeting ID', 'লাইভ ক্লাস'),
                                                                 (820, 'start_time', 'Start Time', ''),
                                                                 (821, 'end_time', 'End Time', ''),
                                                                 (822, 'zoom_meeting_id', 'Zoom Meeting Id', 'জুম মিটিং আইডি'),
                                                                 (823, 'zoom_meeting_password', 'Zoom Meeting Password', 'জুম মিটিংয়ের পাসওয়ার্ড'),
                                                                 (824, 'time_slot', 'Time Slot', 'সময় স্লট'),
                                                                 (825, 'send_notification_sms', 'Send Notification Sms', 'বিজ্ঞপ্তি এসএমএস প্রেরণ করুন'),
                                                                 (826, 'host', 'Host', 'নিমন্ত্রণকর্তা'),
                                                                 (827, 'school', 'School', 'বিদ্যালয়'),
                                                                 (828, 'accounting_links', 'Accounting Links', 'অ্যাকাউন্টিং লিংক'),
                                                                 (829, 'applicant', 'Applicant', 'প্রার্থী'),
                                                                 (830, 'apply_date', 'Apply Date', 'আবেদন করুন তারিখ'),
                                                                 (831, 'add_leave', 'Add Leave', 'ছুটি যুক্ত করুন'),
                                                                 (832, 'leave_date', 'Leave Date', 'ছেড়ে দিন'),
                                                                 (833, 'attachment', 'Attachment', ''),
                                                                 (834, 'comments', 'Comments', 'মন্তব্য'),
                                                                 (835, 'staff_id', 'Staff Id', 'স্টাফ আইডি'),
                                                                 (836, 'income_vs_expense_of', 'Income Vs Expense Of', 'আয় বনাম ব্যয়'),
                                                                 (837, 'designation_name', 'Designation Name', 'পদবি নাম'),
                                                                 (838, 'already_taken', 'This %s already exists.', ''),
                                                                 (839, 'department_name', 'Department Name', 'বিভাগ নাম'),
                                                                 (840, 'date_of_birth', 'Date Of Birth', ''),
                                                                 (841, 'bulk_delete', 'Bulk Delete', 'বাল্ক মুছুন'),
                                                                 (842, 'guardian_name', 'Guardian Name', 'অভিভাবকের নাম'),
                                                                 (843, 'fees_progress', 'Fees Progress', 'ফি অগ্রগতি'),
                                                                 (844, 'evaluate', 'Evaluate', 'মূল্যনির্ধারণ'),
                                                                 (845, 'date_of_homework', 'Date Of Homework', 'হোম ওয়ার্কের তারিখ'),
                                                                 (846, 'date_of_submission', 'Date Of Submission', 'জমা তারিখ'),
                                                                 (847, 'student_fees_report', 'Student Fees Report', 'শিক্ষার্থী ফি রিপোর্ট'),
                                                                 (848, 'student_fees_reports', 'Student Fees Reports', 'ছাত্র ফি প্রতিবেদন'),
                                                                 (849, 'due_date', 'Due Date', 'নির্দিষ্ট তারিখ'),
                                                                 (850, 'payment_date', 'Payment Date', 'টাকা প্রদানের তারিখ'),
                                                                 (851, 'payment_via', 'Payment Via', 'অর্থ প্রদানের মাধ্যমে'),
                                                                 (852, 'generate', 'Generate', 'জেনারেট করুন'),
                                                                 (853, 'print_date', 'Print Date', 'মুদ্রণ তারিখ'),
                                                                 (854, 'bulk_sms_and_email', 'Bulk Sms And Email', 'বাল্ক এসএমএস এবং ইমেল'),
                                                                 (855, 'campaign_type', 'Campaign Type', 'প্রচারের ধরণ'),
                                                                 (856, 'both', 'Both', 'উভয়'),
                                                                 (857, 'regular', 'Regular', 'নিয়মিত'),
                                                                 (858, 'Scheduled', 'Scheduled', 'তালিকাভুক্ত'),
                                                                 (859, 'campaign', 'Campaign', 'ক্যাম্পেইন'),
                                                                 (860, 'campaign_name', 'Campaign Name', 'প্রচারাভিযান নাম'),
                                                                 (861, 'sms_gateway', 'Sms Gateway', 'এসএমএস গেটওয়ে'),
                                                                 (862, 'recipients_type', 'Recipients Type', 'প্রাপক প্রকার'),
                                                                 (863, 'recipients_count', 'Recipients Count', 'প্রাপকগণ গণনা করুন'),
                                                                 (864, 'body', 'Body', 'শরীর'),
                                                                 (865, 'guardian_already_exist', 'Guardian Already Exist', 'অভিভাবক ইতিমধ্যে বিদ্যমান'),
                                                                 (866, 'guardian', 'Guardian', 'অভিভাবক'),
                                                                 (867, 'mother_name', 'Mother Name', 'মা নাম'),
                                                                 (868, 'bank_details', 'Bank Details', 'ব্যাংক বিবরণ'),
                                                                 (869, 'skipped_bank_details', 'Skipped Bank Details', 'বাদ দেওয়া ব্যাঙ্কের বিশদ'),
                                                                 (870, 'bank', 'Bank', 'ব্যাংক'),
                                                                 (871, 'holder_name', 'Holder Name', 'ধারক নাম'),
                                                                 (872, 'bank_branch', 'Bank Branch', 'ব্যাংকের শাখা'),
                                                                 (873, 'custom_field_for', 'Custom Field For', 'কাস্টম ফিল্ড জন্য'),
                                                                 (874, 'label', 'Label', 'লেবেল'),
                                                                 (875, 'order', 'Order', 'ক্রম'),
                                                                 (876, 'online_admission', 'Online Admission', 'অনলাইন ভর্তি'),
                                                                 (877, 'field_label', 'Field Label', 'ফিল্ড লেবেল'),
                                                                 (878, 'field_type', 'Field Label', 'ফিল্ড লেবেল'),
                                                                 (879, 'default_value', 'Default Value', 'ডিফল্ট মান'),
                                                                 (880, 'checked', 'Checked', 'সংযত'),
                                                                 (881, 'unchecked', 'Unchecked', 'অবারিত'),
                                                                 (882, 'roll_number', 'Roll Number', 'রোল নাম্বার'),
                                                                 (883, 'add_rows', 'Add Rows', 'সারি যুক্ত করুন'),
                                                                 (884, 'salary', 'Salary', 'বেতন'),
                                                                 (885, 'basic', 'Basic', 'মৌলিক'),
                                                                 (886, 'allowance', 'Allowance', ''),
                                                                 (887, 'deduction', 'Deduction', ''),
                                                                 (888, 'net', 'Net', 'নেট'),
                                                                 (889, 'activated_sms_gateway', 'Activated Sms Gateway', 'সক্রিয় এসএমএস গেটওয়ে'),
                                                                 (890, 'account_sid', 'Account Sid', 'অ্যাকাউন্ট সিড'),
                                                                 (891, 'roles', 'Roles', 'ভূমিকা'),
                                                                 (892, 'system_role', 'System Role', 'সিস্টেমের ভূমিকা'),
                                                                 (893, 'permission', 'Permission', 'অনুমতি'),
                                                                 (894, 'edit_session', 'Edit Session', 'সেশন সম্পাদনা করুন'),
                                                                 (895, 'transactions', 'Transactions', 'লেনদেন'),
                                                                 (896, 'default_account', 'Default Account', 'ডিফল্ট অ্যাকাউন্ট'),
                                                                 (897, 'deposit', 'Deposit', 'আমানত'),
                                                                 (898, 'acccount', 'Acccount', 'অ্যাকাউন্টে'),
                                                                 (899, 'role_permission_for', 'Role Permission For', 'ভূমিকা জন্য অনুমতি'),
                                                                 (900, 'feature', 'Feature', 'বৈশিষ্ট্য'),
                                                                 (901, 'access_denied', 'Access Denied', 'অ্যাক্সেস অস্বীকৃত'),
                                                                 (902, 'time_start', 'Time Start', 'সময় শুরু'),
                                                                 (903, 'time_end', 'Time End', 'সময় শেষ'),
                                                                 (904, 'month_of_salary', 'Month Of Salary', 'বেতন মাস'),
                                                                 (905, 'add_documents', 'Add Documents', 'নথি যুক্ত করুন'),
                                                                 (906, 'document_type', 'Document Type', 'নথিপত্র ধরণ'),
                                                                 (907, 'document', 'Document', 'দলিল'),
                                                                 (908, 'document_title', 'Document Title', 'নথির শিরোনাম'),
                                                                 (909, 'document_category', 'Document Category', 'নথি বিভাগ'),
                                                                 (910, 'exam_result', 'Exam Result', 'পরীক্ষার ফলাফল'),
                                                                 (911, 'my_annual_fee_summary', 'My Annual Fee Summary', 'আমার বার্ষিক ফি সংক্ষিপ্তসার'),
                                                                 (912, 'book_manage', 'Book Manage', 'বই পরিচালনা'),
                                                                 (913, 'add_leave_category', 'Add Leave Category', 'ছাড়ার বিভাগ যুক্ত করুন'),
                                                                 (914, 'edit_leave_category', 'Edit Leave Category', 'বিভাগ ছেড়ে যান'),
                                                                 (915, 'staff_role', 'Staff Role', 'স্টাফ ভূমিকা'),
                                                                 (916, 'edit_assign', 'Edit Assign', 'সম্পাদনা করুন'),
                                                                 (917, 'view_report', 'View Report', ''),
                                                                 (918, 'rank_out_of_5', 'Rank Out Of 5', 'র‌্যাঙ্ক আউট 5'),
                                                                 (919, 'hall_no', 'Hall No', 'হল নং'),
                                                                 (920, 'no_of_seats', 'No Of Seats', 'নং আসন'),
                                                                 (921, 'mark_distribution', 'Mark Distribution', 'চিহ্ন বিতরণ'),
                                                                 (922, 'exam_type', 'Exam Type', 'পরীক্ষার ধরণ'),
                                                                 (923, 'marks_and_grade', 'Marks And Grade', 'চিহ্ন এবং গ্রেড'),
                                                                 (924, 'min_percentage', 'Min Percentage', 'ন্যূনতম শতাংশ'),
                                                                 (925, 'max_percentage', 'Max Percentage', 'সর্বোচ্চ শতাংশ'),
                                                                 (926, 'cost_per_bed', 'Cost Per Bed', 'প্রতি বিছানা খরচ'),
                                                                 (927, 'add_category', 'Add Category', 'বিভাগ যুক্ত করুন'),
                                                                 (928, 'category_for', 'Category For', 'বিভাগের জন্য'),
                                                                 (929, 'start_place', 'Start Place', 'স্টার্ট প্লেস'),
                                                                 (930, 'stop_place', 'Stop Place', 'স্টপ প্লেস'),
                                                                 (931, 'vehicle', 'Vehicle', 'বাহন'),
                                                                 (932, 'select_multiple_vehicle', 'Select Multiple Vehicle', 'একাধিক যান নির্বাচন করুন'),
                                                                 (933, 'book_details', 'Book Details', 'বইয়ের বিবরণ'),
                                                                 (934, 'issued_by', 'Issued By', 'প্রদান করেছেন'),
                                                                 (935, 'return_by', 'Return By', 'ফিরে আসুন'),
                                                                 (936, 'group', 'Group', 'গ্রুপ'),
                                                                 (937, 'individual', 'Individual', 'স্বতন্ত্র'),
                                                                 (938, 'recipients', 'Recipients', 'প্রাপক'),
                                                                 (939, 'group_name', 'Group Name', 'দলের নাম'),
                                                                 (940, 'fee_code', 'Fee Code', 'ফি কোড'),
                                                                 (941, 'fine_type', 'Fine Type', 'ফাইন টাইপ'),
                                                                 (942, 'fine_value', 'Fine Value', 'সূক্ষ্ম মান'),
                                                                 (943, 'late_fee_frequency', 'Late Fee Frequency', 'দেরিতে ফি ফ্রিকোয়েন্সি'),
                                                                 (944, 'fixed_amount', 'Fixed Amount', 'নির্দিষ্ট পরিমাণ'),
                                                                 (945, 'fixed', 'Fixed', 'ফিক্সড'),
                                                                 (946, 'daily', 'Daily', 'দৈনন্দিন'),
                                                                 (947, 'weekly', 'Weekly', 'সাপ্তাহিক'),
                                                                 (948, 'monthly', 'Monthly', 'মাসিক'),
                                                                 (949, 'annually', 'Annually', 'সালিয়ানা'),
                                                                 (950, 'first_select_the_group', 'First Select The Group', 'প্রথমে গ্রুপটি নির্বাচন করুন');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`) VALUES
                                                                 (951, 'percentage', 'Percentage', ''),
                                                                 (952, 'value', 'Value', 'মান'),
                                                                 (953, 'fee_group', 'Fee Group', 'ফি গ্রুপ'),
                                                                 (954, 'due_invoice', 'Due Invoice', 'ইনভয়েস'),
                                                                 (955, 'reminder', 'Reminder', 'অনুস্মারক'),
                                                                 (956, 'frequency', 'Frequency', 'ফ্রিকোয়েন্সি'),
                                                                 (957, 'notify', 'Notify', 'অবহিত'),
                                                                 (958, 'before', 'Before', 'আগে'),
                                                                 (959, 'after', 'After', 'পরে'),
                                                                 (960, 'number', 'Number', 'সংখ্যা'),
                                                                 (961, 'ref_no', 'Ref No', 'সুত্র নেই'),
                                                                 (962, 'pay_via', 'Pay Via', 'ভায়া দিয়ে'),
                                                                 (963, 'ref', 'Ref', ''),
                                                                 (964, 'dr', 'Dr', ''),
                                                                 (965, 'cr', 'Cr', ''),
                                                                 (966, 'edit_book', 'Edit Book', 'সম্পাদনা বই'),
                                                                 (967, 'leaves', 'Leaves', 'পত্রাদি'),
                                                                 (968, 'leave_request', 'Leave Request', 'অনুরোধ ত্যাগ করুন'),
                                                                 (969, 'this_file_type_is_not_allowed', 'This File Type Is Not Allowed', 'এই ফাইল টাইপ অনুমোদিত নয়'),
                                                                 (970, 'error_reading_the_file', 'Error Reading The File', 'ফাইলটি পড়ার সময় ত্রুটি'),
                                                                 (971, 'staff', 'Staff', 'কর্মী'),
                                                                 (972, 'waiting', 'Waiting', 'অপেক্ষা'),
                                                                 (973, 'live', 'Live', 'লাইভ দেখান'),
                                                                 (974, 'by', 'By', ''),
                                                                 (975, 'host_live_class', 'Host Live Class', 'হোস্ট লাইভ ক্লাস'),
                                                                 (976, 'join_live_class', 'Join Live Class', 'লাইভ ক্লাসে যোগদান করুন'),
                                                                 (977, 'system_logo', 'System Logo', 'সিস্টেম লোগো'),
                                                                 (978, 'text_logo', 'Text Logo', 'পাঠ্য লোগো'),
                                                                 (979, 'printing_logo', 'Printing Logo', 'মুদ্রণ লোগো'),
                                                                 (980, 'expired', 'Expired', 'মেয়াদোত্তীর্ণ'),
                                                                 (981, 'collect_fees', 'Collect Fees', 'ফি সংগ্রহ করুন'),
                                                                 (982, 'fees_code', 'Fees Code', 'ফি কোড'),
                                                                 (983, 'collect_by', 'Collect By', 'সংগ্রহ করুন'),
                                                                 (984, 'fee_payment', 'Fee Payment', 'ফি জমাদান'),
                                                                 (985, 'write_message', 'Write Message', 'বার্তা লিখুন'),
                                                                 (986, 'discard', 'Discard', 'বাতিল করা'),
                                                                 (987, 'message_sent_successfully', 'Message Sent Successfully', 'বার্তা সফলভাবে পাঠানো হয়েছে'),
                                                                 (988, 'visit_home_page', 'Visit Home Page', ''),
                                                                 (989, 'frontend', 'Frontend', ''),
                                                                 (990, 'setting', 'Setting', ''),
                                                                 (991, 'menu', 'Menu', ''),
                                                                 (992, 'page', 'Page', ''),
                                                                 (993, 'manage', 'Manage', ''),
                                                                 (994, 'slider', 'Slider', ''),
                                                                 (995, 'features', 'Features', ''),
                                                                 (996, 'testimonial', 'Testimonial', ''),
                                                                 (997, 'service', 'Service', ''),
                                                                 (998, 'faq', 'Faq', ''),
                                                                 (999, 'card_management', 'Card Management', ''),
                                                                 (1000, 'id_card', 'Id Card', ''),
                                                                 (1001, 'templete', 'Templete', ''),
                                                                 (1002, 'admit_card', 'Admit Card', ''),
                                                                 (1003, 'certificate', 'Certificate', ''),
                                                                 (1004, 'system_update', 'System Update', ''),
                                                                 (1005, 'url', 'Url', ''),
                                                                 (1006, 'content', 'Content', ''),
                                                                 (1007, 'banner_photo', 'Banner Photo', ''),
                                                                 (1008, 'meta', 'Meta', ''),
                                                                 (1009, 'keyword', 'Keyword', ''),
                                                                 (1010, 'applicable_user', 'Applicable User', ''),
                                                                 (1011, 'page_layout', 'Page Layout', ''),
                                                                 (1012, 'background', 'Background', ''),
                                                                 (1013, 'image', 'Image', ''),
                                                                 (1014, 'width', 'Width', ''),
                                                                 (1015, 'height', 'Height', ''),
                                                                 (1016, 'signature', 'Signature', ''),
                                                                 (1017, 'website', 'Website', ''),
                                                                 (1018, 'cms', 'Cms', ''),
                                                                 (1019, 'url_alias', 'Url Alias', ''),
                                                                 (1020, 'cms_frontend', 'Cms Frontend', ''),
                                                                 (1021, 'enabled', 'Enabled', ''),
                                                                 (1022, 'receive_email_to', 'Receive Email To', ''),
                                                                 (1023, 'captcha_status', 'Captcha Status', ''),
                                                                 (1024, 'recaptcha_site_key', 'Recaptcha Site Key', ''),
                                                                 (1025, 'recaptcha_secret_key', 'Recaptcha Secret Key', ''),
                                                                 (1026, 'working_hours', 'Working Hours', ''),
                                                                 (1027, 'fav_icon', 'Fav Icon', ''),
                                                                 (1028, 'theme', 'Theme', ''),
                                                                 (1029, 'fax', 'Fax', ''),
                                                                 (1030, 'footer_about_text', 'Footer About Text', ''),
                                                                 (1031, 'copyright_text', 'Copyright Text', ''),
                                                                 (1032, 'facebook_url', 'Facebook Url', ''),
                                                                 (1033, 'twitter_url', 'Twitter Url', ''),
                                                                 (1034, 'youtube_url', 'Youtube Url', ''),
                                                                 (1035, 'google_plus', 'Google Plus', ''),
                                                                 (1036, 'linkedin_url', 'Linkedin Url', ''),
                                                                 (1037, 'pinterest_url', 'Pinterest Url', ''),
                                                                 (1038, 'instagram_url', 'Instagram Url', ''),
                                                                 (1039, 'play', 'Play', ''),
                                                                 (1040, 'video', 'Video', ''),
                                                                 (1041, 'usename', 'Usename', ''),
                                                                 (1042, 'experience_details', 'Experience Details', ''),
                                                                 (1043, 'total_experience', 'Total Experience', ''),
                                                                 (1044, 'class_schedule', 'Class Schedule', ''),
                                                                 (1045, 'cms_default_branch', 'Cms Default Branch', ''),
                                                                 (1046, 'website_page', 'Website Page', ''),
                                                                 (1047, 'welcome', 'Welcome', ''),
                                                                 (1048, 'services', 'Services', ''),
                                                                 (1049, 'call_to_action_section', 'Call To Action Section', ''),
                                                                 (1050, 'subtitle', 'Subtitle', ''),
                                                                 (1051, 'cta', 'Cta', ''),
                                                                 (1052, 'button_text', 'Button Text', ''),
                                                                 (1053, 'button_url', 'Button Url', ''),
                                                                 (1054, '_title', ' Title', ''),
                                                                 (1055, 'contact', 'Contact', ''),
                                                                 (1056, 'box_title', 'Box Title', ''),
                                                                 (1057, 'box_description', 'Box Description', ''),
                                                                 (1058, 'box_photo', 'Box Photo', ''),
                                                                 (1059, 'form_title', 'Form Title', ''),
                                                                 (1060, 'submit_button_text', 'Submit Button Text', ''),
                                                                 (1061, 'map_iframe', 'Map Iframe', ''),
                                                                 (1062, 'email_subject', 'Email Subject', ''),
                                                                 (1063, 'prefix', 'Prefix', ''),
                                                                 (1064, 'surname', 'Surname', ''),
                                                                 (1065, 'rank', 'Rank', ''),
                                                                 (1066, 'submit', 'Submit', ''),
                                                                 (1067, 'certificate_name', 'Certificate Name', ''),
                                                                 (1068, 'layout_width', 'Layout Width', ''),
                                                                 (1069, 'layout_height', 'Layout Height', ''),
                                                                 (1070, 'expiry_date', 'Expiry Date', ''),
                                                                 (1071, 'position', 'Position', ''),
                                                                 (1072, 'target_new_window', 'Target New Window', ''),
                                                                 (1073, 'external_url', 'External Url', ''),
                                                                 (1074, 'external_link', 'External Link', ''),
                                                                 (1075, 'sms_notification', 'Sms Notification', ''),
                                                                 (1076, 'scheduled_at', 'Scheduled At', ''),
                                                                 (1077, 'published', 'Published', ''),
                                                                 (1078, 'unpublished_on_website', 'Unpublished On Website', ''),
                                                                 (1079, 'published_on_website', 'Published On Website', ''),
                                                                 (1080, 'no_selection_available', 'No Selection Available', ''),
                                                                 (1081, 'select_for_everyone', 'Select For Everyone', ''),
                                                                 (1082, 'teacher_restricted', 'Teacher Restricted', ''),
                                                                 (1083, 'guardian_relation', 'Guardian Relation', ''),
                                                                 (1084, 'username_prefix', 'Username Prefix', ''),
                                                                 (1085, 'default_password', 'Default Password', ''),
                                                                 (1086, 'parents_profile', 'Parents Profile', ''),
                                                                 (1087, 'childs', 'Childs', ''),
                                                                 (1088, 'page_title', 'Page Title', ''),
                                                                 (1089, 'select_menu', 'Select Menu', ''),
                                                                 (1090, 'meta_keyword', 'Meta Keyword', ''),
                                                                 (1091, 'meta_description', 'Meta Description', ''),
                                                                 (1092, 'evaluation_date', 'Evaluation Date', ''),
                                                                 (1093, 'evaluated_by', 'Evaluated By', ''),
                                                                 (1094, 'complete', 'Complete', ''),
                                                                 (1095, 'incomplete', 'Incomplete', ''),
                                                                 (1096, 'payment_details', 'Payment Details', ''),
                                                                 (1097, 'edit_attachments', 'Edit Attachments', ''),
                                                                 (1098, 'live_classes', 'Live Classes', ''),
                                                                 (1099, 'duration', 'Duration', ''),
                                                                 (1100, 'metting_id', 'Metting Id', ''),
                                                                 (1101, 'set_record', 'Set Record', ''),
                                                                 (1102, 'set_mute_on_start', 'Set Mute On Start', ''),
                                                                 (1103, 'button_text_1', 'Button Text 1', ''),
                                                                 (1104, 'button_url_1', 'Button Url 1', ''),
                                                                 (1105, 'button_text_2', 'Button Text 2', ''),
                                                                 (1106, 'button_url_2', 'Button Url 2', ''),
                                                                 (1107, 'left', 'Left', ''),
                                                                 (1108, 'center', 'Center', ''),
                                                                 (1109, 'right', 'Right', ''),
                                                                 (1110, 'about', 'About', ''),
                                                                 (1111, 'about_photo', 'About Photo', ''),
                                                                 (1112, 'parallax_photo', 'Parallax Photo', ''),
                                                                 (1113, 'decline', 'Decline', ''),
                                                                 (1114, 'edit_grade', 'Edit Grade', ''),
                                                                 (1115, 'mark', 'Mark', ''),
                                                                 (1116, 'hall_room', 'Hall Room', ''),
                                                                 (1117, 'student_promotion', 'Student Promotion', ''),
                                                                 (1118, 'username_has_already_been_used', 'Username Has Already Been Used', ''),
                                                                 (1119, 'fee_collection', 'Fee Collection', ''),
                                                                 (1120, 'not_found_anything', 'Not Found Anything', ''),
                                                                 (1121, 'preloader_backend', 'Preloader Backend', ''),
                                                                 (1122, 'ive_class_method', 'Ive Class Method', ''),
                                                                 (1123, 'live_class_method', 'Live Class Method', ''),
                                                                 (1124, 'api_credential', 'Api Credential', ''),
                                                                 (1125, 'translation_update', 'Translation Update', ''),
                                                                 (1126, ' live_class_reports', ' Live Class Reports', ''),
                                                                 (1127, 'live_class_reports', 'Live Class Reports', ''),
                                                                 (1128, 'all', 'All', ''),
                                                                 (1129, 'student_participation_report', 'Student Participation Report', ''),
                                                                 (1130, 'joining_time', 'Joining Time', ''),
                                                                 (1131, 'gallery', 'Gallery', ''),
                                                                 (1132, 'you_are_now_using_the_latest_version', 'You Are Now Using The Latest Version', ''),
                                                                 (1133, 'system_student_field', 'System Student Field', ''),
                                                                 (1134, 'august', 'August', ''),
                                                                 (1135, 'whatsapp_settings', 'Whatsapp Settings', ''),
                                                                 (1136, 'general_setting', 'General Setting', ''),
                                                                 (1137, 'unique_roll', 'Unique Roll', ''),
                                                                 (1138, 'classes_wise', 'Classes Wise', ''),
                                                                 (1139, 'section_wise', 'Section Wise', ''),
                                                                 (1140, 'fees_carry_forward_setting', 'Fees Carry Forward Setting', ''),
                                                                 (1141, 'due_days', 'Due Days', ''),
                                                                 (1142, 'due_fees_calculation_with_fine_', 'Due Fees Calculation With Fine ', ''),
                                                                 (1143, 'SMS configuration not found', 'SMS Configuration Not Found', ''),
                                                                 (1144, 'october', 'October', ''),
                                                                 (1145, 'online_exam', 'Online Exam', ''),
                                                                 (1146, 'question_bank', 'Question Bank', ''),
                                                                 (1147, 'question_group', 'Question Group', ''),
                                                                 (1148, 'reception', 'Reception', ''),
                                                                 (1149, 'admission_enquiry', 'Admission Enquiry', ''),
                                                                 (1150, 'postal_record', 'Postal Record', ''),
                                                                 (1151, 'call_log', 'Call Log', ''),
                                                                 (1152, 'visitor_log', 'Visitor Log', ''),
                                                                 (1153, 'complaint', 'Complaint', ''),
                                                                 (1154, 'progress', 'Progress', ''),
                                                                 (1155, 'today_birthday', 'Today Birthday', ''),
                                                                 (1156, 'questions_qty', 'Questions Qty', ''),
                                                                 (1157, 'exam_status', 'Exam Status', ''),
                                                                 (1158, 'limits_of_participation', 'Limits Of Participation', ''),
                                                                 (1159, 'passing_mark', 'Passing Mark', ''),
                                                                 (1160, 'instruction', 'Instruction', ''),
                                                                 (1161, 'free', 'Free', ''),
                                                                 (1162, 'question', 'Question', ''),
                                                                 (1163, 'random', 'Random', ''),
                                                                 (1164, 'result_publish', 'Result Publish', ''),
                                                                 (1165, 'negative_mark', 'Negative Mark', ''),
                                                                 (1166, 'applicable', 'Applicable', ''),
                                                                 (1167, 'marks_display', 'Marks Display', ''),
                                                                 (1168, 'make', 'Make', ''),
                                                                 (1169, 'level', 'Level', ''),
                                                                 (1170, 'single_choice', 'Single Choice', ''),
                                                                 (1171, 'multiple_choice', 'Multiple Choice', ''),
                                                                 (1172, 'true/false', 'True/false', ''),
                                                                 (1173, 'descriptive', 'Descriptive', ''),
                                                                 (1174, 'easy', 'Easy', ''),
                                                                 (1175, 'medium', 'Medium', ''),
                                                                 (1176, 'hard', 'Hard', ''),
                                                                 (1177, 'guardian_picture', 'Guardian Picture', ''),
                                                                 (1178, 'edit_branch', 'Edit Branch', ''),
                                                                 (1179, 'parent_menu', 'Parent Menu', ''),
                                                                 (1180, 'statistics', 'Statistics', ''),
                                                                 (1181, 'employees', 'Employees', ''),
                                                                 (1182, 'classes', 'Classes', ''),
                                                                 (1183, 'show_tutorial', 'Show Tutorial', ''),
                                                                 (1184, 'Notice', 'Notice', ''),
                                                                 (1185, 'sit_plan', 'Sit Plan', ''),
                                                                 (1186, 'december', 'December', ''),
                                                                 (1187, 'header_title', 'Header Title', ''),
                                                                 (1188, 'frontend_enable_chat', 'Frontend Enable Chat', ''),
                                                                 (1189, 'backend_enable_chat', 'Backend Enable Chat', ''),
                                                                 (1190, 'whatsapp_agent', 'Whatsapp Agent', ''),
                                                                 (1191, 'agent', 'Agent', ''),
                                                                 (1192, 'whataspp_number', 'Whataspp Number', ''),
                                                                 (1193, 'weekend', 'Weekend', ''),
                                                                 (1194, 'active', 'Active', ''),
                                                                 (1195, 'language_unpublished', 'Language Unpublished', ''),
                                                                 (1196, 'fields', 'Fields', ''),
                                                                 (1197, 'create_section', 'Create Section', ''),
                                                                 (1198, 'section_list', 'Section List', ''),
                                                                 (1199, 'addition_subject_code', 'Addition Subject Code', ''),
                                                                 (1200, 'sub_mark', 'Sub Mark', ''),
                                                                 (1201, 'cut_point', 'Cut Point', ''),
                                                                 (1202, 'header_image', 'Header Image', ''),
                                                                 (1203, 'thumb_image', 'Thumb Image', ''),
                                                                 (1204, 'uploaded', 'Uploaded', ''),
                                                                 (1205, 'show_website', 'Show Website', ''),
                                                                 (1206, 'gallery_title', 'Gallery Title', ''),
                                                                 (1207, 'album', 'Album', ''),
                                                                 (1208, 'video_url', 'Video Url', ''),
                                                                 (1209, 'merit_list', 'Merit List', ''),
                                                                 (1210, 'default_template', 'Default Template', '');

-- --------------------------------------------------------

--
-- Table structure for table `language_list`
--

CREATE TABLE `language_list` (
                                 `id` int(11) NOT NULL,
                                 `name` varchar(600) NOT NULL,
                                 `lang_field` varchar(600) NOT NULL,
                                 `status` tinyint(1) NOT NULL DEFAULT 1,
                                 `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                 `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `language_list`
--

INSERT INTO `language_list` (`id`, `name`, `lang_field`, `status`, `created_at`, `updated_at`) VALUES
                                                                                                   (1, 'English', 'english', 1, '2018-11-15 11:36:31', '2022-12-04 23:34:20'),
                                                                                                   (2, 'Bengali', 'bengali', 1, '2018-11-15 11:36:31', '2018-12-04 15:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

CREATE TABLE `leave_application` (
                                     `id` int(11) NOT NULL,
                                     `user_id` int(11) NOT NULL,
                                     `role_id` int(11) NOT NULL,
                                     `category_id` int(2) NOT NULL,
                                     `reason` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
                                     `start_date` date NOT NULL,
                                     `end_date` date NOT NULL,
                                     `leave_days` varchar(20) NOT NULL DEFAULT '0',
                                     `status` int(2) NOT NULL DEFAULT 1 COMMENT '1=pending,2=accepted 3=rejected',
                                     `apply_date` date DEFAULT NULL,
                                     `approved_by` int(11) NOT NULL,
                                     `orig_file_name` varchar(255) NOT NULL,
                                     `enc_file_name` varchar(255) NOT NULL,
                                     `comments` varchar(255) NOT NULL,
                                     `session_id` int(11) DEFAULT NULL,
                                     `branch_id` int(11) DEFAULT NULL,
                                     `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                     `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `leave_category`
--

CREATE TABLE `leave_category` (
                                  `id` int(2) NOT NULL,
                                  `name` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
                                  `role_id` tinyint(1) NOT NULL,
                                  `days` int(11) NOT NULL,
                                  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `live_class`
--

CREATE TABLE `live_class` (
                              `id` int(11) NOT NULL,
                              `live_class_method` tinyint(1) NOT NULL DEFAULT 1,
                              `title` varchar(255) NOT NULL,
                              `meeting_id` varchar(255) NOT NULL,
                              `meeting_password` varchar(255) NOT NULL,
                              `own_api_key` tinyint(1) NOT NULL DEFAULT 0,
                              `duration` int(11) NOT NULL,
                              `bbb` longtext NOT NULL,
                              `class_id` int(11) NOT NULL,
                              `section_id` text NOT NULL,
                              `remarks` text NOT NULL,
                              `date` date NOT NULL,
                              `start_time` time NOT NULL,
                              `end_time` time NOT NULL,
                              `created_by` int(11) NOT NULL,
                              `status` tinyint(1) NOT NULL DEFAULT 0,
                              `created_at` timestamp NULL DEFAULT current_timestamp(),
                              `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `live_class_config`
--

CREATE TABLE `live_class_config` (
                                     `id` int(11) NOT NULL,
                                     `zoom_api_key` varchar(255) DEFAULT NULL,
                                     `zoom_api_secret` varchar(255) DEFAULT NULL,
                                     `bbb_salt_key` varchar(355) DEFAULT NULL,
                                     `bbb_server_base_url` varchar(355) DEFAULT NULL,
                                     `staff_api_credential` tinyint(1) NOT NULL DEFAULT 0,
                                     `student_api_credential` tinyint(1) NOT NULL DEFAULT 0,
                                     `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `live_class_reports`
--

CREATE TABLE `live_class_reports` (
                                      `id` int(11) NOT NULL,
                                      `live_class_id` int(11) NOT NULL,
                                      `student_id` int(11) NOT NULL,
                                      `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `login_credential`
--

CREATE TABLE `login_credential` (
                                    `id` int(11) NOT NULL,
                                    `user_id` int(11) NOT NULL,
                                    `username` varchar(100) NOT NULL,
                                    `password` varchar(250) NOT NULL,
                                    `role` tinyint(2) NOT NULL,
                                    `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1(active) 0(deactivate)',
                                    `last_login` datetime DEFAULT NULL,
                                    `created_at` timestamp NULL DEFAULT current_timestamp(),
                                    `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `login_credential`
--

INSERT INTO `login_credential` (`id`, `user_id`, `username`, `password`, `role`, `active`, `last_login`, `created_at`, `updated_at`) VALUES
                                                                                                                                         (1, 1, 'omithasan@gmail.com', '$2y$10$4M4mfuC0GTvuLPNyutUQIOQDEzKUSR3/3jUydU1HPtHL6JOH1u.ha', 1, 1, '2022-12-05 22:14:30', '2022-03-29 18:19:55', NULL),
                                                                                                                                         (2, 1, 'omit118', '$2y$10$Js7cJS26cM/cQ7rhFoHZLuaqJIJohbj0YZun2q1Qvm2soe61dCVz6', 6, 1, NULL, '2022-10-09 08:22:27', NULL),
                                                                                                                                         (3, 2, 'omit', '$2y$10$oqj.d72Xoi.SNsG0bf4JEu4915VF/VqIGKiD9KiT.tcYVaeYyvjZu', 4, 1, '2022-10-15 21:14:44', '2022-10-15 15:14:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE `mark` (
                        `id` int(11) NOT NULL,
                        `student_id` int(11) NOT NULL,
                        `subject_id` int(11) NOT NULL,
                        `class_id` int(11) NOT NULL,
                        `section_id` int(11) NOT NULL,
                        `exam_id` int(11) NOT NULL,
                        `mark` text DEFAULT NULL,
                        `absent` varchar(4) DEFAULT NULL,
                        `session_id` int(11) NOT NULL,
                        `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
                           `id` int(11) NOT NULL,
                           `body` longtext NOT NULL,
                           `subject` varchar(255) NOT NULL,
                           `file_name` text DEFAULT NULL,
                           `enc_name` text DEFAULT NULL,
                           `trash_sent` tinyint(1) NOT NULL,
                           `trash_inbox` int(11) NOT NULL,
                           `fav_inbox` tinyint(1) NOT NULL,
                           `fav_sent` tinyint(1) NOT NULL,
                           `reciever` varchar(100) NOT NULL,
                           `sender` varchar(100) NOT NULL,
                           `read_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read',
                           `reply_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read',
                           `created_at` datetime NOT NULL,
                           `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `message_reply`
--

CREATE TABLE `message_reply` (
                                 `id` int(11) UNSIGNED NOT NULL,
                                 `message_id` int(11) NOT NULL,
                                 `body` text NOT NULL,
                                 `file_name` text NOT NULL,
                                 `enc_name` text NOT NULL,
                                 `identity` int(11) NOT NULL,
                                 `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
    `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
    (530);

-- --------------------------------------------------------

--
-- Table structure for table `online_admission`
--

CREATE TABLE `online_admission` (
                                    `id` int(11) NOT NULL,
                                    `first_name` varchar(255) NOT NULL,
                                    `last_name` varchar(255) DEFAULT NULL,
                                    `gender` varchar(25) DEFAULT NULL,
                                    `birthday` varchar(100) DEFAULT NULL,
                                    `religion` varchar(100) DEFAULT NULL,
                                    `caste` varchar(100) DEFAULT NULL,
                                    `blood_group` varchar(100) DEFAULT NULL,
                                    `mobile_no` varchar(50) DEFAULT NULL,
                                    `mother_tongue` varchar(100) DEFAULT NULL,
                                    `email` varchar(255) DEFAULT NULL,
                                    `previous_school_details` text DEFAULT NULL,
                                    `present_address` text DEFAULT NULL,
                                    `permanent_address` text DEFAULT NULL,
                                    `admission_date` varchar(100) DEFAULT NULL,
                                    `city` varchar(255) DEFAULT NULL,
                                    `state` varchar(255) DEFAULT NULL,
                                    `student_photo` varchar(255) DEFAULT NULL,
                                    `category_id` varchar(255) DEFAULT NULL,
                                    `guardian_name` varchar(255) DEFAULT NULL,
                                    `guardian_relation` varchar(50) DEFAULT NULL,
                                    `father_name` varchar(255) DEFAULT NULL,
                                    `mother_name` varchar(255) DEFAULT NULL,
                                    `grd_occupation` varchar(255) DEFAULT NULL,
                                    `grd_income` varchar(25) DEFAULT NULL,
                                    `grd_education` varchar(255) DEFAULT NULL,
                                    `grd_email` varchar(255) DEFAULT NULL,
                                    `grd_mobile_no` varchar(50) DEFAULT NULL,
                                    `grd_address` text DEFAULT NULL,
                                    `grd_city` varchar(255) DEFAULT NULL,
                                    `grd_state` varchar(255) DEFAULT NULL,
                                    `grd_photo` varchar(255) DEFAULT NULL,
                                    `status` tinyint(3) NOT NULL DEFAULT 1,
                                    `payment_status` tinyint(1) NOT NULL DEFAULT 0,
                                    `payment_amount` decimal(18,2) NOT NULL,
                                    `payment_details` longtext NOT NULL,
                                    `branch_id` int(11) NOT NULL,
                                    `class_id` int(11) NOT NULL,
                                    `section_id` int(11) DEFAULT NULL,
                                    `apply_date` datetime NOT NULL,
                                    `doc` varchar(255) DEFAULT NULL,
                                    `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_fields`
--

CREATE TABLE `online_admission_fields` (
                                           `id` int(11) NOT NULL,
                                           `fields_id` int(11) NOT NULL,
                                           `status` tinyint(4) NOT NULL DEFAULT 1,
                                           `required` tinyint(4) NOT NULL DEFAULT 0,
                                           `system` tinyint(1) NOT NULL DEFAULT 1,
                                           `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam`
--

CREATE TABLE `online_exam` (
                               `id` int(11) NOT NULL,
                               `title` varchar(255) DEFAULT NULL,
                               `class_id` int(11) NOT NULL,
                               `section_id` text NOT NULL,
                               `subject_id` text NOT NULL,
                               `limits_participation` int(11) NOT NULL,
                               `exam_start` datetime DEFAULT NULL,
                               `exam_end` datetime DEFAULT NULL,
                               `duration` time NOT NULL,
                               `mark_type` tinyint(1) NOT NULL DEFAULT 1,
                               `passing_mark` float NOT NULL DEFAULT 0,
                               `instruction` text DEFAULT NULL,
                               `session_id` int(11) DEFAULT NULL,
                               `publish_result` tinyint(1) NOT NULL DEFAULT 0,
                               `marks_display` tinyint(1) NOT NULL DEFAULT 1,
                               `neg_mark` tinyint(1) NOT NULL DEFAULT 0,
                               `question_type` tinyint(1) NOT NULL DEFAULT 0,
                               `publish_status` tinyint(1) NOT NULL DEFAULT 0,
                               `exam_type` tinyint(1) NOT NULL DEFAULT 0,
                               `fee` float NOT NULL DEFAULT 0,
                               `created_by` int(11) NOT NULL,
                               `position_generated` tinyint(1) NOT NULL DEFAULT 0,
                               `branch_id` int(11) NOT NULL,
                               `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                               `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_answer`
--

CREATE TABLE `online_exam_answer` (
                                      `id` int(11) NOT NULL,
                                      `student_id` int(11) NOT NULL,
                                      `online_exam_id` int(11) NOT NULL,
                                      `question_id` int(11) NOT NULL,
                                      `answer` longtext DEFAULT NULL,
                                      `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                                      `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_attempts`
--

CREATE TABLE `online_exam_attempts` (
                                        `id` int(11) NOT NULL,
                                        `student_id` int(11) NOT NULL,
                                        `online_exam_id` int(11) NOT NULL,
                                        `count` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_payment`
--

CREATE TABLE `online_exam_payment` (
                                       `id` int(11) NOT NULL,
                                       `student_id` int(11) NOT NULL,
                                       `exam_id` int(11) NOT NULL,
                                       `payment_method` tinyint(4) NOT NULL,
                                       `amount` float NOT NULL DEFAULT 0,
                                       `transaction_id` varchar(500) NOT NULL,
                                       `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_submitted`
--

CREATE TABLE `online_exam_submitted` (
                                         `id` int(11) NOT NULL,
                                         `student_id` int(11) NOT NULL,
                                         `online_exam_id` int(11) NOT NULL,
                                         `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
                                         `position` int(11) NOT NULL,
                                         `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
                          `id` int(11) NOT NULL,
                          `name` varchar(255) DEFAULT NULL,
                          `relation` varchar(255) DEFAULT NULL,
                          `father_name` varchar(255) DEFAULT NULL,
                          `mother_name` varchar(255) DEFAULT NULL,
                          `occupation` varchar(100) DEFAULT NULL,
                          `income` varchar(100) DEFAULT NULL,
                          `education` varchar(255) DEFAULT NULL,
                          `email` varchar(100) DEFAULT NULL,
                          `mobileno` varchar(100) DEFAULT NULL,
                          `address` text DEFAULT NULL,
                          `city` varchar(255) DEFAULT NULL,
                          `state` varchar(255) DEFAULT NULL,
                          `branch_id` int(11) DEFAULT NULL,
                          `photo` varchar(255) DEFAULT NULL,
                          `facebook_url` varchar(255) DEFAULT NULL,
                          `linkedin_url` varchar(255) DEFAULT NULL,
                          `twitter_url` varchar(255) DEFAULT NULL,
                          `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                          `updated_at` datetime DEFAULT NULL,
                          `active` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0(active) 1(deactivate)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`id`, `name`, `relation`, `father_name`, `mother_name`, `occupation`, `income`, `education`, `email`, `mobileno`, `address`, `city`, `state`, `branch_id`, `photo`, `facebook_url`, `linkedin_url`, `twitter_url`, `created_at`, `updated_at`, `active`) VALUES
    (1, 'Demo', 'demo', '', '', 'Farmer', '', '', 'admin@gmail.com', '01521108118', 'Dhaka', 'Dhaka', 'Dhaka', 1, 'defualt.png', '', '', '', '2022-10-09 08:22:27', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_config`
--

CREATE TABLE `payment_config` (
                                  `id` int(11) NOT NULL,
                                  `paypal_username` varchar(255) DEFAULT NULL,
                                  `paypal_password` varchar(255) DEFAULT NULL,
                                  `paypal_signature` varchar(255) DEFAULT NULL,
                                  `paypal_email` varchar(255) DEFAULT NULL,
                                  `paypal_sandbox` tinyint(4) DEFAULT NULL,
                                  `paypal_status` tinyint(4) DEFAULT NULL,
                                  `stripe_secret` varchar(255) DEFAULT NULL,
                                  `stripe_publishiable` varchar(255) NOT NULL,
                                  `stripe_demo` varchar(255) DEFAULT NULL,
                                  `stripe_status` tinyint(4) DEFAULT NULL,
                                  `payumoney_key` varchar(255) DEFAULT NULL,
                                  `payumoney_salt` varchar(255) DEFAULT NULL,
                                  `payumoney_demo` tinyint(4) DEFAULT NULL,
                                  `payumoney_status` tinyint(4) DEFAULT NULL,
                                  `paystack_secret_key` varchar(255) NOT NULL,
                                  `paystack_status` tinyint(4) NOT NULL,
                                  `razorpay_key_id` varchar(255) NOT NULL,
                                  `razorpay_key_secret` varchar(255) NOT NULL,
                                  `razorpay_demo` tinyint(4) NOT NULL,
                                  `razorpay_status` tinyint(4) NOT NULL,
                                  `sslcz_store_id` varchar(255) NOT NULL,
                                  `sslcz_store_passwd` varchar(255) NOT NULL,
                                  `sslcommerz_sandbox` tinyint(1) NOT NULL,
                                  `sslcommerz_status` tinyint(1) NOT NULL,
                                  `jazzcash_merchant_id` varchar(255) NOT NULL,
                                  `jazzcash_passwd` varchar(255) NOT NULL,
                                  `jazzcash_integerity_salt` varchar(255) NOT NULL,
                                  `jazzcash_sandbox` tinyint(1) NOT NULL,
                                  `jazzcash_status` tinyint(1) NOT NULL,
                                  `midtrans_client_key` varchar(255) NOT NULL,
                                  `midtrans_server_key` varchar(255) NOT NULL,
                                  `midtrans_sandbox` tinyint(1) NOT NULL,
                                  `midtrans_status` tinyint(1) NOT NULL,
                                  `flutterwave_public_key` varchar(255) DEFAULT NULL,
                                  `flutterwave_secret_key` varchar(255) DEFAULT NULL,
                                  `flutterwave_sandbox` tinyint(4) NOT NULL DEFAULT 0,
                                  `flutterwave_status` tinyint(4) NOT NULL DEFAULT 0,
                                  `branch_id` int(11) NOT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `payment_salary_stipend`
--

CREATE TABLE `payment_salary_stipend` (
                                          `id` int(11) NOT NULL,
                                          `payslip_id` int(11) NOT NULL,
                                          `name` longtext NOT NULL,
                                          `amount` int(11) NOT NULL,
                                          `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
                                 `id` int(11) NOT NULL,
                                 `name` varchar(255) NOT NULL,
                                 `branch_id` int(11) NOT NULL DEFAULT 0,
                                 `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `branch_id`, `timestamp`) VALUES
                                                                         (1, 'Cash', 0, '2019-07-27 18:12:21'),
                                                                         (2, 'Card', 0, '2019-07-27 18:12:31'),
                                                                         (3, 'Cheque', 0, '2019-12-21 10:07:59'),
                                                                         (4, 'Bank Transfer', 0, '2019-12-21 10:08:36'),
                                                                         (5, 'Other', 0, '2019-12-21 10:08:45'),
                                                                         (6, 'Paypal', 0, '2019-12-21 10:08:45'),
                                                                         (7, 'Stripe', 0, '2019-12-21 10:08:45'),
                                                                         (8, 'PayUmoney', 0, '2019-12-21 10:08:45'),
                                                                         (9, 'Paystack', 0, '2019-12-21 10:08:45'),
                                                                         (10, 'Razorpay', 0, '2019-12-21 10:08:45'),
                                                                         (11, 'SSLcommerz', 0, '2021-05-21 10:08:45'),
                                                                         (12, 'Jazzcash', 0, '2021-05-21 10:08:45'),
                                                                         (13, 'Midtrans', 0, '2021-05-21 10:08:45'),
                                                                         (14, 'Flutter Wave', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payslip`
--

CREATE TABLE `payslip` (
                           `id` int(11) NOT NULL,
                           `staff_id` int(11) NOT NULL,
                           `month` varchar(200) DEFAULT NULL,
                           `year` varchar(20) NOT NULL,
                           `basic_salary` decimal(18,2) NOT NULL,
                           `total_allowance` decimal(18,2) NOT NULL,
                           `total_deduction` decimal(18,2) NOT NULL,
                           `net_salary` decimal(18,2) NOT NULL,
                           `bill_no` varchar(25) NOT NULL,
                           `remarks` text NOT NULL,
                           `pay_via` tinyint(1) NOT NULL,
                           `hash` varchar(200) DEFAULT NULL,
                           `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                           `paid_by` varchar(200) DEFAULT NULL,
                           `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_details`
--

CREATE TABLE `payslip_details` (
                                   `id` int(11) NOT NULL,
                                   `payslip_id` int(11) NOT NULL,
                                   `name` varchar(255) NOT NULL,
                                   `amount` decimal(18,2) NOT NULL,
                                   `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
                              `id` int(11) NOT NULL,
                              `module_id` int(11) NOT NULL,
                              `name` varchar(100) NOT NULL,
                              `prefix` varchar(100) NOT NULL,
                              `show_view` tinyint(1) DEFAULT 1,
                              `show_add` tinyint(1) DEFAULT 1,
                              `show_edit` tinyint(1) DEFAULT 1,
                              `show_delete` tinyint(1) DEFAULT 1,
                              `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `module_id`, `name`, `prefix`, `show_view`, `show_add`, `show_edit`, `show_delete`, `created_at`) VALUES
                                                                                                                                      (1, 2, 'Student', 'student', 1, 1, 1, 1, '2020-01-22 11:45:47'),
                                                                                                                                      (2, 2, 'Multiple Import', 'multiple_import', 0, 1, 0, 0, '2020-01-22 11:45:47'),
                                                                                                                                      (3, 2, 'Student Category', 'student_category', 1, 1, 1, 1, '2020-01-22 11:45:47'),
                                                                                                                                      (4, 2, 'Student Id Card', 'student_id_card', 1, 0, 0, 0, '2020-01-22 11:45:47'),
                                                                                                                                      (5, 2, 'Disable Authentication', 'student_disable_authentication', 1, 1, 0, 0, '2020-01-22 11:45:47'),
                                                                                                                                      (6, 4, 'Employee', 'employee', 1, 1, 1, 1, '2020-01-22 11:55:19'),
                                                                                                                                      (7, 3, 'Parent', 'parent', 1, 1, 1, 1, '2020-01-22 13:24:05'),
                                                                                                                                      (8, 3, 'Disable Authentication', 'parent_disable_authentication', 1, 1, 0, 0, '2020-01-22 14:22:21'),
                                                                                                                                      (9, 4, 'Department', 'department', 1, 1, 1, 1, '2020-01-22 17:41:39'),
                                                                                                                                      (10, 4, 'Designation', 'designation', 1, 1, 1, 1, '2020-01-22 17:41:39'),
                                                                                                                                      (11, 4, 'Disable Authentication', 'employee_disable_authentication', 1, 1, 0, 0, '2020-01-22 17:41:39'),
                                                                                                                                      (12, 5, 'Salary Template', 'salary_template', 1, 1, 1, 1, '2020-01-23 05:13:57'),
                                                                                                                                      (13, 5, 'Salary Assign', 'salary_assign', 1, 1, 0, 0, '2020-01-23 05:14:05'),
                                                                                                                                      (14, 5, 'Salary Payment', 'salary_payment', 1, 1, 0, 0, '2020-01-24 06:45:40'),
                                                                                                                                      (15, 5, 'Salary Summary Report', 'salary_summary_report', 1, 0, 0, 0, '2020-03-14 17:09:17'),
                                                                                                                                      (16, 5, 'Advance Salary', 'advance_salary', 1, 1, 1, 1, '2020-01-28 18:23:39'),
                                                                                                                                      (17, 5, 'Advance Salary Manage', 'advance_salary_manage', 1, 1, 1, 1, '2020-01-25 04:57:12'),
                                                                                                                                      (18, 5, 'Advance Salary Request', 'advance_salary_request', 1, 1, 0, 1, '2020-01-28 17:49:58'),
                                                                                                                                      (19, 5, 'Leave Category', 'leave_category', 1, 1, 1, 1, '2020-01-29 02:46:23'),
                                                                                                                                      (20, 5, 'Leave Request', 'leave_request', 1, 1, 1, 1, '2020-01-30 12:06:33'),
                                                                                                                                      (21, 5, 'Leave Manage', 'leave_manage', 1, 1, 1, 1, '2020-01-29 07:27:15'),
                                                                                                                                      (22, 5, 'Award', 'award', 1, 1, 1, 1, '2020-01-31 18:49:11'),
                                                                                                                                      (23, 6, 'Classes', 'classes', 1, 1, 1, 1, '2020-02-01 18:10:00'),
                                                                                                                                      (24, 6, 'Section', 'section', 1, 1, 1, 1, '2020-02-01 21:06:44'),
                                                                                                                                      (25, 6, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2020-02-02 07:09:22'),
                                                                                                                                      (26, 6, 'Subject', 'subject', 1, 1, 1, 1, '2020-02-03 04:32:39'),
                                                                                                                                      (27, 6, 'Subject Class Assign ', 'subject_class_assign', 1, 1, 1, 1, '2020-02-03 17:43:19'),
                                                                                                                                      (28, 6, 'Subject Teacher Assign', 'subject_teacher_assign', 1, 1, 0, 1, '2020-02-03 19:05:11'),
                                                                                                                                      (29, 6, 'Class Timetable', 'class_timetable', 1, 1, 1, 1, '2020-02-04 05:50:37'),
                                                                                                                                      (30, 2, 'Student Promotion', 'student_promotion', 1, 1, 0, 0, '2020-02-05 18:20:30'),
                                                                                                                                      (31, 8, 'Attachments', 'attachments', 1, 1, 1, 1, '2020-02-06 17:59:43'),
                                                                                                                                      (32, 7, 'Homework', 'homework', 1, 1, 1, 1, '2020-02-07 05:40:08'),
                                                                                                                                      (33, 8, 'Attachment Type', 'attachment_type', 1, 1, 1, 1, '2020-02-07 07:16:28'),
                                                                                                                                      (34, 9, 'Exam', 'exam', 1, 1, 1, 1, '2020-02-07 09:59:29'),
                                                                                                                                      (35, 9, 'Exam Term', 'exam_term', 1, 1, 1, 1, '2020-02-07 12:09:28'),
                                                                                                                                      (36, 9, 'Exam Hall', 'exam_hall', 1, 1, 1, 1, '2020-02-07 14:31:04'),
                                                                                                                                      (37, 9, 'Exam Timetable', 'exam_timetable', 1, 1, 0, 1, '2020-02-08 17:04:31'),
                                                                                                                                      (38, 9, 'Exam Mark', 'exam_mark', 1, 1, 1, 1, '2020-02-10 12:53:41'),
                                                                                                                                      (39, 9, 'Exam Grade', 'exam_grade', 1, 1, 1, 1, '2020-02-10 17:29:16'),
                                                                                                                                      (40, 10, 'Hostel', 'hostel', 1, 1, 1, 1, '2020-02-11 04:41:36'),
                                                                                                                                      (41, 10, 'Hostel Category', 'hostel_category', 1, 1, 1, 1, '2020-02-11 07:52:31'),
                                                                                                                                      (42, 10, 'Hostel Room', 'hostel_room', 1, 1, 1, 1, '2020-02-11 11:50:09'),
                                                                                                                                      (43, 10, 'Hostel Allocation', 'hostel_allocation', 1, 0, 0, 1, '2020-02-11 13:06:15'),
                                                                                                                                      (44, 11, 'Transport Route', 'transport_route', 1, 1, 1, 1, '2020-02-12 05:26:19'),
                                                                                                                                      (45, 11, 'Transport Vehicle', 'transport_vehicle', 1, 1, 1, 1, '2020-02-12 05:57:30'),
                                                                                                                                      (46, 11, 'Transport Stoppage', 'transport_stoppage', 1, 1, 1, 1, '2020-02-12 06:49:20'),
                                                                                                                                      (47, 11, 'Transport Assign', 'transport_assign', 1, 1, 1, 1, '2020-02-12 09:55:21'),
                                                                                                                                      (48, 11, 'Transport Allocation', 'transport_allocation', 1, 0, 0, 1, '2020-02-12 19:33:05'),
                                                                                                                                      (49, 12, 'Student Attendance', 'student_attendance', 0, 1, 0, 0, '2020-02-13 05:25:53'),
                                                                                                                                      (50, 12, 'Employee Attendance', 'employee_attendance', 0, 1, 0, 0, '2020-02-13 10:04:16'),
                                                                                                                                      (51, 12, 'Exam Attendance', 'exam_attendance', 0, 1, 0, 0, '2020-02-13 11:08:14'),
                                                                                                                                      (52, 12, 'Student Attendance Report', 'student_attendance_report', 1, 0, 0, 0, '2020-02-13 19:20:56'),
                                                                                                                                      (53, 12, 'Employee Attendance Report', 'employee_attendance_report', 1, 0, 0, 0, '2020-02-14 06:08:53'),
                                                                                                                                      (54, 12, 'Exam Attendance Report', 'exam_attendance_report', 1, 0, 0, 0, '2020-02-14 06:21:40'),
                                                                                                                                      (55, 13, 'Book', 'book', 1, 1, 1, 1, '2020-02-14 06:40:42'),
                                                                                                                                      (56, 13, 'Book Category', 'book_category', 1, 1, 1, 1, '2020-02-15 04:11:41'),
                                                                                                                                      (57, 13, 'Book Manage', 'book_manage', 1, 1, 0, 1, '2020-02-15 11:13:24'),
                                                                                                                                      (58, 13, 'Book Request', 'book_request', 1, 1, 0, 1, '2020-02-17 06:45:19'),
                                                                                                                                      (59, 14, 'Event', 'event', 1, 1, 1, 1, '2020-02-17 18:02:15'),
                                                                                                                                      (60, 14, 'Event Type', 'event_type', 1, 1, 1, 1, '2020-02-18 04:40:33'),
                                                                                                                                      (61, 15, 'Sendsmsmail', 'sendsmsmail', 1, 1, 0, 1, '2020-02-22 07:19:57'),
                                                                                                                                      (62, 15, 'Sendsmsmail Template', 'sendsmsmail_template', 1, 1, 1, 1, '2020-02-22 10:14:57'),
                                                                                                                                      (63, 17, 'Account', 'account', 1, 1, 1, 1, '2020-02-25 09:34:43'),
                                                                                                                                      (64, 17, 'Deposit', 'deposit', 1, 1, 1, 1, '2020-02-25 12:56:11'),
                                                                                                                                      (65, 17, 'Expense', 'expense', 1, 1, 1, 1, '2020-02-26 06:35:57'),
                                                                                                                                      (66, 17, 'All Transactions', 'all_transactions', 1, 0, 0, 0, '2020-02-26 13:35:05'),
                                                                                                                                      (67, 17, 'Voucher Head', 'voucher_head', 1, 1, 1, 1, '2020-02-25 10:50:56'),
                                                                                                                                      (68, 17, 'Accounting Reports', 'accounting_reports', 1, 1, 1, 1, '2020-02-25 13:36:24'),
                                                                                                                                      (69, 16, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2020-02-27 10:11:03'),
                                                                                                                                      (70, 16, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2020-02-26 05:49:09'),
                                                                                                                                      (71, 16, 'Fees Fine Setup', 'fees_fine_setup', 1, 1, 1, 1, '2020-03-05 02:59:27'),
                                                                                                                                      (72, 16, 'Fees Allocation', 'fees_allocation', 1, 1, 1, 1, '2020-03-01 13:47:43'),
                                                                                                                                      (73, 16, 'Collect Fees', 'collect_fees', 0, 1, 0, 0, '2020-03-15 04:23:58'),
                                                                                                                                      (74, 16, 'Fees Reminder', 'fees_reminder', 1, 1, 1, 1, '2020-03-15 04:29:58'),
                                                                                                                                      (75, 16, 'Due Invoice', 'due_invoice', 1, 0, 0, 0, '2020-03-15 04:33:36'),
                                                                                                                                      (76, 16, 'Invoice', 'invoice', 1, 0, 0, 1, '2020-03-15 04:38:06'),
                                                                                                                                      (77, 9, 'Mark Distribution', 'mark_distribution', 1, 1, 1, 1, '2020-03-19 13:02:54'),
                                                                                                                                      (78, 9, 'Report Card', 'report_card', 1, 0, 0, 0, '2020-03-20 12:20:28'),
                                                                                                                                      (79, 9, 'Tabulation Sheet', 'tabulation_sheet', 1, 0, 0, 0, '2020-03-21 07:12:38'),
                                                                                                                                      (80, 15, 'Sendsmsmail Reports', 'sendsmsmail_reports', 1, 0, 0, 0, '2020-03-21 17:02:02'),
                                                                                                                                      (81, 18, 'Global Settings', 'global_settings', 1, 0, 1, 0, '2020-03-22 05:05:41'),
                                                                                                                                      (82, 18, 'Payment Settings', 'payment_settings', 1, 1, 0, 0, '2020-03-22 05:08:57'),
                                                                                                                                      (83, 18, 'Sms Settings', 'sms_settings', 1, 1, 1, 1, '2020-03-22 05:08:57'),
                                                                                                                                      (84, 18, 'Email Settings', 'email_settings', 1, 1, 1, 1, '2020-03-22 05:10:39'),
                                                                                                                                      (85, 18, 'Translations', 'translations', 1, 1, 1, 1, '2020-03-22 05:18:33'),
                                                                                                                                      (86, 18, 'Backup', 'backup', 1, 1, 1, 1, '2020-03-22 07:09:33'),
                                                                                                                                      (87, 18, 'Backup Restore', 'backup_restore', 0, 1, 0, 0, '2020-03-22 07:09:34'),
                                                                                                                                      (88, 7, 'Homework Evaluate', 'homework_evaluate', 1, 1, 0, 0, '2020-03-28 04:20:29'),
                                                                                                                                      (89, 7, 'Evaluation Report', 'evaluation_report', 1, 0, 0, 0, '2020-03-28 09:56:04'),
                                                                                                                                      (90, 18, 'School Settings', 'school_settings', 1, 0, 1, 0, '2020-03-30 17:36:37'),
                                                                                                                                      (91, 1, 'Monthly Income Vs Expense Pie Chart', 'monthly_income_vs_expense_chart', 1, 0, 0, 0, '2020-03-31 06:15:31'),
                                                                                                                                      (92, 1, 'Annual Student Fees Summary Chart', 'annual_student_fees_summary_chart', 1, 0, 0, 0, '2020-03-31 06:15:31'),
                                                                                                                                      (93, 1, 'Employee Count Widget', 'employee_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
                                                                                                                                      (94, 1, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
                                                                                                                                      (95, 1, 'Parent Count Widget', 'parent_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
                                                                                                                                      (96, 1, 'Teacher Count Widget', 'teacher_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
                                                                                                                                      (97, 1, 'Student Quantity Pie Chart', 'student_quantity_pie_chart', 1, 0, 0, 0, '2020-03-31 07:14:07'),
                                                                                                                                      (98, 1, 'Weekend Attendance Inspection Chart', 'weekend_attendance_inspection_chart', 1, 0, 0, 0, '2020-03-31 07:14:07'),
                                                                                                                                      (99, 1, 'Admission Count Widget', 'admission_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
                                                                                                                                      (100, 1, 'Voucher Count Widget', 'voucher_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
                                                                                                                                      (101, 1, 'Transport Count Widget', 'transport_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
                                                                                                                                      (102, 1, 'Hostel Count Widget', 'hostel_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
                                                                                                                                      (103, 18, 'Accounting Links', 'accounting_links', 1, 0, 1, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (104, 16, 'Fees Reports', 'fees_reports', 1, 0, 0, 0, '2020-04-01 15:52:19'),
                                                                                                                                      (105, 18, 'Cron Job', 'cron_job', 1, 0, 1, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (106, 18, 'Custom Field', 'custom_field', 1, 1, 1, 1, '2020-03-31 09:46:30'),
                                                                                                                                      (107, 5, 'Leave Reports', 'leave_reports', 1, 0, 0, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (108, 18, 'Live Class Config', 'live_class_config', 1, 0, 1, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (109, 19, 'Live Class', 'live_class', 1, 1, 1, 1, '2020-03-31 09:46:30'),
                                                                                                                                      (110, 20, 'Certificate Templete', 'certificate_templete', 1, 1, 1, 1, '2020-03-31 09:46:30'),
                                                                                                                                      (111, 20, 'Generate Student Certificate', 'generate_student_certificate', 1, 0, 0, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (112, 20, 'Generate Employee Certificate', 'generate_employee_certificate', 1, 0, 0, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (113, 21, 'ID Card Templete', 'id_card_templete', 1, 1, 1, 1, '2020-03-31 09:46:30'),
                                                                                                                                      (114, 21, 'Generate Student ID Card', 'generate_student_idcard', 1, 0, 0, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (115, 21, 'Generate Employee ID Card', 'generate_employee_idcard', 1, 0, 0, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (116, 21, 'Admit Card Templete', 'admit_card_templete', 1, 1, 1, 1, '2020-03-31 09:46:30'),
                                                                                                                                      (117, 21, 'Generate Admit card', 'generate_admit_card', 1, 0, 0, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (118, 22, 'Frontend Setting', 'frontend_setting', 1, 1, 0, 0, '2019-09-11 03:24:07'),
                                                                                                                                      (119, 22, 'Frontend Menu', 'frontend_menu', 1, 1, 1, 1, '2019-09-11 04:03:39'),
                                                                                                                                      (120, 22, 'Frontend Section', 'frontend_section', 1, 1, 0, 0, '2019-09-11 04:26:11'),
                                                                                                                                      (121, 22, 'Manage Page', 'manage_page', 1, 1, 1, 1, '2019-09-11 05:54:08'),
                                                                                                                                      (122, 22, 'Frontend Slider', 'frontend_slider', 1, 1, 1, 1, '2019-09-11 06:12:31'),
                                                                                                                                      (123, 22, 'Frontend Features', 'frontend_features', 1, 1, 1, 1, '2019-09-11 06:47:51'),
                                                                                                                                      (124, 22, 'Frontend Testimonial', 'frontend_testimonial', 1, 1, 1, 1, '2019-09-11 06:54:30'),
                                                                                                                                      (125, 22, 'Frontend Services', 'frontend_services', 1, 1, 1, 1, '2019-09-11 07:01:44'),
                                                                                                                                      (126, 22, 'Frontend Faq', 'frontend_faq', 1, 1, 1, 1, '2019-09-11 07:06:16'),
                                                                                                                                      (127, 2, 'Online Admission', 'online_admission', 1, 1, 0, 1, '2019-09-11 07:06:16'),
                                                                                                                                      (128, 18, 'System Update', 'system_update', 0, 1, 0, 0, '2019-09-11 07:06:16'),
                                                                                                                                      (129, 19, 'Live Class Reports', 'live_class_reports', 1, 0, 0, 0, '2020-03-31 09:46:30'),
                                                                                                                                      (130, 16, 'Fees Revert', 'fees_revert', 0, 0, 0, 1, '2020-03-31 09:46:30'),
                                                                                                                                      (131, 22, 'Frontend Gallery', 'frontend_gallery', 1, 1, 1, 1, '2019-09-11 07:06:16'),
                                                                                                                                      (132, 22, 'Frontend Gallery Category', 'frontend_gallery_category', 1, 1, 1, 1, '2019-09-11 07:06:16'),
                                                                                                                                      (133, 6, 'Teacher Timetable', 'teacher_timetable', 1, 0, 0, 0, '2019-09-11 07:06:16'),
                                                                                                                                      (134, 18, 'Whatsapp Config', 'whatsapp_config', 1, 1, 1, 1, '2022-08-31 15:03:10'),
                                                                                                                                      (135, 18, 'System Student Field', 'system_student_field', 1, 0, 1, 0, '2022-08-31 15:03:10'),
                                                                                                                                      (136, 23, 'Online Exam', 'online_exam', 1, 1, 1, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (137, 23, 'Question Bank', 'question_bank', 1, 1, 1, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (138, 23, 'Add Questions', 'add_questions', 0, 1, 0, 0, '2021-03-31 03:46:30'),
                                                                                                                                      (139, 23, 'Question Group', 'question_group', 1, 1, 1, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (140, 23, 'Exam Result', 'exam_result', 1, 0, 0, 0, '2021-03-31 03:46:30'),
                                                                                                                                      (141, 23, 'Position Generate', 'position_generate', 1, 1, 0, 0, '2021-03-31 03:46:30'),
                                                                                                                                      (142, 24, 'Postal Record', 'postal_record', 1, 1, 1, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (143, 24, 'Call Log', 'call_log', 1, 1, 1, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (144, 24, 'Visitor Log', 'visitor_log', 1, 1, 1, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (145, 24, 'Complaint', 'complaint', 1, 1, 1, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (146, 24, 'Enquiry', 'enquiry', 1, 1, 1, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (147, 24, 'Follow Up', 'follow_up', 1, 1, 0, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (148, 24, 'Config Reception', 'config_reception', 1, 1, 1, 1, '2021-03-31 03:46:30'),
                                                                                                                                      (149, 15, 'Student Birthday Wishes', 'student_birthday_wishes', 1, 0, 0, 0, '2021-03-31 03:46:30'),
                                                                                                                                      (150, 15, 'Staff Birthday Wishes', 'staff_birthday_wishes', 1, 0, 0, 0, '2021-03-31 03:46:30'),
                                                                                                                                      (151, 1, 'Student Birthday Wishes Widget', 'student_birthday_widget', 1, 0, 0, 0, '2021-03-31 01:22:05'),
                                                                                                                                      (152, 1, 'Staff Birthday Wishes Widget', 'staff_birthday_widget', 1, 0, 0, 0, '2021-03-31 01:22:05'),
                                                                                                                                      (153, 9, 'Progress Reports', 'progress_reports', 1, 0, 0, 0, '2021-03-21 01:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `permission_modules`
--

CREATE TABLE `permission_modules` (
                                      `id` int(11) NOT NULL,
                                      `name` varchar(50) NOT NULL,
                                      `prefix` varchar(50) NOT NULL,
                                      `system` tinyint(1) NOT NULL,
                                      `sorted` tinyint(10) NOT NULL,
                                      `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `permission_modules`
--

INSERT INTO `permission_modules` (`id`, `name`, `prefix`, `system`, `sorted`, `created_at`) VALUES
                                                                                                (1, 'Dashboard', 'dashboard', 1, 1, '2019-05-26 22:23:00'),
                                                                                                (2, 'Student', 'student', 1, 4, '2019-05-26 22:23:00'),
                                                                                                (3, 'Parents', 'parents', 1, 5, '2019-05-26 22:23:00'),
                                                                                                (4, 'Employee', 'employee', 1, 6, '2019-05-26 22:23:00'),
                                                                                                (5, 'Human Resource', 'human_resource', 1, 9, '2019-05-26 22:23:00'),
                                                                                                (6, 'Academic', 'academic', 1, 10, '2019-05-26 22:23:00'),
                                                                                                (7, 'Homework', 'homework', 1, 13, '2019-05-26 22:23:00'),
                                                                                                (8, 'Attachments Book', 'attachments_book', 1, 12, '2019-05-26 22:23:00'),
                                                                                                (9, 'Exam Master', 'exam_master', 1, 14, '2019-05-26 22:23:00'),
                                                                                                (10, 'Hostel', 'hostel', 1, 16, '2019-05-26 22:23:00'),
                                                                                                (11, 'Transport', 'transport', 1, 17, '2019-05-26 22:23:00'),
                                                                                                (12, 'Attendance', 'attendance', 1, 18, '2019-05-26 22:23:00'),
                                                                                                (13, 'Library', 'library', 1, 19, '2019-05-26 22:23:00'),
                                                                                                (14, 'Events', 'events', 1, 20, '2019-05-26 22:23:00'),
                                                                                                (15, 'Bulk Sms And Email', 'bulk_sms_and_email', 1, 21, '2019-05-26 22:23:00'),
                                                                                                (16, 'Student Accounting', 'student_accounting', 1, 22, '2019-05-26 22:23:00'),
                                                                                                (17, 'Office Accounting', 'office_accounting', 1, 23, '2019-05-26 22:23:00'),
                                                                                                (18, 'Settings', 'settings', 1, 24, '2019-05-26 22:23:00'),
                                                                                                (19, 'Live Class', 'live_class', 1, 11, '2019-05-26 22:23:00'),
                                                                                                (20, 'Certificate', 'certificate', 1, 8, '2019-05-26 22:23:00'),
                                                                                                (21, 'Card Management', 'card_management', 1, 7, '2019-05-26 22:23:00'),
                                                                                                (22, 'Website', 'website', 1, 2, '2019-05-26 22:23:00'),
                                                                                                (23, 'Online Exam', 'online_exam', 1, 15, '2019-05-26 16:23:00'),
                                                                                                (24, 'Reception', 'reception', 1, 3, '2019-05-26 16:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `postal_record`
--

CREATE TABLE `postal_record` (
                                 `id` int(11) NOT NULL,
                                 `sender_title` varchar(255) DEFAULT NULL,
                                 `receiver_title` varchar(255) DEFAULT NULL,
                                 `reference_no` varchar(255) DEFAULT NULL,
                                 `address` text NOT NULL,
                                 `date` date NOT NULL,
                                 `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
                                 `file` varchar(250) NOT NULL,
                                 `confidential` tinyint(1) NOT NULL DEFAULT 0,
                                 `created_by` int(11) NOT NULL,
                                 `type` tinyint(1) NOT NULL DEFAULT 1,
                                 `branch_id` int(11) NOT NULL,
                                 `created_at` datetime NOT NULL,
                                 `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_history`
--

CREATE TABLE `promotion_history` (
                                     `id` int(11) NOT NULL,
                                     `student_id` int(11) NOT NULL,
                                     `pre_class` int(11) NOT NULL,
                                     `pre_section` int(11) NOT NULL,
                                     `pre_session` int(11) NOT NULL,
                                     `pro_class` int(11) NOT NULL,
                                     `pro_section` int(11) NOT NULL,
                                     `pro_session` int(11) NOT NULL,
                                     `prev_due` float NOT NULL DEFAULT 0,
                                     `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
                             `id` int(11) NOT NULL,
                             `type` tinyint(1) NOT NULL,
                             `level` tinyint(1) NOT NULL,
                             `class_id` int(11) NOT NULL,
                             `section_id` int(11) DEFAULT 0,
                             `subject_id` int(11) NOT NULL DEFAULT 0,
                             `group_id` int(11) NOT NULL,
                             `question` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
                             `opt_1` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
                             `opt_2` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
                             `opt_3` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
                             `opt_4` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
                             `answer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
                             `mark` float(10,2) NOT NULL DEFAULT 0.00,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `questions_manage`
--

CREATE TABLE `questions_manage` (
                                    `id` int(11) NOT NULL,
                                    `question_id` int(11) DEFAULT NULL,
                                    `onlineexam_id` int(11) DEFAULT NULL,
                                    `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `neg_marks` float(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `question_group`
--

CREATE TABLE `question_group` (
                                  `id` int(11) NOT NULL,
                                  `name` longtext NOT NULL,
                                  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
                                  `key` longtext NOT NULL,
                                  `username` varchar(100) NOT NULL,
                                  `login_credential_id` varchar(100) NOT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `rm_sessions`
--

CREATE TABLE `rm_sessions` (
                               `id` varchar(40) NOT NULL,
                               `ip_address` varchar(45) NOT NULL,
                               `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
                               `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `rm_sessions`
--

INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
                                                                        ('00b94c7ffe0fe1eb713df5760fa99450599313ac', '103.146.17.2', 1670253620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235333632303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('0401952c645933ecd0502ffc79909e38a85b2040', '103.146.17.2', 1670259582, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235393538323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('054ec2f1e47dfcff91065b8a82d0a07d9caf85e4', '103.146.17.2', 1670254999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235343939393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('078fb50b0020c309822f34d6cd7df434b5482f21', '103.146.17.2', 1670179630, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137393633303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('09jul2vto0doad2qbgmfa32gboct7u44', '::1', 1661958325, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313935383332353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('0cv8predca22pc7ghi2jl89iq6tvo4jd', '::1', 1648581740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634383538313734303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('0fdea125e3f246bced1f7d952ebe103d91b39f18', '103.146.17.2', 1670263724, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236333732343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('0jv4vmeglq07aqrofn3ghsj30p7313e8', '::1', 1648582266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634383538323235373b72656469726563745f75726c7c733a35363a22687474703a2f2f6c6f63616c686f73742f6262622f6d61696e5f7363726970745f76342e352f73657474696e67732f756e6976657273616c223b),
                                                                        ('0luk14ufqoel2n30frddngv54nen2iod', '::1', 1665846892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353834363837353b72656469726563745f75726c7c733a36323a22687474703a2f2f6c6f63616c686f73742f62797a69645f7661692f736d732f736d735f6c61746573745f31315f31305f32322f73747564656e742f616464223b6e616d657c733a31333a224d64204f6d697420486173616e223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2233223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('1237lpjg51434m4de67310e3fu373cjf', '::1', 1665247842, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353234373834323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('12c014922ebe155c16f6dc0819687d48c26475ed', '103.146.17.2', 1670178571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137383537313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('1600dc2664d2d7d1f61bdff356d9abe4e990c34b', '103.146.17.2', 1670260074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236303037343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('17ac4f04b7ca72889aa3fed69efd0b04b2accc07', '103.146.17.2', 1670176831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137363833313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('17f38d2375c445740594ec83dc5f1a6727cf221f', '103.146.17.2', 1670263814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236333732343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('18d250e6706ea01386e5116734528a0d98d1fd31', '103.146.17.2', 1670181166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138313136363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('1bb59d789bfd9d256476ea6ca84731bf5b8334db', '66.249.66.157', 1670211892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303231313839323b),
                                                                        ('1bea19b0d36eddee4b64d1975426121bc6409474', '109.239.58.107', 1670231760, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303233313736303b),
                                                                        ('1c4c6beee7e48b5693e8739ff9b831147bfc94f4', '54.198.174.126', 1670185853, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138353835333b),
                                                                        ('1d091785a49da142701b9f172161346b29d6cb0d', '51.222.253.10', 1670250296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235303239363b),
                                                                        ('1e2da1e76a125126838a3d26d0090046cdc57df4', '51.222.253.10', 1670232482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303233323438323b),
                                                                        ('1ebc048cd84bc0e69707f50976c3995b7a29db07', '103.146.17.2', 1670181672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138313437333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('1ef4b59d47fbbd70f17e39a8ab5314a5ea444bb3', '51.222.253.7', 1670259152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235393135323b),
                                                                        ('1oluhdftfpipljk4anglh7b8o52grh4u', '::1', 1648579357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634383537393335373b),
                                                                        ('2180b21c1d48db07a2427998a65109133b434a09', '51.222.253.12', 1670261550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236313535303b),
                                                                        ('2565d1bb0759865a8a9150b29112f87afe43cf20', '103.146.17.2', 1670255620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235353632303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('29eh8c498q2jkcme2sqdbegqplsgph87', '::1', 1665846869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353834363735343b72656469726563745f75726c7c733a36393a22687474703a2f2f6c6f63616c686f73742f62797a69645f7661692f736d732f736d735f6c61746573745f31315f31305f32322f656d706c6f7965652f70726f66696c652f30223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
                                                                        ('2e9a45346d9cdab5a9e247f66f6f1a7494e97a3a', '51.222.253.6', 1670173473, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137333437333b),
                                                                        ('2lm4i90qdt01pp4n1jb0ajib03t2u3ld', '::1', 1665303838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353330333833383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('30f81e165cfe1abd74d4f3e26a0926a20db18d8c', '103.146.17.2', 1670261989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236313938393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('377b3e23ce4b6a5d2243ea18d354cb495ff5770a', '51.222.253.10', 1670263355, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236333335353b),
                                                                        ('38d1f898c2c70444ff6961d810bb8c00c7ea78d8', '51.222.253.11', 1670254040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235343034303b),
                                                                        ('3a207ef227faace4bf12dc05617811f010796778', '66.249.66.43', 1670253414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235333431343b),
                                                                        ('3b21bd93bcb761fc5f5a3eddd2707af837834a86', '193.34.75.155', 1670205630, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303230353633303b),
                                                                        ('3f74fd30cb493659a827730cdcde2ad1d731a2fc', '66.249.66.158', 1670211893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303231313839333b),
                                                                        ('3fe95278cf634f5a43febe8ca16c26f5a2de256e', '51.222.253.17', 1670180245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138303234353b),
                                                                        ('3tlfs0fdem41gug97mjvmg8dq8c8pp54', '::1', 1665509781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353530393537323b72656469726563745f75726c7c733a36303a22687474703a2f2f6c6f63616c686f73742f62797a69645f7661692f736d732f736d735f6c61746573745f31305f31305f32322f64617368626f617264223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('46833a3c93b7d5e710ff6a2248f96a56b2d332ea', '51.222.253.5', 1670255470, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235353436393b),
                                                                        ('486bb33c29ed2d1e2ed381a75b56bd4045a40ff8', '51.222.253.10', 1670229375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303232393337353b),
                                                                        ('49cdaa6d0c6f86d2364206f8643a83b982d1d672', '103.146.17.2', 1670258660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235383636303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('4b0ba13841027430f9a08b61002cc701dbcc94d1', '51.222.253.13', 1670254770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235343737303b),
                                                                        ('4lgl3gefjabkgp9ivmck4q9g8fjpm5ai', '::1', 1665303526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353330333532363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('4takj4g01r6m9jmkm7jdq7r6bs7fml49', '::1', 1648579702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634383537393730323b),
                                                                        ('5060l7acs9v16reko2lqde241qqltd2b', '::1', 1665509388, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353530393130343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('541194d6335a5f984738555b88fa60c406e5fe65', '103.146.17.2', 1670171959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137313935393b),
                                                                        ('57321697b16eb34d8c0073b25da36ff750f7dd1a', '205.169.39.63', 1670257230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235373233303b),
                                                                        ('57dd810915a868f5ac53576f442d110c69ddc2ed', '4.227.201.22', 1670230441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303233303434313b),
                                                                        ('5a3659781c2bf6a768a2878d659b634da4678f1f', '66.249.66.157', 1670215928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303231353932383b),
                                                                        ('5a885244913b7dee97ff3a2de8b73ae39d6367f1', '54.198.174.126', 1670185856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138353835363b),
                                                                        ('5atkorc653k1ujkhb6fuq83dq653bscj', '::1', 1665240463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353234303337303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('5c67bff6d35c1e65876dd36153d6ebd89d80592e', '51.222.253.14', 1670174789, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137343738393b),
                                                                        ('5e8723ffd6e7c3af091d0fb80a5a98d70568b940', '103.146.17.2', 1670179122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137393132323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('6453399b4201cdd727c1aeff4ed176c0bb582f38', '103.146.17.1', 1670249838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303234393833383b),
                                                                        ('664ea603d1f7e53b86a334de800b1222817211ce', '51.222.253.12', 1670247515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303234373531353b),
                                                                        ('6ac1952bdd22f5a9dba235123b54af16f459ef07', '51.222.253.15', 1670256928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235363932383b),
                                                                        ('6af6a32cc5361014f23a6545f224fbe2021ed6c0', '103.100.235.74', 1670262512, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236323531323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('6c8817b2ac35d6ffb3e69c510ee49c7e84c80144', '66.249.66.158', 1670183854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138333835343b),
                                                                        ('6fdf2e74791c73a168d61d9dcaf1c45cc75cbd39', '66.249.66.157', 1670178646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137383634363b),
                                                                        ('70ae761b0200d9693017ed3d56c10c0283e1bfb8', '51.222.253.15', 1670177489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137373438393b),
                                                                        ('70de5a25ffac4096ccb257b4b6c2c56cd284201a', '103.100.235.74', 1670262565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236323536353b),
                                                                        ('735360745ca153aa1eff8b12a8971c6551bcbd25', '103.146.17.2', 1670181473, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138313437333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('7394413af3d91e3020f900fa3b0cd1b78f939fc3', '95.164.156.104', 1670205622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303230353632323b),
                                                                        ('751bc64da43e0983bbd82196907210505d62e9c7', '51.222.253.19', 1670257627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235373632373b),
                                                                        ('769cce6681d508794f77fa7bb322b1d93c0e72b4', '51.222.253.3', 1670262069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236323036393b),
                                                                        ('773793ca3f4842fa7a9ee2344eb94a63f7b15678', '51.222.253.19', 1670251799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235313739393b),
                                                                        ('7798ba0154cd55c80def46aa740eb5fedc1ec548', '51.222.253.11', 1670172169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137323136393b),
                                                                        ('78ade94a8d7a62058fd0683e336eb926f7a4a7aa', '103.146.17.2', 1670260533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236303533333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('7bf1fe37ec0216d4a5ef073edea33799c271c549', '103.146.17.2', 1670176419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137363431393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('7c732e2dac877821a3a77441a8cf779451258cf6', '51.222.253.4', 1670224962, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303232343936323b),
                                                                        ('7f314f3fee7823a51f40840843ac3701ca79cfce', '103.146.17.2', 1670175714, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137353731343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('8176afa9b5a69f37f8c246f076e0011bc5900a62', '196.245.54.171', 1670260359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236303335393b),
                                                                        ('848ee3737c14d48ddf1f38f7de404c3c8a0ecf96', '51.222.253.19', 1670249600, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303234393630303b),
                                                                        ('870ff0f174124536ef253f1989f57a5bac400afc', '103.146.17.2', 1670180525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138303532353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('8852de16bc307211f5aa4fe045d6c3ff71c6df5d', '64.43.108.8', 1670205630, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303230353633303b),
                                                                        ('88e4baa64e5baad4940bfa21299475449ad6989b', '103.146.17.2', 1670254229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235343232393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('8a6bcfb9c3b1054804dcc5e8889fd101c8880741', '51.222.253.20', 1670246817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303234363831373b),
                                                                        ('8af54ce69619343932dd63e6b447cc0422eeedde', '66.249.66.159', 1670186939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138363933393b),
                                                                        ('8aqb1b2atsa8m67hm1gl0565heo008uu', '::1', 1665509104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353530393130343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('8b29ec688620751dfbffc807387070d894fb0b90', '103.100.235.74', 1670250211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235303231313b),
                                                                        ('8c366ba8b991f58f767222a1aab8da307f4ac1ba', '103.146.17.2', 1670177645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137373634353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a34313a22496e666f726d6174696f6e20486173204265656e2055706461746564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('90dc0cd81dcfe56b6a46d0f8662ba463a7327cb7', '51.222.253.20', 1670259929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235393932393b),
                                                                        ('92b87a8ce246a5471fbfb0cf14fa690b1dbc6d61', '193.34.72.24', 1670203110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303230333131303b),
                                                                        ('94cbadfce762edc6a08acd88f944941620543601', '66.249.66.158', 1670177971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137373937313b),
                                                                        ('97fcd9c752aa44017bf02d19406fa4b92641da46', '51.222.253.14', 1670245417, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303234353431373b),
                                                                        ('98e945a478dad57019f3a838bf4da0ea1cf8d0a2', '51.222.253.3', 1670262655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236323635343b),
                                                                        ('999da5c6466561e7660a993bd31fd44450b1d3bd', '202.134.14.153', 1670255809, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235353830393b),
                                                                        ('9ac13f1a3d4fe5cef6884cbf72c7d3b6614d42cd', '103.146.17.2', 1670172917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137323931373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('9ae7370e286f6fe3ce5d12327672a6d9c93f9922', '51.222.253.18', 1670252520, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235323532303b),
                                                                        ('9f95ffee30d6804c1b025f1e4a8bcb389617551d', '51.222.253.15', 1670212401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303231323430313b),
                                                                        ('a04f38e882aaf306f5c844fc45d38e9093fcf98e', '191.102.174.109', 1670203106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303230333130363b),
                                                                        ('a085ecdb3fd500028614b672fe23978882f3e9cd', '103.100.235.74', 1670262557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236323531323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('a280b5bc086b1ab602bb5f7e986bea64a0528014', '103.146.17.2', 1670177953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137373935333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('a77a6fc81927ed5ac97817886383cb097bc42096', '103.146.17.2', 1670259022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235393032323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('a9hutrttekakuqp2sd6i7v10972a7c12', '::1', 1665302017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353330323031373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('acbdcc1c80df127594ae782b9a643b37211aaea8', '103.146.17.2', 1670176084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137363038343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('aff876cfda4df1f50db9c7c8efa78802735be5da', '103.146.17.2', 1670254549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235343534393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('afvn044j9vcrai4es6klv8298anclvud', '::1', 1661961577, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313936313139303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('b098e06396d7759f97b0c0b5a8fbf2e5dcc43235', '51.222.253.12', 1670250990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235303939303b),
                                                                        ('b207797553a64b1c2133c19574b2cfccbb0d4d33', '51.222.253.17', 1670253286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235333238363b),
                                                                        ('b3927fb3e4de0af6576f001cebbda4de0143500e', '51.222.253.20', 1670248889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303234383838383b),
                                                                        ('b88976bcd07320cd6315a014f03774eeaee02b85', '51.222.253.19', 1670185149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138353134393b),
                                                                        ('b894d07582348bae323162d170ff204d77a16c44', '51.222.253.20', 1670252143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235323134333b),
                                                                        ('baksvlqmhvjeutqihn97u6qlibh42irs', '::1', 1665412175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353431323137353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('bbjvoj3injfakb79uj437hgh7csf80u0', '::1', 1665248726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353234383732363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('bc311536ad1f79cb24a312eaa46ab40d9df53621', '51.222.253.5', 1670256246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235363234363b),
                                                                        ('bpljeapjp3vg225d5ipufn8m6bt1jsh7', '::1', 1665412877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353431323836343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('c0e3de2faed66dd1f7523b11d74e218af7ffee07', '51.222.253.11', 1670251798, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235313739383b),
                                                                        ('c1d8746c43c55f26ad4e80899554c97919219fef', '103.146.17.2', 1670173829, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137333832393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('c24afc56a96fcd6666b618fbd4a9972dcb8c924f', '51.222.253.20', 1670239227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303233393232373b),
                                                                        ('c2e213a0c148ee83bc7c350014a21fba84196be8', '51.222.253.10', 1670239229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303233393232393b),
                                                                        ('c30fd066b9e174f70761a3a538f5dd070d4ed710', '103.146.17.2', 1670180837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138303833373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('c52a76dbb5d915949ba7f63e93aaa515cf5f03c8', '54.144.126.3', 1670203112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303230333131323b),
                                                                        ('c6da6a746c378028a087a9051e7f209c1968f5a6', '66.249.66.159', 1670180671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138303637313b),
                                                                        ('c8f9fcac639473c463d35bda31774649b9097800', '51.222.253.10', 1670224964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303232343936343b),
                                                                        ('c9aaa32775fea73d45c3f1b61e18d884370a0ded', '103.146.17.2', 1670256868, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235363836383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('cbc205841058282250a49ca75b1a6cd68b3bc338', '51.222.253.8', 1670246106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303234363130363b),
                                                                        ('cc34d8b4e54da2c3ebc986c9b38f3570e26f6586', '103.100.235.74', 1670253475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235333437343b),
                                                                        ('cd23930d6f8c2a6596a6ba61ec1962ad68d074e4', '66.249.66.43', 1670253415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235333431353b),
                                                                        ('ce32e105b388777c257776290050c3accb78b009', '51.222.253.15', 1670260661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236303636313b),
                                                                        ('cku1phd1vsde36bqql4o6us8b0orj1ud', '::1', 1665303838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353330333833383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a32353a224d6573736167652053656e74205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('d12f581565908f98b4b6d7288531420eeec8c6a2', '103.146.17.2', 1670174525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137343532353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('d4966bcdbdf4709243f0df5f39f61db40c7e5ced', '103.146.17.2', 1670261648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236313634383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('d6b44356db7b1591eaa43bfe0660e5c69bc36d63', '40.77.167.105', 1670206972, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303230363937323b),
                                                                        ('daf4be20f4e901e2b3b7f87a6796945d3304027d', '51.222.253.20', 1670220465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303232303436353b),
                                                                        ('dd4ac0a0651133ba539fb030e7e8431626b539bd', '103.146.17.2', 1670171959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137313935393b),
                                                                        ('dd86a5e2707684e78c4dc30a4142dea02c629310', '202.134.14.153', 1670256622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235363632323b616c6572742d6d6573736167652d6572726f727c733a33333a22557365726e616d65204f722050617373776f726420497320496e636f7272656374223b5f5f63695f766172737c613a313a7b733a31393a22616c6572742d6d6573736167652d6572726f72223b733a333a226f6c64223b7d),
                                                                        ('e22eed11ded3f904aac8b67bb6545cff47bdc1f1', '51.222.253.8', 1670178857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137383835373b),
                                                                        ('e287317e9fc5ad438115534c34bf1d98087582b3', '103.146.17.2', 1670175216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137353231363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('e2b282e936e626846ea9c4f512dcf21ed313ab31', '202.134.14.153', 1670262110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236323131303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('e4441d7b5fe6e1fb3ad8c40700574b5edfbfa120', '103.146.17.2', 1670172309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137323330393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('e64ffe3d12c1abe860c89d7c47d34f0a75d32fc9', '103.146.17.2', 1670177336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137373333363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('e6cfe7b18522787664bddb7d18ad1464edf8aae3', '51.222.253.13', 1670258329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235383332393b),
                                                                        ('ea3ebe98b28e99a377119cd2994057e2fd6fe413', '202.134.14.153', 1670255384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235353338343b),
                                                                        ('ecf9f081b34a8271657171a1296f2ed2b41b7182', '51.222.253.11', 1670235877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303233353837373b),
                                                                        ('ee521e5be6c8e83022f541906cd6881173360226', '51.222.253.7', 1670252911, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235323931313b),
                                                                        ('ee7df7947c1d5d2795a7df10db894b12ea9da3c9', '103.146.17.2', 1670172612, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137323631323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('eea2df9ac1ef2a90b42226cf996f5e04958be5e3', '51.222.253.7', 1670248211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303234383231313b),
                                                                        ('f12989db0e732a3858c15889b8c3d557f13747a9', '51.222.253.18', 1670244069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303234343036393b),
                                                                        ('f46cc5b991e1c6a892a878b2f2ce96eec49faedd', '103.146.17.2', 1670178261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137383236313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('f59ef9063061a536a23d0ec3c4f8e9231a1f23ab', '103.146.17.2', 1670262662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303236323636323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('f5c64d5195762fba8ca608df7794ea7aa8ccea80', '51.222.253.11', 1670229378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303232393337383b),
                                                                        ('f7a6c774d97bc6edfd1bc10ab7eded00a6a7e7a5', '66.249.66.158', 1670183854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303138333835343b),
                                                                        ('f8e2f68ad04ca88ace2691a4507e29b5b19e6451', '51.222.253.8', 1670200518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303230303531383b),
                                                                        ('fa03162a0c1849cb01f4439281cdeb4c45d86815', '202.134.14.153', 1670258225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235383232353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('fb0c78e9af1c760bd8bb568e4643337d33c4a215', '103.146.17.2', 1670179931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303137393933313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
                                                                        ('fe8e30dd1b9bdfc0048da5893f4070d66c6e2af7', '103.146.17.2', 1670253927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637303235333932373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
                                                                        ('fovfshc1ji7bqfhus32p38ethp7v1o8i', '::1', 1665240370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353234303337303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('fr0g2q0j988jl1f7vnahk8eqrrda9dv3', '::1', 1665303214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353330333231343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('hi0b3vkgmn32fkbq79d1kc62em65jss9', '::1', 1661961190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313936313139303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('jkg9itgpu8emun95nolouds9j3hc9mkn', '::1', 1648580198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634383538303139383b616c6572742d6d6573736167652d6572726f727c733a33333a22557365726e616d65204f722050617373776f726420497320496e636f7272656374223b5f5f63695f766172737c613a313a7b733a31393a22616c6572742d6d6573736167652d6572726f72223b733a333a226f6c64223b7d),
                                                                        ('kk3e9co9g8tu6na2qpfh6c53s7klh84d', '::1', 1661959066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313935393036363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('l39f7s8cli3vs5mlmc7136gun1cpfnlg', '::1', 1665244303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353234343330333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('nt8o1qrbalgeg1kpdbih7v83ai6cq2rr', '::1', 1665412864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353431323836343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('rciqoov1ut1qvldvv6oo6tt9o66hgc66', '::1', 1665242029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353234323032393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33363a22596f7520417265204e6f77205573696e6720546865204c61746573742056657273696f6e223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
                                                                        ('rjkc6u7k4kqp16rp3n2u1l3dga88j58u', '::1', 1665248809, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353234383732363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
                                                                        ('tec1u134a4kj8qtf4si1e9upro6d1gdb', '::1', 1665243511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353234333531313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33363a22596f7520417265204e6f77205573696e6720546865204c61746573742056657273696f6e223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
                                                                        ('u0g0a11hcrdcdkcg1cr0esoj7kkdjeog', '::1', 1665246833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353234363833333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
                         `id` int(11) NOT NULL,
                         `name` varchar(50) NOT NULL,
                         `prefix` varchar(50) DEFAULT NULL,
                         `is_system` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `prefix`, `is_system`) VALUES
                                                              (1, 'Super Admin', 'superadmin', '1'),
                                                              (2, 'Admin', 'admin', '1'),
                                                              (3, 'Teacher', 'teacher', '1'),
                                                              (4, 'Accountant', 'accountant', '1'),
                                                              (5, 'Librarian', 'librarian', '1'),
                                                              (6, 'Parent', 'parent', '1'),
                                                              (7, 'Student', 'student', '1'),
                                                              (8, 'Receptionist', 'receptionist', '1');

-- --------------------------------------------------------

--
-- Table structure for table `salary_template`
--

CREATE TABLE `salary_template` (
                                   `id` int(11) NOT NULL,
                                   `name` varchar(255) NOT NULL,
                                   `basic_salary` decimal(18,2) NOT NULL,
                                   `overtime_salary` varchar(100) NOT NULL DEFAULT '0',
                                   `branch_id` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `salary_template_details`
--

CREATE TABLE `salary_template_details` (
                                           `id` int(11) NOT NULL,
                                           `salary_template_id` varchar(20) NOT NULL,
                                           `name` varchar(200) NOT NULL,
                                           `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
                                           `type` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `schoolyear`
--

CREATE TABLE `schoolyear` (
                              `id` int(11) NOT NULL,
                              `school_year` varchar(255) NOT NULL,
                              `created_by` int(11) NOT NULL,
                              `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                              `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `schoolyear`
--

INSERT INTO `schoolyear` (`id`, `school_year`, `created_by`, `created_at`, `updated_at`) VALUES
                                                                                             (1, '2021', 1, '2020-02-25 19:35:41', '2020-02-26 16:54:49'),
                                                                                             (3, '2022', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41'),
                                                                                             (4, '2023', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
                           `id` int(11) NOT NULL,
                           `name` varchar(255) NOT NULL,
                           `capacity` varchar(20) DEFAULT NULL,
                           `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`, `capacity`, `branch_id`) VALUES
    (1, 'General', '100', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections_allocation`
--

CREATE TABLE `sections_allocation` (
                                       `id` int(11) NOT NULL,
                                       `class_id` int(11) NOT NULL,
                                       `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sections_allocation`
--

INSERT INTO `sections_allocation` (`id`, `class_id`, `section_id`) VALUES
    (1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sit_plan_templete`
--

CREATE TABLE `sit_plan_templete` (
                                     `id` int(11) NOT NULL,
                                     `card_type` tinyint(1) NOT NULL DEFAULT 0,
                                     `name` varchar(255) NOT NULL,
                                     `user_type` tinyint(1) NOT NULL,
                                     `background` varchar(355) DEFAULT NULL,
                                     `logo` varchar(355) DEFAULT NULL,
                                     `signature` varchar(255) DEFAULT NULL,
                                     `content` text NOT NULL,
                                     `layout_width` varchar(11) NOT NULL DEFAULT '54',
                                     `layout_height` varchar(11) NOT NULL DEFAULT '86',
                                     `photo_style` tinyint(1) NOT NULL,
                                     `photo_size` varchar(25) NOT NULL,
                                     `top_space` varchar(25) NOT NULL,
                                     `bottom_space` varchar(25) NOT NULL,
                                     `right_space` varchar(25) NOT NULL,
                                     `left_space` varchar(25) NOT NULL,
                                     `qr_code` varchar(25) NOT NULL,
                                     `branch_id` int(11) NOT NULL,
                                     `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sit_plan_templete`
--

INSERT INTO `sit_plan_templete` (`id`, `card_type`, `name`, `user_type`, `background`, `logo`, `signature`, `content`, `layout_width`, `layout_height`, `photo_style`, `photo_size`, `top_space`, `bottom_space`, `right_space`, `left_space`, `qr_code`, `branch_id`, `created_at`) VALUES
    (1, 1, 'Year Final', 1, 'logo2.jpg', '', '', '<p><br></p><p><br></p><table class=\"table table-bordered\"><tbody><tr><td><p>Name:  {name} </p></td><td>Section:</td></tr><tr><td><p>Class:  <span style=\"font-size: 24px;\">{class}</span> </p></td><td><p>Roll:  <span style=\"font-size: 24px;\">{roll}</span> </p></td></tr></tbody></table><p><br></p>', '94.856', '64', 1, '110', '5', '5', '20', '20', 'name', 1, '2022-11-04 10:14:56');

-- --------------------------------------------------------

--
-- Table structure for table `sms_api`
--

CREATE TABLE `sms_api` (
                           `id` int(11) NOT NULL,
                           `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sms_api`
--

INSERT INTO `sms_api` (`id`, `name`) VALUES
                                         (1, 'twilio'),
                                         (2, 'clickatell'),
                                         (3, 'msg91'),
                                         (4, 'mydokani'),
                                         (5, 'textlocal'),
                                         (6, 'smscountry'),
                                         (7, 'bulksmsbd');

-- --------------------------------------------------------

--
-- Table structure for table `sms_credential`
--

CREATE TABLE `sms_credential` (
                                  `id` int(11) NOT NULL,
                                  `sms_api_id` int(11) NOT NULL,
                                  `field_one` varchar(300) NOT NULL,
                                  `field_two` varchar(300) NOT NULL,
                                  `field_three` varchar(300) NOT NULL,
                                  `field_four` varchar(300) NOT NULL,
                                  `branch_id` int(11) NOT NULL,
                                  `is_active` tinyint(1) NOT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sms_credential`
--

INSERT INTO `sms_credential` (`id`, `sms_api_id`, `field_one`, `field_two`, `field_three`, `field_four`, `branch_id`, `is_active`, `created_at`, `updated_at`) VALUES
    (1, 4, 'http://sms.mydokani.com', '27c448c42af46bb038f37e7860670c51c7a54ffa', '', '', 1, 1, '2022-08-31 15:20:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

CREATE TABLE `sms_template` (
                                `id` int(11) NOT NULL,
                                `name` varchar(255) NOT NULL,
                                `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sms_template`
--

INSERT INTO `sms_template` (`id`, `name`, `tags`) VALUES
                                                      (1, 'admission', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}'),
                                                      (2, 'fee_collection', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {paid_amount}, {paid_date} '),
                                                      (3, 'attendance', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}'),
                                                      (4, 'exam_attendance', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_name}, {term_name}, {subject}'),
                                                      (5, 'exam_results', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_name}, {term_name}, {subject}, {marks}'),
                                                      (6, 'homework', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {subject}, {date_of_homework}, {date_of_submission}'),
                                                      (7, 'live_class', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {date_of_live_class}, {start_time}, {end_time}, {host_by}'),
                                                      (8, 'online_exam_publish', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_title}, {start_time}, {end_time}, {time_duration}, {attempt}, {passing_mark}, {exam_fee}'),
                                                      (9, 'student_birthday_wishes', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {birthday}'),
                                                      (10, 'staff_birthday_wishes', '{name}, {birthday}, {joining_date}');

-- --------------------------------------------------------

--
-- Table structure for table `sms_template_details`
--

CREATE TABLE `sms_template_details` (
                                        `id` int(11) NOT NULL,
                                        `template_id` int(11) NOT NULL,
                                        `dlt_template_id` varchar(255) DEFAULT NULL,
                                        `notify_student` tinyint(3) NOT NULL DEFAULT 1,
                                        `notify_parent` tinyint(3) NOT NULL DEFAULT 1,
                                        `template_body` longtext NOT NULL,
                                        `branch_id` int(11) NOT NULL,
                                        `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
                         `id` int(11) NOT NULL,
                         `staff_id` varchar(25) NOT NULL,
                         `name` varchar(255) NOT NULL,
                         `department` int(11) NOT NULL,
                         `qualification` varchar(255) NOT NULL,
                         `experience_details` varchar(255) DEFAULT NULL,
                         `total_experience` varchar(255) DEFAULT NULL,
                         `designation` int(11) NOT NULL,
                         `joining_date` varchar(100) NOT NULL,
                         `birthday` varchar(100) NOT NULL,
                         `sex` varchar(20) NOT NULL,
                         `religion` varchar(100) NOT NULL,
                         `blood_group` varchar(20) NOT NULL,
                         `present_address` text NOT NULL,
                         `permanent_address` text NOT NULL,
                         `mobileno` varchar(100) NOT NULL,
                         `email` varchar(100) NOT NULL,
                         `salary_template_id` int(11) DEFAULT 0,
                         `branch_id` int(11) DEFAULT NULL,
                         `photo` varchar(255) DEFAULT NULL,
                         `facebook_url` varchar(255) DEFAULT NULL,
                         `linkedin_url` varchar(255) DEFAULT NULL,
                         `twitter_url` varchar(255) DEFAULT NULL,
                         `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                         `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff_id`, `name`, `department`, `qualification`, `experience_details`, `total_experience`, `designation`, `joining_date`, `birthday`, `sex`, `religion`, `blood_group`, `present_address`, `permanent_address`, `mobileno`, `email`, `salary_template_id`, `branch_id`, `photo`, `facebook_url`, `linkedin_url`, `twitter_url`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                             (1, '32d7def', 'admin', 0, '', NULL, NULL, 0, '2022-03-29', '', '', '', '', '', '', '', 'omithasan@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, '2022-03-29 18:19:55', NULL),
                                                                                                                                                                                                                                                                                                                                                                                             (2, 'a3687b0', 'Md Omit Hasan', 1, 'HSc', '', '', 1, '2022-10-15', '', 'male', '', '', 'Dhaka', '', '01916962118', 'omithasan118@gmail.com', 0, 1, 'defualt.png', '', '', '', '2022-10-15 15:14:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
                                    `id` int(11) NOT NULL,
                                    `staff_id` int(11) NOT NULL,
                                    `status` varchar(11) DEFAULT NULL COMMENT 'P=Present, A=Absent, H=Holiday, L=Late',
                                    `remark` varchar(255) NOT NULL,
                                    `date` date DEFAULT NULL,
                                    `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff_bank_account`
--

CREATE TABLE `staff_bank_account` (
                                      `id` int(11) NOT NULL,
                                      `staff_id` int(11) NOT NULL,
                                      `bank_name` varchar(200) NOT NULL,
                                      `holder_name` varchar(255) NOT NULL,
                                      `bank_branch` varchar(255) NOT NULL,
                                      `bank_address` varchar(255) NOT NULL,
                                      `ifsc_code` varchar(200) NOT NULL,
                                      `account_no` varchar(200) NOT NULL,
                                      `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                      `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_bank_account`
--

INSERT INTO `staff_bank_account` (`id`, `staff_id`, `bank_name`, `holder_name`, `bank_branch`, `bank_address`, `ifsc_code`, `account_no`, `created_at`, `updated_at`) VALUES
    (1, 2, 'DBBL', 'MD omit', 'Dhaka', '', '', '119.101.363494', '2022-10-15 15:14:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_department`
--

CREATE TABLE `staff_department` (
                                    `id` int(11) NOT NULL,
                                    `name` longtext NOT NULL,
                                    `branch_id` int(11) NOT NULL,
                                    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                    `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_department`
--

INSERT INTO `staff_department` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
    (1, 'Hr', 1, '2022-10-15 15:13:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
                                     `id` int(11) NOT NULL,
                                     `name` longtext NOT NULL,
                                     `branch_id` int(11) NOT NULL,
                                     `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                     `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
    (1, 'Stuff', 1, '2022-10-15 15:13:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_documents`
--

CREATE TABLE `staff_documents` (
                                   `id` int(11) NOT NULL,
                                   `staff_id` int(11) NOT NULL,
                                   `title` varchar(255) NOT NULL,
                                   `category_id` varchar(20) NOT NULL,
                                   `remarks` text NOT NULL,
                                   `file_name` varchar(255) NOT NULL,
                                   `enc_name` varchar(255) NOT NULL,
                                   `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                   `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff_privileges`
--

CREATE TABLE `staff_privileges` (
                                    `id` int(11) NOT NULL,
                                    `role_id` int(11) NOT NULL,
                                    `permission_id` int(11) NOT NULL,
                                    `is_add` tinyint(1) NOT NULL,
                                    `is_edit` tinyint(1) NOT NULL,
                                    `is_view` tinyint(1) NOT NULL,
                                    `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_privileges`
--

INSERT INTO `staff_privileges` (`id`, `role_id`, `permission_id`, `is_add`, `is_edit`, `is_view`, `is_delete`) VALUES
                                                                                                                   (1, 3, 1, 1, 1, 1, 1),
                                                                                                                   (2, 3, 2, 0, 0, 0, 0),
                                                                                                                   (3, 3, 3, 1, 1, 1, 1),
                                                                                                                   (4, 3, 4, 0, 0, 0, 0),
                                                                                                                   (5, 3, 5, 0, 0, 0, 0),
                                                                                                                   (6, 3, 30, 0, 0, 0, 0),
                                                                                                                   (7, 3, 7, 0, 0, 0, 0),
                                                                                                                   (8, 3, 8, 0, 0, 0, 0),
                                                                                                                   (9, 3, 6, 0, 0, 1, 0),
                                                                                                                   (10, 3, 9, 0, 0, 0, 0),
                                                                                                                   (11, 3, 10, 0, 0, 0, 0),
                                                                                                                   (12, 3, 11, 0, 0, 0, 0),
                                                                                                                   (13, 3, 12, 0, 0, 0, 0),
                                                                                                                   (14, 3, 13, 0, 0, 0, 0),
                                                                                                                   (15, 3, 14, 0, 0, 1, 0),
                                                                                                                   (16, 3, 15, 0, 0, 1, 0),
                                                                                                                   (17, 3, 16, 0, 0, 0, 0),
                                                                                                                   (18, 3, 17, 0, 0, 0, 0),
                                                                                                                   (20, 3, 19, 0, 0, 0, 0),
                                                                                                                   (21, 3, 20, 1, 1, 1, 1),
                                                                                                                   (22, 3, 21, 0, 0, 0, 0),
                                                                                                                   (23, 3, 22, 0, 0, 1, 0),
                                                                                                                   (24, 3, 23, 0, 0, 1, 0),
                                                                                                                   (25, 3, 24, 0, 0, 1, 0),
                                                                                                                   (26, 3, 25, 0, 0, 1, 0),
                                                                                                                   (27, 3, 26, 0, 0, 1, 0),
                                                                                                                   (28, 3, 27, 0, 0, 1, 0),
                                                                                                                   (29, 3, 28, 0, 0, 1, 0),
                                                                                                                   (30, 3, 29, 0, 0, 1, 0),
                                                                                                                   (31, 3, 32, 1, 1, 1, 1),
                                                                                                                   (32, 3, 31, 1, 1, 1, 1),
                                                                                                                   (33, 3, 33, 1, 1, 1, 1),
                                                                                                                   (34, 3, 34, 1, 1, 1, 1),
                                                                                                                   (35, 3, 35, 1, 1, 1, 1),
                                                                                                                   (36, 3, 36, 1, 1, 1, 1),
                                                                                                                   (37, 3, 37, 0, 0, 0, 0),
                                                                                                                   (38, 3, 38, 1, 1, 1, 1),
                                                                                                                   (39, 3, 39, 1, 1, 1, 1),
                                                                                                                   (40, 3, 77, 1, 1, 1, 1),
                                                                                                                   (41, 3, 78, 0, 0, 1, 0),
                                                                                                                   (42, 3, 79, 0, 0, 0, 0),
                                                                                                                   (43, 3, 40, 0, 0, 0, 0),
                                                                                                                   (44, 3, 41, 0, 0, 0, 0),
                                                                                                                   (45, 3, 42, 0, 0, 0, 0),
                                                                                                                   (46, 3, 43, 0, 0, 0, 0),
                                                                                                                   (47, 3, 44, 0, 0, 0, 0),
                                                                                                                   (48, 3, 45, 0, 0, 0, 0),
                                                                                                                   (49, 3, 46, 0, 0, 0, 0),
                                                                                                                   (50, 3, 47, 0, 0, 0, 0),
                                                                                                                   (51, 3, 48, 0, 0, 0, 0),
                                                                                                                   (52, 3, 49, 1, 0, 0, 0),
                                                                                                                   (53, 3, 50, 0, 0, 0, 0),
                                                                                                                   (54, 3, 51, 0, 0, 0, 0),
                                                                                                                   (55, 3, 52, 0, 0, 0, 0),
                                                                                                                   (56, 3, 53, 0, 0, 0, 0),
                                                                                                                   (57, 3, 54, 0, 0, 0, 0),
                                                                                                                   (58, 3, 55, 0, 0, 1, 0),
                                                                                                                   (59, 3, 56, 0, 0, 0, 0),
                                                                                                                   (60, 3, 57, 0, 0, 0, 0),
                                                                                                                   (61, 3, 58, 1, 0, 1, 1),
                                                                                                                   (62, 3, 59, 0, 0, 1, 0),
                                                                                                                   (63, 3, 60, 0, 0, 0, 0),
                                                                                                                   (64, 3, 61, 0, 0, 0, 0),
                                                                                                                   (65, 3, 62, 0, 0, 0, 0),
                                                                                                                   (66, 3, 80, 0, 0, 0, 0),
                                                                                                                   (67, 3, 69, 0, 0, 0, 0),
                                                                                                                   (68, 3, 70, 0, 0, 0, 0),
                                                                                                                   (69, 3, 71, 0, 0, 0, 0),
                                                                                                                   (70, 3, 72, 0, 0, 0, 0),
                                                                                                                   (71, 3, 73, 0, 0, 0, 0),
                                                                                                                   (72, 3, 74, 0, 0, 0, 0),
                                                                                                                   (73, 3, 75, 0, 0, 0, 0),
                                                                                                                   (74, 3, 76, 0, 0, 0, 0),
                                                                                                                   (75, 3, 63, 0, 0, 0, 0),
                                                                                                                   (76, 3, 64, 0, 0, 0, 0),
                                                                                                                   (77, 3, 65, 0, 0, 0, 0),
                                                                                                                   (78, 3, 66, 0, 0, 0, 0),
                                                                                                                   (79, 3, 67, 0, 0, 0, 0),
                                                                                                                   (80, 3, 68, 0, 0, 0, 0),
                                                                                                                   (81, 3, 81, 0, 0, 0, 0),
                                                                                                                   (82, 3, 82, 0, 0, 0, 0),
                                                                                                                   (83, 3, 83, 0, 0, 0, 0),
                                                                                                                   (84, 3, 84, 0, 0, 0, 0),
                                                                                                                   (85, 3, 85, 0, 0, 0, 0),
                                                                                                                   (86, 3, 86, 0, 0, 0, 0),
                                                                                                                   (87, 3, 87, 0, 0, 0, 0),
                                                                                                                   (88, 2, 1, 1, 1, 1, 1),
                                                                                                                   (89, 2, 2, 1, 0, 0, 0),
                                                                                                                   (90, 2, 3, 1, 1, 1, 1),
                                                                                                                   (91, 2, 4, 0, 0, 1, 0),
                                                                                                                   (92, 2, 5, 1, 0, 1, 0),
                                                                                                                   (93, 2, 30, 1, 0, 1, 0),
                                                                                                                   (94, 2, 7, 1, 1, 1, 1),
                                                                                                                   (95, 2, 8, 1, 0, 1, 0),
                                                                                                                   (96, 2, 6, 1, 1, 1, 1),
                                                                                                                   (97, 2, 9, 1, 1, 1, 1),
                                                                                                                   (98, 2, 10, 1, 1, 1, 1),
                                                                                                                   (99, 2, 11, 1, 0, 1, 0),
                                                                                                                   (100, 2, 12, 1, 1, 1, 1),
                                                                                                                   (101, 2, 13, 1, 0, 1, 0),
                                                                                                                   (102, 2, 14, 1, 0, 1, 0),
                                                                                                                   (103, 2, 15, 0, 0, 1, 0),
                                                                                                                   (104, 2, 16, 1, 1, 1, 1),
                                                                                                                   (105, 2, 17, 1, 1, 1, 1),
                                                                                                                   (107, 2, 19, 1, 1, 1, 1),
                                                                                                                   (108, 2, 20, 1, 1, 1, 1),
                                                                                                                   (109, 2, 21, 1, 1, 1, 1),
                                                                                                                   (110, 2, 22, 1, 1, 1, 1),
                                                                                                                   (111, 2, 23, 1, 1, 1, 1),
                                                                                                                   (112, 2, 24, 1, 1, 1, 1),
                                                                                                                   (113, 2, 25, 1, 1, 1, 1),
                                                                                                                   (114, 2, 26, 1, 1, 1, 1),
                                                                                                                   (115, 2, 27, 1, 1, 1, 1),
                                                                                                                   (116, 2, 28, 1, 0, 1, 1),
                                                                                                                   (117, 2, 29, 1, 1, 1, 1),
                                                                                                                   (118, 2, 32, 1, 1, 1, 1),
                                                                                                                   (119, 2, 31, 1, 1, 1, 1),
                                                                                                                   (120, 2, 33, 1, 1, 1, 1),
                                                                                                                   (121, 2, 34, 1, 1, 1, 1),
                                                                                                                   (122, 2, 35, 1, 1, 1, 1),
                                                                                                                   (123, 2, 36, 1, 1, 1, 1),
                                                                                                                   (124, 2, 37, 1, 0, 1, 1),
                                                                                                                   (125, 2, 38, 1, 1, 1, 1),
                                                                                                                   (126, 2, 39, 1, 1, 1, 1),
                                                                                                                   (127, 2, 77, 1, 1, 1, 1),
                                                                                                                   (128, 2, 78, 0, 0, 1, 0),
                                                                                                                   (129, 2, 79, 0, 0, 1, 0),
                                                                                                                   (130, 2, 40, 1, 1, 1, 1),
                                                                                                                   (131, 2, 41, 1, 1, 1, 1),
                                                                                                                   (132, 2, 42, 1, 1, 1, 1),
                                                                                                                   (133, 2, 43, 0, 0, 1, 1),
                                                                                                                   (134, 2, 44, 1, 1, 1, 1),
                                                                                                                   (135, 2, 45, 1, 1, 1, 1),
                                                                                                                   (136, 2, 46, 1, 1, 1, 1),
                                                                                                                   (137, 2, 47, 1, 1, 1, 1),
                                                                                                                   (138, 2, 48, 0, 0, 1, 1),
                                                                                                                   (139, 2, 49, 1, 0, 0, 0),
                                                                                                                   (140, 2, 50, 1, 0, 0, 0),
                                                                                                                   (141, 2, 51, 1, 0, 0, 0),
                                                                                                                   (142, 2, 52, 0, 0, 1, 0),
                                                                                                                   (143, 2, 53, 0, 0, 1, 0),
                                                                                                                   (144, 2, 54, 0, 0, 1, 0),
                                                                                                                   (145, 2, 55, 1, 1, 1, 1),
                                                                                                                   (146, 2, 56, 1, 1, 1, 1),
                                                                                                                   (147, 2, 57, 1, 0, 1, 1),
                                                                                                                   (148, 2, 58, 1, 0, 1, 1),
                                                                                                                   (149, 2, 59, 1, 1, 1, 1),
                                                                                                                   (150, 2, 60, 1, 1, 1, 1),
                                                                                                                   (151, 2, 61, 1, 0, 1, 1),
                                                                                                                   (152, 2, 62, 1, 1, 1, 1),
                                                                                                                   (153, 2, 80, 0, 0, 1, 0),
                                                                                                                   (154, 2, 69, 1, 1, 1, 1),
                                                                                                                   (155, 2, 70, 1, 1, 1, 1),
                                                                                                                   (156, 2, 71, 1, 1, 1, 1),
                                                                                                                   (157, 2, 72, 1, 1, 1, 1),
                                                                                                                   (158, 2, 73, 1, 0, 0, 0),
                                                                                                                   (159, 2, 74, 1, 1, 1, 1),
                                                                                                                   (160, 2, 75, 0, 0, 1, 0),
                                                                                                                   (161, 2, 76, 0, 0, 1, 1),
                                                                                                                   (162, 2, 63, 1, 1, 1, 1),
                                                                                                                   (163, 2, 64, 1, 1, 1, 1),
                                                                                                                   (164, 2, 65, 1, 1, 1, 1),
                                                                                                                   (165, 2, 66, 0, 0, 1, 0),
                                                                                                                   (166, 2, 67, 1, 1, 1, 1),
                                                                                                                   (167, 2, 68, 1, 1, 1, 1),
                                                                                                                   (168, 2, 81, 0, 0, 0, 0),
                                                                                                                   (169, 2, 82, 1, 0, 1, 0),
                                                                                                                   (170, 2, 83, 1, 1, 1, 1),
                                                                                                                   (171, 2, 84, 1, 1, 1, 1),
                                                                                                                   (172, 2, 85, 1, 1, 1, 1),
                                                                                                                   (173, 2, 86, 0, 0, 0, 0),
                                                                                                                   (174, 2, 87, 0, 0, 0, 0),
                                                                                                                   (175, 7, 1, 0, 0, 0, 0),
                                                                                                                   (176, 7, 2, 0, 0, 0, 0),
                                                                                                                   (177, 7, 3, 0, 0, 0, 0),
                                                                                                                   (178, 7, 4, 0, 0, 0, 0),
                                                                                                                   (179, 7, 5, 0, 0, 0, 0),
                                                                                                                   (180, 7, 30, 0, 0, 0, 0),
                                                                                                                   (181, 7, 7, 0, 0, 0, 0),
                                                                                                                   (182, 7, 8, 0, 0, 0, 0),
                                                                                                                   (183, 7, 6, 0, 0, 0, 0),
                                                                                                                   (184, 7, 9, 0, 0, 0, 0),
                                                                                                                   (185, 7, 10, 0, 0, 0, 0),
                                                                                                                   (186, 7, 11, 0, 0, 0, 0),
                                                                                                                   (187, 7, 12, 0, 0, 0, 0),
                                                                                                                   (188, 7, 13, 0, 0, 0, 0),
                                                                                                                   (189, 7, 14, 0, 0, 0, 0),
                                                                                                                   (190, 7, 15, 0, 0, 0, 0),
                                                                                                                   (191, 7, 16, 0, 0, 0, 0),
                                                                                                                   (192, 7, 17, 0, 0, 0, 0),
                                                                                                                   (194, 7, 19, 0, 0, 0, 0),
                                                                                                                   (195, 7, 20, 0, 0, 0, 0),
                                                                                                                   (196, 7, 21, 0, 0, 0, 0),
                                                                                                                   (197, 7, 22, 0, 0, 0, 0),
                                                                                                                   (198, 7, 23, 0, 0, 0, 0),
                                                                                                                   (199, 7, 24, 0, 0, 0, 0),
                                                                                                                   (200, 7, 25, 0, 0, 0, 0),
                                                                                                                   (201, 7, 26, 0, 0, 1, 0),
                                                                                                                   (202, 7, 27, 0, 0, 0, 0),
                                                                                                                   (203, 7, 28, 0, 0, 0, 0),
                                                                                                                   (204, 7, 29, 0, 0, 1, 0),
                                                                                                                   (205, 7, 32, 0, 0, 0, 0),
                                                                                                                   (206, 7, 31, 0, 0, 0, 0),
                                                                                                                   (207, 7, 33, 0, 0, 0, 0),
                                                                                                                   (208, 7, 34, 0, 0, 0, 0),
                                                                                                                   (209, 7, 35, 0, 0, 0, 0),
                                                                                                                   (210, 7, 36, 0, 0, 0, 0),
                                                                                                                   (211, 7, 37, 0, 0, 0, 0),
                                                                                                                   (212, 7, 38, 0, 0, 0, 0),
                                                                                                                   (213, 7, 39, 0, 0, 0, 0),
                                                                                                                   (214, 7, 77, 0, 0, 0, 0),
                                                                                                                   (215, 7, 78, 0, 0, 0, 0),
                                                                                                                   (216, 7, 79, 0, 0, 0, 0),
                                                                                                                   (217, 7, 40, 0, 0, 0, 0),
                                                                                                                   (218, 7, 41, 0, 0, 0, 0),
                                                                                                                   (219, 7, 42, 0, 0, 0, 0),
                                                                                                                   (220, 7, 43, 0, 0, 0, 0),
                                                                                                                   (221, 7, 44, 0, 0, 0, 0),
                                                                                                                   (222, 7, 45, 0, 0, 0, 0),
                                                                                                                   (223, 7, 46, 0, 0, 0, 0),
                                                                                                                   (224, 7, 47, 0, 0, 0, 0),
                                                                                                                   (225, 7, 48, 0, 0, 0, 0),
                                                                                                                   (226, 7, 49, 0, 0, 0, 0),
                                                                                                                   (227, 7, 50, 0, 0, 0, 0),
                                                                                                                   (228, 7, 51, 0, 0, 0, 0),
                                                                                                                   (229, 7, 52, 0, 0, 0, 0),
                                                                                                                   (230, 7, 53, 0, 0, 0, 0),
                                                                                                                   (231, 7, 54, 0, 0, 0, 0),
                                                                                                                   (232, 7, 55, 0, 0, 0, 0),
                                                                                                                   (233, 7, 56, 0, 0, 0, 0),
                                                                                                                   (234, 7, 57, 0, 0, 0, 0),
                                                                                                                   (235, 7, 58, 0, 0, 0, 0),
                                                                                                                   (236, 7, 59, 0, 0, 0, 0),
                                                                                                                   (237, 7, 60, 0, 0, 0, 0),
                                                                                                                   (238, 7, 61, 0, 0, 0, 0),
                                                                                                                   (239, 7, 62, 0, 0, 0, 0),
                                                                                                                   (240, 7, 80, 0, 0, 0, 0),
                                                                                                                   (241, 7, 69, 0, 0, 0, 0),
                                                                                                                   (242, 7, 70, 0, 0, 0, 0),
                                                                                                                   (243, 7, 71, 0, 0, 0, 0),
                                                                                                                   (244, 7, 72, 0, 0, 0, 0),
                                                                                                                   (245, 7, 73, 0, 0, 0, 0),
                                                                                                                   (246, 7, 74, 0, 0, 0, 0),
                                                                                                                   (247, 7, 75, 0, 0, 0, 0),
                                                                                                                   (248, 7, 76, 0, 0, 0, 0),
                                                                                                                   (249, 7, 63, 0, 0, 0, 0),
                                                                                                                   (250, 7, 64, 0, 0, 0, 0),
                                                                                                                   (251, 7, 65, 0, 0, 0, 0),
                                                                                                                   (252, 7, 66, 0, 0, 0, 0),
                                                                                                                   (253, 7, 67, 0, 0, 0, 0),
                                                                                                                   (254, 7, 68, 0, 0, 0, 0),
                                                                                                                   (255, 7, 81, 0, 0, 0, 0),
                                                                                                                   (256, 7, 82, 0, 0, 0, 0),
                                                                                                                   (257, 7, 83, 0, 0, 0, 0),
                                                                                                                   (258, 7, 84, 0, 0, 0, 0),
                                                                                                                   (259, 7, 85, 0, 0, 0, 0),
                                                                                                                   (260, 7, 86, 0, 0, 0, 0),
                                                                                                                   (261, 7, 87, 0, 0, 0, 0),
                                                                                                                   (262, 88, 88, 1, 1, 1, 1),
                                                                                                                   (263, 88, 88, 1, 1, 1, 1),
                                                                                                                   (264, 89, 89, 1, 1, 1, 1),
                                                                                                                   (265, 90, 90, 1, 1, 1, 1),
                                                                                                                   (266, 2, 88, 1, 0, 1, 0),
                                                                                                                   (267, 2, 89, 0, 0, 1, 0),
                                                                                                                   (268, 90, 90, 1, 1, 1, 1),
                                                                                                                   (269, 2, 90, 0, 1, 1, 0),
                                                                                                                   (270, 91, 91, 1, 1, 1, 1),
                                                                                                                   (271, 92, 92, 1, 1, 1, 1),
                                                                                                                   (272, 2, 91, 0, 0, 1, 0),
                                                                                                                   (273, 2, 92, 0, 0, 1, 0),
                                                                                                                   (274, 93, 93, 1, 1, 1, 1),
                                                                                                                   (275, 94, 94, 1, 1, 1, 1),
                                                                                                                   (276, 95, 95, 1, 1, 1, 1),
                                                                                                                   (277, 96, 96, 1, 1, 1, 1),
                                                                                                                   (278, 2, 93, 0, 0, 1, 0),
                                                                                                                   (279, 2, 94, 0, 0, 1, 0),
                                                                                                                   (280, 2, 95, 0, 0, 1, 0),
                                                                                                                   (281, 2, 96, 0, 0, 1, 0),
                                                                                                                   (282, 97, 97, 1, 1, 1, 1),
                                                                                                                   (283, 98, 98, 1, 1, 1, 1),
                                                                                                                   (284, 2, 97, 0, 0, 1, 0),
                                                                                                                   (285, 2, 98, 0, 0, 1, 0),
                                                                                                                   (286, 99, 99, 1, 1, 1, 1),
                                                                                                                   (287, 100, 100, 1, 1, 1, 1),
                                                                                                                   (288, 101, 101, 1, 1, 1, 1),
                                                                                                                   (289, 102, 102, 1, 1, 1, 1),
                                                                                                                   (290, 2, 99, 0, 0, 1, 0),
                                                                                                                   (291, 2, 100, 0, 0, 1, 0),
                                                                                                                   (292, 2, 101, 0, 0, 1, 0),
                                                                                                                   (293, 2, 102, 0, 0, 1, 0),
                                                                                                                   (294, 103, 103, 1, 1, 1, 1),
                                                                                                                   (295, 2, 103, 0, 1, 1, 0),
                                                                                                                   (296, 3, 91, 0, 0, 0, 0),
                                                                                                                   (297, 3, 92, 0, 0, 0, 0),
                                                                                                                   (298, 3, 93, 0, 0, 1, 0),
                                                                                                                   (299, 3, 94, 0, 0, 1, 0),
                                                                                                                   (300, 3, 95, 0, 0, 1, 0),
                                                                                                                   (301, 3, 96, 0, 0, 1, 0),
                                                                                                                   (302, 3, 97, 0, 0, 1, 0),
                                                                                                                   (303, 3, 98, 0, 0, 1, 0),
                                                                                                                   (304, 3, 99, 0, 0, 0, 0),
                                                                                                                   (305, 3, 100, 0, 0, 0, 0),
                                                                                                                   (306, 3, 101, 0, 0, 0, 0),
                                                                                                                   (307, 3, 102, 0, 0, 0, 0),
                                                                                                                   (308, 3, 88, 1, 0, 1, 0),
                                                                                                                   (309, 3, 89, 0, 0, 1, 0),
                                                                                                                   (310, 3, 90, 0, 0, 0, 0),
                                                                                                                   (311, 3, 103, 0, 0, 0, 0),
                                                                                                                   (312, 4, 91, 0, 0, 1, 0),
                                                                                                                   (313, 4, 92, 0, 0, 1, 0),
                                                                                                                   (314, 4, 93, 0, 0, 0, 0),
                                                                                                                   (315, 4, 94, 0, 0, 0, 0),
                                                                                                                   (316, 4, 95, 0, 0, 0, 0),
                                                                                                                   (317, 4, 96, 0, 0, 0, 0),
                                                                                                                   (318, 4, 97, 0, 0, 0, 0),
                                                                                                                   (319, 4, 98, 0, 0, 0, 0),
                                                                                                                   (320, 4, 99, 0, 0, 0, 0),
                                                                                                                   (321, 4, 100, 0, 0, 0, 0),
                                                                                                                   (322, 4, 101, 0, 0, 0, 0),
                                                                                                                   (323, 4, 102, 0, 0, 0, 0),
                                                                                                                   (324, 4, 1, 0, 0, 0, 0),
                                                                                                                   (325, 4, 2, 0, 0, 0, 0),
                                                                                                                   (326, 4, 3, 0, 0, 0, 0),
                                                                                                                   (327, 4, 4, 0, 0, 0, 0),
                                                                                                                   (328, 4, 5, 0, 0, 0, 0),
                                                                                                                   (329, 4, 30, 0, 0, 0, 0),
                                                                                                                   (330, 4, 7, 0, 0, 0, 0),
                                                                                                                   (331, 4, 8, 0, 0, 0, 0),
                                                                                                                   (332, 4, 6, 0, 0, 0, 0),
                                                                                                                   (333, 4, 9, 0, 0, 0, 0),
                                                                                                                   (334, 4, 10, 0, 0, 0, 0),
                                                                                                                   (335, 4, 11, 0, 0, 0, 0),
                                                                                                                   (336, 4, 12, 1, 1, 1, 1),
                                                                                                                   (337, 4, 13, 1, 0, 1, 0),
                                                                                                                   (338, 4, 14, 1, 0, 1, 0),
                                                                                                                   (339, 4, 15, 0, 0, 1, 0),
                                                                                                                   (340, 4, 16, 1, 1, 1, 1),
                                                                                                                   (341, 4, 17, 1, 1, 1, 1),
                                                                                                                   (343, 4, 19, 1, 1, 1, 1),
                                                                                                                   (344, 4, 20, 1, 1, 1, 1),
                                                                                                                   (345, 4, 21, 1, 1, 1, 1),
                                                                                                                   (346, 4, 22, 1, 1, 1, 1),
                                                                                                                   (347, 4, 23, 0, 0, 0, 0),
                                                                                                                   (348, 4, 24, 0, 0, 0, 0),
                                                                                                                   (349, 4, 25, 0, 0, 0, 0),
                                                                                                                   (350, 4, 26, 0, 0, 0, 0),
                                                                                                                   (351, 4, 27, 0, 0, 0, 0),
                                                                                                                   (352, 4, 28, 0, 0, 0, 0),
                                                                                                                   (353, 4, 29, 0, 0, 0, 0),
                                                                                                                   (354, 4, 32, 0, 0, 0, 0),
                                                                                                                   (355, 4, 88, 0, 0, 0, 0),
                                                                                                                   (356, 4, 89, 0, 0, 0, 0),
                                                                                                                   (357, 4, 31, 0, 0, 0, 0),
                                                                                                                   (358, 4, 33, 0, 0, 0, 0),
                                                                                                                   (359, 4, 34, 0, 0, 0, 0),
                                                                                                                   (360, 4, 35, 0, 0, 0, 0),
                                                                                                                   (361, 4, 36, 0, 0, 0, 0),
                                                                                                                   (362, 4, 37, 0, 0, 0, 0),
                                                                                                                   (363, 4, 38, 0, 0, 0, 0),
                                                                                                                   (364, 4, 39, 0, 0, 0, 0),
                                                                                                                   (365, 4, 77, 0, 0, 0, 0),
                                                                                                                   (366, 4, 78, 0, 0, 0, 0),
                                                                                                                   (367, 4, 79, 0, 0, 0, 0),
                                                                                                                   (368, 4, 40, 0, 0, 0, 0),
                                                                                                                   (369, 4, 41, 0, 0, 0, 0),
                                                                                                                   (370, 4, 42, 0, 0, 0, 0),
                                                                                                                   (371, 4, 43, 0, 0, 0, 0),
                                                                                                                   (372, 4, 44, 0, 0, 0, 0),
                                                                                                                   (373, 4, 45, 0, 0, 0, 0),
                                                                                                                   (374, 4, 46, 0, 0, 0, 0),
                                                                                                                   (375, 4, 47, 0, 0, 0, 0),
                                                                                                                   (376, 4, 48, 0, 0, 0, 0),
                                                                                                                   (377, 4, 49, 0, 0, 0, 0),
                                                                                                                   (378, 4, 50, 0, 0, 0, 0),
                                                                                                                   (379, 4, 51, 0, 0, 0, 0),
                                                                                                                   (380, 4, 52, 0, 0, 0, 0),
                                                                                                                   (381, 4, 53, 0, 0, 0, 0),
                                                                                                                   (382, 4, 54, 0, 0, 0, 0),
                                                                                                                   (383, 4, 55, 0, 0, 1, 0),
                                                                                                                   (384, 4, 56, 0, 0, 0, 0),
                                                                                                                   (385, 4, 57, 0, 0, 0, 0),
                                                                                                                   (386, 4, 58, 1, 0, 1, 0),
                                                                                                                   (387, 4, 59, 0, 0, 0, 0),
                                                                                                                   (388, 4, 60, 0, 0, 0, 0),
                                                                                                                   (389, 4, 61, 0, 0, 0, 0),
                                                                                                                   (390, 4, 62, 0, 0, 0, 0),
                                                                                                                   (391, 4, 80, 0, 0, 0, 0),
                                                                                                                   (392, 4, 69, 1, 1, 1, 1),
                                                                                                                   (393, 4, 70, 1, 1, 1, 1),
                                                                                                                   (394, 4, 71, 1, 1, 1, 1),
                                                                                                                   (395, 4, 72, 1, 1, 1, 1),
                                                                                                                   (396, 4, 73, 1, 0, 0, 0),
                                                                                                                   (397, 4, 74, 1, 1, 1, 1),
                                                                                                                   (398, 4, 75, 0, 0, 1, 0),
                                                                                                                   (399, 4, 76, 0, 0, 1, 0),
                                                                                                                   (400, 4, 63, 1, 1, 1, 1),
                                                                                                                   (401, 4, 64, 1, 1, 1, 1),
                                                                                                                   (402, 4, 65, 1, 1, 1, 1),
                                                                                                                   (403, 4, 66, 0, 0, 1, 0),
                                                                                                                   (404, 4, 67, 1, 1, 1, 1),
                                                                                                                   (405, 4, 68, 1, 1, 1, 1),
                                                                                                                   (406, 4, 81, 0, 0, 0, 0),
                                                                                                                   (407, 4, 82, 0, 0, 0, 0),
                                                                                                                   (408, 4, 83, 0, 0, 0, 0),
                                                                                                                   (409, 4, 84, 0, 0, 0, 0),
                                                                                                                   (410, 4, 85, 0, 0, 0, 0),
                                                                                                                   (411, 4, 86, 0, 0, 0, 0),
                                                                                                                   (412, 4, 87, 0, 0, 0, 0),
                                                                                                                   (413, 4, 90, 0, 0, 0, 0),
                                                                                                                   (414, 4, 103, 0, 0, 0, 0),
                                                                                                                   (415, 5, 91, 0, 0, 0, 0),
                                                                                                                   (416, 5, 92, 0, 0, 0, 0),
                                                                                                                   (417, 5, 93, 0, 0, 1, 0),
                                                                                                                   (418, 5, 94, 0, 0, 1, 0),
                                                                                                                   (419, 5, 95, 0, 0, 0, 0),
                                                                                                                   (420, 5, 96, 0, 0, 0, 0),
                                                                                                                   (421, 5, 97, 0, 0, 0, 0),
                                                                                                                   (422, 5, 98, 0, 0, 0, 0),
                                                                                                                   (423, 5, 99, 0, 0, 0, 0),
                                                                                                                   (424, 5, 100, 0, 0, 0, 0),
                                                                                                                   (425, 5, 101, 0, 0, 0, 0),
                                                                                                                   (426, 5, 102, 0, 0, 0, 0),
                                                                                                                   (427, 5, 1, 0, 0, 1, 0),
                                                                                                                   (428, 5, 2, 0, 0, 0, 0),
                                                                                                                   (429, 5, 3, 0, 0, 0, 0),
                                                                                                                   (430, 5, 4, 0, 0, 0, 0),
                                                                                                                   (431, 5, 5, 0, 0, 0, 0),
                                                                                                                   (432, 5, 30, 0, 0, 0, 0),
                                                                                                                   (433, 5, 7, 0, 0, 0, 0),
                                                                                                                   (434, 5, 8, 0, 0, 0, 0),
                                                                                                                   (435, 5, 6, 0, 0, 1, 0),
                                                                                                                   (436, 5, 9, 0, 0, 0, 0),
                                                                                                                   (437, 5, 10, 0, 0, 0, 0),
                                                                                                                   (438, 5, 11, 0, 0, 0, 0),
                                                                                                                   (439, 5, 12, 0, 0, 0, 0),
                                                                                                                   (440, 5, 13, 0, 0, 0, 0),
                                                                                                                   (441, 5, 14, 0, 0, 0, 0),
                                                                                                                   (442, 5, 15, 0, 0, 0, 0),
                                                                                                                   (443, 5, 16, 0, 0, 0, 0),
                                                                                                                   (444, 5, 17, 0, 0, 0, 0),
                                                                                                                   (446, 5, 19, 0, 0, 0, 0),
                                                                                                                   (447, 5, 20, 1, 1, 1, 1),
                                                                                                                   (448, 5, 21, 0, 0, 0, 0),
                                                                                                                   (449, 5, 22, 0, 0, 0, 0),
                                                                                                                   (450, 5, 23, 0, 0, 0, 0),
                                                                                                                   (451, 5, 24, 0, 0, 0, 0),
                                                                                                                   (452, 5, 25, 0, 0, 0, 0),
                                                                                                                   (453, 5, 26, 0, 0, 0, 0),
                                                                                                                   (454, 5, 27, 0, 0, 0, 0),
                                                                                                                   (455, 5, 28, 0, 0, 0, 0),
                                                                                                                   (456, 5, 29, 0, 0, 0, 0),
                                                                                                                   (457, 5, 32, 0, 0, 0, 0),
                                                                                                                   (458, 5, 88, 0, 0, 0, 0),
                                                                                                                   (459, 5, 89, 0, 0, 0, 0),
                                                                                                                   (460, 5, 31, 0, 0, 0, 0),
                                                                                                                   (461, 5, 33, 0, 0, 0, 0),
                                                                                                                   (462, 5, 34, 0, 0, 0, 0),
                                                                                                                   (463, 5, 35, 0, 0, 0, 0),
                                                                                                                   (464, 5, 36, 0, 0, 0, 0),
                                                                                                                   (465, 5, 37, 0, 0, 0, 0),
                                                                                                                   (466, 5, 38, 0, 0, 0, 0),
                                                                                                                   (467, 5, 39, 0, 0, 0, 0),
                                                                                                                   (468, 5, 77, 0, 0, 0, 0),
                                                                                                                   (469, 5, 78, 0, 0, 0, 0),
                                                                                                                   (470, 5, 79, 0, 0, 0, 0),
                                                                                                                   (471, 5, 40, 0, 0, 0, 0),
                                                                                                                   (472, 5, 41, 0, 0, 0, 0),
                                                                                                                   (473, 5, 42, 0, 0, 0, 0),
                                                                                                                   (474, 5, 43, 0, 0, 0, 0),
                                                                                                                   (475, 5, 44, 0, 0, 0, 0),
                                                                                                                   (476, 5, 45, 0, 0, 0, 0),
                                                                                                                   (477, 5, 46, 0, 0, 0, 0),
                                                                                                                   (478, 5, 47, 0, 0, 0, 0),
                                                                                                                   (479, 5, 48, 0, 0, 0, 0),
                                                                                                                   (480, 5, 49, 0, 0, 0, 0),
                                                                                                                   (481, 5, 50, 0, 0, 0, 0),
                                                                                                                   (482, 5, 51, 0, 0, 0, 0),
                                                                                                                   (483, 5, 52, 0, 0, 0, 0),
                                                                                                                   (484, 5, 53, 0, 0, 0, 0),
                                                                                                                   (485, 5, 54, 0, 0, 0, 0),
                                                                                                                   (486, 5, 55, 1, 1, 1, 1),
                                                                                                                   (487, 5, 56, 1, 1, 1, 1),
                                                                                                                   (488, 5, 57, 1, 0, 1, 1),
                                                                                                                   (489, 5, 58, 1, 0, 1, 1),
                                                                                                                   (490, 5, 59, 0, 0, 0, 0),
                                                                                                                   (491, 5, 60, 0, 0, 0, 0),
                                                                                                                   (492, 5, 61, 0, 0, 0, 0),
                                                                                                                   (493, 5, 62, 0, 0, 0, 0),
                                                                                                                   (494, 5, 80, 0, 0, 0, 0),
                                                                                                                   (495, 5, 69, 0, 0, 0, 0),
                                                                                                                   (496, 5, 70, 0, 0, 0, 0),
                                                                                                                   (497, 5, 71, 0, 0, 0, 0),
                                                                                                                   (498, 5, 72, 0, 0, 0, 0),
                                                                                                                   (499, 5, 73, 0, 0, 0, 0),
                                                                                                                   (500, 5, 74, 0, 0, 0, 0),
                                                                                                                   (501, 5, 75, 0, 0, 0, 0),
                                                                                                                   (502, 5, 76, 0, 0, 0, 0),
                                                                                                                   (503, 5, 63, 0, 0, 0, 0),
                                                                                                                   (504, 5, 64, 0, 0, 0, 0),
                                                                                                                   (505, 5, 65, 0, 0, 0, 0),
                                                                                                                   (506, 5, 66, 0, 0, 0, 0),
                                                                                                                   (507, 5, 67, 0, 0, 0, 0),
                                                                                                                   (508, 5, 68, 0, 0, 0, 0),
                                                                                                                   (509, 5, 81, 0, 0, 0, 0),
                                                                                                                   (510, 5, 82, 0, 0, 0, 0),
                                                                                                                   (511, 5, 83, 0, 0, 0, 0),
                                                                                                                   (512, 5, 84, 0, 0, 0, 0),
                                                                                                                   (513, 5, 85, 0, 0, 0, 0),
                                                                                                                   (514, 5, 86, 0, 0, 0, 0),
                                                                                                                   (515, 5, 87, 0, 0, 0, 0),
                                                                                                                   (516, 5, 90, 0, 0, 0, 0),
                                                                                                                   (517, 5, 103, 0, 0, 0, 0),
                                                                                                                   (518, 104, 104, 1, 1, 1, 1),
                                                                                                                   (519, 2, 104, 0, 0, 1, 0),
                                                                                                                   (520, 4, 104, 0, 0, 1, 0),
                                                                                                                   (521, 2, 18, 1, 0, 1, 0),
                                                                                                                   (522, 2, 105, 0, 1, 1, 0),
                                                                                                                   (523, 2, 106, 1, 1, 1, 1),
                                                                                                                   (524, 2, 107, 0, 0, 1, 0),
                                                                                                                   (525, 2, 109, 1, 1, 1, 1),
                                                                                                                   (526, 2, 108, 0, 1, 1, 0),
                                                                                                                   (527, 3, 18, 0, 0, 0, 0),
                                                                                                                   (528, 3, 107, 0, 0, 0, 0),
                                                                                                                   (529, 3, 109, 1, 1, 1, 1),
                                                                                                                   (530, 3, 104, 0, 0, 0, 0),
                                                                                                                   (531, 3, 105, 0, 0, 0, 0),
                                                                                                                   (532, 3, 106, 0, 0, 0, 0),
                                                                                                                   (533, 3, 108, 0, 0, 0, 0),
                                                                                                                   (534, 2, 110, 1, 1, 1, 1),
                                                                                                                   (535, 2, 111, 0, 0, 1, 0),
                                                                                                                   (536, 2, 112, 0, 0, 1, 0),
                                                                                                                   (537, 2, 113, 1, 1, 1, 1),
                                                                                                                   (538, 2, 114, 0, 0, 1, 0),
                                                                                                                   (539, 2, 115, 0, 0, 1, 0),
                                                                                                                   (540, 2, 116, 1, 1, 1, 1),
                                                                                                                   (541, 2, 117, 0, 0, 1, 0),
                                                                                                                   (542, 3, 110, 1, 1, 1, 1),
                                                                                                                   (543, 3, 111, 0, 0, 1, 0),
                                                                                                                   (544, 3, 112, 0, 0, 0, 0),
                                                                                                                   (545, 3, 113, 1, 1, 1, 1),
                                                                                                                   (546, 3, 114, 0, 0, 1, 0),
                                                                                                                   (547, 3, 115, 0, 0, 0, 0),
                                                                                                                   (548, 3, 116, 1, 1, 1, 1),
                                                                                                                   (549, 3, 117, 0, 0, 1, 0),
                                                                                                                   (550, 2, 127, 1, 0, 1, 1),
                                                                                                                   (551, 2, 118, 1, 0, 1, 0),
                                                                                                                   (552, 2, 119, 1, 1, 1, 1),
                                                                                                                   (553, 2, 120, 1, 0, 1, 0),
                                                                                                                   (554, 2, 121, 1, 1, 1, 1),
                                                                                                                   (555, 2, 122, 1, 1, 1, 1),
                                                                                                                   (556, 2, 123, 1, 1, 1, 1),
                                                                                                                   (557, 2, 124, 1, 1, 1, 1),
                                                                                                                   (558, 2, 125, 1, 1, 1, 1),
                                                                                                                   (559, 2, 126, 1, 1, 1, 1),
                                                                                                                   (560, 3, 118, 0, 0, 0, 0),
                                                                                                                   (561, 3, 119, 0, 0, 0, 0),
                                                                                                                   (562, 3, 120, 0, 0, 0, 0),
                                                                                                                   (563, 3, 121, 0, 0, 0, 0),
                                                                                                                   (564, 3, 122, 0, 0, 0, 0),
                                                                                                                   (565, 3, 123, 0, 0, 0, 0),
                                                                                                                   (566, 3, 124, 0, 0, 0, 0),
                                                                                                                   (567, 3, 125, 0, 0, 0, 0),
                                                                                                                   (568, 3, 126, 0, 0, 0, 0),
                                                                                                                   (569, 3, 127, 0, 0, 0, 0),
                                                                                                                   (570, 3, 128, 0, 0, 0, 0),
                                                                                                                   (571, 2, 129, 0, 0, 1, 0),
                                                                                                                   (572, 2, 128, 0, 0, 0, 0),
                                                                                                                   (573, 2, 131, 1, 1, 1, 1),
                                                                                                                   (574, 2, 132, 1, 1, 1, 1),
                                                                                                                   (575, 2, 130, 0, 0, 0, 1),
                                                                                                                   (576, 4, 118, 0, 0, 0, 0),
                                                                                                                   (577, 4, 119, 0, 0, 0, 0),
                                                                                                                   (578, 4, 120, 0, 0, 0, 0),
                                                                                                                   (579, 4, 121, 0, 0, 0, 0),
                                                                                                                   (580, 4, 122, 0, 0, 0, 0),
                                                                                                                   (581, 4, 123, 0, 0, 0, 0),
                                                                                                                   (582, 4, 124, 0, 0, 0, 0),
                                                                                                                   (583, 4, 125, 0, 0, 0, 0),
                                                                                                                   (584, 4, 126, 0, 0, 0, 0),
                                                                                                                   (585, 4, 131, 0, 0, 0, 0),
                                                                                                                   (586, 4, 132, 0, 0, 0, 0),
                                                                                                                   (587, 4, 127, 0, 0, 0, 0),
                                                                                                                   (588, 4, 113, 0, 0, 0, 0),
                                                                                                                   (589, 4, 114, 0, 0, 0, 0),
                                                                                                                   (590, 4, 115, 0, 0, 0, 0),
                                                                                                                   (591, 4, 116, 0, 0, 0, 0),
                                                                                                                   (592, 4, 117, 0, 0, 0, 0),
                                                                                                                   (593, 4, 110, 0, 0, 0, 0),
                                                                                                                   (594, 4, 111, 0, 0, 0, 0),
                                                                                                                   (595, 4, 112, 0, 0, 0, 0),
                                                                                                                   (596, 4, 18, 0, 0, 0, 0),
                                                                                                                   (597, 4, 107, 0, 0, 0, 0),
                                                                                                                   (598, 4, 109, 0, 0, 0, 0),
                                                                                                                   (599, 4, 129, 0, 0, 0, 0),
                                                                                                                   (600, 4, 130, 0, 0, 0, 1),
                                                                                                                   (601, 4, 105, 0, 0, 0, 0),
                                                                                                                   (602, 4, 106, 0, 0, 0, 0),
                                                                                                                   (603, 4, 108, 0, 0, 0, 0),
                                                                                                                   (604, 4, 128, 0, 0, 0, 0),
                                                                                                                   (605, 2, 131, 1, 1, 1, 1),
                                                                                                                   (606, 2, 132, 1, 1, 1, 1),
                                                                                                                   (607, 2, 133, 0, 0, 1, 0),
                                                                                                                   (608, 3, 133, 0, 0, 1, 0),
                                                                                                                   (609, 2, 136, 1, 1, 1, 1),
                                                                                                                   (610, 2, 137, 1, 1, 1, 1),
                                                                                                                   (611, 2, 138, 1, 0, 0, 0),
                                                                                                                   (612, 2, 139, 1, 1, 1, 1),
                                                                                                                   (613, 2, 140, 0, 0, 1, 0),
                                                                                                                   (614, 2, 135, 0, 1, 1, 0),
                                                                                                                   (615, 3, 131, 0, 0, 0, 0),
                                                                                                                   (616, 3, 132, 0, 0, 0, 0),
                                                                                                                   (617, 3, 129, 0, 0, 0, 0),
                                                                                                                   (618, 3, 130, 0, 0, 0, 0),
                                                                                                                   (619, 3, 136, 1, 1, 1, 1),
                                                                                                                   (620, 3, 137, 1, 1, 1, 1),
                                                                                                                   (621, 3, 138, 1, 0, 0, 0),
                                                                                                                   (622, 3, 139, 1, 1, 1, 1),
                                                                                                                   (623, 3, 140, 0, 0, 1, 0),
                                                                                                                   (624, 3, 134, 0, 0, 0, 0),
                                                                                                                   (625, 3, 135, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
                           `id` int(11) NOT NULL,
                           `register_no` varchar(100) DEFAULT NULL,
                           `admission_date` varchar(100) DEFAULT NULL,
                           `first_name` varchar(255) DEFAULT NULL,
                           `last_name` varchar(255) DEFAULT NULL,
                           `gender` varchar(20) DEFAULT NULL,
                           `birthday` varchar(100) DEFAULT NULL,
                           `religion` varchar(100) DEFAULT NULL,
                           `caste` varchar(100) DEFAULT NULL,
                           `blood_group` varchar(100) DEFAULT NULL,
                           `mother_tongue` varchar(100) DEFAULT NULL,
                           `current_address` text DEFAULT NULL,
                           `permanent_address` text DEFAULT NULL,
                           `city` varchar(255) DEFAULT NULL,
                           `state` varchar(255) DEFAULT NULL,
                           `mobileno` varchar(255) DEFAULT NULL,
                           `category_id` int(11) NOT NULL DEFAULT 0,
                           `email` varchar(100) DEFAULT NULL,
                           `parent_id` int(11) NOT NULL,
                           `route_id` int(11) NOT NULL DEFAULT 0,
                           `vehicle_id` int(11) NOT NULL DEFAULT 0,
                           `hostel_id` int(11) NOT NULL DEFAULT 0,
                           `room_id` int(11) NOT NULL DEFAULT 0,
                           `previous_details` text DEFAULT NULL,
                           `photo` varchar(100) DEFAULT NULL,
                           `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                           `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `student_admission_fields`
--

CREATE TABLE `student_admission_fields` (
                                            `id` int(11) NOT NULL,
                                            `fields_id` int(11) NOT NULL,
                                            `status` tinyint(4) NOT NULL DEFAULT 1,
                                            `required` tinyint(4) NOT NULL DEFAULT 0,
                                            `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `student_admission_fields`
--

INSERT INTO `student_admission_fields` (`id`, `fields_id`, `status`, `required`, `branch_id`) VALUES
                                                                                                  (1, 1, 1, 1, 1),
                                                                                                  (2, 2, 0, 0, 1),
                                                                                                  (3, 3, 1, 1, 1),
                                                                                                  (4, 4, 1, 1, 1),
                                                                                                  (5, 5, 0, 0, 1),
                                                                                                  (6, 6, 0, 0, 1),
                                                                                                  (7, 8, 1, 0, 1),
                                                                                                  (8, 9, 0, 0, 1),
                                                                                                  (9, 10, 1, 0, 1),
                                                                                                  (10, 11, 0, 0, 1),
                                                                                                  (11, 12, 1, 1, 1),
                                                                                                  (12, 13, 0, 0, 1),
                                                                                                  (13, 14, 0, 0, 1),
                                                                                                  (14, 15, 0, 0, 1),
                                                                                                  (15, 16, 0, 0, 1),
                                                                                                  (16, 17, 1, 1, 1),
                                                                                                  (17, 18, 1, 1, 1),
                                                                                                  (18, 19, 0, 0, 1),
                                                                                                  (19, 20, 0, 0, 1),
                                                                                                  (20, 21, 0, 0, 1),
                                                                                                  (21, 22, 1, 1, 1),
                                                                                                  (22, 23, 1, 0, 1),
                                                                                                  (23, 24, 0, 0, 1),
                                                                                                  (24, 25, 0, 0, 1),
                                                                                                  (25, 26, 0, 0, 1),
                                                                                                  (26, 27, 0, 0, 1),
                                                                                                  (27, 28, 1, 1, 1),
                                                                                                  (28, 29, 0, 0, 1),
                                                                                                  (29, 30, 0, 0, 1),
                                                                                                  (30, 32, 0, 0, 1),
                                                                                                  (31, 33, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE `student_attendance` (
                                      `id` int(11) NOT NULL,
                                      `student_id` int(11) NOT NULL,
                                      `date` date NOT NULL,
                                      `status` varchar(4) DEFAULT NULL COMMENT 'P=Present, A=Absent, H=Holiday, L=Late',
                                      `remark` text DEFAULT NULL,
                                      `branch_id` int(11) DEFAULT NULL,
                                      `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                      `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `student_category`
--

CREATE TABLE `student_category` (
                                    `id` int(11) NOT NULL,
                                    `branch_id` int(11) NOT NULL DEFAULT 0,
                                    `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `student_documents`
--

CREATE TABLE `student_documents` (
                                     `id` int(11) NOT NULL,
                                     `student_id` int(11) NOT NULL,
                                     `title` varchar(255) NOT NULL,
                                     `type` varchar(100) NOT NULL,
                                     `remarks` text NOT NULL,
                                     `file_name` varchar(255) NOT NULL,
                                     `enc_name` varchar(255) NOT NULL,
                                     `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                     `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `student_fields`
--

CREATE TABLE `student_fields` (
                                  `id` int(11) NOT NULL,
                                  `prefix` varchar(255) NOT NULL,
                                  `default_status` tinyint(1) NOT NULL DEFAULT 1,
                                  `default_required` tinyint(4) NOT NULL DEFAULT 1,
                                  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `student_fields`
--

INSERT INTO `student_fields` (`id`, `prefix`, `default_status`, `default_required`, `created_at`) VALUES
                                                                                                      (1, 'roll', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (2, 'last_name', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (3, 'gender', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (4, 'birthday', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (5, 'admission_date', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (6, 'category', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (7, 'section', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (8, 'religion', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (9, 'caste', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (10, 'blood_group', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (11, 'mother_tongue', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (12, 'present_address', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (13, 'permanent_address', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (14, 'city', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (15, 'state', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (16, 'student_email', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (17, 'student_mobile_no', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (18, 'student_photo', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (19, 'previous_school_details', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (20, 'guardian_name', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (21, 'guardian_relation', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (22, 'father_name', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (23, 'mother_name', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (24, 'guardian_occupation', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (25, 'guardian_income', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (26, 'guardian_education', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (27, 'guardian_email', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (28, 'guardian_mobile_no', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (29, 'guardian_address', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (30, 'guardian_photo', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (31, 'upload_documents', 1, 1, '2022-04-25 20:27:04'),
                                                                                                      (32, 'guardian_city', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (33, 'guardian_state', 1, 0, '2022-04-25 20:27:04'),
                                                                                                      (34, 'first_name', 1, 1, '2022-04-25 20:27:04');

-- --------------------------------------------------------

--
-- Table structure for table `student_profile_fields`
--

CREATE TABLE `student_profile_fields` (
                                          `id` int(11) NOT NULL,
                                          `fields_id` int(11) NOT NULL,
                                          `status` tinyint(4) NOT NULL DEFAULT 1,
                                          `required` tinyint(4) NOT NULL DEFAULT 0,
                                          `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
                           `id` int(11) NOT NULL,
                           `name` varchar(255) NOT NULL,
                           `subject_code` varchar(200) NOT NULL,
                           `subject_type` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
                           `subject_author` varchar(255) NOT NULL,
                           `branch_id` int(11) DEFAULT NULL,
                           `cut_point` int(10) NOT NULL DEFAULT 0,
                           `add_subject_code` varchar(100) DEFAULT NULL,
                           `sub_mark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `subject_code`, `subject_type`, `subject_author`, `branch_id`, `cut_point`, `add_subject_code`, `sub_mark`) VALUES
                                                                                                                                                     (1, 'Bangla', '1', 'Theory', '', 1, 0, '', ''),
                                                                                                                                                     (2, 'Bangla 1st Part', '101', 'Theory', '', 1, 0, '101', '200'),
                                                                                                                                                     (3, 'Bangla 2nd part', '102', 'Theory', '', 1, 0, '101', ''),
                                                                                                                                                     (4, 'Agriculture', '110', 'Optional', '', 1, 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `subject_assign`
--

CREATE TABLE `subject_assign` (
                                  `id` int(11) NOT NULL,
                                  `class_id` int(11) NOT NULL,
                                  `section_id` int(11) NOT NULL,
                                  `subject_id` longtext NOT NULL,
                                  `teacher_id` int(11) NOT NULL,
                                  `branch_id` int(11) NOT NULL,
                                  `session_id` int(11) NOT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `subject_assign`
--

INSERT INTO `subject_assign` (`id`, `class_id`, `section_id`, `subject_id`, `teacher_id`, `branch_id`, `session_id`, `created_at`, `updated_at`) VALUES
                                                                                                                                                     (1, 1, 1, '1', 0, 1, 3, '2022-12-04 17:56:03', NULL),
                                                                                                                                                     (2, 1, 1, '2', 0, 1, 3, '2022-12-04 17:56:03', NULL),
                                                                                                                                                     (3, 1, 1, '3', 0, 1, 3, '2022-12-04 17:56:04', NULL),
                                                                                                                                                     (4, 1, 1, '4', 0, 1, 3, '2022-12-04 17:56:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_allocation`
--

CREATE TABLE `teacher_allocation` (
                                      `id` int(11) NOT NULL,
                                      `class_id` int(11) NOT NULL,
                                      `section_id` int(11) NOT NULL,
                                      `teacher_id` int(11) NOT NULL,
                                      `session_id` int(11) NOT NULL,
                                      `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_note`
--

CREATE TABLE `teacher_note` (
                                `id` int(11) NOT NULL,
                                `title` longtext NOT NULL,
                                `description` longtext NOT NULL,
                                `file_name` longtext NOT NULL,
                                `enc_name` longtext NOT NULL,
                                `type_id` int(11) NOT NULL,
                                `class_id` longtext NOT NULL,
                                `teacher_id` int(11) NOT NULL,
                                `branch_id` int(11) NOT NULL,
                                `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
                                  `id` int(11) NOT NULL,
                                  `border_mode` varchar(200) NOT NULL,
                                  `dark_skin` varchar(200) NOT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `border_mode`, `dark_skin`, `created_at`, `updated_at`) VALUES
    (1, 'true', 'false', '2018-10-23 16:59:38', '2020-05-10 14:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_class`
--

CREATE TABLE `timetable_class` (
                                   `id` int(11) NOT NULL,
                                   `class_id` int(11) NOT NULL,
                                   `section_id` int(11) NOT NULL,
                                   `break` varchar(11) DEFAULT 'false',
                                   `subject_id` int(11) NOT NULL,
                                   `teacher_id` int(11) NOT NULL,
                                   `class_room` varchar(100) DEFAULT NULL,
                                   `time_start` time NOT NULL,
                                   `time_end` time NOT NULL,
                                   `day` varchar(20) NOT NULL,
                                   `session_id` int(11) NOT NULL,
                                   `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_exam`
--

CREATE TABLE `timetable_exam` (
                                  `id` int(11) NOT NULL,
                                  `exam_id` int(11) NOT NULL,
                                  `class_id` int(11) NOT NULL,
                                  `section_id` int(11) NOT NULL,
                                  `subject_id` int(11) NOT NULL,
                                  `time_start` varchar(20) NOT NULL,
                                  `time_end` varchar(20) NOT NULL,
                                  `mark_distribution` text NOT NULL,
                                  `hall_id` int(11) NOT NULL,
                                  `exam_date` date NOT NULL,
                                  `branch_id` int(11) NOT NULL,
                                  `session_id` int(11) NOT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
                                `id` int(11) NOT NULL,
                                `account_id` varchar(20) NOT NULL,
                                `voucher_head_id` int(11) NOT NULL,
                                `type` varchar(100) NOT NULL,
                                `category` varchar(20) NOT NULL,
                                `ref` varchar(255) NOT NULL,
                                `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
                                `dr` decimal(18,2) NOT NULL DEFAULT 0.00,
                                `cr` decimal(18,2) NOT NULL DEFAULT 0.00,
                                `bal` decimal(18,2) NOT NULL DEFAULT 0.00,
                                `date` date NOT NULL,
                                `pay_via` varchar(20) NOT NULL,
                                `description` text NOT NULL,
                                `attachments` varchar(255) NOT NULL,
                                `branch_id` int(11) NOT NULL,
                                `system` tinyint(1) NOT NULL DEFAULT 0,
                                `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `transactions_links`
--

CREATE TABLE `transactions_links` (
                                      `id` int(11) NOT NULL,
                                      `status` tinyint(3) DEFAULT NULL,
                                      `deposit` tinyint(3) DEFAULT NULL,
                                      `expense` tinyint(3) DEFAULT NULL,
                                      `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `transport_assign`
--

CREATE TABLE `transport_assign` (
                                    `id` int(11) NOT NULL,
                                    `route_id` int(11) NOT NULL,
                                    `stoppage_id` int(11) NOT NULL,
                                    `vehicle_id` int(11) NOT NULL,
                                    `branch_id` int(11) NOT NULL,
                                    `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE `transport_route` (
                                   `id` int(11) NOT NULL,
                                   `name` longtext NOT NULL,
                                   `start_place` longtext NOT NULL,
                                   `remarks` longtext NOT NULL,
                                   `stop_place` longtext NOT NULL,
                                   `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `transport_stoppage`
--

CREATE TABLE `transport_stoppage` (
                                      `id` int(11) NOT NULL,
                                      `stop_position` varchar(255) NOT NULL,
                                      `stop_time` time NOT NULL,
                                      `route_fare` decimal(18,2) NOT NULL,
                                      `branch_id` int(11) NOT NULL,
                                      `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `transport_vehicle`
--

CREATE TABLE `transport_vehicle` (
                                     `id` int(11) NOT NULL,
                                     `vehicle_no` longtext NOT NULL,
                                     `capacity` longtext NOT NULL,
                                     `insurance_renewal` longtext NOT NULL,
                                     `driver_name` longtext NOT NULL,
                                     `driver_phone` longtext NOT NULL,
                                     `driver_license` longtext NOT NULL,
                                     `branch_id` int(11) DEFAULT NULL,
                                     `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                     `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_log`
--

CREATE TABLE `visitor_log` (
                               `id` int(11) NOT NULL,
                               `name` varchar(255) DEFAULT NULL,
                               `number` varchar(255) DEFAULT NULL,
                               `purpose_id` int(11) DEFAULT NULL,
                               `date` date NOT NULL,
                               `entry_time` time DEFAULT NULL,
                               `exit_time` time DEFAULT NULL,
                               `number_of_visitor` float DEFAULT NULL,
                               `id_number` varchar(255) DEFAULT NULL,
                               `token_pass` varchar(255) DEFAULT NULL,
                               `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
                               `branch_id` int(11) NOT NULL,
                               `created_by` int(11) NOT NULL,
                               `created_at` datetime NOT NULL,
                               `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_purpose`
--

CREATE TABLE `visitor_purpose` (
                                   `id` int(11) NOT NULL,
                                   `name` varchar(255) NOT NULL,
                                   `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_head`
--

CREATE TABLE `voucher_head` (
                                `id` int(11) NOT NULL,
                                `name` varchar(255) NOT NULL,
                                `type` varchar(20) NOT NULL,
                                `system` tinyint(1) DEFAULT 0,
                                `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_agent`
--

CREATE TABLE `whatsapp_agent` (
                                  `id` int(11) NOT NULL,
                                  `agent_name` varchar(255) NOT NULL,
                                  `agent_image` varchar(255) NOT NULL,
                                  `agent_designation` varchar(255) NOT NULL,
                                  `whataspp_number` varchar(255) NOT NULL,
                                  `start_time` time NOT NULL,
                                  `end_time` time NOT NULL,
                                  `weekend` varchar(20) DEFAULT NULL,
                                  `enable` tinyint(1) NOT NULL DEFAULT 1,
                                  `branch_id` int(11) NOT NULL,
                                  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_chat`
--

CREATE TABLE `whatsapp_chat` (
                                 `id` int(11) NOT NULL,
                                 `header_title` varchar(255) NOT NULL,
                                 `subtitle` varchar(355) DEFAULT NULL,
                                 `footer_text` varchar(255) DEFAULT NULL,
                                 `popup_message` varchar(255) DEFAULT NULL,
                                 `frontend_enable_chat` tinyint(1) NOT NULL DEFAULT 0,
                                 `backend_enable_chat` tinyint(1) NOT NULL DEFAULT 0,
                                 `branch_id` int(11) NOT NULL,
                                 `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `whatsapp_chat`
--

INSERT INTO `whatsapp_chat` (`id`, `header_title`, `subtitle`, `footer_text`, `popup_message`, `frontend_enable_chat`, `backend_enable_chat`, `branch_id`, `created_at`) VALUES
    (1, 'Start a Conversation', 'Start a Conversation', 'Use this feature to chat with our agent.', NULL, 0, 0, 1, '2022-02-16 13:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `zoom_own_api`
--

CREATE TABLE `zoom_own_api` (
                                `id` int(11) NOT NULL,
                                `user_type` tinyint(1) NOT NULL,
                                `user_id` int(11) NOT NULL,
                                `zoom_api_key` varchar(255) NOT NULL,
                                `zoom_api_secret` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advance_salary`
--
ALTER TABLE `advance_salary`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments_type`
--
ALTER TABLE `attachments_type`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_log`
--
ALTER TABLE `call_log`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_purpose`
--
ALTER TABLE `call_purpose`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_templete`
--
ALTER TABLE `card_templete`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field`
--
ALTER TABLE `custom_field`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields_online_values`
--
ALTER TABLE `custom_fields_online_values`
    ADD PRIMARY KEY (`id`),
  ADD KEY `relid` (`relid`),
  ADD KEY `fieldid` (`field_id`);

--
-- Indexes for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
    ADD PRIMARY KEY (`id`),
  ADD KEY `relid` (`relid`),
  ADD KEY `fieldid` (`field_id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates_details`
--
ALTER TABLE `email_templates_details`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_follow_up`
--
ALTER TABLE `enquiry_follow_up`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_reference`
--
ALTER TABLE `enquiry_reference`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_response`
--
ALTER TABLE `enquiry_response`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_hall`
--
ALTER TABLE `exam_hall`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_term`
--
ALTER TABLE `exam_term`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_type`
--
ALTER TABLE `fees_type`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_fine`
--
ALTER TABLE `fee_fine`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups`
--
ALTER TABLE `fee_groups`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_admission`
--
ALTER TABLE `front_cms_admission`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_admitcard`
--
ALTER TABLE `front_cms_admitcard`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_certificates`
--
ALTER TABLE `front_cms_certificates`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_events`
--
ALTER TABLE `front_cms_events`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_exam_results`
--
ALTER TABLE `front_cms_exam_results`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_gallery`
--
ALTER TABLE `front_cms_gallery`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_gallery_category`
--
ALTER TABLE `front_cms_gallery_category`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_gallery_content`
--
ALTER TABLE `front_cms_gallery_content`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu_visible`
--
ALTER TABLE `front_cms_menu_visible`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_teachers`
--
ALTER TABLE `front_cms_teachers`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall_allocation`
--
ALTER TABLE `hall_allocation`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework_submit`
--
ALTER TABLE `homework_submit`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_category`
--
ALTER TABLE `hostel_category`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_room`
--
ALTER TABLE `hostel_room`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_list`
--
ALTER TABLE `language_list`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application`
--
ALTER TABLE `leave_application`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_category`
--
ALTER TABLE `leave_category`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class`
--
ALTER TABLE `live_class`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class_config`
--
ALTER TABLE `live_class_config`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class_reports`
--
ALTER TABLE `live_class_reports`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_credential`
--
ALTER TABLE `login_credential`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark`
--
ALTER TABLE `mark`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_reply`
--
ALTER TABLE `message_reply`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_admission`
--
ALTER TABLE `online_admission`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam`
--
ALTER TABLE `online_exam`
    ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `online_exam_answer`
--
ALTER TABLE `online_exam_answer`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_attempts`
--
ALTER TABLE `online_exam_attempts`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_payment`
--
ALTER TABLE `online_exam_payment`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_submitted`
--
ALTER TABLE `online_exam_submitted`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_config`
--
ALTER TABLE `payment_config`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_salary_stipend`
--
ALTER TABLE `payment_salary_stipend`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip`
--
ALTER TABLE `payslip`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_details`
--
ALTER TABLE `payslip_details`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_modules`
--
ALTER TABLE `permission_modules`
    ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `postal_record`
--
ALTER TABLE `postal_record`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_history`
--
ALTER TABLE `promotion_history`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions_manage`
--
ALTER TABLE `questions_manage`
    ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_id` (`onlineexam_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `question_group`
--
ALTER TABLE `question_group`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rm_sessions`
--
ALTER TABLE `rm_sessions`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template`
--
ALTER TABLE `salary_template`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schoolyear`
--
ALTER TABLE `schoolyear`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sit_plan_templete`
--
ALTER TABLE `sit_plan_templete`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_api`
--
ALTER TABLE `sms_api`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_credential`
--
ALTER TABLE `sms_credential`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template`
--
ALTER TABLE `sms_template`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template_details`
--
ALTER TABLE `sms_template_details`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_department`
--
ALTER TABLE `staff_department`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_documents`
--
ALTER TABLE `staff_documents`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_admission_fields`
--
ALTER TABLE `student_admission_fields`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_category`
--
ALTER TABLE `student_category`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_documents`
--
ALTER TABLE `student_documents`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fields`
--
ALTER TABLE `student_fields`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_profile_fields`
--
ALTER TABLE `student_profile_fields`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_assign`
--
ALTER TABLE `subject_assign`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_allocation`
--
ALTER TABLE `teacher_allocation`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_note`
--
ALTER TABLE `teacher_note`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable_class`
--
ALTER TABLE `timetable_class`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions_links`
--
ALTER TABLE `transactions_links`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_assign`
--
ALTER TABLE `transport_assign`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_route`
--
ALTER TABLE `transport_route`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_log`
--
ALTER TABLE `visitor_log`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_purpose`
--
ALTER TABLE `visitor_purpose`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_head`
--
ALTER TABLE `voucher_head`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whatsapp_agent`
--
ALTER TABLE `whatsapp_agent`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whatsapp_chat`
--
ALTER TABLE `whatsapp_chat`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zoom_own_api`
--
ALTER TABLE `zoom_own_api`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advance_salary`
--
ALTER TABLE `advance_salary`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments_type`
--
ALTER TABLE `attachments_type`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `call_log`
--
ALTER TABLE `call_log`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_purpose`
--
ALTER TABLE `call_purpose`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_templete`
--
ALTER TABLE `card_templete`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field`
--
ALTER TABLE `custom_field`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_online_values`
--
ALTER TABLE `custom_fields_online_values`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `email_templates_details`
--
ALTER TABLE `email_templates_details`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_follow_up`
--
ALTER TABLE `enquiry_follow_up`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_reference`
--
ALTER TABLE `enquiry_reference`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_response`
--
ALTER TABLE `enquiry_response`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_hall`
--
ALTER TABLE `exam_hall`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_term`
--
ALTER TABLE `exam_term`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_type`
--
ALTER TABLE `fees_type`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_fine`
--
ALTER TABLE `fee_fine`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_groups`
--
ALTER TABLE `fee_groups`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_admission`
--
ALTER TABLE `front_cms_admission`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_admitcard`
--
ALTER TABLE `front_cms_admitcard`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_certificates`
--
ALTER TABLE `front_cms_certificates`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_events`
--
ALTER TABLE `front_cms_events`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_exam_results`
--
ALTER TABLE `front_cms_exam_results`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `front_cms_gallery`
--
ALTER TABLE `front_cms_gallery`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_gallery_category`
--
ALTER TABLE `front_cms_gallery_category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_gallery_content`
--
ALTER TABLE `front_cms_gallery_content`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `front_cms_menu_visible`
--
ALTER TABLE `front_cms_menu_visible`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_teachers`
--
ALTER TABLE `front_cms_teachers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hall_allocation`
--
ALTER TABLE `hall_allocation`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework_submit`
--
ALTER TABLE `homework_submit`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_category`
--
ALTER TABLE `hostel_category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_room`
--
ALTER TABLE `hostel_room`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1211;

--
-- AUTO_INCREMENT for table `language_list`
--
ALTER TABLE `language_list`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_category`
--
ALTER TABLE `leave_category`
    MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_class`
--
ALTER TABLE `live_class`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_class_config`
--
ALTER TABLE `live_class_config`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_class_reports`
--
ALTER TABLE `live_class_reports`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_credential`
--
ALTER TABLE `login_credential`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mark`
--
ALTER TABLE `mark`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_reply`
--
ALTER TABLE `message_reply`
    MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_admission`
--
ALTER TABLE `online_admission`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam`
--
ALTER TABLE `online_exam`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_answer`
--
ALTER TABLE `online_exam_answer`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_attempts`
--
ALTER TABLE `online_exam_attempts`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_payment`
--
ALTER TABLE `online_exam_payment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_submitted`
--
ALTER TABLE `online_exam_submitted`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_config`
--
ALTER TABLE `payment_config`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_salary_stipend`
--
ALTER TABLE `payment_salary_stipend`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payslip`
--
ALTER TABLE `payslip`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_details`
--
ALTER TABLE `payslip_details`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `permission_modules`
--
ALTER TABLE `permission_modules`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `postal_record`
--
ALTER TABLE `postal_record`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_history`
--
ALTER TABLE `promotion_history`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions_manage`
--
ALTER TABLE `questions_manage`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_group`
--
ALTER TABLE `question_group`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `salary_template`
--
ALTER TABLE `salary_template`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schoolyear`
--
ALTER TABLE `schoolyear`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sit_plan_templete`
--
ALTER TABLE `sit_plan_templete`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_api`
--
ALTER TABLE `sms_api`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sms_credential`
--
ALTER TABLE `sms_credential`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_template`
--
ALTER TABLE `sms_template`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sms_template_details`
--
ALTER TABLE `sms_template_details`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_department`
--
ALTER TABLE `staff_department`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_documents`
--
ALTER TABLE `staff_documents`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=626;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_admission_fields`
--
ALTER TABLE `student_admission_fields`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_category`
--
ALTER TABLE `student_category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_documents`
--
ALTER TABLE `student_documents`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fields`
--
ALTER TABLE `student_fields`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `student_profile_fields`
--
ALTER TABLE `student_profile_fields`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subject_assign`
--
ALTER TABLE `subject_assign`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacher_allocation`
--
ALTER TABLE `teacher_allocation`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_note`
--
ALTER TABLE `teacher_note`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timetable_class`
--
ALTER TABLE `timetable_class`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_links`
--
ALTER TABLE `transactions_links`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_assign`
--
ALTER TABLE `transport_assign`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_route`
--
ALTER TABLE `transport_route`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_log`
--
ALTER TABLE `visitor_log`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_purpose`
--
ALTER TABLE `visitor_purpose`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_head`
--
ALTER TABLE `voucher_head`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatsapp_agent`
--
ALTER TABLE `whatsapp_agent`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatsapp_chat`
--
ALTER TABLE `whatsapp_chat`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zoom_own_api`
--
ALTER TABLE `zoom_own_api`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
