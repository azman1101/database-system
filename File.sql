/* ---------------------------- Employee ---------------------------- */
/* ------------------------------- 01 ------------------------------- */
CREATE TABLE Employee
(
    empID           VARCHAR2(7),
    Name            VARCHAR2(50),
    Position        VARCHAR2(30),
    Salary          FLOAT,
    IC_Num          VARCHAR2(14),
    PRIMARY KEY (empID)
);
/* --------------------------- Department --------------------------- */
/* ------------------------------- 02 ------------------------------- */
CREATE TABLE Department
(
    DeptNo          VARCHAR2(8),
    Dept_name       VARCHAR2(30),
    Jobscope        VARCHAR2(65),
    total_employee  INT,
    EXTNUM          VARCHAR2(3),
    PRIMARY KEY (DeptNo)
);
/* ----------------------------- Branch ----------------------------- */
/* ------------------------------- 03 ------------------------------- */
CREATE TABLE Branch
(
    BranchID        VARCHAR2(6),
    BranchName      VARCHAR2(30),
    Location        VARCHAR2(50),
    Email           VARCHAR2(30),
    Contact_Num     VARCHAR2(14),
    PRIMARY KEY (BranchID)
);
/* ---------------------------- Company ----------------------------- */
/* ------------------------------- 04 ------------------------------- */
CREATE TABLE Company
(
    companyID       VARCHAR2(5),
    SSMnum          VARCHAR2(8),
    Name            VARCHAR2(50),
    Address         VARCHAR2(200),
    Phonenum        VARCHAR2(14),
    PRIMARY KEY (companyID)
);
/* ---------------------------- Customer ---------------------------- */
/* ------------------------------- 05 ------------------------------- */
CREATE TABLE Customer
(
    CustID              VARCHAR2(4),
    type                VARCHAR2(10),
    email               VARCHAR2(40),
    contactperson       VARCHAR2(20),
    conpersnum          VARCHAR2(14),
    companyID           VARCHAR2(5),
    PRIMARY KEY (CustID),
    FOREIGN KEY (companyID) REFERENCES Company (companyID)
);
/* ---------------------------- Supplier ---------------------------- */
/* ------------------------------- 06 ------------------------------- */
CREATE TABLE Supplier
(
    SuppID          VARCHAR2(4),
    majorproduct    VARCHAR2(30),
    faxnum          VARCHAR2(14),
    website         VARCHAR2(20),
    status          VARCHAR2(15),
    companyID       VARCHAR2(5),
    PRIMARY KEY (SuppID),
    FOREIGN KEY (companyID) REFERENCES Company (companyID)
);
/* ----------------------------- Orders ----------------------------- */
/* ------------------------------- 07 ------------------------------- */
CREATE TABLE Orders
(
    OrderID             VARCHAR2(6),
    Date_received       DATE,
    Deposit             FLOAT,
    Due_date            DATE,
    Quantity            INT,
    CustID          VARCHAR2(4),
    BranchID        VARCHAR2(6),
    empID           VARCHAR2(7),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustID) REFERENCES Customer (CustID),
    FOREIGN KEY (BranchID) REFERENCES Branch (BranchID),
    FOREIGN KEY (EmpID) REFERENCES Employee (EmpID)
);
/* ---------------------------- Jobsheet ---------------------------- */
/* ------------------------------- 08 ------------------------------- */
CREATE TABLE Jobsheet
(
    JobsheetNum         VARCHAR2(6),
    Datesubmit          DATE,
    Datesettle          DATE,
    Description         VARCHAR2(40),
    Total_lost          INT,
    OrderID         VARCHAR2(6),
    EmpID           VARCHAR2(7),
    PRIMARY KEY (JobsheetNum),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (EmpID) REFERENCES Employee (EmpID)
);
/* ---------------------------- Product ----------------------------- */
/* ------------------------------- 09 ------------------------------- */
CREATE TABLE Product
(
    Productcode         VARCHAR2(8),
    ProdType            VARCHAR2(30),
    Price               FLOAT,
    Quantity            INT,
    Description         VARCHAR2(25),
    SuppID          VARCHAR2(4),
    BranchID        VARCHAR2(6),
    PRIMARY KEY (Productcode),
    FOREIGN KEY (SuppID) REFERENCES Supplier (SuppID),
    FOREIGN KEY (BranchID) REFERENCES Branch (BranchID)
);
/* ----------------------------- Machine ---------------------------- */
/* ------------------------------- 10 ------------------------------- */
CREATE TABLE Machine
(
    MachineNum      VARCHAR2(7),
    MachineName     VARCHAR2(40),
    Function        VARCHAR2(40),
    PurchaseDate    DATE,
    Brand           VARCHAR2(20),
    SuppID          VARCHAR2(4),
    DeptNo          VARCHAR2(8),
    PRIMARY KEY (MachineNum),
    FOREIGN KEY (SuppID) REFERENCES Supplier (SuppID),
    FOREIGN KEY (DeptNo) REFERENCES Department (DeptNo)
);
/* ---------------------------- Equipment --------------------------- */
/* ------------------------------- 11 ------------------------------- */
CREATE TABLE Equipment
(
    Code                VARCHAR2(5),
    Name                VARCHAR2(24),
    Function            VARCHAR2(50),
    Price               FLOAT,
    Quantity_avail      INT,
    SuppID          VARCHAR2(4),
    PRIMARY KEY (Code),
    FOREIGN KEY (SuppID) REFERENCES Supplier (SuppID)
);
/* ---------------------------- Payment ----------------------------- */
/* ------------------------------- 12 ------------------------------- */
CREATE TABLE Payment
(
    Paymentnum      VARCHAR2(5),
    amount          FLOAT,
    tax             INT,
    types           VARCHAR2(8),
    method          VARCHAR2(4),
    OrderID           VARCHAR2(6),
    empID             VARCHAR2(7),
    companyID         VARCHAR2(5),
    PRIMARY KEY (Paymentnum),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (empID) REFERENCES Employee (empID),
    FOREIGN KEY (companyID) REFERENCES Company (companyID)
);
/* -------------------------- Transaction --------------------------- */
/* ------------------------------- 13 ------------------------------- */
CREATE TABLE Transaction
(
    trans_num           VARCHAR2(10),
    Bankname            VARCHAR2(10),
    Accholder_name      VARCHAR2(30),
    transdate           DATE,
    AccountNum          VARCHAR2(15),
    paymentnum          VARCHAR2(5),
    PRIMARY KEY (trans_num),
    FOREIGN KEY (paymentnum) REFERENCES Payment (paymentnum)
);
/* ---------------------------- Invoice ----------------------------- */
/* ------------------------------- 14 ------------------------------- */
CREATE TABLE Invoice
(
    invnum              VARCHAR2(6),
    Dates               DATE,
    termdays            INT,
    outstanding         FLOAT,
    due_date            DATE,
    paymentnum          VARCHAR2(5),
    PRIMARY KEY (invnum),
    FOREIGN KEY (paymentnum) REFERENCES Payment (paymentnum)
);
/* ---------------------------- Receipt ----------------------------- */
/* ------------------------------- 15 ------------------------------- */
CREATE TABLE Receipt
(
    receiptnum          VARCHAR2(5),
    Dates               DATE,
    discount            INT,
    types               VARCHAR2(6),
    amount              FLOAT,
    invnum          VARCHAR2(6),
    PRIMARY KEY (receiptnum),
    FOREIGN KEY (invnum) REFERENCES Invoice (invnum)
);
/* ---------------------------- Cash bill --------------------------- */
/* ------------------------------- 16 ------------------------------- */
CREATE TABLE Cashbill
(
    cashbillnum         VARCHAR2(7),
    billdate            DATE,
    method              VARCHAR2(6),
    receive_send        VARCHAR2(7),
    discount            INT,
    paymentnum          VARCHAR2(5),
    PRIMARY KEY (cashbillnum),
    FOREIGN KEY (paymentnum) REFERENCES Payment (paymentnum)
);
/* ----------------------- EmployeeDepartment ----------------------- */
/* ----------------------------- - 17 - ----------------------------- */
CREATE TABLE EmployeeDepartment  
(
    empID           VARCHAR2(7),
    DeptNo          VARCHAR2(8),
    FOREIGN KEY (empID) REFERENCES Employee (empID),
    FOREIGN KEY (DeptNo) REFERENCES Department (DeptNo)
);
/* ------------------------- EmployeeBranch ------------------------- */
/* ----------------------------- - 18 - ----------------------------- */
CREATE TABLE EmployeeBranch  
(
    empID           VARCHAR2(7),
    BranchID        VARCHAR2(6),
    FOREIGN KEY (empID) REFERENCES Employee (empID),
    FOREIGN KEY (BranchID) REFERENCES Branch (BranchID)
);
/* ------------------------ CustomerEmployee ------------------------ */
/* ----------------------------- - 19 - ----------------------------- */
CREATE TABLE CustomerEmployee  
(
    CustID          VARCHAR2(4),
    empID           VARCHAR2(7),
    FOREIGN KEY (CustID) REFERENCES Customer (CustID),
    FOREIGN KEY (empID) REFERENCES Employee (empID)
);
/* ------------------------- CustomerBranch ------------------------- */
/* ----------------------------- - 20 - ----------------------------- */
CREATE TABLE CustomerBranch  
(
    CustID          VARCHAR2(4),
    BranchID        VARCHAR2(6),
    FOREIGN KEY (CustID) REFERENCES Customer (CustID),
    FOREIGN KEY (BranchID) REFERENCES Branch (BranchID)
);
/* ------------------------- OrdersProduct -------------------------- */
/* ----------------------------- - 21 - ----------------------------- */
CREATE TABLE OrdersProduct 
(
    OrderID             VARCHAR2(6),
    Productcode         VARCHAR2(8),
    amount              INT,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (Productcode) REFERENCES Product (Productcode)
);
/* ------------------------- ProductMachine ------------------------- */
/* ----------------------------- - 22 - ----------------------------- */
CREATE TABLE ProductMachine  
(
    Productcode         VARCHAR2(8),
    MachineNum          VARCHAR2(7),
    FOREIGN KEY (Productcode) REFERENCES Product (Productcode),
    FOREIGN KEY (MachineNum) REFERENCES Machine (MachineNum)
);
/* ------------------------ MachineEquipment ------------------------ */
/* ----------------------------- - 23 - ----------------------------- */
CREATE TABLE MachineEquipment   
(
    MachineNum      VARCHAR2(7),
    Code            VARCHAR2(5),
    FOREIGN KEY (MachineNum) REFERENCES Machine (MachineNum),
    FOREIGN KEY (Code) REFERENCES Equipment (Code)
);
/* ------------------------- OrdersMachine -------------------------- */
/* ----------------------------- - 24 - ----------------------------- */
CREATE TABLE OrdersMachine  
(
    OrderID         VARCHAR2(6),
    MachineNum      VARCHAR2(7),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (MachineNum) REFERENCES Machine (MachineNum)
);
/* ------------------------- OrdersEquipment ------------------------ */
/* ----------------------------- - 25 - ----------------------------- */
CREATE TABLE OrdersEquipment  
(
    OrderID         VARCHAR2(6),
    Code            VARCHAR2(5),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (Code) REFERENCES Equipment (Code)
);
/* ------------------------ BranchDepartment ------------------------ */
/* ----------------------------- - 26 - ----------------------------- */
CREATE TABLE BranchDepartment   
(
    BranchID        VARCHAR2(6),
    DeptNo          VARCHAR2(8),
    FOREIGN KEY (BranchID) REFERENCES Branch (BranchID),
    FOREIGN KEY (DeptNo) REFERENCES Department (DeptNo)
);
/* ------------------------------- 01 ------------------------------- */
/* ---------------------------- Employee ---------------------------- */
/* ------------------------------- 01 ------------------------------- */
INSERT INTO Employee VALUES('ED5304', 'RUSILAWATI BINTI RUSLI   ', 'SENIOR STAFF', 1800, '830406-05-5304');
INSERT INTO Employee VALUES('ED5018', 'NORLIZA BINTI JOFRI', 'SENIOR STAFF', 1500, '860506-05-5018');
INSERT INTO Employee VALUES('ED5322', 'SITI HABAH BINTI MOHD SALLEH', 'STAFF', 1200, '820903-05-5322');
INSERT INTO Employee VALUES('ED5109', 'MOHD MUZAMIL BIN ISMAIL', 'STAFF' , 1000, '910311-05-5109' );
INSERT INTO Employee VALUES('ED5632', 'NURSHAHYRA BINTI SHARIF', 'STAFF' , 1000, '920919-05-5632' );

