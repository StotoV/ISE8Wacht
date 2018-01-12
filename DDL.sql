/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     1/11/2018 12:55:59 PM                        */
/*==============================================================*/

/*==============================================================*/
/* Domain: ADDRESS                                              */
/*==============================================================*/
create type ADDRESS
   from text
go

/*==============================================================*/
/* Domain: AMOUNT                                               */
/*==============================================================*/
create type AMOUNT
   from int
go

/*==============================================================*/
/* Domain: ARTICLE                                              */
/*==============================================================*/
create type ARTICLE
   from int
go

/*==============================================================*/
/* Domain: COLOR                                                */
/*==============================================================*/
create type COLOR
   from varchar(8)
go

/*==============================================================*/
/* Domain: COMPONENT                                            */
/*==============================================================*/
create type COMPONENT
   from int
go

/*==============================================================*/
/* Domain: CUSTOMER                                             */
/*==============================================================*/
create type CUSTOMER
   from int
go

/*==============================================================*/
/* Domain: DESCRIPTION                                          */
/*==============================================================*/
create type DESCRIPTION
   from varchar(255)
go

/*==============================================================*/
/* Domain: DIMENSION                                            */
/*==============================================================*/
create type DIMENSION
   from varchar(10)
go

/*==============================================================*/
/* Domain: EMAIL                                                */
/*==============================================================*/
create type EMAIL
   from varchar(254)
go

/*==============================================================*/
/* Domain: EMPLOYEE                                             */
/*==============================================================*/
create type EMPLOYEE
   from int
go

/*==============================================================*/
/* Domain: "FUNCTION"                                           */
/*==============================================================*/
create type "FUNCTION"
   from varchar(100)
go

/*==============================================================*/
/* Domain: INVOICE                                              */
/*==============================================================*/
create type INVOICE
   from int
go

/*==============================================================*/
/* Domain: LOCATION                                             */
/*==============================================================*/
create type LOCATION
   from int
go

/*==============================================================*/
/* Domain: MEASUREMENTTYPE                                      */
/*==============================================================*/
create type MEASUREMENTTYPE
   from text
go

/*==============================================================*/
/* Domain: NAME                                                 */
/*==============================================================*/
create type NAME
   from varchar(100)
go

/*==============================================================*/
/* Domain: "ORDER"                                              */
/*==============================================================*/
create type "ORDER"
   from int
go

/*==============================================================*/
/* Domain: ORDERTYPE                                            */
/*==============================================================*/
create type ORDERTYPE
   from text
go

/*==============================================================*/
/* Domain: PAYMENT                                              */
/*==============================================================*/
create type PAYMENT
   from int
go

/*==============================================================*/
/* Domain: PHONENO                                              */
/*==============================================================*/
create type PHONENO
   from varchar(20)
go

/*==============================================================*/
/* Domain: PRICE                                                */
/*==============================================================*/
create type PRICE
   from money
go

/*==============================================================*/
/* Domain: PRODUCT                                              */
/*==============================================================*/
create type PRODUCT
   from int
go

/*==============================================================*/
/* Domain: QUOTATION                                            */
/*==============================================================*/
create type QUOTATION
   from int
go

/*==============================================================*/
/* Domain: REFERENCE                                            */
/*==============================================================*/
create type REFERENCE
   from varchar(30)
go

/*==============================================================*/
/* Domain: RELATION                                             */
/*==============================================================*/
create type RELATION
   from int
go

/*==============================================================*/
/* Domain: SEASON                                               */
/*==============================================================*/
create type SEASON
   from text
go

/*==============================================================*/
/* Domain: SHELFLIFE                                            */
/*==============================================================*/
create type SHELFLIFE
   from datetime
go

/*==============================================================*/
/* Domain: SIZE                                                 */
/*==============================================================*/
create type SIZE
   from decimal
go

/*==============================================================*/
/* Domain: STORAGEMETHOD                                        */
/*==============================================================*/
create type STORAGEMETHOD
   from text
go

/*==============================================================*/
/* Domain: SUPPLIER                                             */
/*==============================================================*/
create type SUPPLIER
   from int
go

/*==============================================================*/
/* Domain: TEMPERATURE                                          */
/*==============================================================*/
create type TEMPERATURE
   from decimal
go

/*==============================================================*/
/* Domain: UNIT                                                 */
/*==============================================================*/
create type UNIT
   from text
go

/*==============================================================*/
/* Domain: VALUTA                                               */
/*==============================================================*/
create type VALUTA
   from text
go

/*==============================================================*/
/* Domain: VATTYPE                                              */
/*==============================================================*/
create type VATTYPE
   from varchar(20)
go

/*==============================================================*/
/* Domain: WEIGHT                                               */
/*==============================================================*/
create type WEIGHT
   from decimal
go

/*==============================================================*/
/* Table: ARTICLE                                               */
/*==============================================================*/
create table ARTICLE (
   ARTICLENO            ARTICLE              not null,
   VATTYPE_CATEGORY     VATTYPE              not null,
   SHELFLIFE_SHELFLIFETYPE SHELFLIFE            null,
   COMPONENT_ARTICLE_ARTICLENO ARTICLE              null,
   COMPONENT_ORDER      COMPONENT            null,
   AMOUNT               AMOUNT               not null,
   NAME                 NAME                 not null,
   DESCRIPTION          text                 not null,
   MARGIN               PRICE                not null,
   PURCHASEPRICE        PRICE                not null,
   LENGTH               SIZE                 not null,
   WIDTH                SIZE                 not null,
   HEIGHT               SIZE                 not null,
   WEIGHT               WEIGHT               not null,
   MINTEMPERATURE       TEMPERATURE          not null,
   MAXTEMPERATURE       TEMPERATURE          not null,
   FRAGILE              bit                  not null,
   COLOR                COLOR                null,
   FLAMMABLE            bit                  not null,
   constraint PK_ARTICLE primary key (ARTICLENO)
)
go

