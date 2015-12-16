vocabulary TalentModel;

/*
 * Value Types
 */
AbilityCategory_id is written as Auto Counter;
Ability_id is written as Auto Counter;
Address_id is written as Auto Counter;
Age is written as Unsigned Integer(32);
Agency_id is written as Auto Counter;
ApplicationStatus is written as String(20) restricted to {'Accepted', 'Applied', 'InterviewScheduled', 'NeedsInterview', 'NeedsPhotos', 'PendingOther', 'Rejected'};
Application_id is written as Auto Counter;
AreaCode is written as Unsigned Integer(32);
AuditionInvitation_id is written as Auto Counter;
Audition_id is written as Auto Counter;
BinaryContents is written as Blob;
BinaryFile_code is written as Char(36);
City_id is written as Auto Counter;
ContactInfo_id is written as Auto Counter;
Date is written as Date;
DateTime is written as Date Time;
Description is written as String(255);
EducationLevel is written as String(20) restricted to {'AssociateDegree', 'BachelorDegree', 'HighSchoolOrGED', 'None', 'PostGraduateDegree', 'SomeCollege'};
EmailAddress is written as String(255);
EthnicCategory_id is written as Auto Counter;
EthnicityAmount is written as String restricted to {'full', 'half', 'some'};
Ethnicity_id is written as Auto Counter;
ExperienceID is written as Auto Counter;
Extension is written as Unsigned Integer(32);
EyeColor _name is written as String;
FileCategory_name is written as String(20);
Gender_code is written as Char(1);
GeoRegion_name is written as String(50);
HairColor_name is written as String;
HairLength_name is written as String;
HairShade_name is written as String;
JSON is written as String;
Latitude is written as Real(32);
Login_id is written as Auto Counter;
Longitude is written as Real(32);
MIMEtype is written as String(30);
MediaSource is written as String(250);
Name is written as String(50);
Notes is written as Text;
Occupation is written as String(200);
Office_id is written as Auto Counter;
ParentOrGuardian is written as String(100);
PassPlain is written as String(128);
Password is written as String(50);
PermissionLevelCode is written as String(20) restricted to {'admin', 'applicant', 'employee', 'guardianOfMinor', 'guest', 'minor', 'talent'};
PermissionLevel_code is written as Char restricted to {'admin', 'applicant', 'employee', 'guardianOfMinor', 'minorTalent', 'talent'};
PermissionLevel_nr is written as Unsigned Integer(32);
Permission_code is written as Char(12) restricted to {'delete', 'edit', 'grant', 'read', 'revoke', 'write'};
Person_id is written as Auto Counter;
PhoneNr is written as Unsigned Integer(64);
Phone_id is written as Auto Counter;
PhotoAlbum_id is written as Auto Counter;
Photo_name is written as String(50);
PointOrder is written as Unsigned Integer(32);
ProductOrService_id is written as Auto Counter;
Production_id is written as Auto Counter;
ProficiencyCode is written as Char(20) restricted to {'beginner', 'expert', 'intermediate', 'professional'};
Proficiency_nr is written as Signed Integer(32);
Promotion_code is written as Char(10);
Purchase_id is written as Auto Counter;
Quantity is written as Real(32);
Ranking is written as Unsigned Integer(32);
Role_id is written as Auto Counter;
Stage Name is written as String(70);
State_code is written as Char(2);
Street is written as String(200);
TalentCategory_id is written as Auto Counter;
TalentReview_id is written as Auto Counter;
TalentSubcategory_id is written as Auto Counter;
TimeSpan_id is written as Auto Counter;
Timestamp is written as Auto Time Stamp;
Title is written as String(255);
Training_id is written as Auto Counter;
Username is written as String(30);
Zip is written as Unsigned Integer(32);
cmValue is written as Decimal(10);
kgValue is written as Decimal(2);
sizeValue is written as Decimal(5);

/*
 * Entity Types
 */
Ability is identified by its _id;
Ability has at most one Name;

AbilityCategory is identified by its _id;
Ability is in at most one AbilityCategory,
	AbilityCategory contains Ability;