INSERT INTO Employee VALUES('ED5265', 'MUHAMMAD AFIQ BIN ABDUL MALEK', 'STAFF' , 1200, '901023-05-5265' );
INSERT INTO Employee VALUES('ED5258', 'ZARILAH BINTI MOHAMAD', 'STAFF' , 1300, '680326-05-5258' );
INSERT INTO Employee VALUES('ED5703', 'MUHAMMAD AZMIL BIN RAZI','STAFF', 1300,'900806-01-5703' );
INSERT INTO Employee VALUES('ED5443', 'MUHAMMAD HAFIZ AKMAL BIN ABDUL KADIR', 'SENIOR STAFF', 1200,'920202-05-5443' );
INSERT INTO Employee VALUES('ED5222', 'NORFATIN NABILA BINTI KATAN', 'SENIOR STAFF', 1200,'930501-05-5222' );
/* -- 10 -- */
INSERT INTO Employee VALUES('ED5756', 'ERICHA FITRIH BINTI FIRMAN', 'STAFF', 1200, '960116-01-5756' );
INSERT INTO Employee VALUES('ED5766', 'NABILAH BINTI SHAHDAN', 'STAFF', 1200, '960527-06-5766' );
INSERT INTO Employee VALUES('ED6236', 'AMANI BINTI MOHAMED', 'STAFF', 1200,'960924-14-6236' );
INSERT INTO Employee VALUES('ED6092', 'ASYIQIN BINTI SAIDINA ALI', 'SENIOR STAFF', 1200, '810105-01-6092' );
INSERT INTO Employee VALUES('ED6164', 'AMALINA BINTI MAT ARIFIN', 'STAFF', 1200, '750515-05-6164' );

INSERT INTO Employee VALUES('ED6023', 'MUHAMMAD BADRI MUNIR BIN ABD GHAFAR', 'STAFF', 1200, '810112-05-6023');
INSERT INTO Employee VALUES('ED2002', 'FADILAH BINTI JAMHARI', 'STAFF', 1200, '750501-01-2002');
INSERT INTO Employee VALUES('ED5442', 'MADIHAH AISYAH BINTI JINORDIN', 'SENIOR STAFF', 1600, '781104-05-5442');
INSERT INTO Employee VALUES('ED7022', 'NAIMAH BINTI MOHAMMAD WEDDAN', 'SENIOR STAFF', 1600, '910101-05-7022');
INSERT INTO Employee VALUES('ED5448', 'SARAH ARISSA BINTI APLI', 'STAFF', 1200, '850403-05-5448');
/* -- 20 -- */
INSERT INTO Employee VALUES('ED5506', 'AZIZATUL BUSYRA BINTI SHAMSUL NAJMI', 'STAFF', 1200, '921112-02-5506');
INSERT INTO Employee VALUES('ED5102', 'NURSAFFA NAJWA BINTI ISKANDAR ZULKORNAIN', 'STAFF', 1200, '950607-05-5102');
INSERT INTO Employee VALUES('ED5544', 'NURUL NATASYA BINTI MAZALAN', 'STAFF', 1200, '920312-05-5544');
INSERT INTO Employee VALUES('ED5562', 'SITI AISHAH BINTI CHE MUDA', 'SENIOR STAFF', 1600, '850104-12-5562');
INSERT INTO Employee VALUES('ED5501', 'MUHAMMAD AZRUL BIN MOHD ARIFF', 'STAFF', 1200, '740404-01-5501');

INSERT INTO Employee VALUES('ED6243', 'MUHAMMD AZRI AQEEL BIN MOHD ASARI', 'STAFF', 1000, '910304-03-6243');
INSERT INTO Employee VALUES('ED2333', 'MOHAMAD QUYYUM BIN MOHD SAAD', 'STAFF', 1200, '920521-04-2333');
INSERT INTO Employee VALUES('ED8423', 'MOHAMAD AFIQ BIN ABD MOLOK', 'SENIOR STAFF', 1600, '930303-01-8423');
INSERT INTO Employee VALUES('ED6979', 'TENGKU MOHD MUSLIM BIN TUAN HASSAN', 'STAFF', 1000, '960623-02-6979');
INSERT INTO Employee VALUES('ED2337', 'MUHAMMAD IZZANI FITRI BIN ZAMRI', 'SENIOR STAFF', 1500, '840625-03-2337');
/* -- 30 -- */
INSERT INTO Employee VALUES('ED6336', 'NOR HASLINDA BINTI MAD ZAHARI', 'STAFF', 1000, '970912-05-6336');
INSERT INTO Employee VALUES('ED5662', 'NORIDAH BINTI AZMAN', 'STAFF', 1000, '950111-05-5662');
INSERT INTO Employee VALUES('ED8062', 'NUR SHAIDATUL AKMA BINTI SHAHRUL', 'STAFF', 1000, '940906-01-8062');
INSERT INTO Employee VALUES('ED6242', 'NURFAZREEN NATASHA BINTI BAHAMAN', 'STAFF', 1000, '941111-13-6242');
INSERT INTO Employee VALUES('ED2028', 'NURUL ANEESA BINTI ISMADI', 'STAFF', 1000, '920523-05-2028');

INSERT INTO Employee VALUES('ED6106', 'NURAIN BINTI AB AZIZ', 'STAFF', 1000, '950427-05-6106');
/* ------------------------------- 02 ------------------------------- */
/* --------------------------- Department --------------------------- */
/* ------------------------------- 02 ------------------------------- */
INSERT INTO Department VALUES('DEPT001', 'ADMINISTRATION', 'ADMINISTRATION', 2, '001');
INSERT INTO Department VALUES('DEPT002', 'PRODUCTION', 'CATERS ORDER AND PROCEED JOBSHEET DESCRIPTION', 4, '002');
INSERT INTO Department VALUES('DEPT003', 'MARKETING', 'ADVERTISING AND FIND CUSTOMER', 4, '003');
INSERT INTO Department VALUES('DEPT004', 'FINANCE', 'CHECK PAYMENTS AND ACCOUNTS', 2, '004');
INSERT INTO Department VALUES('DEPT005', 'HUMAN RESOURCE', 'DEALS WITH RECRUITMENT,TRAINING,PAY NEGOTIATIONS WITH EMPLOYEE', 2, '005');

INSERT INTO Department VALUES('DEPT006', 'PURCHASING', 'BUYS PRODUCTS AND EQUIPMENT AND DEALS WITH SUPPLIER', 3, '006');
INSERT INTO Department VALUES('DEPT007', 'SALES', 'DEALS WITH SALES AND SELLING TO CUSTOMER', 11, '007');
INSERT INTO Department VALUES('DEPT008', 'ORDER PROCESSING', 'PROCESS THE ORDER AND UPDATE BETWEEN PRODUCTION', 4, '008');
INSERT INTO Department VALUES('DEPT009', 'MAINTENANCE', 'SERVICE CATERS MACHINE AND OTHER EQUIPMENT IN OFFICE', 2, '009');
INSERT INTO Department VALUES('DEPT010', 'RESEARCH AND DEVELOPMENT', 'DO REGULATORY CUSTOMER SATISFACTION SURVEY AND FEEDBAY', 2, '010');
/* ------------------------------- 03 ------------------------------- */
/* ----------------------------- Branch ----------------------------- */
/* ------------------------------- 03 ------------------------------- */
INSERT INTO Branch VALUES('BR001', 'ZRICH CORPORATION SDN. BHD', 'SENAWANG',    'zrich6866@gmail.com',      '06-6776686');
INSERT INTO Branch VALUES('BR002', 'ZRICH CORPORATION SDN. BHD', 'SEREMBAN',    'zrichds2mall@gmail.com',   '017-6246866');
INSERT INTO Branch VALUES('BR003', 'ZRICH TRADING SDN. BHD'    , 'SENAWANG',    'zrichtaipan2@gmail.com',   '017-6376866');
INSERT INTO Branch VALUES('BR004', 'QHAZZ MARKETING SDN. BHD'  , 'SENAWANG',    'qhazzmarketing@gmail.com', '06-6776676');
INSERT INTO Branch VALUES('BR005', 'ZRICH CORPORATION SDN. BHD', 'SEREMBAN', 	'zrichbetaria@gmail.com',   '06-7766966');