/*==============================================================*/
/* Table: ARTICLEDISCOUNT                                       */
/*==============================================================*/
create table ARTICLEDISCOUNT (
   DISCOUNTCODE         varchar(1024)        not null,
   ARTICLE_ARTICLENO    ARTICLE              not null,
   STARTDATE            datetime             not null,
   ENDDATE              datetime             null,
   ISUSED               bit                  null,
   constraint PK_ARTICLEDISCOUNT primary key (DISCOUNTCODE)
)
go

/*==============================================================*/
/* Table: ARTICLEINLOCATION                                     */
/*==============================================================*/
create table ARTICLEINLOCATION (
   ARTICLE_ARTICLENO    ARTICLE              not null,
   LOCATION_ADDRESS     ADDRESS              not null,
   AMOUNT               AMOUNT               not null,
   constraint PK_ARTICLEINLOCATION primary key (ARTICLE_ARTICLENO, LOCATION_ADDRESS)
)
go

/*==============================================================*/
/* Table: ARTICLEINSTORAGECUBE                                  */
/*==============================================================*/
create table ARTICLEINSTORAGECUBE (
   ARTICLE_ARTICLENO    ARTICLE              not null,
   STORAGECUBE_LOCATION_ADDRESS ADDRESS              not null,
   STORAGECUBE_REFERENCENO int                  not null,
   AMOUNT               AMOUNT               not null,
   constraint PK_ARTICLEINSTORAGECUBE primary key (STORAGECUBE_LOCATION_ADDRESS, ARTICLE_ARTICLENO, STORAGECUBE_REFERENCENO)
)
go

/*==============================================================*/
/* Table: ARTICLE_IN_UNIT                                       */
/*==============================================================*/
create table ARTICLE_IN_UNIT (
   UNIT_NAME            UNIT                 not null,
   ARTICLE_ARTICLENO    ARTICLE              not null,
   constraint PK_ARTICLE_IN_UNIT primary key (UNIT_NAME, ARTICLE_ARTICLENO)
)
go

/*==============================================================*/
/* Table: COMPONENT                                             */
/*==============================================================*/
create table COMPONENT (
   ARTICLE_ARTICLENO    ARTICLE              not null,
   "ORDER"              COMPONENT            not null,
   AMOUNT               AMOUNT               not null,
   constraint PK_COMPONENT primary key (ARTICLE_ARTICLENO, "ORDER")
)
go

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER (
   RELATIONNO           RELATION             not null,
   ADDRESS              ADDRESS              not null,
   EMAIL                EMAIL                not null,
   PHONENO              PHONENO              null,
   NAME                 NAME                 null,
   constraint PK_CUSTOMER primary key (RELATIONNO)
)
go

/*==============================================================*/
/* Table: CUSTOMERDISCOUNT                                      */
/*==============================================================*/
create table CUSTOMERDISCOUNT (
   DISCOUNTCODE         varchar(1024)        not null,
   CUSTOMER_RELATIONNO  RELATION             not null,
   STARTDATE            datetime             not null,
   ENDDATE              datetime             null,
   ISUSED               bit                  null,
   constraint PK_CUSTOMERDISCOUNT primary key (DISCOUNTCODE)
)
go

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
create table EMPLOYEE (
   EMPLOYEEID           EMPLOYEE             not null,
   NAME                 NAME                 not null,
   ADDRESS              ADDRESS              not null,
   "FUNCTION"           "FUNCTION"           not null,
   constraint PK_EMPLOYEE primary key (EMPLOYEEID)
)
go

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
create table LOCATION (
   ADDRESS              ADDRESS              not null,
   DESCRIPTION          DESCRIPTION          null,
   constraint PK_LOCATION primary key (ADDRESS)
)
go

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT (
   ARTICLE_ARTICLENO    ARTICLE              not null,
   SERIALNO             PRODUCT              not null,
   LOCATION_ADDRESS     ADDRESS              not null,
   STORAGECUBE_LOCATION_ADDRESS ADDRESS              not null,
   STORAGECUBE_REFERENCENO int                  not null,
   SUPPLY_SUPPLYNO      int                  not null,
   constraint PK_PRODUCT primary key (ARTICLE_ARTICLENO, SERIALNO)
)
go

/*==============================================================*/
/* Table: PURCHASEINVOICE                                       */
/*==============================================================*/
create table PURCHASEINVOICE (
   INVOICENO            INVOICE              not null,
   REFERENCENO          REFERENCE            not null,
   SUPPLIER_RELATIONNO  RELATION             not null,
   DATE                 datetime             not null,
   PAYMENTDATE          datetime             not null,
   constraint PK_PURCHASEINVOICE primary key (INVOICENO, REFERENCENO)
)
go

/*==============================================================*/
/* Table: PURCHASEINVOICELINE                                   */
/*==============================================================*/
create table PURCHASEINVOICELINE (
   PURCHASEINVOICE_INVOICENO INVOICE              not null,
   PURCHASEINVOICE_REFERENCENO REFERENCE            not null,
   "LINENO"             int                  not null,
   UNIT_NAME            UNIT                 not null,
   ARTICLE_ARTICLENO    ARTICLE              not null,
   PURCHASEORDERLINE_PURCHASEORDER_ORDERNO "ORDER"              null,
   PURCHASEORDERLINE_PURCHASEORDER_REFERENCENO int                  null,
   PURCHASEORDERLINE_LINENO int                  null,
   VATTYPE_CATEGORY     VATTYPE              not null,
   AMOUNT               AMOUNT               not null,
   PRICE                PRICE                not null,
   constraint PK_PURCHASEINVOICELINE primary key (PURCHASEINVOICE_INVOICENO, PURCHASEINVOICE_REFERENCENO, "LINENO")
)
go