AbilityCategory has at most one Name;

Address is identified by its _id;
Address is in at most one Zip;
Address has one first-Street;
Address has at most one second-Street;

AgeRange is identified by max-Age and min-Age where
	AgeRange has one max-Age,
	AgeRange has one min-Age;

Agency is identified by its _id;
Agency has at most one Name;

Application is identified by its _id;
Application has one Age;
Application has one ApplicationStatus;
Application has at most one EducationLevel;
Application was referred by at most one MediaSource;
Application has at most one Occupation;
Application lists at most one ParentOrGuardian,
	ParentOrGuardian is shown for Application;
Application has at most one appointment-DateTime;
Application has at most one approval-DateTime;
Application has one creation-Timestamp;
Application has at most one experience-Notes (as Experience);
Application has at most one first-Name;
Application has at most one firstcall-DateTime;
Application has at most one hobbies-Notes (as Hobbies);
Application has at most one last-Name;
Application has at most one referral-Notes (as Referrals);
Application has at most one rejection-DateTime;
Application has at most one talents-Notes (as Talents);

Audition is identified by its _id;
Audition has at most one Title;

AuditionInvitation is identified by its _id;
Audition has AuditionInvitation,
	AuditionInvitation belongs to one Audition;
AuditionInvitation has at most one Notes;

BinaryFile is identified by its _code;
Application has at most one BinaryFile;
BinaryFile has at most one BinaryContents;
BinaryFile has at most one MIMEtype;
BinaryFile has at most one file-Name;

City is identified by its _id;
Address is in one City;
City has one Name;

ContactInfo is identified by its _id;
Application has one ContactInfo;
Audition has at most one ContactInfo;
ContactInfo has at most one Address;
ContactInfo has one EmailAddress;
ContactInfo has at most one Notes;

DressSize is identified by sizeValue where
	DressSize has one sizeValue,
	sizeValue is of at most one DressSize;
Application has at most one DressSize;

EthnicCategory is identified by its _id;
EthnicCategory has one Name;

Ethnicity is identified by its _id;
Ethnicity is in at most one EthnicCategory;
Ethnicity has one Name;

Experience is identified by its ID;
Experience was added on one Timestamp;
Experience had at most one company-Title;
Experience has at most one end-Date;
Experience had at most one production-Title;
Experience had at most one role-Title;
Experience has at most one start-Date;

EyeColor is identified by its _name;
Application has at most one EyeColor;

FileCategory is identified by its _name;
BinaryFile is in at most one FileCategory;

Gender is identified by its _code;
Application has at most one Gender;

GeoPoint is identified by Longitude and Latitude where
	GeoPoint has one Longitude,
	GeoPoint has one Latitude;
Address is at at most one GeoPoint;

GeoRegion is independent identified by its _name;

GeoRegionShape is where
	GeoRegion has GeoPoint in PointOrder;

HairColor is identified by its _name;
Application has at most one HairColor;

HairLength is identified by its _name;

HairShade is identified by its _name;

Height is identified by cmValue where
	Height has one cmValue,
	cmValue is of at most one Height;
Application has at most one Height;

JacketSize is identified by sizeValue where
	JacketSize has one sizeValue,
	sizeValue is of at most one JacketSize;
Application has at most one JacketSize;

Login is identified by its _id;
Login was last used at at most one DateTime (as LastLogin);
Login has one PassPlain;
Login has one Password;
Login was created on one Timestamp (as CreatedOn);
Login has one Username;

Office is identified by its _id;
Agency has Office;
Office is at one Address;
Office is primary office;

Permission is identified by its _code;

PermissionLevel is identified by its _nr;
PermissionLevel has one PermissionLevelCode;

Person is identified by its _id;
Login is for one Person,
	Person has one Login;
Person has at most one ContactInfo;
Person has at most one ContactInfo;
Person has one PermissionLevel;
Person was added on at most one Timestamp (as creationTime);
Person has at most one first-Name;
Person has at most one last-Name;

