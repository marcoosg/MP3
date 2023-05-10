CREATE TABLE USERS (USER_ID VARCHAR(20), USER_PASS VARCHAR(20), USER_TYPE VARCHAR(10));
CREATE TABLE ITEM (ITEM_ID INT, ITEM_NAME VARCHAR(50), ITEM_PRICE INT, ITEM_IMG VARCHAR(10), ITEM_TYPE VARCHAR(10));
CREATE TABLE CART (USER_ID VARCHAR(20), ITEM_ID INT, QUANTITY INT);
CREATE TABLE ORDERS (ORDER_ID INT, USER_ID VARCHAR(20), TOTAL INT);

INSERT INTO USERS VALUES ('roger', 'pass1', 'Customer');
INSERT INTO USERS VALUES ('fabian', 'pass2', 'Customer');
INSERT INTO USERS VALUES ('aaron', 'pass3', 'Admin');
SELECT * FROM USERS;

INSERT INTO ITEM VALUES(001,'Elden Ring',2990,'001.jpg','PS5');
INSERT INTO ITEM VALUES(002,'God of War Ragnarok',3490,'002.jpg','PS5');
INSERT INTO ITEM VALUES(003,'Horizon Forbidden West',3490,'003.jpg','PS5');
INSERT INTO ITEM VALUES(004,'NBA 2K23',1395,'004.jpg','XBOX');
INSERT INTO ITEM VALUES(005,'Halo Infinite',2895,'005.jpg','XBOX');
INSERT INTO ITEM VALUES(006,'Battlefield 2042',1595,'006.jpg','XBOX');
INSERT INTO ITEM VALUES(007,'Animal Crossing: New Horizons',2450,'007.jpg','SWITCH');
INSERT INTO ITEM VALUES(008,'Pokemon Legends Arceus',2495,'008.jpg','SWITCH');
SELECT * FROM ITEM;

INSERT INTO CART VALUES('roger',1,1);
INSERT INTO CART VALUES('roger',2,1);
INSERT INTO CART VALUES('roger',3,1);
INSERT INTO CART VALUES('roger',4,1);
INSERT INTO CART VALUES('fabian',5,1);
INSERT INTO CART VALUES('fabian',6,1);
INSERT INTO CART VALUES('fabian',7,1);
INSERT INTO CART VALUES('fabian',8,1);
SELECT * FROM CART WHERE USER_ID='roger';


