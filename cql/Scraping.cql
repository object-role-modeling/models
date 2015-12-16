vocabulary Scraping;

/*
 * Value Types
 */
Argument_id is written as Auto Counter;
DataPage_id is written as Auto Counter;
DateStamp is written as Auto Time Stamp;
FieldName is written as String(50);
FieldValueConstant is written as String(200);
FieldValueFunctionName is written as String(200);
Path is written as String(200);
Property_id is written as Auto Counter;
Scrape_id is written as Auto Counter;
url is written as String(200);

/*
 * Entity Types
 */
Argument is identified by its _id;
Argument has one FieldName;
Argument has at most one FieldValueConstant;
Argument has at most one FieldValueFunctionName;
Argument is post;

DataPage is identified by its _id;

DataPageUsedArgument is where
	DataPage used Argument;

DataScraper is a kind of DataPage;

NavigationScraper is a kind of DataPage;

Property is identified by its _id;

Scrape is identified by its _id;
Scrape used one DataPage;
Scrape happened on at most one DateStamp;

Website is identified by base-url where
	Website has one base-url,
	Website is of base-url;
Website has url;  // Avoid ambiguity; this is a new fact type
Website has one url,
	url is of at most one Website;

Listing is identified by Property and Scrape where
	Listing is for at most one Property,
	Listing was found on one Scrape,
	Scrape found Listing;

Page is identified by Website and Path where
	Page is on one Website,
	Page has one Path,
	Path is of Page;
Scrape was for one Page;

