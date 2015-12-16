vocabulary PZ;

/*
 * Value Types
 */
Address_id is written as Auto Counter;
City_id is written as Auto Counter;
Commission_id is written as Auto Counter;
Date is written as Date;
DateTime is written as Date Time;
Description is written as Text;
Discount_id is written as Auto Counter;
Duration is written as Time;
Email is written as String(255);
File_id is written as Auto Counter;
Filesize is written as Unsigned Integer(32);
FormatType_code is written as Char(10);
IPAddress_code is written as Char(40);
Invoice_id is written as Auto Counter;
LineItem_id is written as Auto Counter;
Mimetype is written as String(50);
Name is written as String(60);
Password is written as String(20);
Percent is written as Decimal;
Person_id is written as Auto Counter;
PhotoShoot_id is written as Auto Counter;
Pixels is written as Unsigned Integer(32);
PostalCode is written as Char(10);
PromotionCode_code is written as Char;
Qty is written as Unsigned Integer(32);
SaleItem_id is written as Auto Counter;
State_code is written as Char(2);
Street is written as String(200);
Tag_id is written as Auto Counter;
TalentRelease_id is written as Auto Counter;
Timestamp is written as Auto Time Stamp;
Title_name is written as String;
URL is written as Text;
USDValue is written as MoneyNumeric;
Username is written as String(20);

/*
 * Entity Types
 */
Address is identified by its _id;
Address is in one PostalCode;
Address has one first-Street;
Address has at most one second-Street;

City is identified by its _id;
Address is in one City;
City has one Name;

Commission is identified by its _id;

Discount is identified by its _id;
Discount has at most one Description;
Discount has one Name;
Discount is for at most one Percent;

File is identified by its _id;
File has at most one Description;
File has one Filesize;
File has one Mimetype;
File is at one URL;

FormatType is identified by its _code;

IPAddress is identified by its _code;

Invoice is identified by its _id;
Invoice was created on one Timestamp;
Invoice has at most one due-Date;

InvoiceDiscounts is where
	Discount is applied to Invoice;

LineItem is identified by its _id;
Commission was for at most one LineItem;
Invoice has LineItem;

LineItemDiscounts is where
	Discount is applied to LineItem;

Money is identified by USDValue where
	Money has one USDValue,
	USDValue is of at most one Money;
Discount is for at most one Money;
FormatType costs one Money;
Invoice has at most one total-Money;

Person is identified by its _id;
Person has one first-Name;
Person has one last-Name;

PhotoShoot is identified by its _id;
PhotoShoot has at most one Description;
PhotoShoot has at most one Name;

PhotoShootContainsFile is where
	PhotoShoot contains File,
	File is in PhotoShoot;

PromotionCode is identified by its _code;
Discount has at most one PromotionCode;

SaleItem is identified by its _id;
LineItem references one SaleItem;
SaleItem has at most one Description;
SaleItem has one Name;
SaleItem has at most one Qty;
SaleItem expires at at most one end-DateTime;
SaleItem is available at at most one start-DateTime;
SaleItem is active;

Service is a kind of SaleItem;

State is identified by its _code;
Address is in at most one State;
State has one Name;

Subscription is a kind of SaleItem;

Tag is identified by its _id;
Tag has at most one Name;

Talent is a kind of Person [separate];
Talent received Commission;
Talent has at most one Description;

TalentFiles is where
	File represents Talent;

TalentRelease is identified by its _id;
Talent signed TalentRelease,
	TalentRelease was signed by one Talent;

TalentReleaseIsForPhotoShoot is where
	TalentRelease is for PhotoShoot;

TimedMedia is a kind of File;
TimedMedia has at most one Duration;

Title is identified by its _name;
File has at most one Title;

User is a kind of Person [separate];
User logged in on at most one DateTime (as lastLogin);
User has one Email;
User is logged in from at most one IPAddress;
User has one Password;
User (as manager) manages Talent;
User has one Username;
User was created on one creation-Timestamp;
User can upload;

VisualMedia is a kind of File;
VisualMedia is one Pixels (as height);
VisualMedia is one Pixels (as width);

AvailableFileType is where
	File is sold as FormatType;

Customer is a kind of User;

FileHasTag is where
	File has Tag;

MaxCommissionCount is where
	Talent receives Qty commissions on PhotoShoot;

MediaProvider is a kind of User;
MediaProvider uploaded File;
MediaProvider owns PhotoShoot;
TalentRelease is for one MediaProvider;

Product is a kind of SaleItem;
Product is for at most one AvailableFileType;

ReceivedCommissionCount is where
	Talent received Qty commissions on PhotoShoot;

/*
 * Constraints:
 */
Talent receives Qty commissions on PhotoShoot
	only if PhotoShoot contains File that represents Talent;
each Commission occurs at most one time in
	Talent received Commission;
each Email occurs at most one time in
	User has Email;
each File occurs one time in
	MediaProvider uploaded File;
each LineItem occurs one time in
	Invoice has LineItem;
each PhotoShoot occurs at most one time in
	MediaProvider owns PhotoShoot;
each combination PhotoShoot, Talent occurs one time in
	Talent received Qty commissions on PhotoShoot;
each combination Talent, PhotoShoot occurs one time in
	Talent receives Qty commissions on PhotoShoot;
each Talent occurs at most one time in
	User manages Talent;