/*==============================================================*/
/* Table: PURCHASEORDER                                         */
/*==============================================================*/
create table PURCHASEORDER (
   ORDERNO              "ORDER"              not null,
   REFERENCENO          int                  not null,
   PURCHASEINVOICE_INVOICENO INVOICE              null,
   PURCHASEINVOICE_REFERENCENO REFERENCE            null,
   EMPLOYEE_EMPLOYEEID  EMPLOYEE             null,
   PURCHASEQUOTE_QUOTATIONNO QUOTATION            null,
   PURCHASEQUOTE_REFERENCENO int                  null,
   SUPPLIER_RELATIONNO  RELATION             not null,
   SUPERORDERNO         "ORDER"              null,
   SUPERORDERREFERENCENO int                  null,
   DATE                 datetime             not null,
   ISCANCELLED          bit                  not null,
   constraint PK_PURCHASEORDER primary key (ORDERNO, REFERENCENO)
)
go

/*==============================================================*/
/* Table: PURCHASEORDERLINE                                     */
/*==============================================================*/
create table PURCHASEORDERLINE (
   PURCHASEORDER_ORDERNO "ORDER"              not null,
   PURCHASEORDER_REFERENCENO int                  not null,
   "LINENO"             int                  not null,
   PURCHASEINVOICELINE_PURCHASEINVOICE_INVOICENO INVOICE              null,
   PURCHASEINVOICELINE_PURCHASEINVOICE_REFERENCENO REFERENCE            null,
   PURCHASEINVOICELINE_LINENO int                  null,
   ARTICLE_ARTICLENO    ARTICLE              not null,
   UNIT_NAME            UNIT                 not null,
   VATTYPE_CATEGORY     VATTYPE              not null,
   ARTICLEINSTORAGECUBE_STORAGECUBE_LOCATION_ADDRESS ADDRESS              not null,
   ARTICLEINSTORAGECUBE_STORAGECUBE_REFERENCENO int                  not null,
   ARTICLEINLOCATION_LOCATION_ADDRESS ADDRESS              not null,
   AMOUNT               AMOUNT               not null,
   PRICE                PRICE                not null,
   constraint PK_PURCHASEORDERLINE primary key (PURCHASEORDER_ORDERNO, PURCHASEORDER_REFERENCENO, "LINENO")
)
go

/*==============================================================*/
/* Table: PURCHASEPAYMENT                                       */
/*==============================================================*/
create table PURCHASEPAYMENT (
   PAYMENTNO            PAYMENT              not null,
   PURCHASEINVOICE_INVOICENO INVOICE              not null,
   PURCHASEINVOICE_REFERENCENO REFERENCE            not null,
   AMOUNT               AMOUNT               not null,
   VALUTA               VALUTA               not null,
   DATE                 datetime             not null,
   constraint PK_PURCHASEPAYMENT primary key (PAYMENTNO)
)
go

/*==============================================================*/
/* Table: PURCHASEQUOTE                                         */
/*==============================================================*/
create table PURCHASEQUOTE (
   QUOTATIONNO          QUOTATION            not null,
   REFERENCENO          int                  not null,
   PURCHASEORDER_ORDERNO "ORDER"              null,
   PURCHASEORDER_REFERENCENO int                  null,
   EMPLOYEE_EMPLOYEEID  EMPLOYEE             null,
   SUPPLIER_RELATIONNO  RELATION             not null,
   DATE                 datetime             not null,
   ISCANCELLED          bit                  not null,
   constraint PK_PURCHASEQUOTE primary key (QUOTATIONNO, REFERENCENO)
)
go

/*==============================================================*/
/* Table: PURCHASEQUOTELINE                                     */
/*==============================================================*/
create table PURCHASEQUOTELINE (
   PURCHASEQUOTE_QUOTATIONNO QUOTATION            not null,
   PURCHASEQUOTE_REFERENCENO int                  not null,
   "LINENO"             int                  not null,
   VATTYPE_CATEGORY     VATTYPE              not null,
   ARTICLE_ARTICLENO    ARTICLE              not null,
   UNIT_NAME            UNIT                 not null,
   AMOUNT               AMOUNT               not null,
   PRICE                PRICE                not null,
   constraint PK_PURCHASEQUOTELINE primary key (PURCHASEQUOTE_QUOTATIONNO, PURCHASEQUOTE_REFERENCENO, "LINENO")
)
go

/*==============================================================*/
/* Table: SALESINVOICE                                          */
/*==============================================================*/
create table SALESINVOICE (
   INVOICENO            INVOICE              not null,
   REFERENCENO          REFERENCE            not null,
   CUSTOMER_RELATIONNO  RELATION             not null,
   DATE                 datetime             not null,
   PAYMENTDATE          datetime             not null,
   constraint PK_SALESINVOICE primary key (INVOICENO, REFERENCENO)
)
go

/*==============================================================*/
/* Table: SALESINVOICELINE                                      */
/*==============================================================*/
create table SALESINVOICELINE (
   SALESINVOICE_INVOICENO INVOICE              not null,
   SALESINVOICE_REFERENCENO REFERENCE            not null,
   "LINENO"             int                  not null,
   VATTYPE_CATEGORY     VATTYPE              not null,
   ARTICLE_ARTICLENO    ARTICLE              not null,
   SALESORDERLINE_SALESORDER_ORDERNO "ORDER"              null,
   SALESORDERLINE_SALESORDER_REFERENCENO REFERENCE            null,
   SALESORDERLINE_LINENO int                  null,
   UNIT_NAME            UNIT                 not null,
   AMOUNT               AMOUNT               not null,
   PRICE                PRICE                not null,
   constraint PK_SALESINVOICELINE primary key (SALESINVOICE_INVOICENO, SALESINVOICE_REFERENCENO, "LINENO")
)
go

