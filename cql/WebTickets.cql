vocabulary WebTickets;

/*
 * Value Types
 */
Address Line is written as String(200);
Address_guid is written as Guid;
Amount is written as Money;
Card Transaction ID is written as String(512);
City Name is written as String(50);
City_id is written as Auto Counter;
Column is written as String(3);
Custom Event Field is written as String(200);
Date Time is written as Date Time;
Description is written as Text;
Email Address is written as String(512);
Event Type_name is written as String(100);
Event_guid is written as Guid;
Image_guid is written as Guid;
Membership Status_guid is written as Guid;
Notes is written as Text;
Password Hash is written as String(500);
Payment_guid is written as Guid;
Percentage is written as Decimal(8,7);
Physical Seat_guid is written as Guid;
Postal Code is written as String(10);
Promotion Code is written as String(150);
Promotion Redemption_id is written as Auto Counter;
Promotion_id is written as Auto Counter;
Purchase_id is written as Auto Counter;
Purchasing Workflow_guid is written as Guid;
Quantity is written as Signed Integer(16);
Receipt_guid is written as Guid;
Row is written as String(4);
Salt is written as String(200);
Seat Pricing Plan_guid is written as Guid;
Seat Type_name is written as String(20);
Seating Level is written as String(20);
Section_id is written as Auto Counter;
Short Name is written as String(100);
Showing_guid is written as Guid;
State Code is written as Char(2);
State Name is written as String(30);
State_id is written as Auto Counter;
TargetedPromotion_guid is written as Guid;
Ticket Scan_guid is written as Guid;
Ticket Type_name is written as String(20);
Ticket_guid is written as Guid;
Timestamp is written as Auto Time Stamp;
URL is written as String(100);
User Role is written as String(10);
User_guid is written as Guid;
Username is written as String(100);
Venue_guid is written as Guid;

/*
 * Entity Types
 */
Address is identified by its _guid;
Address is in at most one Postal Code;
Address has one first-Address Line (as line1);
Address has at most one second-Address Line (as line2);
Address has at most one third-Address Line (as line3);

City is identified by its _id;
Address is in one City;
City has one City Name (as Name);

Event is identified by its _guid;
Event has at most one Custom Event Field;
Event has at most one Custom Event Field;
Event has at most one Custom Event Field;
Event has at most one Description;
Event has one Short Name;
Event charges at most one salestax-Percentage;
Event has at most one short-URL;

Event Type is identified by its _name;
Event has at most one Event Type;

Image is identified by its _guid;
Event has at most one main-Image;
Event has at most one ticket-Image;

Membership Status is identified by its _guid;
Membership Status has one Short Name;

Payment is identified by its _guid;
Payment is for one Amount;
Payment happened on one Timestamp;
Payment is refund;

Physical Seat is identified by its _guid;

Promotion is identified by its _id;
Promotion has at most one Promotion Code;
Promotion has at most one activation-Date Time;
Promotion has at most one discount-Amount;
Promotion has at most one discount-Percentage;
Promotion has at most one expiration-Date Time;
Promotion has at most one freeticket-Quantity;
Promotion has at most one limited-Quantity;
Promotion has at most one maxsales-Amount;
Promotion has at most one maxticket-Quantity;
Promotion has at most one minsales-Amount;
Promotion has at most one minticket-Quantity;

Promotion Redemption is identified by its _id;
Promotion Redemption was worth at most one Amount;
Promotion Redemption is for at most one Promotion;
Promotion Redemption happened on one Timestamp;

Purchase is identified by its _id;
Promotion Redemption was applied to one Purchase;
Purchase has at most one Notes;
Purchase was made with at least one Payment,
	Payment is for at most one Purchase;
Purchase was made on one Timestamp;

Purchasing Workflow is identified by its _guid;
Purchasing Workflow was used during Purchase,
	Purchase used one Purchasing Workflow;
Purchasing Workflow has one Short Name;
Purchasing Workflow has at most one perorder- discount Amount;
Purchasing Workflow has at most one perorder- surcharge Amount;
Purchasing Workflow has at most one perticket- discount Amount;
Purchasing Workflow has at most one perticket- surcharge Amount;

Receipt is identified by its _guid;
Receipt was sent to one Email Address;
Receipt is for at most one Purchase;

Refund is a kind of Payment;

Seat Number is identified by Row and Number and Seating Level where
	Seat Number is in one Row,
	Seat Number is in one Column (as Number),
	Seat Number is on at most one Seating Level;
Physical Seat has at most one Seat Number;

Seat Pricing Plan is identified by its _guid;
Seat Pricing Plan has at most one Short Name (as Name);

Seat Type is identified by its _name;

Section is identified by its _id;
Section has at most one Short Name;
Section is general admission;

Showing is identified by its _guid;
Event has Showing,
	Showing is for one Event;
Seat Pricing Plan is used for Showing,
	Showing uses one Seat Pricing Plan;
Showing begins on one Date Time;

ShowingPromotionAvailability is where
	Promotion can be used for Showing;

ShowingSalesEnd is where
	Showing stops selling through Purchasing Workflow on one Date Time;

ShowingSalesStart is where
	Showing starts selling through Purchasing Workflow on one Date Time;

State is identified by its _id;
Address is in at most one State;
City is in one State,
	State contains City;
State has one State Code;
State has one State Name (as Name);

