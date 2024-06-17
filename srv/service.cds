using{com.logaligroup as call} from '../db/schema';

service ServiceCatalog {
   entity SalesOrderSet as projection on call.SalesOrder;

};