INSERT INTO Branch VALUES('BR006', 'ZRICH CORPORATION SDN. BHD', 'NILAI',       'zrichnilai@gmail.com',     '06-6996866');
INSERT INTO Branch VALUES('BR007', 'ZRICH CORPORATION SDN. BHD', 'KUALA PILAH', 'zrichkpilah@gmail.com',    '06-6672382');
INSERT INTO Branch VALUES('BR008', 'ZRICH CORPORATION SDN. BHD', 'PORT DICKSON','zrichpd@gmail.com',        '06-7852371');
INSERT INTO Branch VALUES('BR009', 'ZRICH CORPORATION SDN. BHD', 'JELEBU',      'zrichjelebu@gmail.com',    '019-3384172');
INSERT INTO Branch VALUES('BR010', 'ZRICH CORPORATION SDN. BHD', 'REMBAU',      'zrichrembau@gmail.com',    '06-6851733');
/* ------------------------------- 04 ------------------------------- */
/* ---------------------------- Company ----------------------------- */
/* ------------------------------- 04 ------------------------------- */
INSERT INTO Company VALUES( 'COM01', '213457', 'ALEX QM SPORTS SHOP', 'N0. 1884 KAMPONG BARU RASAH, 70300 SEREMBAN NEGERI SEMBILAN', '019-6500819');
INSERT INTO Company VALUES( 'COM02', '286739', 'ARORA SPORTS TRADING SDN BHD', 'NO 22, JALAN ARFAH 2, MEDAN NIAGA SERI KUCHING, 51200 KUALA LUMPUR', '03 62590000');
INSERT INTO Company VALUES( 'COM03', '238927', 'CY UNIFORM (M) SDN BHD', 'B-18, JLN SEMAMBU PUSAT KOMERSDIAL SEMAMBU 25300 KUANTAN', '09-556 2568');
INSERT INTO Company VALUES( 'COM04', '728930', 'EMPIRIC FASHION ATTIRES (BD) SDN BHD', 'NO. 02(LOT 2.01), GROUND FLOOR,LORONG MERBAU, OFF JALAN KENANGA, 55200 KUALA LUMPUR', '03-92247470');
INSERT INTO Company VALUES( 'COM05', '237291', 'FIRST MACHITA (M) SDN BHD', 'NO 18 JALAN TU52, KAWASAN PERINDUSTRIAN TASIK UTAMA,AYER KEROH,MELAKA', '06-2530988');

INSERT INTO Company VALUES( 'COM06', '627381', 'KEDAI ALAT-ALAT JAHITAN JAYA', '45, JALAN DATO LEE FONG YEE 70000 SEREMBAN NEGERI SEMBILAN', '06-7630257');
INSERT INTO Company VALUES( 'COM07', '725192', 'KONICA MINOLTA BUSINESS SOLUTIONS (M) SDN. BHD', 'NO 46, JALAN S2 D37, SEREMBAN 2, 70300 SEREMBAN NEGERI SEMBILAN', '06-6012620');
INSERT INTO Company VALUES( 'COM08', '671023', 'LEADS TAILOR', '52G JALAN KOMERSIL SENAWANG 7, TAMAN KOMERSIL SENAWANG 70450 SEREMBAN', '06-6786566');
INSERT INTO Company VALUES( 'COM09', '428799', 'MY APPAREL (M) SDN BHD', 'NO 104 GROUND FLOOR, JALAN SEROJA 39, TAMAN JOHOR JAYA, 81100 JOHOR BAHRU', '07-3516993');
INSERT INTO Company VALUES( 'COM10', '526189', 'MR2 MARKETING SDN BHD', 'NO. 17 JALAN 20, TAMAN SRI KLUANG, KAWASAN PERINDUSTRIAN SRI KLUANG 86000 KLUANG, JOHOR', '07-7771398');
/* -- 10 -- */
INSERT INTO Company VALUES( 'COM11', '526172', 'OREN SPORT SDN BHD', 'NO. 66, GROUND FLOOR, JALAN SEROJA 39, TAMAN JOHOR JAYA 81100 JOHOR BAHRU', '07-3516993');
INSERT INTO Company VALUES( 'COM12', '981276', 'RONSON OFFICE PRODUCT SUPPLIES', 'NO. 151, JALAN SUNGAI UJONG, TAMAN AST 70200', '06-6788118');
INSERT INTO Company VALUES( 'COM13', '801289', 'RAND ORIENTAL SDN. BHD', '33, JALAN NIRWANA 1, TAMAN NURWANA, 680000 AMPANG, SELANGOR', '03-92816328');
INSERT INTO Company VALUES( 'COM14', '421762', 'THUNDER MATCH TECHNOLOGY SDN. BHD', 'LOT F36, 1ST FLOOR, JUSCO SEREMBAN 2, PERSIARAN S2 B 1,70300 SEREMBAN, NEGERI SEREMBAN', '06-6014589');
INSERT INTO Company VALUES( 'COM15', '516281', 'COWAY (M) SDN BHD', 'SUITE 6-3, LEVEL 6, WISMA UOA II, NO 21, JALAN PINANG, 50450 KUALA LUMPUR', '03-21661677');

INSERT INTO Company VALUES( 'COM16', '162892', 'AGENSI ANTIDADAH KEBANGSAAN KUALA PILAH', 'NO. 14, JALAN BUKIT 72200 KUALA PILAH NEGERI SEMBILAN', '06-7667682');
INSERT INTO Company VALUES( 'COM17', '526192', 'AADK DAERAH SEREMBAN', 'JKR 630 JALAN DATO KLANA MAAMOR 70200 SEREMBAN', '066569872');
INSERT INTO Company VALUES( 'COM18', '627198', 'AKADEMI PEMBANGUNAN BELIA', 'KOMPLEKS RAKAN SUKAN TELUK KEMANG 71050 PORT DICKSON', '069607528');
INSERT INTO Company VALUES( 'COM19', '781923', 'AKADEMI AUDIT NEGARA', 'PERSIARAN TIMUR 71760 BANDAR ENSTEK, NILAI', '069876542');
INSERT INTO Company VALUES( 'COM20', '526198', 'BAITULMAL NEGERI SEMBILAN', 'KARUNG BERKUNCI NO 22 70990 SEREMBAN NEGERI SEMBILAN', '061234543');
/* -- 20 -- */
INSERT INTO Company VALUES( 'COM21', '679201', 'BAHAGIAN PEMBANGUNAN KOTRAKTOR', 'TKT 3, WISMA PERSEKUTUAN 70000 SEREMBAN', '068796654');
INSERT INTO Company VALUES( 'COM22', '862192', 'BSS DEVELOPMENT SDN BHD', 'WISMA MATRIX NO 57 JLN TUN DR ISMAIL 70200 SEREMBAN', '067906583');
INSERT INTO Company VALUES( 'COM23', '621028', 'BANK ISLAM MALAYSIA BERHAD', 'NO.554, JLN BANDAR SENAWANG 16, PUSAT BANDAR SENAWANG 70450 SEREMBAN', '06-7893452');
INSERT INTO Company VALUES( 'COM24', '569281', 'CAREGLOVE GLOBAL SDN BHD', 'LOT 17479, LORONG SENAWANG 3/2, OFF JALAN SENAWANG 3, SENAWANG INDUSTRIAL ESTATE, 70450 SEREMBAN NEGERI SEMBILAN', '066739282');
INSERT INTO Company VALUES( 'COM25', '672039', 'DRB-HICOM DEFENCE TECHNOLOGIES SDN BHD', 'LOT 26, JALAN PENGAPIT 15/19, SEKSYEN 15, 40200 SHAH ALAM, SELANGOR', '');

INSERT INTO Company VALUES( 'COM26', '601982', 'ETIKA LAKSANA ENTERPRISE', 'NO 1048, JLN TTJ 2/2 TAMAN TUANKU JAFAAR 71450 SEREMBAN', '061287296');
INSERT INTO Company VALUES( 'COM27', '629183', 'FELCRA BERHAD', 'KAWASAN GAGUBATU 20, KG RENAL 71600 KUALA KLAWANG, JELEBU N.SEMBILAN', '068192757');
INSERT INTO Company VALUES( 'COM28', '162098', 'GRAND BEACH RESORT P.DICKSON', '5TH MILES, JALAN PANTAI 71050 PORT DICKSON', '062648169');
INSERT INTO Company VALUES( 'COM29', '601982', 'HOSPITAL TUANKU JAAFAR', 'KOMPLEKS PENGURUSAN, JALAN RASAH 70300', '061285979');
INSERT INTO Company VALUES( 'COM30', '702914', 'INSTITUT PENDIDIKAN GURU RAJA MELAWAR', 'SIKAMAT 70400 SEREMBAN NEGERI SEMBILAN', '061285979');
/* -- 30 -- */
INSERT INTO Company VALUES( 'COM31', '701925', 'JABATAN HAL EHWAL AGAMA ISLAM N.S.D.K', 'KARUNG BERKUNCI NO 30 70900 SEREMBAN NEGERI SEMBILAN', '06-7622692');
INSERT INTO Company VALUES( 'COM32', '692081', 'JABATAN IMIGRESEN MALAYSIA', 'TINGKAT 2,4,6, 7,WISMA PERSEKUTUAN,JALAN DATO ABRUL KADIR 70000 SEREMBAN,N.SEMBILAN', '067899871');
INSERT INTO Company VALUES( 'COM33', '582919', 'JATIBINA TRADE SDN BHD', 'LOT 1910 BATU 21/2 BANDAR BARU AMPANGAN 70100 SEREMBAN', '067125524');
INSERT INTO Company VALUES( 'COM34', '162019', 'KPJ HEALTHCARE UNIVERSITY COLLEGE', 'NILAI NEGERI SEMBILAN (STUDENT DEVELOPMENT UNIT)', '066879021');
INSERT INTO Company VALUES( 'COM35', '397219', 'KPJ Seremban Specialist Hospital', 'Lot 6219, 6220,/ 30 Days Jalan Toman 1,Kemayan Square 70200 Seremban', '067826345');