/*==============================================================*/
/* Table: SALESORDER                                            */
/*==============================================================*/
create table SALESORDER (
   ORDERNO              "ORDER"              not null,
   REFERENCENO          REFERENCE            not null,
   EMPLOYEE_EMPLOYEEID  EMPLOYEE             null,
   SALESQUOTE_QUOTATIONNO QUOTATION            null,
   SALESQUOTE_REFERENCENO REFERENCE            null,
   SALESINVOICE_INVOICENO INVOICE              null,
   SALESINVOICE_REFERENCENO REFERENCE            null,
   CUSTOMER_RELATIONNO  RELATION             not null,
   SUPERORDERNO         "ORDER"              null,
   SUPERORDERREFERENCENO REFERENCE            null,
   BACKORDERNO          "ORDER"              null,
   BACKORDERREFERENCENO REFERENCE            null,
   DATE                 datetime             not null,
   ISCANCELLED          bit                  not null,
   constraint PK_SALESORDER primary key (ORDERNO, REFERENCENO)
)
go

/*==============================================================*/
/* Table: SALESORDERDISCOUNT                                    */
/*==============================================================*/
create table SALESORDERDISCOUNT (
   DISCOUNTCODE         varchar(1024)        not null,
   SALESORDER_ORDERNO   "ORDER"              not null,
   SALESORDER_REFERENCENO REFERENCE            not null,
   STARTDATE            datetime             not null,
   ENDDATE              datetime             null,
   ISUSED               bit                  null,
   constraint PK_SALESORDERDISCOUNT primary key (DISCOUNTCODE)
)
go

/*==============================================================*/
/* Table: SALESORDERLINE                                        */
/*==============================================================*/
create table SALESORDERLINE (
   SALESORDER_ORDERNO   "ORDER"              not null,
   SALESORDER_REFERENCENO REFERENCE            not null,
   "LINENO"             int                  not null,
   UNIT_NAME            UNIT                 not null,
   SUPPLY_SUPPLYNO      int                  not null,
   VATTYPE_CATEGORY     VATTYPE              not null,
   SALESINVOICELINE_SALESINVOICE_INVOICENO INVOICE              null,
   SALESINVOICELINE_SALESINVOICE_REFERENCENO REFERENCE            null,
   SALESINVOICELINE_LINENO int                  null,
   ARTICLE_ARTICLENO    ARTICLE              not null,
   ARTICLEINSTORAGECUBE_STORAGECUBE_LOCATION_ADDRESS ADDRESS              not null,
   ARTICLEINSTORAGECUBE_STORAGECUBE_REFERENCENO int                  not null,
   ARTICLEINLOCATION_LOCATION_ADDRESS ADDRESS              not null,
   AMOUNT               int                  not null,
   DATE                 datetime             not null,
   constraint PK_SALESORDERLINE primary key (SALESORDER_ORDERNO, SALESORDER_REFERENCENO, "LINENO")
)
go

/*==============================================================*/
/* Table: SALESPAYMENT                                          */
/*==============================================================*/
create table SALESPAYMENT (
   PAYMENTNO            PAYMENT              not null,
   SALESINVOICE_INVOICENO INVOICE              not null,
   SALESINVOICE_REFERENCENO REFERENCE            not null,
   AMOUNT               AMOUNT               not null,
   VALUTA               VALUTA               not null,
   DATE                 datetime             not null,
   constraint PK_SALESPAYMENT primary key (PAYMENTNO)
)
go

/*==============================================================*/
/* Table: SALESQUOTE                                            */
/*==============================================================*/
create table SALESQUOTE (
   QUOTATIONNO          QUOTATION            not null,
   REFERENCENO          REFERENCE            not null,
   SALESORDER_ORDERNO   "ORDER"              null,
   SALESORDER_REFERENCENO REFERENCE            null,
   EMPLOYEE_EMPLOYEEID  EMPLOYEE             null,
   CUSTOMER_RELATIONNO  RELATION             not null,
   DATE                 datetime             not null,
   ISCANCELLED          bit                  not null,
   constraint PK_SALESQUOTE primary key (QUOTATIONNO, REFERENCENO)
)
go

/*==============================================================*/
/* Table: SALESQUOTELINE                                        */
/*==============================================================*/
create table SALESQUOTELINE (
   ARTICLE_ARTICLENO    ARTICLE              not null,
   SALESQUOTE_QUOTATIONNO QUOTATION            not null,
   SALESQUOTE_REFERENCENO REFERENCE            not null,
   "LINENO"             int                  not null,
   UNIT_NAME            UNIT                 not null,
   VATTYPE_CATEGORY     VATTYPE              not null,
   AMOUNT               AMOUNT               not null,
   PRICE                PRICE                not null,
   constraint PK_SALESQUOTELINE primary key (ARTICLE_ARTICLENO, SALESQUOTE_QUOTATIONNO, SALESQUOTE_REFERENCENO, "LINENO")
)
go

/*==============================================================*/
/* Table: SHELFLIFE                                             */
/*==============================================================*/
create table SHELFLIFE (
   SHELFLIFETYPE        SHELFLIFE            not null,
   constraint PK_SHELFLIFE primary key (SHELFLIFETYPE)
)
go

/*==============================================================*/
/* Table: STORAGECUBE                                           */
/*==============================================================*/
create table STORAGECUBE (
   LOCATION_ADDRESS     ADDRESS              not null,
   REFERENCENO          int                  not null,
   STORAGEMETHOD_NAME   NAME                 not null,
   LENGTH               DIMENSION            not null,
   WIDTH                DIMENSION            not null,
   HEIGHT               DIMENSION            not null,
   MAXWEIGHT            WEIGHT               not null,
   TEMPERATURE          TEMPERATURE          not null,
   constraint PK_STORAGECUBE primary key (LOCATION_ADDRESS, REFERENCENO)
)
go

/*==============================================================*/
/* Table: STORAGEMETHOD                                         */
/*==============================================================*/
create table STORAGEMETHOD (
   NAME                 NAME                 not null,
   DESCRIPTION          DESCRIPTION          null,
   constraint PK_STORAGEMETHOD primary key (NAME)
)
go

