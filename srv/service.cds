using{com.logaligroup as call} from '../db/schema';

service ServiceCatalog {
   entity SaleOrderSet as projection on call.SalesOrder;

};