INSERT INTO Company VALUES( 'COM36', '710192', 'LUBRIZOL ADVANCED MATERIALS MALAYSIA', 'BUNGA TANJUNG 1, SENAWANG INDUSTRIAL PARK, 70400 SEREMBAN NEGERI SEMBILAN', '');
INSERT INTO Company VALUES( 'COM37', '710292', 'ON SEMICONDUCTOR MALAYSIA SDN BHD', 'LOT 122,SENAWANG INDUSTRIAL ESTATE 70450 SEREMBAN NEGERI SEMBILAN', '066879688');
INSERT INTO Company VALUES( 'COM38', '710972', 'PEJABAT PENDIDIKAN DAERAH SEREMBAN', 'KM4, JALAN KUALA PILAH,AMPANGAN 70400 SEREMBAN NEGERI SEMBILAN', '067896791');
INSERT INTO Company VALUES( 'COM39', '571083', 'PASADANA SDN BHD', 'SUITE 1023 LEVEL 10 BLOCK B1 LEISURE COMMERCE SQUARE NO 9 JLN PJS 8/9 46150 PETALING JAYA', '039450867');
INSERT INTO Company VALUES( 'COM40', '372917', 'THE ENSTEK DEVELOPMENT SDN BHD', 'NO.1, LEBUH ENSTEK 71760 BANDAR ENSTEK, N.SEMBILAN', '068918901');
/* -- 40 -- */
INSERT INTO Company VALUES( 'COM41', '709163', 'TENAGA NASIONAL BERHAD (P.D)', 'TUANKU JAFAR POWER STATION,GENERATION DIVISION P.O BOX 26,71007 PORT DICKSON', '065647686');
INSERT INTO Company VALUES( 'COM42', '682091', 'ZB BERJAYA CONSULTANCY', '13-2,JLN FOREST HEIGHT 8 SEREMBAN FOREST HEIGHT 70400 SEREMBAN', '067981234');
INSERT INTO Company VALUES( 'COM43', '620283', 'ZBBC WEALTH ADVISORY SDN BHD', 'LOT 13-2,JLN FOREST HEIGHT 8,SEREMBAN FOREST,70450', '066885431');
INSERT INTO Company VALUES( 'COM44', '431822', 'ZK HOLIDAY', 'NO 52, EASTERN GARDEN BATU 4,SI RUSA,71050 PORT DICKSON', '066777011');
/* ------------------------------- 05 ------------------------------- */
/* ---------------------------- Customer ---------------------------- */
/* ------------------------------- 05 ------------------------------- */
INSERT INTO Customer VALUES( 'C01', 'Gov', 'aadk.kp@kkm.gov.my', 'Rose', '06527871', 'COM16');
INSERT INTO Customer VALUES( 'C02', 'Gov', 'aadk.ser@kkm.gov.my', 'Marsila', '0687152', 'COM17');
INSERT INTO Customer VALUES( 'C03', 'Gov', 'audit@mof.gov.my', 'ruhaiza', '06281971', 'COM18');
INSERT INTO Customer VALUES( 'C04', 'Gov', 'Youth@academy.gov.my', 'zubaidah', '06198378', 'COM19');
INSERT INTO Customer VALUES( 'C05', 'Gov', 'Baitulmalns@gov.my', 'Najmi', '06162811', 'COM20');

INSERT INTO Customer VALUES( 'C06', 'Gov', 'bpnns@gov.my', 'Khairy', '06712849', 'COM21');
INSERT INTO Customer VALUES( 'C07', 'Private', 'bbs@gmail.com', 'Cynthia', '06728738', 'COM22');
INSERT INTO Customer VALUES( 'C08', 'Private', 'bankislamsnwg@gmail.com', 'Rina', '06781929', 'COM23');
INSERT INTO Customer VALUES( 'C09', 'Private', 'cg@gmail.com', 'Marsani', '01725891', 'COM24');
INSERT INTO Customer VALUES( 'C10', 'private', 'drbhicom@gmail.com', 'Yaacob', '06718726', 'COM25');
/* -- 10 -- */
INSERT INTO Customer VALUES( 'C11', 'Private', 'etikalaksana@gmail.com', 'Irdyna', '01867279', 'COM26');
INSERT INTO Customer VALUES( 'C12', 'Gov', 'felcra@gmail.com', 'Farzana', '0632419', 'COM27');
INSERT INTO Customer VALUES( 'C13', 'Private', 'contact@grandbeachpd.com', 'Fatiha', '01952172', 'COM28');
INSERT INTO Customer VALUES( 'C14', 'Gov', 'htj@kkm.gov.my', 'Faiz', '06238172', 'COM29');
INSERT INTO Customer VALUES( 'C15', 'Gov', 'ipgrm@moe.gov.my', 'Rahmah', '06981352', 'COM30');

INSERT INTO Customer VALUES( 'C16', 'Gov', 'jheains@ns.gov.my', 'Afiq', '06819269', 'COM31');
INSERT INTO Customer VALUES( 'C17', 'Gov', 'borderns@gov.my', 'Faliq', '06718299', 'COM32');
INSERT INTO Customer VALUES( 'C18', 'Private', 'jtt@yahoo.com', 'Norizan', '03472817', 'COM33');
INSERT INTO Customer VALUES( 'C19', 'Private', 'edu@kpj.com', 'Bukhari', '06728718', 'COM34');
INSERT INTO Customer VALUES( 'C20', 'Private', 'Seremban@kpj.com', 'Shila', '01672456', 'COM35');
/* -- 20 -- */
INSERT INTO Customer VALUES( 'C21', 'Private', 'contact@lubrizol.com', 'Peter', '01678261', 'COM36');
INSERT INTO Customer VALUES( 'C22', 'Private', 'contact@on.com', 'Loges', '06529182', 'COM37');
INSERT INTO Customer VALUES( 'C23', 'Gov', 'ppd@seremban.edu.my', 'Derma', '06719245', 'COM38');
INSERT INTO Customer VALUES( 'C24', 'Private', 'pasadana@yahoo.com', 'Taksiah', '06817299', 'COM39');
INSERT INTO Customer VALUES( 'C25', 'Private', 'Thp@yahoo.com', 'Fifty', '06818826', 'COM40');

INSERT INTO Customer VALUES( 'C26', 'Private', 'pd@tnb.com', 'Salleh', '06991628', 'COM41');
INSERT INTO Customer VALUES( 'C27', 'Private', 'zb@gmail.com', 'Zaki', '06817626', 'COM42');
INSERT INTO Customer VALUES( 'C28', 'Private', 'zbbc@gmail.com', 'Razzaq', '06812888', 'COM43');
INSERT INTO Customer VALUES( 'C29', 'Private', 'zkholiday@gmail.com', 'Zalikha', '01347299', 'COM44');
/* ------------------------------- 06 ------------------------------- */
/* ---------------------------- Supplier ---------------------------- */
/* ------------------------------- 06 ------------------------------- */
INSERT INTO Supplier VALUES( 'S01', 'Shirts', '06-7637948', 'ALEXQM.com', 'Local', 'COM01');
INSERT INTO Supplier VALUES( 'S02', 'Sports Shirts', '03-62593901', 'Arora.com', 'Local', 'COM02');
INSERT INTO Supplier VALUES( 'S03', 'Uniform and shirts', '09-5685078', 'CY.com', 'Local', 'COM03');
INSERT INTO Supplier VALUES( 'S04', 'Shirts', '', 'EFA.com', 'Local', 'COM04');
INSERT INTO Supplier VALUES( 'S05', 'Shirts', '06-2530989', 'FM.com', 'Local', 'COM05');

INSERT INTO Supplier VALUES( 'S07', 'Embroidery equipment', '', '', 'Local', 'COM06');
INSERT INTO Supplier VALUES( 'S08', 'Printing and inkjet machine', '06012717', 'Konicaminolta.com', 'International', 'COM07');
INSERT INTO Supplier VALUES( 'S10', 'Customade shirts', '', '', 'Local', 'COM08');
INSERT INTO Supplier VALUES( 'S12', 'shirts', '607-3517993', 'MYAPP.com', 'Local', 'COM09');
INSERT INTO Supplier VALUES( 'S13', 'Uniform and shirts', '07-7763497', 'MR2.com', 'Local', 'COM10');
/* -- 10 -- */
INSERT INTO Supplier VALUES( 'S14', 'shirts', '07-3517993', 'Orensports.com', 'International', 'COM11');
INSERT INTO Supplier VALUES( 'S15', 'Office supplies', '', 'Ronson.com', 'Local', 'COM12');
INSERT INTO Supplier VALUES( 'S16', 'Machine', '03 92813623', 'RandMY.com', 'Local', 'COM13');
INSERT INTO Supplier VALUES( 'S17', 'Computer and PC supplies', '06-6014589', 'ThunderMY.com', 'Local', 'COM14');
INSERT INTO Supplier VALUES( 'S18', 'Water treatment dispenser', '', '', 'International', 'COM15');
/* ------------------------------- 07 ------------------------------- */
/* ----------------------------- Orders ----------------------------- */
/* ------------------------------- 07 ------------------------------- */
INSERT INTO Orders VALUES( 'ORD001', '13-FEB-2017', 150, '13-FEB-2017', 30, 'C01', 'BR007', 'ED8062');
INSERT INTO Orders VALUES( 'ORD002', '01-MAR-2017', 175, '11-MAR-2017', 35, 'C02', 'BR005', 'ED5102');
INSERT INTO Orders VALUES( 'ORD003', '12-MAR-2017',  50, '14-MAR-2017', 10, 'C03', 'BR006', 'ED5662');
INSERT INTO Orders VALUES( 'ORD004', '09-APR-2017', 450, '29-APR-2017', 90, 'C04', 'BR008', 'ED6242');
INSERT INTO Orders VALUES( 'ORD005', '02-MAY-2017', 750, '02-JUN-2017',150, 'C05', 'BR005', 'ED5102');