/*==============================================================*/
/* Table: SUPPLIER                                              */
/*==============================================================*/
create table SUPPLIER (
   RELATIONNO           RELATION             not null,
   ADDRESS              ADDRESS              not null,
   EMAIL                EMAIL                not null,
   PHONENO              PHONENO              null,
   NAME                 NAME                 null,
   constraint PK_SUPPLIER primary key (RELATIONNO)
)
go

/*==============================================================*/
/* Table: SUPPLY                                                */
/*==============================================================*/
create table SUPPLY (
   SUPPLYNO             int                  not null,
   PURCHASEORDERLINE_PURCHASEORDER_ORDERNO "ORDER"              null,
   PURCHASEORDERLINE_PURCHASEORDER_REFERENCENO int                  null,
   PURCHASEORDERLINE_LINENO int                  null,
   STORAGECUBE_LOCATION_ADDRESS ADDRESS              not null,
   STORAGECUBE_REFERENCENO int                  not null,
   ARTICLE_ARTICLENO    ARTICLE              not null,
   UNIT_NAME            UNIT                 not null,
   LOCATION_ADDRESS     ADDRESS              not null,
   SHELFLIFETIME        SHELFLIFE            null,
   ARRIVALDATE          datetime             not null,
   SEASON               SEASON               null,
   PRODUCTIONLOCATION   ADDRESS              not null,
   ISSELLABLESTOCK      bit                  not null,
   AMOUNT               AMOUNT               not null,
   constraint PK_SUPPLY primary key (SUPPLYNO)
)
go

/*==============================================================*/
/* Table: SUPPLYDISCOUNT                                        */
/*==============================================================*/
create table SUPPLYDISCOUNT (
   DISCOUNTCODE         varchar(1024)        not null,
   SUPPLY_SUPPLYNO      int                  not null,
   STARTDATE            datetime             not null,
   ENDDATE              datetime             null,
   ISUSED               bit                  null,
   constraint PK_SUPPLYDISCOUNT primary key (DISCOUNTCODE)
)
go

/*==============================================================*/
/* Table: UNIT                                                  */
/*==============================================================*/
create table UNIT (
   NAME                 UNIT                 not null,
   AMOUNT               AMOUNT               not null,
   constraint PK_UNIT primary key (NAME)
)
go

/*==============================================================*/
/* Table: VATTYPE                                               */
/*==============================================================*/
create table VATTYPE (
   CATEGORY             VATTYPE              not null,
   VAT                  decimal(5,2)         not null,
   constraint PK_VATTYPE primary key (CATEGORY)
)
go

alter table ARTICLE
   add constraint FK_ARTICLE_COMPONENT_COMPONEN foreign key (COMPONENT_ARTICLE_ARTICLENO, COMPONENT_ORDER)
      references COMPONENT (ARTICLE_ARTICLENO, "ORDER")
         on update cascade on delete cascade
go

alter table ARTICLE
   add constraint FK_ARTICLE_SHELFLIFE_SHELFLIF foreign key (SHELFLIFE_SHELFLIFETYPE)
      references SHELFLIFE (SHELFLIFETYPE)
         on update cascade on delete cascade
go

alter table ARTICLE
   add constraint FK_ARTICLE_VATTYPE_F_VATTYPE foreign key (VATTYPE_CATEGORY)
      references VATTYPE (CATEGORY)
         on update cascade on delete cascade
go

alter table ARTICLEDISCOUNT
   add constraint FK_ARTICLED_DISCOUNT__ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table ARTICLEINLOCATION
   add constraint FK_ARTICLEI_ARTICLE_I_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table ARTICLEINLOCATION
   add constraint FK_ARTICLEI_LOCATION__LOCATION foreign key (LOCATION_ADDRESS)
      references LOCATION (ADDRESS)
         on update cascade on delete cascade
go

alter table ARTICLEINSTORAGECUBE
   add constraint FK_ARTICLEI_ARTICLE_I_ARTICLE_2 foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table ARTICLEINSTORAGECUBE
   add constraint FK_ARTICLEI_STORAGECU_STORAGEC foreign key (STORAGECUBE_LOCATION_ADDRESS, STORAGECUBE_REFERENCENO)
      references STORAGECUBE (LOCATION_ADDRESS, REFERENCENO)
         on update cascade on delete cascade
go

alter table ARTICLE_IN_UNIT
   add constraint FK_ARTICLE__ARTICLE_I_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table ARTICLE_IN_UNIT
   add constraint FK_ARTICLE__ARTICLE_I_UNIT foreign key (UNIT_NAME)
      references UNIT (NAME)
         on update cascade on delete cascade
go

alter table COMPONENT
   add constraint FK_COMPONEN_COMPONENT_ARTICLE_2 foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table COMPONENT
   add constraint FK_COMPONEN_COMPONENT_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table CUSTOMERDISCOUNT
   add constraint FK_CUSTOMER_DISCOUNT__CUSTOMER foreign key (CUSTOMER_RELATIONNO)
      references CUSTOMER (RELATIONNO)
         on update cascade on delete cascade
go

alter table PRODUCT
   add constraint FK_PRODUCT_ARTICLE_A_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table PRODUCT
   add constraint FK_PRODUCT_PRODUCT_I_LOCATION foreign key (LOCATION_ADDRESS)
      references LOCATION (ADDRESS)
         on update cascade on delete cascade
go

alter table PRODUCT
   add constraint FK_PRODUCT_PRODUCT_I_STORAGEC foreign key (STORAGECUBE_LOCATION_ADDRESS, STORAGECUBE_REFERENCENO)
      references STORAGECUBE (LOCATION_ADDRESS, REFERENCENO)
         on update cascade on delete cascade
go

alter table PRODUCT
   add constraint FK_PRODUCT_PRODUCT_I_SUPPLY foreign key (SUPPLY_SUPPLYNO)
      references SUPPLY (SUPPLYNO)
         on update cascade on delete cascade
go

