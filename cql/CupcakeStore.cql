vocabulary CupcakeStore;

/*
 * Value Types
 */
CountValue is written as Unsigned Integer(16);
CustomerName is written as String(100);
Data is written as Blob;
DateTime is written as Auto Time Stamp;
Description is written as Text;
Email is written as String(200);
FileSize is written as Unsigned Integer(32);
LineItem_nr is written as Signed Integer(32);
MimeType is written as String(100);
Order_nr is written as Signed Integer(32);
PhoneNr is written as String(25);
Product_id is written as Auto Counter;
Team_nr is written as Signed Integer(32);
Title is written as String(100);
USDValue is written as Money;

/*
 * Entity Types
 */
Cost is identified by USDValue where
	Cost has one USDValue,
	USDValue is of at most one Cost;

LineItem is identified by its _nr;

Order is identified by its _nr;
LineItem is part of at most one Order;
Order has at most one CustomerName;
Order was placed at at most one DateTime;
Order has at most one Email;
Order has at most one PhoneNr;

Product is identified by its _id;
LineItem is for one Product;
Product has at most one Cost (as price);
Product has at most one Data;
Product has at most one Description;
Product has at most one FileSize;
Product has at most one MimeType;
Product has one Title;

Qty is identified by CountValue where
	Qty has one CountValue,
	CountValue is of at most one Qty;
LineItem is for one Qty;

Team is identified by its _nr;
Product belongs to one Team;