INSERT INTO Orders VALUES( 'ORD006', '25-MAY-2017', 200, '05-JUN-2017', 40, 'C02', 'BR005', 'ED5102');
INSERT INTO Orders VALUES( 'ORD007', '09-JUN-2017', 225, '19-JUN-2017', 45, 'C06', 'BR005', 'ED5102');
INSERT INTO Orders VALUES( 'ORD008', '02-JUL-2017', 175, '10-JUL-2017', 35, 'C07', 'BR002', 'ED7022');
INSERT INTO Orders VALUES( 'ORD009', '18-JUL-2017', 200, '28-JUL-2017', 40, 'C01', 'BR007', 'ED8062');
INSERT INTO Orders VALUES( 'ORD010', '01-AUG-2017', 250, '12-AUG-2017', 50, 'C08', 'BR004', 'ED5506');
/* ------------------------------- 08 ------------------------------- */
/* ---------------------------- Jobsheet ---------------------------- */
/* ------------------------------- 08 ------------------------------- */
INSERT INTO Jobsheet VALUES('JS0001', '13-FEB-2017', '15-FEB-2017', 'Printing',                     0, 'ORD001', 'ED8062');
INSERT INTO Jobsheet VALUES('JS0002', '02-MAR-2017', '04-APR-2017', 'Embroidery Logo and printing', 1, 'ORD002', 'ED5102');
INSERT INTO Jobsheet VALUES('JS0003', '13-MAR-2017', '15-MAR-2017', 'Embroidery',                   0, 'ORD003', 'ED5662');
INSERT INTO Jobsheet VALUES('JS0004', '09-APR-2017', '12-APR-2017', 'Printing',                     0, 'ORD004', 'ED6242');
INSERT INTO Jobsheet VALUES('JS0005', '02-MAY-2017', '08-MAY-2017', 'Embroidery',                   2, 'ORD005', 'ED5102');

INSERT INTO Jobsheet VALUES('JS0006', '25-MAY-2017', '27-MAY-2017', 'Printing',                     0, 'ORD006', 'ED5102');
INSERT INTO Jobsheet VALUES('JS0007', '10-JUN-2017', '16-JUN-2017', 'Printing and Embroidery',      0, 'ORD007', 'ED5102');
INSERT INTO Jobsheet VALUES('JS0008', '03-JUL-2017', '05-AUG-2017', 'Embroidery',                   0, 'ORD008', 'ED7022');
INSERT INTO Jobsheet VALUES('JS0009', '19-JUL-2017', '23-JUL-2017', 'Embroidery',                   2, 'ORD009', 'ED8062');
INSERT INTO Jobsheet VALUES('JS0010', '02-AUG-2017', '04-AUG-2017', 'Embroidery',                   0, 'ORD010', 'ED5506');
/* ------------------------------- 09 ------------------------------- */
/* ---------------------------- Product ----------------------------- */
/* ------------------------------- 09 ------------------------------- */
INSERT INTO Product VALUES('QD04WH' , 'MICROFIBRE TSHIRTS', 18.90, 20, 'ROUNDNECK', 'S01', 'BR001');
INSERT INTO Product VALUES('QD06BLK', 'MICROFIBRE TSHIRTS', 28.00, 26, 'WITH COLLAR', 'S01', 'BR001');
INSERT INTO Product VALUES('QD49ORG', 'POLYESTER INTERLOCK', 18.00, 32, 'LONG SLEEVE ROUNDNECK', 'S04', 'BR001');
INSERT INTO Product VALUES('QD48GRN', 'POLYESTER INTERLOCK', 14.90, 42, 'ROUNDNECK', 'S04', 'BR001');
INSERT INTO Product VALUES('QD25PNK', 'COTTON MICROFIBRE', 16.00, 59, 'WITH COLLAR', 'S05', 'BR001');

INSERT INTO Product VALUES('CI12BLK', 'COTTON POLYESTER', 18.00, 86, 'ROUNDNECK', 'S05', 'BR001');
INSERT INTO Product VALUES('HC01YLL', 'HONEYCOMB', 22.00, 140, 'WITH COLLAR', 'S02', 'BR001');
INSERT INTO Product VALUES('CT53RD' , 'COMFY COTTON', 15.00, 62, 'ROUNDNECK', 'S02', 'BR001');
INSERT INTO Product VALUES('F138RD' , 'F1 UNIFORM POLYESTER VISCOSE', 15.00, 19, 'WITH COLLAR MAN', 'S04', 'BR001');
INSERT INTO Product VALUES('F139BLU', 'F1 UNIFORM POLYESTER VISCOSE', 32.00, 27, 'WITH COLLAR FEMALE', 'S04', 'BR001');
/* ------------------------------- 10 ------------------------------- */
/* ----------------------------- Machine ---------------------------- */
/* ------------------------------- 10 ------------------------------- */
INSERT INTO Machine VALUES( 'MAC001', 'HCH-701-30 HAPPY EMBROIDERY MACHINE' , 'EMBROIDERY MACHINE (SINGLE)'     , '20-MAY-2004'     , 'HAPPY JAPAN'     , 'S16', 'DEPT002');
INSERT INTO Machine VALUES( 'MAC002', 'BROTHER HIGH SPEED MACHINE'          , 'EMBROIDERY MACHINE (SINGLE)'     , '07-APRIL-2009'   , 'BROTHER'         , 'S16', 'DEPT002');
INSERT INTO Machine VALUES( 'MAC003', 'TAJIMA EMBROIDERY MACHINE'           , 'EMBROIDERY MACHINE (12 HEADS)'   , '07-APRIL-2009'   , 'TAJIMA'          , 'S16', 'DEPT002');
INSERT INTO Machine VALUES( 'MAC004', 'BIZHUB C658'                         , 'PRINTING MACHINE'                , '07-APRIL-2009'   , 'KONICA MINOLTA'  , 'S08', 'DEPT002');
INSERT INTO Machine VALUES( 'MAC005', 'BIZHUB C558'                         , 'PRINTING MACHINE'                , '05-NOVEMBER-2010', 'KONICA MINOLTA'  , 'S08', 'DEPT002');

INSERT INTO Machine VALUES( 'MAC006', 'HCH-701-30 HAPPY EMBROIDERY MACHINE', 'EMBROIDERY MACHINE (SINGLE)'      , '15-APRIL-2012'   , 'HAPPY JAPAN'     , 'S16', 'DEPT002');
INSERT INTO Machine VALUES( 'MAC007', 'TAJIMA EMBROIDERY MACHINE', 'EMBROIDERY MACHINE (12 HEADS)'              , '11-JULY-2012'    , 'TAJIMA'          , 'S16', 'DEPT002');
INSERT INTO Machine VALUES( 'MAC008', 'BIZHUB C558', 'PRINTING MACHINE'                                         , '04-APRIL-2013'   , 'KONICA MINOLTA'  , 'S08', 'DEPT002');
INSERT INTO Machine VALUES( 'MAC009', 'HCH-701-30 HAPPY EMBROIDERY MACHINE', 'EMBROIDERY MACHINE (SINGLE)'      , '10-OCTOBER-2015' , 'HAPPY JAPAN'     , 'S16', 'DEPT002');
INSERT INTO Machine VALUES( 'MAC010', 'HCH-701-30 HAPPY EMBROIDERY MACHINE', 'EMBROIDERY MACHINE (SINGLE)'      , '12-JANUARY-2017' , 'HAPPY JAPAN'     , 'S16', 'DEPT002');
/* ------------------------------- 11 ------------------------------- */
/* ---------------------------- Equipment --------------------------- */
/* ------------------------------- 11 ------------------------------- */
INSERT INTO Equipment VALUES('EQ001', 'EMBROIDERY THREAD', 'THREAD SEPCIFICALLY FOR EMBROIDERY.', 7, 120, 'S07');
INSERT INTO Equipment VALUES('EQ002', 'BOBBIN THREAD', 'USED IN BOBBINS', 30, 20, 'S07');
INSERT INTO Equipment VALUES('EQ003', 'BOBBIN', 'FOR STICHING', 20, 10, 'S07');
INSERT INTO Equipment VALUES('EQ004', 'EMBROIDERY LINING', 'PROVIDE NEAT FININSHING', 30, 2, 'S07');
INSERT INTO Equipment VALUES('EQ005', 'EMBROIDERY NEEDLE', 'SPECIAL NEEDLE FOR EMBROIDERY MACHINE', 2, 5, 'S16');

INSERT INTO Equipment VALUES('EQ006', 'DISKETTE', 'FOR EMBROIDERY STORAGE', 50, 180, 'S15');
INSERT INTO Equipment VALUES('EQ007', 'PENDIRVE', 'FOR EMBROIDERY STORAGE', 100, 5, 'S15');
INSERT INTO Equipment VALUES('EQ008', 'TRIM SCISSORS', 'FOR TRIMMING EDGES AND EMBROIDERED ERROR', 2, 10, 'S07');
INSERT INTO Equipment VALUES('EQ009', 'PC', 'FOR ALL PURPOSES WORK-RELATED', 2000, 25, 'S17');
INSERT INTO Equipment VALUES('EQ010', 'PRINTING INK', 'FOR TSHIRT PRINTING', 0, 120, 'S07');
/* ------------------------------- 12 ------------------------------- */
/* ---------------------------- Payment ----------------------------- */
/* ------------------------------- 12 ------------------------------- */
INSERT INTO Payment VALUES( 'PY001', 4500, 6, 'cash out', 'debt',       '', 'ED5222', 'COM01');
INSERT INTO Payment VALUES( 'PY002', 5000, 6, 'cash out', 'debt',       '', 'ED5222', 'COM01');
INSERT INTO Payment VALUES( 'PY003', 7000, 6, 'cash out', 'debt',       '', 'ED5222', 'COM02');
INSERT INTO Payment VALUES( 'PY004', 6500, 6, 'cash out', 'debt',       '', 'ED5222', 'COM03');
INSERT INTO Payment VALUES( 'PY005', 7800, 6, 'cash out', 'debt',       '', 'ED5222', 'COM04');

INSERT INTO Payment VALUES( 'PY006', 9000, 6, 'cash out', 'cash',       '', 'ED5632', 'COM05');
INSERT INTO Payment VALUES( 'PY007', 5600, 6, 'cash out', 'cash',       '', 'ED5632', 'COM07');
INSERT INTO Payment VALUES( 'PY008', 8500, 6, 'cash out', 'cash',       '', 'ED5632', 'COM08');
INSERT INTO Payment VALUES( 'PY009', 2700, 6, 'cash out', 'cash',       '', 'ED5632', 'COM10');
INSERT INTO Payment VALUES( 'PY010', 1200, 6, 'cash out', 'cash',       '', 'ED5632', 'COM12');
/* -- 10 -- */
INSERT INTO Payment VALUES( 'PY011',  567, 6,  'cash in', 'debt', 'ORD001', 'ED5222', 'COM16');
INSERT INTO Payment VALUES( 'PY012',  980, 6,  'cash in', 'debt', 'ORD002', 'ED5222', 'COM17');
INSERT INTO Payment VALUES( 'PY013',  180, 6,  'cash in', 'debt', 'ORD003', 'ED5222', 'COM18');
INSERT INTO Payment VALUES( 'PY014',2110.5,6,  'cash in', 'debt', 'ORD004', 'ED5222', 'COM19');
INSERT INTO Payment VALUES( 'PY015', 2800, 6,  'cash in', 'debt', 'ORD005', 'ED5222', 'COM20');

