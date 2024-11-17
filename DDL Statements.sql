-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-11-17 21:31:57 CST
--   site:      Oracle Database 21c
--   type:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE admin (
    userid             NUMBER(5) NOT NULL,
    administrativetask VARCHAR2(50) NOT NULL
);

ALTER TABLE admin ADD CONSTRAINT admin_pk PRIMARY KEY ( userid );

CREATE TABLE authenticationsystem (
    systemid NUMBER(5) NOT NULL,
    password VARCHAR2(100) NOT NULL,
    role     VARCHAR2(50)
);

ALTER TABLE authenticationsystem ADD CONSTRAINT authenticationsystem_pk PRIMARY KEY ( systemid );

CREATE TABLE author (
    authorid        NUMBER(5) NOT NULL,
    authorfirstname VARCHAR2(50) NOT NULL,
    authorlastname  VARCHAR2(50) NOT NULL,
    listofbooks     NUMBER(5) NOT NULL
);

ALTER TABLE author ADD CONSTRAINT author_pk PRIMARY KEY ( authorid );

CREATE TABLE book (
    isbn            NUMBER(13) NOT NULL,
    title           VARCHAR2(100) NOT NULL,
    publicationdate DATE NOT NULL,
    availablecopies NUMBER(4) NOT NULL,
    status          VARCHAR2(10) NOT NULL,
    author_authorid NUMBER(5) NOT NULL
);

ALTER TABLE book ADD CONSTRAINT book_pk PRIMARY KEY ( isbn );

CREATE TABLE borrow (
    transactionid NUMBER(5) NOT NULL,
    borrowdate    DATE NOT NULL
);

ALTER TABLE borrow ADD CONSTRAINT borrow_pk PRIMARY KEY ( transactionid );

CREATE TABLE renew (
    transactionid NUMBER(5) NOT NULL,
    newreturndate DATE NOT NULL,
    renewaldate   DATE NOT NULL,
    newlatefees   NUMBER(3)
);

ALTER TABLE renew ADD CONSTRAINT renew_pk PRIMARY KEY ( transactionid );

CREATE TABLE return (
    transactionid NUMBER(5) NOT NULL,
    returndate    DATE,
    latefees      NUMBER(3)
);

ALTER TABLE return ADD CONSTRAINT return_pk PRIMARY KEY ( transactionid );

CREATE TABLE student (
    userid           NUMBER(5) NOT NULL,
    outstandingfines NUMBER(5) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( userid );

CREATE TABLE transaction (
    transactionid   NUMBER(5) NOT NULL,
    transactiondate DATE NOT NULL,
    user_userid     NUMBER(5) NOT NULL,
    book_isbn       NUMBER(13) NOT NULL
);

ALTER TABLE transaction ADD CONSTRAINT transaction_pk PRIMARY KEY ( transactionid );

CREATE TABLE "User" (
    userid                        NUMBER(5) NOT NULL,
    userfirstname                 VARCHAR2(50) NOT NULL,
    userlastname                  VARCHAR2(50) NOT NULL,
    authenticationsystem_systemid NUMBER(5) NOT NULL
);

CREATE UNIQUE INDEX user__idx ON
    "User" (
        authenticationsystem_systemid
    ASC );

ALTER TABLE "User" ADD CONSTRAINT user_pk PRIMARY KEY ( userid );

ALTER TABLE admin
    ADD CONSTRAINT admin_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE book
    ADD CONSTRAINT book_author_fk FOREIGN KEY ( author_authorid )
        REFERENCES author ( authorid );

ALTER TABLE borrow
    ADD CONSTRAINT borrow_transaction_fk FOREIGN KEY ( transactionid )
        REFERENCES transaction ( transactionid );

ALTER TABLE renew
    ADD CONSTRAINT renew_transaction_fk FOREIGN KEY ( transactionid )
        REFERENCES transaction ( transactionid );

ALTER TABLE return
    ADD CONSTRAINT return_transaction_fk FOREIGN KEY ( transactionid )
        REFERENCES transaction ( transactionid );

ALTER TABLE student
    ADD CONSTRAINT student_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_book_fk FOREIGN KEY ( book_isbn )
        REFERENCES book ( isbn );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_user_fk FOREIGN KEY ( user_userid )
        REFERENCES "User" ( userid );

ALTER TABLE "User"
    ADD CONSTRAINT user_authenticationsystem_fk FOREIGN KEY ( authenticationsystem_systemid )
        REFERENCES authenticationsystem ( systemid );

--  ERROR: No Discriminator Column found in Arc FKArc_23 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_23 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_23 - constraint trigger for Arc cannot be generated

--  ERROR: No Discriminator Column found in Arc FKArc_24 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_24 - constraint trigger for Arc cannot be generated



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             1
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   5
-- WARNINGS                                 0
