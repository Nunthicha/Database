--VENDOR
CREATE TABLE VENDOR (VEND_ID number(10) PRIMARY KEY,
VEND_NAME varchar2(30),VEND_ADDRESS varchar2(30),
VEND_PHONE varchar2(10));

--RETAIL_SHOP
CREATE TABLE RETAIL_SHOP (RT_ID number(10) PRIMARY KEY,
RT_NAME varchar2(30),RT_ADDRESS varchar2(30),
RT_PHONE varchar2(10));

--INVOICE
CREATE TABLE INVOICE (INV_ID number(10) PRIMARY KEY,
INV_DATE date,RT_ID REFERENCES RETAIL_SHOP);

--ORDER
CREATE TABLE "ORDER" (ORDER_ID number(10) PRIMARY KEY,
ORDER_DATE date,VEND_ID REFERENCES VENDOR);

--PRODUCT
CREATE TABLE PRODUCT (PRD_ID number(10) PRIMARY KEY,
VEND_ID REFERENCES VENDOR,PRD_NAME varchar2(30),
PRD_TASTE varchar(20),PRD_SIZE varchar2(10));

--LINE_IN
CREATE TABLE LINE_IN (ORDER_ID REFERENCES 
"ORDER", PRD_ID REFERENCES PRODUCT,
PRICE number(4));

--LINE_OUT
CREATE TABLE LINE_OUT (INV_ID REFERENCES 
INVOICE, PRD_ID REFERENCES PRODUCT,
PRICE number(4));

//

--VENDOR
INSERT INTO VENDOR VALUES(1000,'MAX','Germany','555-555');
INSERT INTO VENDOR VALUES(2000,'JIJEE','China','666-666');
INSERT INTO VENDOR VALUES(3000,'OAT','Africa','777-777');
INSERT INTO VENDOR VALUES(4000,'PRINCE','Japan','888-888');

--RETAIL_SHOP
INSERT INTO RETAIL_SHOP VALUES(110,'Midlane Shop','BANGKOK','012-345');
INSERT INTO RETAIL_SHOP VALUES(111,'TNI','BANGKOK','000-999');
INSERT INTO RETAIL_SHOP VALUES(112,'Stoner Market','SARABURI','999-001');

--ORDER
INSERT INTO "ORDER" VALUES(0010,'08-JAN-2020',1000);
INSERT INTO "ORDER" VALUES(0020,'10-FEB-2020',2000);
INSERT INTO "ORDER" VALUES(0030,'13-FEB-2020',3000);
INSERT INTO "ORDER" VALUES(0040,'10-MAR-2020',4000);

--INVOICE
INSERT INTO INVOICE VALUES(1010,'15-JAN-2020',110); 
INSERT INTO INVOICE VALUES(1020,'20-FEB-2020',111); 
INSERT INTO INVOICE VALUES(1030,'16-FEB-2020',110);
INSERT INTO INVOICE VALUES(1040,'15-MAY-2020',112); 

--PRODUCT
INSERT INTO PRODUCT VALUES(999,1000,'Malboro','Gold','L');
INSERT INTO PRODUCT VALUES(998,1000,'Malboro','Purple','L'); 
INSERT INTO PRODUCT VALUES(997,1000,'Malboro','Gold','M'); 
INSERT INTO PRODUCT VALUES(996,1000,'Malboro','Purple','M'); 

INSERT INTO PRODUCT VALUES(899,2000,'LM','Red','L'); 
INSERT INTO PRODUCT VALUES(898,2000,'LM','Blue','L'); 
INSERT INTO PRODUCT VALUES(897,2000,'LM','Red','M'); 
INSERT INTO PRODUCT VALUES(896,2000,'LM','Blue','M'); 

INSERT INTO PRODUCT VALUES(799,3000,'Camel','Blue','L'); 
INSERT INTO PRODUCT VALUES(798,3000,'Camel','Yellow','L'); 
INSERT INTO PRODUCT VALUES(797,3000,'Camel','Blue','M'); 
INSERT INTO PRODUCT VALUES(796,3000,'Camel','Yellow','M'); 

INSERT INTO PRODUCT VALUES(699,4000,'Mevius','Sky Blue','L'); 
INSERT INTO PRODUCT VALUES(698,4000,'Mevius','Purple','L'); 
INSERT INTO PRODUCT VALUES(697,4000,'Mevius','Sky Blue','M'); 
INSERT INTO PRODUCT VALUES(696,4000,'Mevius','Purple','M'); 

--LINE_IN
INSERT INTO LINE_IN VALUES(0010,999,2500);
INSERT INTO LINE_IN VALUES(0010,899,2000);
INSERT INTO LINE_IN VALUES(0010,799,2000);
INSERT INTO LINE_IN VALUES(0010,699,2500);

INSERT INTO LINE_IN VALUES(0040,997,1500);
INSERT INTO LINE_IN VALUES(0040,897,1000);
INSERT INTO LINE_IN VALUES(0040,797,1000);
INSERT INTO LINE_IN VALUES(0040,697,1500);

--LINE_OUT
INSERT INTO LINE_OUT VALUES(1010,899,2000);
INSERT INTO LINE_OUT VALUES(1010,897,1000);

INSERT INTO LINE_OUT VALUES(1040,899,2500);
INSERT INTO LINE_OUT VALUES(1040,797,1000);
INSERT INTO LINE_OUT VALUES(1040,997,1500);

drop table vendor;
drop table retail_shop;
drop table product;
drop table "order";
drop table line_in;
drop table line_out;
drop table invoice;



