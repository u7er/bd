DROP TABLE APRODUCT;
DROP TABLE AITEM;

/
CREATE TABLE AITEM (
  ID NUMBER(30) NOT NULL,
  nameItem VARCHAR2(50) NOT NULL,
  PRIMARY KEY(ID)
);
/
CREATE TABLE APRODUCT (
  ID NUMBER(30) NOT NULL,
  nameProduct VARCHAR2(50) NOT NULL,
  fieldID NUMBER(10) NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY (fieldID) REFERENCES AITEM(ID)
);
/
DROP SEQUENCE seqProduct;
DROP SEQUENCE seqItem;
/
CREATE SEQUENCE seqProduct START WITH 1001;
CREATE SEQUENCE seqItem;
/
CREATE OR REPLACE PACKAGE tablePack IS
  TYPE  nameItemTab IS TABLE OF AITEM.NAMEITEM%TYPE;
  TYPE  nameProductTab IS TABLE OF APRODUCT.NAMEPRODUCT%TYPE;
  PROCEDURE dataAdd;
  PROCEDURE dataDel;
  --PROCEDURE selectField (delName IN VARCHAR2 DEFAULT NULL);
END;
/
CREATE OR REPLACE PACKAGE BODY tablePack IS
  arrItem nameItemTab;
  arrProduct nameProductTab;
  PROCEDURE dataAdd IS
  BEGIN
    INSERT INTO AITEM(ID, nameItem) VALUES(seqItem.NEXTVAL, 'Булочка');
    INSERT INTO AITEM(ID, nameItem) VALUES(seqItem.NEXTVAL, 'Торт');
    INSERT INTO AITEM(ID, nameItem) VALUES(seqItem.NEXTVAL, 'Булка');
    INSERT INTO AITEM(ID, nameItem) VALUES(seqItem.NEXTVAL, 'Хлебушек');
    INSERT INTO AITEM(ID, nameItem) VALUES(seqItem.NEXTVAL, 'Пироженое');
    INSERT INTO AITEM(ID, nameItem) VALUES(seqItem.NEXTVAL, 'Кекс');
    INSERT INTO AITEM(ID, nameItem) VALUES(seqItem.NEXTVAL, 'Круассан');
-- Paul 3/27/19:
-- select * from aitem;    
-- FK fieldID static crappy. replace it pls.
    INSERT INTO APRODUCT(ID, nameProduct, fieldID) VALUES(seqProduct.NEXTVAL, 'Мука', 16); --> static crappy (fieldID)
    INSERT INTO APRODUCT(ID, nameProduct, fieldID) VALUES(seqProduct.NEXTVAL, 'Вода', 17); --> so, static crappy
    INSERT INTO APRODUCT(ID, nameProduct, fieldID) VALUES(seqProduct.NEXTVAL, 'Молоко', 18); --> so on...
    INSERT INTO APRODUCT(ID, nameProduct, fieldID) VALUES(seqProduct.NEXTVAL, 'Сахар', 19);
    INSERT INTO APRODUCT(ID, nameProduct, fieldID) VALUES(seqProduct.NEXTVAL, 'Масло', 20);
    INSERT INTO APRODUCT(ID, nameProduct, fieldID) VALUES(seqProduct.NEXTVAL, 'Соль', 21);
    INSERT INTO APRODUCT(ID, nameProduct, fieldID) VALUES(seqProduct.NEXTVAL, 'Сода', 22); --> crappy heap is end.
END dataAdd;
    PROCEDURE dataDel IS 
    BEGIN   
        DELETE FROM APRODUCT;
        DELETE FROM AITEM;
        EXECUTE IMMEDIATE 'DROP SEQUENCE seqProduct';
        EXECUTE IMMEDIATE 'DROP SEQUENCE seqItem';
    END dataDel;
    END;
/   
-- Paul 3/27/19: trigger
create or replace trigger tr_del_in_work_time
before delete on aproduct
declare
  no_work_time exception;
begin
  if to_char(sysdate, 'HH24SS') > '2000' or to_char(sysdate, 'HH24SS') < '1200' then
    raise no_work_time;
  end if; 
  exception
    when no_work_time then
      raise;
end;
BEGIN
    tablePack.dataAdd;
   -- tablePack.dataDel;
END;
/

CREATE OR REPLACE VIEW myView AS
  SELECT APRODUCT.ID, APRODUCT.nameProduct,
  AITEM.ID AITEM_ID, AITEM.nameItem, APRODUCT.FIELDID 
  FROM AITEM, APRODUCT WHERE AITEM.ID = APRODUCT.FIELDID; 
/
select * from myview;
/

CREATE OR REPLACE PACKAGE helpPack IS
  err_code NUMBER(10,0);
  err_msg VARCHAR2(500);
  PROCEDURE delProduct (idProduct IN number DEFAULT NULL);
  PROCEDURE ADD_DEL_TablePack (actTable IN VARCHAR2 DEFAULT NULL);
  -- Paul 3/27/19:
  procedure view_ingedients(c_product in varchar2);
END helpPack;
/

CREATE OR REPLACE PACKAGE BODY helpPack IS

  PROCEDURE DelProduct 
  (idProduct IN number DEFAULT NULL) IS
  BEGIN
  DELETE FROM APRODUCT WHERE ID=idProduct;
    COMMIT;
    EXCEPTION 
      WHEN OTHERS THEN
      begin
        ROLLBACK;
        err_code := SQLCODE;
        err_msg := SUBSTR(SQLERRM, 1, 200);
        RAISE_APPLICATION_ERROR(err_code, err_msg);
        end;
  END DelProduct;

  
  PROCEDURE ADD_DEL_TablePack 
  (actTable IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF actTable = 'dataAdd' THEN
      tablePack.dataAdd;
    ELSIF actTable = 'dataDel' THEN
      tablePack.dataDel;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Не выбрано действий над таблицами');
    END IF;
    EXCEPTION 
    WHEN OTHERS THEN 
      DBMS_OUTPUT.PUT_LINE('ОШИБКА!');
  END ADD_DEL_TablePack;
  
  -- Paul 3/27/19: new procedure
  procedure view_ingedients(c_product in varchar2) is
      -- type table (how collection (unlimit size))
      type t_prod_name is table of aproduct.nameproduct%type;
      -- t_prod_name type varriable (for fetching data)
      p_prod_name t_prod_name;
      
      cursor get_ingred(c_some_prod in varchar2) is
        select p.nameproduct from aproduct p
        where p.fieldid not in (select i.id from aitem i where i.nameitem = c_some_prod);
        
    begin
      open get_ingred(c_product);
      fetch get_ingred bulk collect into p_prod_name;
      close get_ingred;
      
      for it in p_prod_name.first..p_prod_name.last
      loop
        dbms_output.put_line('Product: ' || it);
      end loop;
      
      exception
        when others then
          raise;
    end;
  
END helpPack;
/
BEGIN 
  HELPPACK.DELPRODUCT(1008);
  --HELPPACK.IN_DEL_TABLEPACK('dataIn');
END;

-- Право на обращение к нашему представлению для всех пользователей
GRANT SELECT ON myView TO PUBLIC;
-- Право на обращение к пакету только для UP1
GRANT EXECUTE ON helpPack TO up1;

-- Paul 3/27/19: self

select * from aitem;