alter table PURCHASEINVOICE
   add constraint FK_PURCHASE_PURCHASEI_SUPPLIER foreign key (SUPPLIER_RELATIONNO)
      references SUPPLIER (RELATIONNO)
         on update cascade on delete cascade
go

alter table PURCHASEINVOICELINE
   add constraint FK_PURCHASE_ARTICLE_I_ARTICLE_3 foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table PURCHASEINVOICELINE
   add constraint FK_PURCHASE_PURCHASEI_PURCHASE foreign key (PURCHASEINVOICE_INVOICENO, PURCHASEINVOICE_REFERENCENO)
      references PURCHASEINVOICE (INVOICENO, REFERENCENO)
         on update cascade on delete cascade
go

alter table PURCHASEINVOICELINE
   add constraint FK_PURCHASE_PURCHASEO_PURCHASE_7 foreign key (PURCHASEORDERLINE_PURCHASEORDER_ORDERNO, PURCHASEORDERLINE_PURCHASEORDER_REFERENCENO, PURCHASEORDERLINE_LINENO)
      references PURCHASEORDERLINE (PURCHASEORDER_ORDERNO, PURCHASEORDER_REFERENCENO, "LINENO")
         on update cascade on delete cascade
go

alter table PURCHASEINVOICELINE
   add constraint FK_PURCHASE_UNIT_IN_P_UNIT_3 foreign key (UNIT_NAME)
      references UNIT (NAME)
         on update cascade on delete cascade
go

alter table PURCHASEINVOICELINE
   add constraint FK_PURCHASE_VATTYPE_F_VATTYPE_3 foreign key (VATTYPE_CATEGORY)
      references VATTYPE (CATEGORY)
         on update cascade on delete cascade
go

alter table PURCHASEORDER
   add constraint FK_PURCHASE_PURCHASEO_PURCHASE_4 foreign key (PURCHASEQUOTE_QUOTATIONNO, PURCHASEQUOTE_REFERENCENO)
      references PURCHASEQUOTE (QUOTATIONNO, REFERENCENO)
         on update cascade on delete cascade
go

alter table PURCHASEORDER
   add constraint FK_PURCHASE_PURCHASEO_SUPPLIER foreign key (SUPPLIER_RELATIONNO)
      references SUPPLIER (RELATIONNO)
         on update cascade on delete cascade
go

alter table PURCHASEORDER
   add constraint FK_PURCHASE_PURCHASEO_PURCHASE_3 foreign key (PURCHASEINVOICE_INVOICENO, PURCHASEINVOICE_REFERENCENO)
      references PURCHASEINVOICE (INVOICENO, REFERENCENO)
         on update cascade on delete cascade
go

alter table PURCHASEORDER
   add constraint FK_PURCHASE_PURCHASEO_EMPLOYEE foreign key (EMPLOYEE_EMPLOYEEID)
      references EMPLOYEE (EMPLOYEEID)
         on update cascade on delete cascade
go

alter table PURCHASEORDER
   add constraint FK_PURCHASE_PURCHASEO_PURCHASE_6 foreign key (SUPERORDERNO, SUPERORDERREFERENCENO)
      references PURCHASEORDER (ORDERNO, REFERENCENO)
go

alter table PURCHASEORDERLINE
   add constraint FK_PURCHASE_ARTICLE_I_ARTICLE_2 foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table PURCHASEORDERLINE
   add constraint FK_PURCHASE_PURCHASEO_ARTICLEI_2 foreign key (ARTICLE_ARTICLENO, ARTICLEINLOCATION_LOCATION_ADDRESS)
      references ARTICLEINLOCATION (ARTICLE_ARTICLENO, LOCATION_ADDRESS)
         on update cascade on delete cascade
go

alter table PURCHASEORDERLINE
   add constraint FK_PURCHASE_PURCHASEO_ARTICLEI foreign key (ARTICLEINSTORAGECUBE_STORAGECUBE_LOCATION_ADDRESS, ARTICLE_ARTICLENO, ARTICLEINSTORAGECUBE_STORAGECUBE_REFERENCENO)
      references ARTICLEINSTORAGECUBE (STORAGECUBE_LOCATION_ADDRESS, ARTICLE_ARTICLENO, STORAGECUBE_REFERENCENO)
         on update cascade on delete cascade
go

alter table PURCHASEORDERLINE
   add constraint FK_PURCHASE_PURCHASEO_PURCHASE_5 foreign key (PURCHASEINVOICELINE_PURCHASEINVOICE_INVOICENO, PURCHASEINVOICELINE_PURCHASEINVOICE_REFERENCENO, PURCHASEINVOICELINE_LINENO)
      references PURCHASEINVOICELINE (PURCHASEINVOICE_INVOICENO, PURCHASEINVOICE_REFERENCENO, "LINENO")
         on update cascade on delete cascade
go

alter table PURCHASEORDERLINE
   add constraint FK_PURCHASE_PURCHASEO_PURCHASE_2 foreign key (PURCHASEORDER_ORDERNO, PURCHASEORDER_REFERENCENO)
      references PURCHASEORDER (ORDERNO, REFERENCENO)
         on update cascade on delete cascade
go

alter table PURCHASEORDERLINE
   add constraint FK_PURCHASE_UNIT_IN_P_UNIT_2 foreign key (UNIT_NAME)
      references UNIT (NAME)
         on update cascade on delete cascade
go

alter table PURCHASEORDERLINE
   add constraint FK_PURCHASE_VATTYPE_F_VATTYPE_2 foreign key (VATTYPE_CATEGORY)
      references VATTYPE (CATEGORY)
         on update cascade on delete cascade
go

alter table PURCHASEPAYMENT
   add constraint FK_PURCHASE_PURCHASEP_PURCHASE foreign key (PURCHASEINVOICE_INVOICENO, PURCHASEINVOICE_REFERENCENO)
      references PURCHASEINVOICE (INVOICENO, REFERENCENO)
         on update cascade on delete cascade
go