INSERT INTO Payment VALUES( 'PY016',  720, 6,  'cash in', 'cash', 'ORD006', 'ED5632', 'COM21');
INSERT INTO Payment VALUES( 'PY017',  990, 6,  'cash in', 'cash', 'ORD007', 'ED5632', 'COM22');
INSERT INTO Payment VALUES( 'PY018',  525, 6,  'cash in', 'cash', 'ORD008', 'ED5632', 'COM23');
INSERT INTO Payment VALUES( 'PY019',  600, 6,  'cash in', 'cash', 'ORD009', 'ED5632', 'COM24');
INSERT INTO Payment VALUES( 'PY020', 1600, 6,  'cash in', 'cash', 'ORD010', 'ED5632', 'COM25');
/* ------------------------------- 13 ------------------------------- */
/* -------------------------- Transaction --------------------------- */
/* ------------------------------- 13 ------------------------------- */
INSERT INTO Transaction VALUES('464256542', 'CIMB'   , 'FIRST MACHITA (M) SDN BHD'    , '05-JUN-2016', '70117543857','PY006');
INSERT INTO Transaction VALUES('464245612', 'MayBank', 'JAYAGESH LETCHUMI'            , '19-JUN-2016', '16220045384','PY007');
INSERT INTO Transaction VALUES('784656542', 'MayBank', 'KONICA MINOLTA SDN. BHD'      , '10-JUL-2016', '16220078354','PY008');
INSERT INTO Transaction VALUES('771452645', 'MayBank', 'Xue Huang'                    , '28-JUL-2016', '16220086453','PY009');
INSERT INTO Transaction VALUES('741851625', 'CIMB'    , 'MY APPAREL (M) SDN BHD'      , '12-AUG-2016', '70114752437','PY010');

INSERT INTO Transaction VALUES('464471852', 'MAYBANK', 'ZRICH CORPORATION SDN BHD'    , '05-JUN-2017', '70112574219','PY016');
INSERT INTO Transaction VALUES('741845645', 'MAYBANK', 'ZRICH CORPORATION SDN BHD'    , '19-JUN-2017', '70112574219','PY017');
INSERT INTO Transaction VALUES('464471842', 'MAYBANK', 'ZRICH CORPORATION SDN BHD'    , '10-JUL-2017', '70112574219','PY018');
INSERT INTO Transaction VALUES('741852645', 'MAYBANK', 'ZRICH CORPORATION SDN BHD'    , '28-JUL-2017', '70112574219','PY019');
INSERT INTO Transaction VALUES('464471832', 'MAYBANK', 'ZRICH CORPORATION SDN BHD'    , '12-AUG-2017', '70112574219','PY020');
/* ------------------------------- 14 ------------------------------- */
/* ---------------------------- Invoice ----------------------------- */
/* ------------------------------- 14 ------------------------------- */
INSERT INTO Invoice VALUES( 'inv001', '25-JAN-2016', 30, 4500, '25-FEB-2016', 'PY001');
INSERT INTO Invoice VALUES( 'inv002', '11-JAN-2016', 60, 5000, '11-MAR-2016', 'PY002');
INSERT INTO Invoice VALUES( 'inv003', '27-JAN-2016', 60, 7000, '27-MAR-2016', 'PY003');
INSERT INTO Invoice VALUES( 'inv004', '01-MAR-2016', 60, 6500, '01-MAY-2016', 'PY004');
INSERT INTO Invoice VALUES( 'inv005', '02-MAR-2016', 90, 7800, '02-JUN-2016', 'PY005');

INSERT INTO Invoice VALUES( 'inv006', '25-MAY-2017', 30,  447, '25-JUN-2017', 'PY011');
INSERT INTO Invoice VALUES( 'inv007', '09-JUN-2017', 30,  805, '09-JUL-2017', 'PY012');
INSERT INTO Invoice VALUES( 'inv008', '02-JUL-2017', 30,  130, '02-AUG-2017', 'PY013');
INSERT INTO Invoice VALUES( 'inv009', '18-JUL-2017', 60,1660.5,'18-AUG-2017', 'PY014');
INSERT INTO Invoice VALUES( 'inv010', '01-AUG-2017', 60, 2050, '01-SEP-2017', 'PY015');
/* ------------------------------- 15 ------------------------------- */
/* ---------------------------- Receipt ----------------------------- */
/* ------------------------------- 15 ------------------------------- */
INSERT INTO Receipt VALUES( 'rc001', '23-FEB-2016', 0, 'online', '4500', 'inv001');
INSERT INTO Receipt VALUES( 'rc002', '11-MAR-2016', 0, 'online', '5000', 'inv002');
INSERT INTO Receipt VALUES( 'rc003', '24-MAR-2016', 0, 'online', '7000', 'inv003');
INSERT INTO Receipt VALUES( 'rc004', '29-APR-2016', 0, 'online', '6500', 'inv004');
INSERT INTO Receipt VALUES( 'rc005', '02-JUN-2016', 0, 'online', '7800', 'inv005');

INSERT INTO Receipt VALUES( 'rc006', '25-JUN-2017', 0,   'cash',  '447', 'inv006');
INSERT INTO Receipt VALUES( 'rc007', '09-JUL-2017', 0,   'cash',  '805', 'inv007');
INSERT INTO Receipt VALUES( 'rc008', '02-AUG-2017', 0,   'cash',  '130', 'inv008');
INSERT INTO Receipt VALUES( 'rc009', '18-AUG-2017', 0, 'cheque','1660.5','inv009');
INSERT INTO Receipt VALUES( 'rc010', '01-SEP-2017', 0, 'cheque', '2050', 'inv010');
/* ------------------------------- 16 ------------------------------- */
/* ---------------------------- Cash bill --------------------------- */
/* ------------------------------- 16 ------------------------------- */
INSERT INTO Cashbill VALUES( 'bill001', '05-JUN-2016', 'Online', 'RECEIVE', 5, 'PY006');
INSERT INTO Cashbill VALUES( 'bill002', '19-JUN-2016', 'online', 'RECEIVE', 5, 'PY007');
INSERT INTO Cashbill VALUES( 'bill003', '10-JUL-2016', 'online', 'RECEIVE', 5, 'PY008');
INSERT INTO Cashbill VALUES( 'bill004', '28-JUL-2016', 'online', 'RECEIVE', 5, 'PY009');
INSERT INTO Cashbill VALUES( 'bill005', '12-AUG-2016', 'online', 'RECEIVE', 5, 'PY010');

INSERT INTO Cashbill VALUES( 'bill006', '25-MAY-2017',   'cash',   'SEND', 10, 'PY016');
INSERT INTO Cashbill VALUES( 'bill007', '09-JUN-2017',   'cash',   'SEND', 10, 'PY017');
INSERT INTO Cashbill VALUES( 'bill008', '02-JUL-2017', 'cheque',   'SEND', 10, 'PY018');
INSERT INTO Cashbill VALUES( 'bill009', '18-JUL-2017', 'cheque',   'SEND', 10, 'PY019');
INSERT INTO Cashbill VALUES( 'bill010', '01-AUG-2017', 'online',   'SEND', 10, 'PY020');
/* ----------------------------- - 01 - ----------------------------- */
/* ----------------------- EmployeeDepartment ----------------------- */
/* ----------------------------- - 17 - ----------------------------- */
INSERT INTO EmployeeDepartment VALUES('ED5304', 'DEPT001');
INSERT INTO EmployeeDepartment VALUES('ED5258', 'DEPT001');
INSERT INTO EmployeeDepartment VALUES('ED5018', 'DEPT002');
INSERT INTO EmployeeDepartment VALUES('ED5322', 'DEPT007');
INSERT INTO EmployeeDepartment VALUES('ED5109', 'DEPT002');

INSERT INTO EmployeeDepartment VALUES('ED5265', 'DEPT002');
INSERT INTO EmployeeDepartment VALUES('ED5703', 'DEPT002');
INSERT INTO EmployeeDepartment VALUES('ED5443', 'DEPT003');
INSERT INTO EmployeeDepartment VALUES('ED5756', 'DEPT003');
INSERT INTO EmployeeDepartment VALUES('ED5766', 'DEPT003');
/* -- 10 -- */
INSERT INTO EmployeeDepartment VALUES('ED6236', 'DEPT003');
INSERT INTO EmployeeDepartment VALUES('ED5632', 'DEPT004');
INSERT INTO EmployeeDepartment VALUES('ED5222', 'DEPT004');
INSERT INTO EmployeeDepartment VALUES('ED6092', 'DEPT005');
INSERT INTO EmployeeDepartment VALUES('ED6164', 'DEPT005');

INSERT INTO EmployeeDepartment VALUES('ED6023', 'DEPT006');
INSERT INTO EmployeeDepartment VALUES('ED2002', 'DEPT006');
INSERT INTO EmployeeDepartment VALUES('ED5442', 'DEPT006');
INSERT INTO EmployeeDepartment VALUES('ED7022', 'DEPT007');
INSERT INTO EmployeeDepartment VALUES('ED5448', 'DEPT007');
/* -- 20 -- */
INSERT INTO EmployeeDepartment VALUES('ED5506', 'DEPT007');
INSERT INTO EmployeeDepartment VALUES('ED5102', 'DEPT007');
INSERT INTO EmployeeDepartment VALUES('ED5544', 'DEPT008');
INSERT INTO EmployeeDepartment VALUES('ED5562', 'DEPT008');
INSERT INTO EmployeeDepartment VALUES('ED5501', 'DEPT008');

