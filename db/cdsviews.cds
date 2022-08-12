namespace mm.db;

using { mm.db.transaction } from './datamodel.cds';


context cdsviews {
    
    define view mycdsview as
    select from transaction.purchaseorder
    {
        key ID as ![POID],
        PO_ID,
        PARTNER_GUID,
        CURRENCY_CODE,
        LIFECYCLE_STATUS,
        items.PRODUCT_GUID,
        items.GROSS_AMOUNT,
        items.NET_AMOUNT,
        items.TAX_AMOUNT
            
    }

    

}

