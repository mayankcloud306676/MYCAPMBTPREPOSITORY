
using { mm.db.master , mm.db.transaction } from '../db/datamodel';



service demoService @(path : '/demoService'){
 

 entity BusinessPartnerSet as projection on master.businesspartner;
 entity ProductSet as projection on master.product;
 entity AddressSet as projection on master.address; 
 entity ProductTextSet as projection on master.prodtexts;
 entity PurchaseOrderSet as projection on transaction.purchaseorder;
 entity POItemsSet as projection on transaction.poitems;
 

}