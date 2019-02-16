--------------------------------------------------------
--  File created - Wednesday-September-26-2018   
--------------------------------------------------------
DROP TABLE "BR23"."CUST" cascade constraints;
DROP TABLE "BR23"."ORD" cascade constraints;
DROP TABLE "BR23"."SAL" cascade constraints;
--------------------------------------------------------
--  DDL for Table CUST
--------------------------------------------------------

  CREATE TABLE "BR23"."CUST" 
   (	"CNUM" NUMBER(4,0), 
	"CNAME" VARCHAR2(10 BYTE), 
	"CITY" VARCHAR2(10 BYTE), 
	"RATING" NUMBER(3,0), 
	"SNUM" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORD
--------------------------------------------------------

  CREATE TABLE "BR23"."ORD" 
   (	"ONUM" NUMBER(4,0), 
	"AMT" NUMBER(7,2), 
	"ODATE" DATE, 
	"CNUM" NUMBER(4,0), 
	"SNUM" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SAL
--------------------------------------------------------

  CREATE TABLE "BR23"."SAL" 
   (	"SNUM" NUMBER(4,0), 
	"SNAME" VARCHAR2(10 BYTE), 
	"CITY" VARCHAR2(10 BYTE), 
	"COMM" NUMBER(7,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into BR23.CUST
SET DEFINE OFF;
Insert into BR23.CUST (CNUM,CNAME,CITY,RATING,SNUM) values (2001,'Hoffman','London',100,1001);
Insert into BR23.CUST (CNUM,CNAME,CITY,RATING,SNUM) values (2002,'Giovanni','Rome',200,1003);
Insert into BR23.CUST (CNUM,CNAME,CITY,RATING,SNUM) values (2003,'Liu','San Jose',200,1002);
Insert into BR23.CUST (CNUM,CNAME,CITY,RATING,SNUM) values (2004,'Grass','Berlin',300,1002);
Insert into BR23.CUST (CNUM,CNAME,CITY,RATING,SNUM) values (2006,'Clemens','London',100,1001);
Insert into BR23.CUST (CNUM,CNAME,CITY,RATING,SNUM) values (2008,'Cisneros','San Jose',300,1007);
Insert into BR23.CUST (CNUM,CNAME,CITY,RATING,SNUM) values (2007,'Pereira','Rome',100,1004);
REM INSERTING into BR23.ORD
SET DEFINE OFF;
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3001,18.69,to_date('03-01-10','DD-MM-RR'),2008,1007);
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3003,767.19,to_date('03-01-10','DD-MM-RR'),2001,1001);
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3002,1900.1,to_date('03-01-10','DD-MM-RR'),2007,1004);
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3005,5160.45,to_date('03-01-10','DD-MM-RR'),2003,1002);
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3006,1098.16,to_date('03-01-10','DD-MM-RR'),2008,1007);
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3009,1713.23,to_date('04-01-10','DD-MM-RR'),2002,1003);
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3007,75.75,to_date('04-01-10','DD-MM-RR'),2004,1002);
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3008,4723,to_date('05-01-10','DD-MM-RR'),2006,1001);
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3010,1309.95,to_date('06-01-10','DD-MM-RR'),2004,1002);
Insert into BR23.ORD (ONUM,AMT,ODATE,CNUM,SNUM) values (3011,9891.88,to_date('06-01-10','DD-MM-RR'),2006,1001);
REM INSERTING into BR23.SAL
SET DEFINE OFF;
Insert into BR23.SAL (SNUM,SNAME,CITY,COMM) values (1001,'Peel','London',0.12);
Insert into BR23.SAL (SNUM,SNAME,CITY,COMM) values (1002,'Serres','San Jose',0.13);
Insert into BR23.SAL (SNUM,SNAME,CITY,COMM) values (1004,'Motica','London',0.11);
Insert into BR23.SAL (SNUM,SNAME,CITY,COMM) values (1007,'Rifkin','Barcelona',0.15);
Insert into BR23.SAL (SNUM,SNAME,CITY,COMM) values (1003,'Axelrod','New York',0.1);
--------------------------------------------------------
--  DDL for Index ORD_PRIMARY_KEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "BR23"."ORD_PRIMARY_KEY" ON "BR23"."ORD" ("ONUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SAL_PRIMARY_KEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "BR23"."SAL_PRIMARY_KEY" ON "BR23"."SAL" ("SNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CUST_PRIMARY_KEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "BR23"."CUST_PRIMARY_KEY" ON "BR23"."CUST" ("CNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CUST
--------------------------------------------------------

  ALTER TABLE "BR23"."CUST" ADD CONSTRAINT "CUST_PRIMARY_KEY" PRIMARY KEY ("CNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BR23"."CUST" MODIFY ("RATING" NOT NULL ENABLE);
  ALTER TABLE "BR23"."CUST" MODIFY ("CITY" NOT NULL ENABLE);
  ALTER TABLE "BR23"."CUST" MODIFY ("CNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORD
--------------------------------------------------------

  ALTER TABLE "BR23"."ORD" ADD CONSTRAINT "ORD_PRIMARY_KEY" PRIMARY KEY ("ONUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BR23"."ORD" MODIFY ("ODATE" NOT NULL ENABLE);
  ALTER TABLE "BR23"."ORD" MODIFY ("AMT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SAL
--------------------------------------------------------

  ALTER TABLE "BR23"."SAL" ADD CONSTRAINT "SAL_PRIMARY_KEY" PRIMARY KEY ("SNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BR23"."SAL" MODIFY ("COMM" NOT NULL ENABLE);
  ALTER TABLE "BR23"."SAL" MODIFY ("CITY" NOT NULL ENABLE);
  ALTER TABLE "BR23"."SAL" MODIFY ("SNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CUST
--------------------------------------------------------

  ALTER TABLE "BR23"."CUST" ADD CONSTRAINT "CUST_FOREIGN_KEY_SNUM" FOREIGN KEY ("SNUM")
	  REFERENCES "BR23"."SAL" ("SNUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORD
--------------------------------------------------------

  ALTER TABLE "BR23"."ORD" ADD CONSTRAINT "ORD_FOREIGN_KEY_CNUM" FOREIGN KEY ("CNUM")
	  REFERENCES "BR23"."CUST" ("CNUM") ENABLE;
  ALTER TABLE "BR23"."ORD" ADD CONSTRAINT "ORD_FOREIGN_KEY_SNUM" FOREIGN KEY ("SNUM")
	  REFERENCES "BR23"."SAL" ("SNUM") ENABLE;
