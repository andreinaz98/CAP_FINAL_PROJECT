
namespace com.logaligroup;

entity SalesOrder {//: cuid, managed {
    key ID : String(36);
    SalesOrder: String(36);
    key Email: String(30);
    Firsname: String(30);
    Lastname: String(30);
    Country : String(30);
    Createon: Date;
    Deliverydate: DateTime;
    Orderstatus: Integer;
    Imageurl: String;
};

// CAP CDS Annotations