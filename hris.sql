CREATE USER 'human'@'localhost' IDENTIFIED BY 'hr001';

GRANT USAGE ON * . * TO 'human'@'localhost'  IDENTIFIED BY 'hr001' 
WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;

CREATE DATABASE  HRIS  DEFAULT CHARSET=utf8 ;

GRANT ALL PRIVILEGES ON  HRIS  . * TO 'human'@'localhost' WITH GRANT OPTION ;

use HRIS ;
 
CREATE TABLE  employee  (
   emp_id  varchar(3) NOT NULL,
   emp_name  varchar(30) default NULL,
   emp_lname  varchar(30) default NULL,
   job  varchar(30) default NULL,
   chg_hour  decimal(8,2) default NULL,
  PRIMARY KEY  ( emp_id )
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO  employee  VALUES ('101', 'อรอนงค์', 'ระวังงาน', 'Database Designer', 500.00);
INSERT INTO  employee  VALUES ('102', 'วรพจน์', 'นิยมกุล', 'System Analyst', 750.00);
INSERT INTO  employee  VALUES ('103', 'จักรินทร์', 'แสงสุข', 'Elect Engineer', 450.00);
INSERT INTO  employee  VALUES ('104', 'วรวรรณ', 'แสงสุข', 'System Analyst', 850.00);
INSERT INTO  employee  VALUES ('105', 'ณัฐวัฒน์', 'บุญพิทักษ์', 'Database Designer', 700.00);
INSERT INTO  employee  VALUES ('106', 'วิมล', 'เอียมอุไร', 'Programmer', 500.00);
INSERT INTO  employee  VALUES ('111', 'วรพร', 'เลิศไกร', 'Clearical Support', 300.00);
INSERT INTO  employee  VALUES ('113', 'ทิพาวดี', 'สมศิริ', 'Application Designer', 600.00);
INSERT INTO  employee  VALUES ('114', 'ไพรินทร์', 'อิ่มจำรูญ', 'Application Designer', 600.00);
INSERT INTO  employee  VALUES ('118', 'สุขเกษม', 'นิ่มนุช', 'General Support', 400.00);
INSERT INTO  employee  VALUES ('119', 'ปัทมา', 'นิ่มนุช', 'Programmer', 500.00);
INSERT INTO  employee  VALUES ('120', 'ไพรินทร์', 'ปราศอาพาธ', 'Programmer', 400.00);

CREATE TABLE  project_type_setup  (
   proj_type  varchar(5) NOT NULL,
   proj_type_desc  varchar(50) NOT NULL,
  PRIMARY KEY  ( proj_type )
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO  project_type_setup  VALUES ('HRM', 'ระบบการจัดการทรัพยากรมนุษย์');
INSERT INTO  project_type_setup  VALUES ('ACC', 'ระบบบัญชี');

CREATE TABLE  project_status_setup  (
   proj_status  varchar(5) NOT NULL,
   proj_status_desc  varchar(50) NOT NULL,
  PRIMARY KEY  ( proj_status )
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO  project_status_setup  VALUES ('ACT','อยู่ระหว่างดำเนินการ');
INSERT INTO  project_status_setup  VALUES ('WT', 'รอเซ็นสัญญา');
INSERT INTO  project_status_setup  VALUES ('CL', 'ยกเลิก') ;
INSERT INTO  project_status_setup  VALUES ('CMP', 'สิ้นสุดสัญญา') ;
CREATE TABLE  project  (
   proj_id  varchar(2) NOT NULL,
   proj_name  varchar(30) NOT NULL,
   proj_type  varchar(5) NOT NULL,
   location  varchar(30) NOT NULL,
   budget  decimal(10,2) NOT NULL,
   proj_status  varchar(5) NOT NULL,
  PRIMARY KEY (proj_id) ,
  FOREIGN KEY (proj_type) 
        REFERENCES project_type_setup(proj_type),
  FOREIGN KEY (proj_status) 
        REFERENCES project_status_setup(proj_status)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO  project  VALUES ('15', 'โรงงานแกลงยานยนต์', 'HRM', 'แกลง-ระยอง', 500000.00, 'ACT');
INSERT INTO  project  VALUES ('18', 'โรงงานแกลงการยาง', 'ACC', 'แกลง-ระยอง', 1200000.00, 'ACT');
INSERT INTO  project  VALUES ('22', 'โรงแรมฟ้างามหินสวย', 'HRM', 'แหลมเสด็จ-จันทบุรี', 500000.00, 'ACT');
INSERT INTO  project  VALUES ('25', 'โรงแรมนิวพลาซ่า บีช', 'ACC', 'แหลมเสด็จ-จันทบุรี', 1000000.00, 'WT');
 
CREATE TABLE  working  (
   date_work  date NOT NULL,
   proj_id  varchar(2) NOT NULL,
   emp_id  varchar(3) NOT NULL,
   work_hours decimal(4,2) NOT NULL,
    PRIMARY KEY (date_work,proj_id,emp_id) ,
    FOREIGN KEY(proj_id) 
        REFERENCES project(proj_id),
    FOREIGN KEY(emp_id) 
        REFERENCES employee(emp_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO  working  VALUES ('2013-05-02', '15', '101', 3.00);
INSERT INTO  working  VALUES ('2013-05-02', '15', '102', 3.00);
INSERT INTO  working  VALUES ('2013-05-02', '15', '103', 2.00);
INSERT INTO  working  VALUES ('2013-05-02', '15', '105', 2.00);
INSERT INTO  working  VALUES ('2013-05-02', '15', '106', 3.00);
INSERT INTO  working  VALUES ('2013-05-03', '22', '104', 3.00);
INSERT INTO  working  VALUES ('2013-05-03', '22', '105', 3.00);
INSERT INTO  working  VALUES ('2013-05-03', '22', '111', 4.00);
INSERT INTO  working  VALUES ('2013-05-03', '22', '113', 4.00);
INSERT INTO  working  VALUES ('2013-05-03', '18', '114', 2.00);
INSERT INTO  working  VALUES ('2013-05-03', '18', '118', 6.00);
INSERT INTO  working  VALUES ('2013-05-04', '15', '101', 3.00);
INSERT INTO  working  VALUES ('2013-05-04', '15', '102', 3.00);
INSERT INTO  working  VALUES ('2013-05-04', '15', '103', 3.00);
INSERT INTO  working  VALUES ('2013-05-04', '22', '104', 2.00);
INSERT INTO  working  VALUES ('2013-05-04', '15', '105', 2.00);
INSERT INTO  working  VALUES ('2013-05-04', '18', '105', 2.00);
INSERT INTO  working  VALUES ('2013-05-04', '15', '106', 3.00);
INSERT INTO  working  VALUES ('2013-05-04', '22', '111', 6.00);
INSERT INTO  working  VALUES ('2013-05-04', '22', '113', 6.00);
INSERT INTO  working  VALUES ('2013-05-04', '18', '114', 6.00);
INSERT INTO  working  VALUES ('2013-05-04', '18', '118', 6.00);
INSERT INTO  working  VALUES ('2013-05-07', '15', '101', 2.00);
INSERT INTO  working  VALUES ('2013-05-07', '15', '102', 2.00);
INSERT INTO  working  VALUES ('2013-05-07', '15', '103', 2.00);
INSERT INTO  working  VALUES ('2013-05-07', '22', '104', 4.00);
INSERT INTO  working  VALUES ('2013-05-07', '15', '105', 3.00);
INSERT INTO  working  VALUES ('2013-05-07', '18', '105', 2.00);
INSERT INTO  working  VALUES ('2013-05-07', '15', '106', 3.00);
INSERT INTO  working  VALUES ('2013-05-07', '22', '111', 4.00);
INSERT INTO  working  VALUES ('2013-05-07', '22', '113', 4.00);
INSERT INTO  working  VALUES ('2013-05-07', '18', '114', 3.00);
INSERT INTO  working  VALUES ('2013-05-07', '18', '118', 3.00);
INSERT INTO  working  VALUES ('2013-05-08', '18', '114', 6.00);
INSERT INTO  working  VALUES ('2013-05-08', '18', '118', 3.00);
INSERT INTO  working  VALUES ('2013-05-08', '15', '101', 4.00);
INSERT INTO  working  VALUES ('2013-05-08', '15', '102', 4.00);
INSERT INTO  working  VALUES ('2013-05-08', '15', '103', 4.00);
INSERT INTO  working  VALUES ('2013-05-09', '22', '104', 3.00);
INSERT INTO  working  VALUES ('2013-05-09', '15', '105', 3.00);
INSERT INTO  working  VALUES ('2013-05-09', '18', '105', 3.00);
INSERT INTO  working  VALUES ('2013-05-09', '15', '106', 3.00);
INSERT INTO  working  VALUES ('2013-05-10', '22', '104', 3.00);
INSERT INTO  working  VALUES ('2013-05-10', '18', '105', 3.00);
INSERT INTO  working  VALUES ('2013-05-10', '15', '101', 1.00);
INSERT INTO  working  VALUES ('2013-05-10', '15', '102', 1.00);
INSERT INTO  working  VALUES ('2013-05-10', '15', '103', 1.00);
INSERT INTO  working  VALUES ('2013-05-10', '15', '105', 1.00);
INSERT INTO  working  VALUES ('2013-05-10', '15', '106', 1.00);
INSERT INTO  working  VALUES ('2013-05-11', '15', '101', 6.00);
INSERT INTO  working  VALUES ('2013-05-11', '15', '102', 6.00);
INSERT INTO  working  VALUES ('2013-05-11', '15', '103', 6.00);
INSERT INTO  working  VALUES ('2013-05-11', '15', '105', 6.00);
INSERT INTO  working  VALUES ('2013-05-11', '15', '106', 6.00);
INSERT INTO  working  VALUES ('2013-05-12', '15', '101', 3.00);
INSERT INTO  working  VALUES ('2013-05-12', '15', '102', 3.00);
INSERT INTO  working  VALUES ('2013-05-12', '15', '103', 3.00);
INSERT INTO  working  VALUES ('2013-05-12', '15', '105', 3.00);
INSERT INTO  working  VALUES ('2013-05-12', '15', '106', 3.00);