alter table PURCHASEQUOTE
   add constraint FK_PURCHASE_PURCHASEO_PURCHASE foreign key (PURCHASEORDER_ORDERNO, PURCHASEORDER_REFERENCENO)
      references PURCHASEORDER (ORDERNO, REFERENCENO)
         on update cascade on delete cascade
go

alter table PURCHASEQUOTE
   add constraint FK_PURCHASE_PURCHASEQ_SUPPLIER foreign key (SUPPLIER_RELATIONNO)
      references SUPPLIER (RELATIONNO)
         on update cascade on delete cascade
go

alter table PURCHASEQUOTE
   add constraint FK_PURCHASE_PURCHASEQ_EMPLOYEE foreign key (EMPLOYEE_EMPLOYEEID)
      references EMPLOYEE (EMPLOYEEID)
         on update cascade on delete cascade
go

alter table PURCHASEQUOTELINE
   add constraint FK_PURCHASE_ARTICLE_I_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table PURCHASEQUOTELINE
   add constraint FK_PURCHASE_PURCHASEQ_PURCHASE foreign key (PURCHASEQUOTE_QUOTATIONNO, PURCHASEQUOTE_REFERENCENO)
      references PURCHASEQUOTE (QUOTATIONNO, REFERENCENO)
         on update cascade on delete cascade
go

alter table PURCHASEQUOTELINE
   add constraint FK_PURCHASE_UNIT_IN_P_UNIT foreign key (UNIT_NAME)
      references UNIT (NAME)
         on update cascade on delete cascade
go

alter table PURCHASEQUOTELINE
   add constraint FK_PURCHASE_VATTYPE_F_VATTYPE foreign key (VATTYPE_CATEGORY)
      references VATTYPE (CATEGORY)
         on update cascade on delete cascade
go

alter table SALESINVOICE
   add constraint FK_SALESINV_SALESINVO_CUSTOMER foreign key (CUSTOMER_RELATIONNO)
      references CUSTOMER (RELATIONNO)
         on update cascade on delete cascade
go

alter table SALESINVOICELINE
   add constraint FK_SALESINV_ARTICLE_I_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table SALESINVOICELINE
   add constraint FK_SALESINV_SALESINVO_SALESINV foreign key (SALESINVOICE_INVOICENO, SALESINVOICE_REFERENCENO)
      references SALESINVOICE (INVOICENO, REFERENCENO)
         on update cascade on delete cascade
go

alter table SALESINVOICELINE
   add constraint FK_SALESINV_SALESORDE_SALESORD foreign key (SALESORDERLINE_SALESORDER_ORDERNO, SALESORDERLINE_SALESORDER_REFERENCENO, SALESORDERLINE_LINENO)
      references SALESORDERLINE (SALESORDER_ORDERNO, SALESORDER_REFERENCENO, "LINENO")
         on update cascade on delete cascade
go

alter table SALESINVOICELINE
   add constraint FK_SALESINV_UNIT_IN_S_UNIT foreign key (UNIT_NAME)
      references UNIT (NAME)
         on update cascade on delete cascade
go

alter table SALESINVOICELINE
   add constraint FK_SALESINV_VATTYPE_F_VATTYPE foreign key (VATTYPE_CATEGORY)
      references VATTYPE (CATEGORY)
         on update cascade on delete cascade
go

alter table SALESORDER
   add constraint FK_SALESORD_SALESORDE_SALESORD_2 foreign key (BACKORDERNO, BACKORDERREFERENCENO)
      references SALESORDER (ORDERNO, REFERENCENO)
go

alter table SALESORDER
   add constraint FK_SALESORD_SALESORDE_CUSTOMER foreign key (CUSTOMER_RELATIONNO)
      references CUSTOMER (RELATIONNO)
         on update cascade on delete cascade
go

alter table SALESORDER
   add constraint FK_SALESORD_SALESORDE_SALESQUO foreign key (SALESQUOTE_QUOTATIONNO, SALESQUOTE_REFERENCENO)
      references SALESQUOTE (QUOTATIONNO, REFERENCENO)
         on update cascade on delete cascade
go

alter table SALESORDER
   add constraint FK_SALESORD_SALESORDE_SALESINV_2 foreign key (SALESINVOICE_INVOICENO, SALESINVOICE_REFERENCENO)
      references SALESINVOICE (INVOICENO, REFERENCENO)
         on update cascade on delete cascade
go

alter table SALESORDER
   add constraint FK_SALESORD_SALESORDE_EMPLOYEE foreign key (EMPLOYEE_EMPLOYEEID)
      references EMPLOYEE (EMPLOYEEID)
         on update cascade on delete cascade
go

alter table SALESORDER
   add constraint FK_SALESORD_SALESORDE_SALESORD foreign key (SUPERORDERNO, SUPERORDERREFERENCENO)
      references SALESORDER (ORDERNO, REFERENCENO)
go

alter table SALESORDERDISCOUNT
   add constraint FK_SALESORD_DISCOUNT__SALESORD foreign key (SALESORDER_ORDERNO, SALESORDER_REFERENCENO)
      references SALESORDER (ORDERNO, REFERENCENO)
         on update cascade on delete cascade
go

alter table SALESORDERLINE
   add constraint FK_SALESORD_ARTICLE_I_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table SALESORDERLINE
   add constraint FK_SALESORD_SALESORDE_ARTICLEI_2 foreign key (ARTICLE_ARTICLENO, ARTICLEINLOCATION_LOCATION_ADDRESS)
      references ARTICLEINLOCATION (ARTICLE_ARTICLENO, LOCATION_ADDRESS)
         on update cascade on delete cascade
go

alter table SALESORDERLINE
   add constraint FK_SALESORD_SALESORDE_ARTICLEI foreign key (ARTICLEINSTORAGECUBE_STORAGECUBE_LOCATION_ADDRESS, ARTICLE_ARTICLENO, ARTICLEINSTORAGECUBE_STORAGECUBE_REFERENCENO)
      references ARTICLEINSTORAGECUBE (STORAGECUBE_LOCATION_ADDRESS, ARTICLE_ARTICLENO, STORAGECUBE_REFERENCENO)
         on update cascade on delete cascade
