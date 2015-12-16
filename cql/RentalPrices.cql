vocabulary RentalPrices;

/*
 * Value Types
 */
BathroomCount is written as Unsigned Integer(32);
BedroomCount is written as Unsigned Integer(32);
CityName is written as String(30);
City_id is written as Auto Counter;
Date is written as Date;
Name is written as String(40);
NavigationBar_id is written as Auto Counter;
Neighborhood_id is written as Auto Counter;
Newspaper_id is written as Auto Counter;
ParameterValue is written as String(40);
Parameter_name is written as String;
PropertyType_name is written as String;
Property_id is written as Auto Counter;
Rent is written as Money(2);
SqFt is written as Unsigned Integer(32);
State_code is written as Char(2);
StreetAddress is written as String(100);
USDValue is written as Money;
WebPage_id is written as Auto Counter;
Zip is written as Unsigned Integer(32);
location is written as String;

/*
 * Entity Types
 */
City is identified by its _id;
City has at most one CityName;

NavigationBar is identified by its _id;

Neighborhood is identified by its _id;
Neighborhood is in at most one City;
Neighborhood has one Name,
	Name is name of Neighborhood;

NeighborhoodIsInZip is where
	Neighborhood is in Zip;

Newspaper is identified by its _id;
Newspaper has one Name;

Parameter is identified by its _name;
Parameter is post;

Property is identified by its _id;
Property has at most one BathroomCount;
Property has at most one BedroomCount;
Property is in one City;
Property is in at most one Neighborhood;
Property has at most one SqFt;
Property is at at most one StreetAddress;
Property is in at most one Zip;
Property is rto;

PropertyType is identified by its _name restricted to {'condo', 'house', 'plex'};
Property is of one PropertyType;

State is identified by its _code;
City is in at most one State;

URL is identified by location where
	URL has one location,
	location is of at most one URL;
Newspaper has at most one base-URL;

WebPage is identified by its _id;
WebPage was captured on at most one Date;
WebPage contains at most one NavigationBar;
WebPage is at one URL;

WebPageTookParameterWithParameterValue is where
	WebPage took Parameter with one ParameterValue;

ZipIsInCity is where
	Zip is in City;

Listing is where
	Property was listed for Rent on Date;
Listing is in at most one Newspaper;
Listing has details at at most one WebPage,
	WebPage has details for Listing;
WebPage has summary for Listing;

WebPageLinksToDetailsOfListingAtURL is where
	WebPage links to details of Listing at one URL;

/*
 * Constraints:
 */
for each WebPage at most one of these holds:
	WebPage has summary for Listing (2),
	WebPage has summary for Listing (2),
	WebPage has details for Listing;
WebPage links to details of Listing(2) at URL
	only if WebPage has summary for Listing(1);
each combination CityName, State occurs at most one time in
	City has CityName,
	City is in State;
each Listing occurs at most one time in
	WebPage has summary for Listing;
each combination Property, Date occurs one time in
	Property was listed for Rent on Date;
each URL occurs at most one time in
	Newspaper has base URL;
