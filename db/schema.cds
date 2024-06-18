namespace com.logaligroup;

using {cuid} from '@sap/cds/common';

type ZDE_MEINS : String(2);

entity Orders : cuid {
  //key ID           : String(36);
  Email        : String(30);
  Firsname     : String(30);
  Lastname     : String(30);
  Country      : String(30);
  Createon     : Date default $now;
  Deliverydate : DateTime;
  Orderstatus  : Integer; // Association to VH_Status; 
  Imageurl     : LargeBinary  @UI.IsImage  @Core.MediaType: 'image/jpg'; //String(600);
  ToItems      : Composition of many Items
                   on ToItems.Order = $self;
};


entity Items : cuid { //, managed{
  Name             : localized String(40);
  Description      : localized String(40);
  ReleaseDate      : Date;
  DiscontinuedDate : Date;
  Price            : Decimal(12, 2);
  Height           : Decimal(15, 3) @Measures.Unit: UnitOfMeasure;
  Width            : Decimal(13, 3) @Measures.Unit: UnitOfMeasure;
  Depth            : Decimal(12, 2) @Measures.Unit: UnitOfMeasure;
  Quantity         : Decimal(16, 2);
  UnitOfMeasure    : ZDE_MEINS      @Common.IsUnit; //String(10)
  Order            : Association to Orders;
}

//entity VH_Status : CodeList {
//  key code : String enum {
//        New       = 'New';
//        InProcess = ' In Process';
//        Canceled  = 'Canceled';
//      };
//};
// CAP CDS Annotations
