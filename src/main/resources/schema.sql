CREATE TABLE IF NOT EXISTS ADDRESS  (
                                        ID BIGINT NOT NULL AUTO_INCREMENT,
                                        STREET VARCHAR(50) NOT NULL,
                                        STREET_NUMBER VARCHAR(10),
                                        CITY VARCHAR(20) NOT NULL,
                                        ZIP_CODE VARCHAR(10) NOT NULL,
                                        COUNTRY VARCHAR(20) NOT NULL,
                                        PRIMARY KEY(ID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS CUSTOMER  (
                                         ID BIGINT NOT NULL AUTO_INCREMENT,
                                         NAME VARCHAR(50) NOT NULL,
                                         ID_ADDRESS BIGINT NOT NULL,
                                         PRIMARY KEY(ID),
                                         FOREIGN KEY(ID_ADDRESS) REFERENCES ADDRESS(ID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS PRODUCT  (
                                        ID BIGINT NOT NULL AUTO_INCREMENT,
                                        NAME VARCHAR(50) NOT NULL,
                                        PRIMARY KEY(ID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS CATEGORY  (
                                         ID BIGINT NOT NULL AUTO_INCREMENT,
                                         NAME VARCHAR(50) NOT NULL,
                                         PRIMARY KEY(ID)
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS PRODUCT_CATEGORIES  (
                                                   ID_PRODUCT BIGINT NOT NULL,
                                                   ID_CATEGORY BIGINT NOT NULL,
                                                   PRIMARY KEY(ID_PRODUCT, ID_CATEGORY),
                                                   FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCT(ID),
                                                   FOREIGN KEY(ID_CATEGORY) REFERENCES CATEGORY(ID)
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS INVOICE  (
                                        INVOICE_NUMBER BIGINT NOT NULL AUTO_INCREMENT,
    /*CUSTOMER_NAME VARCHAR(50) NOT NULL,*/
                                        ORDER_NUMBER VARCHAR(13),
                                        ID_CUSTOMER BIGINT NOT NULL,
                                        PRIMARY KEY(INVOICE_NUMBER),
                                        FOREIGN KEY(ID_CUSTOMER) REFERENCES CUSTOMER(ID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS INVOICE_LINE  (
                                             ID BIGINT NOT NULL AUTO_INCREMENT,
                                             QUANTITY SMALLINT NOT NULL,
                                             ID_PRODUCT BIGINT NOT NULL,
                                             INVOICE_NUMBER BIGINT NOT NULL,
                                             PRIMARY KEY(ID),
                                             FOREIGN KEY(INVOICE_NUMBER) REFERENCES INVOICE(INVOICE_NUMBER),
                                             FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCT(ID)
) ENGINE=InnoDB;