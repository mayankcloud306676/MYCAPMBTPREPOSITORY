
using { mm.db.cdsviews} from '../db/cdsviews.cds';



service cdsService @(path : '/cdsDervice'){
 

 entity CDSDATASet as projection on cdsviews.mycdsview
 

}