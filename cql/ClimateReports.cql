vocabulary ClimateReports;

/*
 * Value Types
 */
Data is written as Decimal(15,8);
Latitude is written as Decimal(20,17);
Longitude is written as Decimal(20,17);
Name is written as String(200);
Report_id is written as Auto Counter;

/*
 * Entity Types
 */
Geopoint is identified by Latitude and Longitude where
	Geopoint is at one Latitude,
	Geopoint is at one Longitude;

Report is identified by its _id;
Report has one Name;

Results is where
	Report has Data at Geopoint;

/*
 * Constraints:
 */
each combination Report, Geopoint occurs one time in
	Report has Data at Geopoint;
