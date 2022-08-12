namespace mm.db;

    context master
    {

        entity businesspartner
        {
            key NODE_KEY  : String(32) ;
            BP_ROLE : String(2);
            EMAIL_ADDRESS : String(64);
            PHONE_NUMBER  : String(14);
            FAX_NUMBER  : String(14);                  
            WEB_ADDRESS  : String(64);
            ADDRESS_GUID  : Association to address;
            BP_ID  : String(16);
            COMPANY_NAME   : String(80)                                                                  
                                                                                                                                                                                               
        }

        annotate businesspartner with{
            BP_ROLE @title: '{i18n>BP_ROLE}'
        } ;
        

        entity address
        {
              key NODE_KEY  : String(32);
              CITY : String(64);
              POSTAL_CODE : String(14);
              STREET  : String(64);
              BUILDING : String(10);
              COUNTRY : String(4);
              ADDRESS_TYPE : String(2);
              VAL_START_DATE : Date;
              VAL_END_DATE : Date;
              LATITUDE : Decimal;
              LONGITUDE  : Decimal;  
              businesspartner : Association to one businesspartner on businesspartner.ADDRESS_GUID = $self;

        }


        entity product
        {
           key NODE_KEY : String(32);
            PRODUCT_ID : String(32);
            TYPE_CODE : String(2);
            CATEGORY  : String(60);
            SUPPLIER_GUID : Association to master.businesspartner;
            TAX_TARIF_CODE : Integer;
            MEASURE_UNIT : String(4);
            WEIGHT_MEASURE : Decimal(5,2);
            WEIGHT_UNIT : String(3);
            CURRENCY_CODE : String(4);
            PRICE : Decimal(15,2);
            WIDTH : Decimal(5,2);
            DEPTH : Decimal(5,2);
            HEIGHT : Decimal(5,2);
            DIM_UNIT : String(3);
            DESCRIPTION : localized String(255);
 
        }

        entity prodtexts
        {
           key NODE_KEY : Association to product;                       
           key locale : String(4);
           DESCRIPTION : String(255);
 
        }
    }

    context transaction
    {
        entity purchaseorder
        {
            key ID : String(32);
            PO_ID : String(24);
            PARTNER_GUID : Association to master.businesspartner;
            CURRENCY_CODE : String(3);
            GROSS_AMOUNT : Decimal(15,2);
            NET_AMOUNT : Decimal(15,2);
            TAX_AMOUNT : Decimal(15,2);
            LIFECYCLE_STATUS : String(1);
            OVERALL_STATUS : String(1);
            items : Association to many  poitems on items.PARENT_KEY_ID = $self;
        }

        entity poitems
        {
            key ID : String(32);
            PARENT_KEY_ID : Association to purchaseorder;
            PO_ITEM_POS : Integer;
            PRODUCT_GUID : Association to master.product;                
            CURRENCY_CODE : String(3);
            GROSS_AMOUNT : Decimal(15,2);
            NET_AMOUNT : Decimal(15,2);
            TAX_AMOUNT  : Decimal(15,2);     
        }


        

    }


