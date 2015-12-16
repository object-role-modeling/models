vocabulary RentAWreck_Model;

/*
 * Value Types
 */
City_name is written as String;
DateTime is written as Date Time;
Email is written as String(255);
EmployeePermission is written as String(5) restricted to {'admin', 'csm', 'mech', 'mgr', 'pos'};
ExtensionNr is written as Unsigned Integer(16);
Invoice_nr is written as Unsigned Integer(32);
Item_id is written as Auto Counter;
OrderNr is written as Unsigned Integer(32);
PersonOrCompany_id is written as Auto Counter;
Phone_nr is written as Char(10);
PromotionOrDiscount_id is written as Auto Counter;
Quantity is written as Real(32);
SKU is written as String(50);
State_code is written as Char(2);
StreetAddress is written as String(255);
USDValue is written as Money;
Zip is written as Unsigned Integer(32);

/*
 * Entity Types
 */
Invoice is identified by its _nr;

Item is identified by its _id;
Item has at most one internal-SKU;
Item is currently in one stock-Quantity;

LineItem is identified by Invoice and OrderNr where
	Invoice has LineItem,
	LineItem is in one OrderNr;
LineItem is for at most one Item;
LineItem is for at most one Quantity;

PersonOrCompany is identified by its _id;
Invoice is for one PersonOrCompany;
PersonOrCompany has at most one Email;

Phone is identified by its _nr;
PersonOrCompany has one home-Phone;
Phone has at most one ExtensionNr;
Phone can sms;
Phone is fax;

Price is identified by USDValue where
	Price has one USDValue,
	USDValue is of at most one Price;
Item has at most one list-Price;
LineItem has at most one overrideunit-Price;

PromotionOrDiscount is identified by its _id;
LineItem is for at most one PromotionOrDiscount;

State is identified by its _code;

Supplier is a kind of PersonOrCompany;
Item has at most one preferred-Supplier;

AuditEntry is where
	Item had Quantity on DateTime;

City is identified by City_name and State where
	City has one City_name,
	City_name is of City,
	City is in one State;

Customer is a kind of PersonOrCompany;
Customer is preferred;

DiscrepancyAdjustment is where
	Item was adjusted by Quantity at DateTime;

Employee is a kind of PersonOrCompany;

Manager is a kind of Employee;
LineItem was overridden by at most one Manager;

Mechanic is a kind of Employee;

Permissions is where
	Employee has EmployeePermission;

Point Of Sale is a kind of Employee;
Invoice was written by one Point Of Sale;

SuppliedItem is where
	Item is available from Supplier;
SuppliedItem has at most one supplier-SKU;

Address is identified by StreetAddress and City and Zip where
	Address has one StreetAddress,
	Address has one City,
	Address has one Zip;
PersonOrCompany has one billing-Address;

Administrator is a kind of Employee;

Customer Service Manager is a kind of Employee;

/*
 * Constraints:
 */
either LineItem is for Item or LineItem is for PromotionOrDiscount but not both;
LineItem is for Item
	if and only if
	LineItem is for Quantity;
LineItem was overridden by Manager
	if and only if
	LineItem has overrideunit Price;
Item has preferred Supplier
	only if Item is available from Supplier;
LineItem has overrideunit Price
	only if LineItem is for Item;
each combination DateTime, Item occurs one time in
	Item had Quantity on DateTime;
each combination DateTime, Item occurs one time in
	Item was adjusted by Quantity at DateTime;
each LineItem occurs one time in
	Invoice has LineItem;