INSERT INTO EmployeeDepartment VALUES('ED6243', 'DEPT008');
INSERT INTO EmployeeDepartment VALUES('ED2333', 'DEPT009');
INSERT INTO EmployeeDepartment VALUES('ED8423', 'DEPT009');
INSERT INTO EmployeeDepartment VALUES('ED6979', 'DEPT010');
INSERT INTO EmployeeDepartment VALUES('ED2337', 'DEPT010');
/* ----------------------------- - 02 - ----------------------------- */
/* ------------------------- EmployeeBranch ------------------------- */
/* ----------------------------- - 18 - ----------------------------- */
INSERT INTO EmployeeBranch VALUES('ED5304', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5258', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5018', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5322', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5109', 'BR001');

INSERT INTO EmployeeBranch VALUES('ED5265', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5703', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5443', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5756', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5766', 'BR001');
/* -- 10 -- */
INSERT INTO EmployeeBranch VALUES('ED6236', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5632', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5222', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED6092', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED6164', 'BR001');

INSERT INTO EmployeeBranch VALUES('ED6023', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED2002', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5442', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED7022', 'BR002');
INSERT INTO EmployeeBranch VALUES('ED5448', 'BR003');
/* -- 20 -- */
INSERT INTO EmployeeBranch VALUES('ED5506', 'BR004');
INSERT INTO EmployeeBranch VALUES('ED5102', 'BR005');
INSERT INTO EmployeeBranch VALUES('ED5544', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5562', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5501', 'BR001');

INSERT INTO EmployeeBranch VALUES('ED6243', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED2333', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED8423', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED6979', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED2337', 'BR001');
/* -- 30 -- */
INSERT INTO EmployeeBranch VALUES('ED6336', 'BR001');
INSERT INTO EmployeeBranch VALUES('ED5662', 'BR006');
INSERT INTO EmployeeBranch VALUES('ED8062', 'BR007');
INSERT INTO EmployeeBranch VALUES('ED6242', 'BR008');
INSERT INTO EmployeeBranch VALUES('ED2028', 'BR009');

INSERT INTO EmployeeBranch VALUES('ED6106', 'BR010');
/* ----------------------------- - 03 - ----------------------------- */
/* ------------------------ CustomerEmployee ------------------------ */
/* ----------------------------- - 19 - ----------------------------- */
INSERT INTO CustomerEmployee VALUES( 'C01', 'ED8062');
INSERT INTO CustomerEmployee VALUES( 'C02', 'ED5102');
INSERT INTO CustomerEmployee VALUES( 'C04', 'ED6242');
INSERT INTO CustomerEmployee VALUES( 'C03', 'ED5662');
INSERT INTO CustomerEmployee VALUES( 'C05', 'ED5102');

INSERT INTO CustomerEmployee VALUES( 'C06', 'ED5102');
INSERT INTO CustomerEmployee VALUES( 'C07', 'ED7022');
INSERT INTO CustomerEmployee VALUES( 'C08', 'ED5506');
INSERT INTO CustomerEmployee VALUES( 'C09', 'ED5443');
INSERT INTO CustomerEmployee VALUES( 'C10', 'ED5756');
/* -- 10 -- */
INSERT INTO CustomerEmployee VALUES( 'C11', 'ED5766');
INSERT INTO CustomerEmployee VALUES( 'C12', 'ED2028');
INSERT INTO CustomerEmployee VALUES( 'C13', 'ED6242');
INSERT INTO CustomerEmployee VALUES( 'C14', 'ED5102');
INSERT INTO CustomerEmployee VALUES( 'C15', 'ED5766');

INSERT INTO CustomerEmployee VALUES( 'C16', 'ED5448');
INSERT INTO CustomerEmployee VALUES( 'C17', 'ED5443');
INSERT INTO CustomerEmployee VALUES( 'C18', 'ED5766');
INSERT INTO CustomerEmployee VALUES( 'C19', 'ED5662');
INSERT INTO CustomerEmployee VALUES( 'C20', 'ED7022');
/* -- 20 -- */
INSERT INTO CustomerEmployee VALUES( 'C21', 'ED5506');
INSERT INTO CustomerEmployee VALUES( 'C22', 'ED5756');
INSERT INTO CustomerEmployee VALUES( 'C23', 'ED5766');
INSERT INTO CustomerEmployee VALUES( 'C24', 'ED6236');
INSERT INTO CustomerEmployee VALUES( 'C25', 'ED5662');

INSERT INTO CustomerEmployee VALUES( 'C26', 'ED6242');
INSERT INTO CustomerEmployee VALUES( 'C27', 'ED5756');
INSERT INTO CustomerEmployee VALUES( 'C28', 'ED2028');
INSERT INTO CustomerEmployee VALUES( 'C29', 'ED6242');
/* ----------------------------- - 04 - ----------------------------- */
/* ------------------------- CustomerBranch ------------------------- */
/* ----------------------------- - 20 - ----------------------------- */
INSERT INTO CustomerBranch VALUES( 'C01', 'BR007');
INSERT INTO CustomerBranch VALUES( 'C02', 'BR005');
INSERT INTO CustomerBranch VALUES( 'C04', 'BR008');
INSERT INTO CustomerBranch VALUES( 'C03', 'BR006');
INSERT INTO CustomerBranch VALUES( 'C05', 'BR005');

INSERT INTO CustomerBranch VALUES( 'C06', 'BR005');
INSERT INTO CustomerBranch VALUES( 'C07', 'BR002');
INSERT INTO CustomerBranch VALUES( 'C08', 'BR004');
INSERT INTO CustomerBranch VALUES( 'C09', 'BR001');
INSERT INTO CustomerBranch VALUES( 'C10', 'BR001');
/* -- 10 -- */
INSERT INTO CustomerBranch VALUES( 'C11', 'BR001');
INSERT INTO CustomerBranch VALUES( 'C12', 'BR009');
INSERT INTO CustomerBranch VALUES( 'C13', 'BR008');
INSERT INTO CustomerBranch VALUES( 'C14', 'BR005');
INSERT INTO CustomerBranch VALUES( 'C15', 'BR001');

INSERT INTO CustomerBranch VALUES( 'C16', 'BR003');
INSERT INTO CustomerBranch VALUES( 'C17', 'BR001');
INSERT INTO CustomerBranch VALUES( 'C18', 'BR001');
INSERT INTO CustomerBranch VALUES( 'C19', 'BR006');
INSERT INTO CustomerBranch VALUES( 'C20', 'BR002');
/* -- 20 -- */
INSERT INTO CustomerBranch VALUES( 'C21', 'BR004');
INSERT INTO CustomerBranch VALUES( 'C22', 'BR001');
INSERT INTO CustomerBranch VALUES( 'C23', 'BR001');
INSERT INTO CustomerBranch VALUES( 'C24', 'BR001');
INSERT INTO CustomerBranch VALUES( 'C25', 'BR006');

INSERT INTO CustomerBranch VALUES( 'C26', 'BR008');
INSERT INTO CustomerBranch VALUES( 'C27', 'BR001');
INSERT INTO CustomerBranch VALUES( 'C28', 'BR009');
INSERT INTO CustomerBranch VALUES( 'C29', 'BR008');
/* ----------------------------- - 05 - ----------------------------- */
/* ------------------------- OrdersProduct -------------------------- */
/* ----------------------------- - 21    - ----------------------------- */
INSERT INTO OrdersProduct VALUES('ORD001',  'QD04WH', 30);
INSERT INTO OrdersProduct VALUES('ORD002', 'QD06BLK', 35);
INSERT INTO OrdersProduct VALUES('ORD003', 'QD49ORG', 10);
INSERT INTO OrdersProduct VALUES('ORD004', 'QD48GRN', 45);
INSERT INTO OrdersProduct VALUES('ORD004', 'F139BLU', 45);

INSERT INTO OrdersProduct VALUES('ORD005', 'QD25PNK', 50);
INSERT INTO OrdersProduct VALUES('ORD005', 'CI12BLK', 50);
INSERT INTO OrdersProduct VALUES('ORD005', 'HC01YLL', 50);
INSERT INTO OrdersProduct VALUES('ORD006', 'CI12BLK', 40);
INSERT INTO OrdersProduct VALUES('ORD007', 'HC01YLL', 45);
/* -- 10 -- */
INSERT INTO OrdersProduct VALUES('ORD008',  'CT53RD', 35);
INSERT INTO OrdersProduct VALUES('ORD009',  'F138RD', 40);
INSERT INTO OrdersProduct VALUES('ORD010', 'F139BLU', 50);
/* ----------------------------- - 06 - ----------------------------- */
/* ------------------------- ProductMachine ------------------------- */
/* ----------------------------- - 22 - ----------------------------- */
INSERT INTO ProductMachine VALUES( 'QD04WH', 'MAC005');
INSERT INTO ProductMachine VALUES( 'QD06BLK', 'MAC001');
INSERT INTO ProductMachine VALUES( 'QD06BLK', 'MAC004');
INSERT INTO ProductMachine VALUES( 'QD49ORG', 'MAC003');
INSERT INTO ProductMachine VALUES( 'QD48GRN', 'MAC008');

INSERT INTO ProductMachine VALUES( 'F139BLU', 'MAC004');
INSERT INTO ProductMachine VALUES( 'QD25PNK', 'MAC006');
INSERT INTO ProductMachine VALUES( 'CI12BLK', 'MAC008');
INSERT INTO ProductMachine VALUES( 'HC01YLL', 'MAC008');
INSERT INTO ProductMachine VALUES( 'HC01YLL', 'MAC006');
/* -- 10 -- */
INSERT INTO ProductMachine VALUES( 'CT53RD', 'MAC007'); 
INSERT INTO ProductMachine VALUES( 'F138RD', 'MAC009');
INSERT INTO ProductMachine VALUES( 'F139BLU', 'MAC010');
/* ----------------------------- - 07 - ----------------------------- */
/* ------------------------ MachineEquipment ------------------------ */
/* ----------------------------- - 23 - ----------------------------- */
INSERT INTO MachineEquipment VALUES( 'MAC001', 'EQ001');
INSERT INTO MachineEquipment VALUES( 'MAC001', 'EQ002');
INSERT INTO MachineEquipment VALUES( 'MAC001', 'EQ003');
INSERT INTO MachineEquipment VALUES( 'MAC001', 'EQ004');
INSERT INTO MachineEquipment VALUES( 'MAC001', 'EQ005');

INSERT INTO MachineEquipment VALUES( 'MAC001', 'EQ006');
INSERT INTO MachineEquipment VALUES( 'MAC001', 'EQ008');
INSERT INTO MachineEquipment VALUES( 'MAC001', 'EQ009');
INSERT INTO MachineEquipment VALUES( 'MAC002', 'EQ001');
INSERT INTO MachineEquipment VALUES( 'MAC002', 'EQ002');
/* -- 10 -- */
INSERT INTO MachineEquipment VALUES( 'MAC002', 'EQ003');
INSERT INTO MachineEquipment VALUES( 'MAC002', 'EQ004');
INSERT INTO MachineEquipment VALUES( 'MAC002', 'EQ005');
INSERT INTO MachineEquipment VALUES( 'MAC002', 'EQ006');
INSERT INTO MachineEquipment VALUES( 'MAC002', 'EQ008');

INSERT INTO MachineEquipment VALUES( 'MAC002', 'EQ009');
INSERT INTO MachineEquipment VALUES( 'MAC003', 'EQ001');
INSERT INTO MachineEquipment VALUES( 'MAC003', 'EQ002');
INSERT INTO MachineEquipment VALUES( 'MAC003', 'EQ003');
INSERT INTO MachineEquipment VALUES( 'MAC003', 'EQ004');
/* -- 20 -- */
INSERT INTO MachineEquipment VALUES( 'MAC003', 'EQ005');
INSERT INTO MachineEquipment VALUES( 'MAC003', 'EQ006');
INSERT INTO MachineEquipment VALUES( 'MAC003', 'EQ008');
INSERT INTO MachineEquipment VALUES( 'MAC003', 'EQ009');
INSERT INTO MachineEquipment VALUES( 'MAC004', 'EQ007');

INSERT INTO MachineEquipment VALUES( 'MAC004', 'EQ009');
INSERT INTO MachineEquipment VALUES( 'MAC004', 'EQ010');
INSERT INTO MachineEquipment VALUES( 'MAC005', 'EQ007');
INSERT INTO MachineEquipment VALUES( 'MAC005', 'EQ009');
INSERT INTO MachineEquipment VALUES( 'MAC005', 'EQ010');
/* -- 30 -- */
INSERT INTO MachineEquipment VALUES( 'MAC006', 'EQ001');
INSERT INTO MachineEquipment VALUES( 'MAC006', 'EQ002');
INSERT INTO MachineEquipment VALUES( 'MAC006', 'EQ003');
INSERT INTO MachineEquipment VALUES( 'MAC006', 'EQ004');
INSERT INTO MachineEquipment VALUES( 'MAC006', 'EQ005');

INSERT INTO MachineEquipment VALUES( 'MAC006', 'EQ007');
INSERT INTO MachineEquipment VALUES( 'MAC006', 'EQ008');
INSERT INTO MachineEquipment VALUES( 'MAC006', 'EQ009');
INSERT INTO MachineEquipment VALUES( 'MAC007', 'EQ001');
INSERT INTO MachineEquipment VALUES( 'MAC007', 'EQ002');
/* -- 40 -- */
INSERT INTO MachineEquipment VALUES( 'MAC007', 'EQ003');
INSERT INTO MachineEquipment VALUES( 'MAC007', 'EQ004');
INSERT INTO MachineEquipment VALUES( 'MAC007', 'EQ005');
INSERT INTO MachineEquipment VALUES( 'MAC007', 'EQ007');
INSERT INTO MachineEquipment VALUES( 'MAC007', 'EQ008');

INSERT INTO MachineEquipment VALUES( 'MAC007', 'EQ009');
INSERT INTO MachineEquipment VALUES( 'MAC008', 'EQ007');
INSERT INTO MachineEquipment VALUES( 'MAC008', 'EQ009');
INSERT INTO MachineEquipment VALUES( 'MAC008', 'EQ010');
INSERT INTO MachineEquipment VALUES( 'MAC009', 'EQ001');
/* -- 50 -- */
INSERT INTO MachineEquipment VALUES( 'MAC009', 'EQ002');
INSERT INTO MachineEquipment VALUES( 'MAC009', 'EQ003');
INSERT INTO MachineEquipment VALUES( 'MAC009', 'EQ004');
INSERT INTO MachineEquipment VALUES( 'MAC009', 'EQ005');
INSERT INTO MachineEquipment VALUES( 'MAC009', 'EQ007');

INSERT INTO MachineEquipment VALUES( 'MAC009', 'EQ008');
INSERT INTO MachineEquipment VALUES( 'MAC009', 'EQ010');
INSERT INTO MachineEquipment VALUES( 'MAC010', 'EQ001');
INSERT INTO MachineEquipment VALUES( 'MAC010', 'EQ002');
INSERT INTO MachineEquipment VALUES( 'MAC010', 'EQ003');
/* -- 60 -- */
INSERT INTO MachineEquipment VALUES( 'MAC010', 'EQ004');
INSERT INTO MachineEquipment VALUES( 'MAC010', 'EQ005');
INSERT INTO MachineEquipment VALUES( 'MAC010', 'EQ007');
INSERT INTO MachineEquipment VALUES( 'MAC010', 'EQ008');
/* ----------------------------- - 08 - ----------------------------- */
/* ------------------------- OrdersMachine -------------------------- */
/* ----------------------------- - 24 - ----------------------------- */
INSERT INTO OrdersMachine VALUES( 'ORD001', 'MAC005');
INSERT INTO OrdersMachine VALUES( 'ORD002', 'MAC001');
INSERT INTO OrdersMachine VALUES( 'ORD002', 'MAC004');
INSERT INTO OrdersMachine VALUES( 'ORD003', 'MAC003');
INSERT INTO OrdersMachine VALUES( 'ORD004', 'MAC008');

INSERT INTO OrdersMachine VALUES( 'ORD004', 'MAC004');
INSERT INTO OrdersMachine VALUES( 'ORD005', 'MAC006');
INSERT INTO OrdersMachine VALUES( 'ORD005', 'MAC007');
INSERT INTO OrdersMachine VALUES( 'ORD005', 'MAC009');
INSERT INTO OrdersMachine VALUES( 'ORD006', 'MAC008');
/* -- 10 -- */
INSERT INTO OrdersMachine VALUES( 'ORD007', 'MAC008');
INSERT INTO OrdersMachine VALUES( 'ORD007', 'MAC006');
INSERT INTO OrdersMachine VALUES( 'ORD008', 'MAC007');
INSERT INTO OrdersMachine VALUES( 'ORD009', 'MAC009');
INSERT INTO OrdersMachine VALUES( 'ORD010', 'MAC010');
/* ----------------------------- - 09 - ----------------------------- */
/* ------------------------- OrdersEquipment ------------------------ */
/* ----------------------------- - 25 - ----------------------------- */
INSERT INTO OrdersEquipment VALUES( 'ORD001', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD001', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD001', 'EQ010');
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ001');
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ002');

INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ003');
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ004');
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ005');
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ006');
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ008');
/* -- 10 -- */
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD002', 'EQ010');
INSERT INTO OrdersEquipment VALUES( 'ORD003', 'EQ001');

INSERT INTO OrdersEquipment VALUES( 'ORD003', 'EQ002');
INSERT INTO OrdersEquipment VALUES( 'ORD003', 'EQ003');
INSERT INTO OrdersEquipment VALUES( 'ORD003', 'EQ004');
INSERT INTO OrdersEquipment VALUES( 'ORD003', 'EQ005');
INSERT INTO OrdersEquipment VALUES( 'ORD003', 'EQ006');
/* -- 20 -- */
INSERT INTO OrdersEquipment VALUES( 'ORD003', 'EQ008');
INSERT INTO OrdersEquipment VALUES( 'ORD003', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD004', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD004', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD004', 'EQ010');

INSERT INTO OrdersEquipment VALUES( 'ORD004', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD004', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD004', 'EQ010');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ001');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ002');
/* -- 30 -- */
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ003');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ004');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ005');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ008');

INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ001');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ002');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ003');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ004');
/* -- 40 -- */
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ005');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ008');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ001');

INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ002');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ003');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ004');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ005');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ007');
/* -- 50 -- */
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ008');
INSERT INTO OrdersEquipment VALUES( 'ORD005', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD006', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD006', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD006', 'EQ010');

INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ010');
INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ001');
INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ002');
/* -- 60 -- */
INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ003');
INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ004');
INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ005');
INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ008');

INSERT INTO OrdersEquipment VALUES( 'ORD007', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD008', 'EQ001');
INSERT INTO OrdersEquipment VALUES( 'ORD008', 'EQ002');
INSERT INTO OrdersEquipment VALUES( 'ORD008', 'EQ003');
INSERT INTO OrdersEquipment VALUES( 'ORD008', 'EQ004');
/* -- 70 -- */
INSERT INTO OrdersEquipment VALUES( 'ORD008', 'EQ005');
INSERT INTO OrdersEquipment VALUES( 'ORD008', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD008', 'EQ008');
INSERT INTO OrdersEquipment VALUES( 'ORD008', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD009', 'EQ002');

INSERT INTO OrdersEquipment VALUES( 'ORD009', 'EQ003');
INSERT INTO OrdersEquipment VALUES( 'ORD009', 'EQ004');
INSERT INTO OrdersEquipment VALUES( 'ORD009', 'EQ005');
INSERT INTO OrdersEquipment VALUES( 'ORD009', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD009', 'EQ008');
/* -- 80 -- */
INSERT INTO OrdersEquipment VALUES( 'ORD009', 'EQ009');
INSERT INTO OrdersEquipment VALUES( 'ORD010', 'EQ001');
INSERT INTO OrdersEquipment VALUES( 'ORD010', 'EQ002');
INSERT INTO OrdersEquipment VALUES( 'ORD010', 'EQ003');
INSERT INTO OrdersEquipment VALUES( 'ORD010', 'EQ004');

INSERT INTO OrdersEquipment VALUES( 'ORD010', 'EQ005');
INSERT INTO OrdersEquipment VALUES( 'ORD010', 'EQ007');
INSERT INTO OrdersEquipment VALUES( 'ORD010', 'EQ008');
/* ----------------------------- - 10 - ----------------------------- */
/* ------------------------ BranchDepartment ------------------------ */
/* ----------------------------- - 26 - ----------------------------- */
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT001');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT002');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT003');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT004');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT005');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT006');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR002', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR003', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR004', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR005', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR005', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT008');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT009');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR001', 'DEPT010');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR006', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR007', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR008', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR009', 'DEPT007');
INSERT INTO BRANCHDEPARTMENT VALUES( 'BR010', 'DEPT007');