Phone is identified by its _id;
Application has at most one parentOrGuardian-Phone;
ContactInfo has at most one primary-Phone;
ContactInfo has at most one secondary-Phone;
ContactInfo has at most one tertiary-Phone;
Phone has at most one AreaCode;
Phone has at most one Extension;
Phone has one PhoneNr;
Phone can fax;
Phone can sms;
Phone is home;
Phone is work;

Photo is identified by its _name;
Application has at most one Photo;
Photo is of at most one Person;
Photo has one upload-Timestamp;

PhotoAlbum is identified by its _id;
Person owns PhotoAlbum;

PhotoAlbumHasPhoto is where
	PhotoAlbum has Photo,
	Photo is in PhotoAlbum;

ProductOrService is identified by its _id;
ProductOrService has at most one Description;
ProductOrService has one Name;

Production is identified by its _id;
Production was created on one Timestamp (as CreatedOn);
Production has one Title;

Proficiency is identified by its _nr;
Proficiency has at most one ProficiencyCode;

Promotion is identified by its _code;

Purchase is identified by its _id;
Person made Purchase;
Promotion was applied to Purchase;
Purchase was made on one Timestamp;

Role is identified by its _id;
AuditionInvitation is for at most one Role;
Production has Role,
	Role belongs to one Production;
Role has one Title;

ShoeSize is identified by cmValue where
	ShoeSize has one cmValue,
	cmValue is of at most one ShoeSize;
Application has at most one ShoeSize;

State is identified by its _code;
City is in one State;

Subscription is a kind of ProductOrService [separate];
Person has current-Subscription;
Subscription ends on at most one expiration-Date;
Subscription begins on one start-Date;
Subscription is autorenew;

Talent is a kind of Person [separate];
JSON summarizes Talent,
	Talent has one JSON summary;
Talent can play at most one AgeRange;
Talent is represented by one Agency,
	Agency represents Talent;
Talent came from at most one Application;
Talent wears at most one DressSize;
Talent had Experience,
	Experience was had by one Talent;
Talent has at most one EyeColor;
Talent has at most one Gender;
Talent has at most one HairColor;
Talent has at most one HairLength;
Talent has at most one HairShade;
Talent has at most one Height;
Talent wears at most one JacketSize;
Talent has at most one Notes;
Talent is minor of at most one Person (as parentOrGuardian),
	parentOrGuardian is guardian of Talent;
Talent wears at most one ShoeSize;
Talent has one Stage Name;
Talent was born on one birth-Date;
Talent is active;
Talent is premium member;
Talent is sag eligible;
Talent is sag member;

TalentAuditionInvitation is where
	AuditionInvitation is available for Talent,
	Talent is invited to AuditionInvitation;
TalentAuditionInvitation was accepted on at most one DateTime (as AcceptedOn);
TalentAuditionInvitation was declined on at most one DateTime (as DeclinedOn);

TalentCategory is identified by its _id;
TalentCategory has at most one Description;
TalentCategory has one Name;

TalentProficiency is where
	Talent has Proficiency in Ability;

TalentReview is identified by its _id;
Talent has had at most one TalentReview,
	TalentReview belongs to at least one Talent;

TalentSubcategory is identified by its _id;
Experience was in one TalentSubcategory;
TalentCategory contains TalentSubcategory,
	TalentSubcategory is in one TalentCategory;
TalentSubcategory has at most one Description;
TalentSubcategory has one Name;
TalentSubcategory is publicly viewable;

TalentSubcategoryMatch is where
	Talent is in TalentSubcategory;

TalentSubcategoryQualification is where
	Talent is qualified in TalentSubcategory;

TimeSpan is identified by its _id;
Audition is during TimeSpan;
TimeSpan has at most one end-DateTime;
TimeSpan has one start-DateTime;

Training is identified by its _id;

Training Attendance is where
	Talent attended Training;

Weight is identified by kgValue where
	Weight has one kgValue,
	kgValue is of at most one Weight;
Application has at most one Weight;
Talent has at most one Weight;

