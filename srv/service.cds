using {com.logaligroup as call} from '../db/schema';

service ServiceCatalog {
   entity OrdersSet as projection on call.Orders;
   entity ItemsSet  as projection on call.Items;
};