go

alter table SALESORDERLINE
   add constraint FK_SALESORD_SALESORDE_SALESINV foreign key (SALESINVOICELINE_SALESINVOICE_INVOICENO, SALESINVOICELINE_SALESINVOICE_REFERENCENO, SALESINVOICELINE_LINENO)
      references SALESINVOICELINE (SALESINVOICE_INVOICENO, SALESINVOICE_REFERENCENO, "LINENO")
         on update cascade on delete cascade
go

alter table SALESORDERLINE
   add constraint FK_SALESORD_SALESORDE_SALESORD_3 foreign key (SALESORDER_ORDERNO, SALESORDER_REFERENCENO)
      references SALESORDER (ORDERNO, REFERENCENO)
         on update cascade on delete cascade
go

alter table SALESORDERLINE
   add constraint FK_SALESORD_SUPPLY_IN_SUPPLY foreign key (SUPPLY_SUPPLYNO)
      references SUPPLY (SUPPLYNO)
         on update cascade on delete cascade
go

alter table SALESORDERLINE
   add constraint FK_SALESORD_UNIT_IN_S_UNIT foreign key (UNIT_NAME)
      references UNIT (NAME)
         on update cascade on delete cascade
go

alter table SALESORDERLINE
   add constraint FK_SALESORD_VATTYPE_F_VATTYPE foreign key (VATTYPE_CATEGORY)
      references VATTYPE (CATEGORY)
         on update cascade on delete cascade
go

alter table SALESPAYMENT
   add constraint FK_SALESPAY_SALESPAYM_SALESINV foreign key (SALESINVOICE_INVOICENO, SALESINVOICE_REFERENCENO)
      references SALESINVOICE (INVOICENO, REFERENCENO)
         on update cascade on delete cascade
go

alter table SALESQUOTE
   add constraint FK_SALESQUO_SALESORDE_SALESORD foreign key (SALESORDER_ORDERNO, SALESORDER_REFERENCENO)
      references SALESORDER (ORDERNO, REFERENCENO)
         on update cascade on delete cascade
go

alter table SALESQUOTE
   add constraint FK_SALESQUO_SALESQUOT_CUSTOMER foreign key (CUSTOMER_RELATIONNO)
      references CUSTOMER (RELATIONNO)
         on update cascade on delete cascade
go

alter table SALESQUOTE
   add constraint FK_SALESQUO_SALESQUOT_EMPLOYEE foreign key (EMPLOYEE_EMPLOYEEID)
      references EMPLOYEE (EMPLOYEEID)
         on update cascade on delete cascade
go

alter table SALESQUOTELINE
   add constraint FK_SALESQUO_ARTICLE_I_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table SALESQUOTELINE
   add constraint FK_SALESQUO_RELATIONS_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table SALESQUOTELINE
   add constraint FK_SALESQUO_SALESQUOT_SALESQUO foreign key (SALESQUOTE_QUOTATIONNO, SALESQUOTE_REFERENCENO)
      references SALESQUOTE (QUOTATIONNO, REFERENCENO)
         on update cascade on delete cascade
go

alter table SALESQUOTELINE
   add constraint FK_SALESQUO_UNIT_IN_S_UNIT foreign key (UNIT_NAME)
      references UNIT (NAME)
         on update cascade on delete cascade
go

alter table SALESQUOTELINE
   add constraint FK_SALESQUO_VATTYPE_F_VATTYPE foreign key (VATTYPE_CATEGORY)
      references VATTYPE (CATEGORY)
         on update cascade on delete cascade
go

alter table STORAGECUBE
   add constraint FK_STORAGEC_STORAGECU_LOCATION foreign key (LOCATION_ADDRESS)
      references LOCATION (ADDRESS)
         on update cascade on delete cascade
go

alter table STORAGECUBE
   add constraint FK_STORAGEC_STORAGECU_STORAGEM foreign key (STORAGEMETHOD_NAME)
      references STORAGEMETHOD (NAME)
         on update cascade on delete cascade
go

alter table SUPPLY
   add constraint FK_SUPPLY_ARTICLE_I_ARTICLE foreign key (ARTICLE_ARTICLENO)
      references ARTICLE (ARTICLENO)
         on update cascade on delete cascade
go

alter table SUPPLY
   add constraint FK_SUPPLY_SUPPLY_IN_LOCATION foreign key (LOCATION_ADDRESS)
      references LOCATION (ADDRESS)
         on update cascade on delete cascade
go

alter table SUPPLY
   add constraint FK_SUPPLY_SUPPLY_IN_PURCHASE foreign key (PURCHASEORDERLINE_PURCHASEORDER_ORDERNO, PURCHASEORDERLINE_PURCHASEORDER_REFERENCENO, PURCHASEORDERLINE_LINENO)
      references PURCHASEORDERLINE (PURCHASEORDER_ORDERNO, PURCHASEORDER_REFERENCENO, "LINENO")
         on update cascade on delete cascade
go

alter table SUPPLY
   add constraint FK_SUPPLY_SUPPLY_IN_STORAGEC foreign key (STORAGECUBE_LOCATION_ADDRESS, STORAGECUBE_REFERENCENO)
      references STORAGECUBE (LOCATION_ADDRESS, REFERENCENO)
         on update cascade on delete cascade
go

alter table SUPPLY
   add constraint FK_SUPPLY_UNIT_IN_S_UNIT foreign key (UNIT_NAME)
      references UNIT (NAME)
         on update cascade on delete cascade
go

alter table SUPPLYDISCOUNT
   add constraint FK_SUPPLYDI_DISCOUNT__SUPPLY foreign key (SUPPLY_SUPPLYNO)
      references SUPPLY (SUPPLYNO)
         on update cascade on delete cascade
go