TargetedPromotion is identified by its _guid;
Promotion Redemption is for at most one TargetedPromotion;
TargetedPromotion implements one Promotion,
	Promotion is template for TargetedPromotion;
TargetedPromotion has at most one Promotion Code;
TargetedPromotion has at most one end-Date Time;
TargetedPromotion has at most one start-Date Time;
TargetedPromotion is single use;

Ticket is identified by its _guid;
Purchase ordered Ticket,
	Ticket was bought on at most one Purchase;
Ticket is for one Physical Seat;
Ticket is for one Showing;
Ticket is on hold;

Ticket Scan is identified by its _guid;
Ticket Scan used one Ticket,
	Ticket was scanned in Ticket Scan;
Ticket Scan happened on one Timestamp;

Ticket Type is identified by its _name;

User is identified by its _guid;
Purchase was made by one User;
Ticket belongs to at most one User;
User has one Email Address;
User has at most one Password Hash;
User has one Salt;
User was created on one Timestamp;
User has at most one Username;
User has at most one defaultbilling-Address;
User has at most one shipping-Address;

Venue is identified by its _guid;
Event is at at most one Venue;
Promotion belongs to one Venue,
	Venue created Promotion;
Seat Pricing Plan is defined for one Venue;
Venue is at one Address;
Venue has one Short Name (as Name);
Venue was created on one Timestamp;
Venue has assigned-Physical Seat,
	Physical Seat is at one Venue;

VenueMembershipStatusUsage is where
	Venue uses Membership Status,
	Membership Status is used at Venue;

VenueWorkflowUsage is where
	Purchasing Workflow is used by Venue,
	Venue uses Purchasing Workflow;

Assigned Seat is where
	Physical Seat is listed in Seat Pricing Plan;
Assigned Seat is of one Seat Type;
Assigned Seat is in at most one Section;
Assigned Seat is reserved;

Attendee is a kind of User;
Promotion Redemption was used by one Attendee,
	Attendee redeemed Promotion Redemption;
TargetedPromotion is for one Attendee,
	Attendee can use TargetedPromotion;

Cash Payment is a kind of Payment;

Check Payment is a kind of Payment;

Credit Card Payment is a kind of Payment;
Credit Card Payment has one Card Transaction ID;

EventPromotionAvailability is where
	Promotion can be used for Event;

Promoter is a kind of User;
Payment was processed by at most one Promoter;
Promoter has at most one default-User Role;
Purchase was sold by at most one Promoter;

PromoterVenueRole is where
	Promoter has User Role at Venue;

Seat Type Ticket Price is where
	Seat Type sells for Amount as Ticket Type in Seat Pricing Plan;

Ticket Transfer is where
	Ticket was transferred to User;
Ticket Transfer happened on one Timestamp;

Venue Member is a kind of Attendee;

VenueMemberStatus is where
	Venue Member has Membership Status at Venue;

Account is a kind of Promoter;
Venue belongs to one Account,
	Account owns Venue;

Employee is a kind of Promoter;
Employee is under one Account;
Promotion Redemption was authorized by at most one Employee;
Ticket Scan was performed by one Employee,
	Employee scanned Ticket Scan;

/*
 * Constraints:
 */
either Promoter is an Account or Promoter is an Employee but not both;
either Promotion Redemption is for TargetedPromotion or Promotion Redemption is for Promotion but not both;
for each Promotion exactly one of these holds:
	Promotion has discount-Amount,
	Promotion has discount-Percentage,
	Promotion has freeticket-Quantity;
either User is an Attendee or User is a Promoter but not both;
for each Promotion Code at most one of these holds:
	TargetedPromotion has Promotion Code,
	Promotion has Promotion Code;
for each Purchasing Workflow at most one of these holds:
	Purchasing Workflow has perorder- surcharge Amount,
	Purchasing Workflow has perorder- discount Amount;
for each Purchasing Workflow at most one of these holds:
	Purchasing Workflow has perticket- surcharge Amount,
	Purchasing Workflow has perticket- discount Amount;
Showing starts selling through Purchasing Workflow on Date Time(1)
	if and only if
	Showing stops selling through Purchasing Workflow on Date Time(2);
Address has third Address Line
	only if Address has second Address Line;
Event has Custom Event Field(1)
	only if Event has Custom Event Field(2);
Event has Custom Event Field(1)
	only if Event has Custom Event Field(2);
Event is at Venue
	only if Event has Showing and Seat Pricing Plan is defined for Venue;
Venue Member has Membership Status at Venue
	only if Membership Status is used at Venue;
each combination Promotion Code, Venue occurs at most one time in
	Promotion has Promotion Code,
	Promotion belongs to Venue;
each Promotion Code occurs at most one time in
	TargetedPromotion has Promotion Code;
each combination Seat Type, Ticket Type, Seat Pricing Plan occurs one time in
	Seat Type sells for Amount as Ticket Type in Seat Pricing Plan;
each combination Showing, Physical Seat occurs at most one time in
	Ticket is for Showing,
	Ticket is for Physical Seat;
each combination State, City Name occurs at most one time in
	City is in State,
	City has City Name;
each combination Venue Member, Venue occurs one time in
	Venue Member has Membership Status at Venue;
each combination Venue, Seat Number occurs at most one time in
	Physical Seat is at Venue,
	Physical Seat has Seat Number;