ApplicationEthnicity is where
	Application has Ethnicity in one EthnicityAmount (as Amount);

AuditionIsForRole is where
	Audition is for Role;

ContactInfoPermission is where
	Person has Permission for ContactInfo;

EmployeeOrCastingAgent is a kind of Person;
EmployeeOrCastingAgent owns Production,
	Production is owned by at most one EmployeeOrCastingAgent;

EthnicBackground is where
	Talent has Ethnicity in one EthnicityAmount (as Amount);

GeoPointRegions is where
	GeoRegion contains GeoPoint;

LineItem is where
	Purchase was for ProductOrService in one Quantity;

PhotoRanking is where
	Photo of Talent has Ranking in TalentSubcategory;

ProductionPermission is where
	EmployeeOrCastingAgent has Permission for Production;

SubcategoryRanking is where
	Talent in TalentSubcategory is in one Ranking,
	Talent has Ranking in TalentSubcategory;

CastingAgent is a kind of EmployeeOrCastingAgent;

Employee is a kind of EmployeeOrCastingAgent;
Employee works at at most one Agency,
	Agency employs Employee;
Talent is represented by at most one Employee (as Agent),
	Agent is agent of Talent;

EmployeeWorksFromOffice is where
	Employee works from Office;

ProficiencyConfirmation is where
	TalentProficiency was confirmed by Employee on one Timestamp;

/*
 * Constraints:
 */
for each Application at most one of these holds:
	Application has rejection-DateTime,
	Application has approval-DateTime;
for each Talent at most one of these holds:
	Talent is sag member,
	Talent is sag eligible;
for each Talent at most one of these holds:
	Talent wears JacketSize,
	Talent wears DressSize;
for each TalentAuditionInvitation at most one of these holds:
	TalentAuditionInvitation was accepted on DateTime (1),
	TalentAuditionInvitation was declined on DateTime (2);
Application lists ParentOrGuardian
	if and only if
	Application has parentOrGuardian Phone;
Application has approval DateTime
	only if Application has appointment DateTime;
Talent came from Application
	only if Application has approval DateTime;
Application has appointment DateTime
	only if Application has firstcall DateTime;
Person is a Talent and Photo of Talent has Ranking in TalentSubcategory
	only if Photo is of Person;
Photo is in PhotoAlbum
	only if Photo is of Person that owns PhotoAlbum;
AuditionInvitation is for Role
	only if Audition is for Role and Audition has AuditionInvitation;
Photo of Talent has Ranking in TalentSubcategory
	only if Talent is qualified in TalentSubcategory;
Talent in TalentSubcategory is in Ranking
	only if Talent is qualified in TalentSubcategory;
each Application occurs at most one time in
	Talent came from Application;
each ContactInfo occurs at most one time in
	Application has ContactInfo;
each ContactInfo occurs at most one time in
	Person has ContactInfo;
each Name occurs at most one time in
	Ethnicity has Name;
each Office occurs at most one time in
	Agency has Office;
each PermissionLevelCode occurs at most one time in
	PermissionLevel has PermissionLevelCode;
each PhotoAlbum occurs at most one time in
	Person owns PhotoAlbum;
each ProficiencyCode occurs at most one time in
	Proficiency has ProficiencyCode;
each Purchase occurs at most one time in
	Person made Purchase;
each Purchase occurs at most one time in
	Promotion was applied to Purchase;
each Purchase occurs at least one time in
	Purchase was for ProductOrService in Quantity;
each combination Stage Name, Agency occurs at most one time in
	Talent has Stage Name,
	Talent is represented by Agency;
each combination State, Name occurs at most one time in
	City is in State,
	City has Name;
each Subscription occurs at most one time in
	Person has current Subscription;
each combination Talent, Ability occurs one time in
	Talent has Proficiency in Ability;
each combination TalentSubcategory, Talent, Photo occurs one time in
	Photo of Talent has Ranking in TalentSubcategory;
each TimeSpan occurs at most one time in
	Audition is during TimeSpan;
each Username occurs at most one time in
	Login has Username;
