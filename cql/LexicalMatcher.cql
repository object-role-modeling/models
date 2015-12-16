vocabulary LexicalMatcher;

/*
 * Value Types
 */
ColumnOrderPosition_nr is written as Signed Integer(32);
ColumnType is written as String restricted to {'id', 'reading'};
Column_id is written as Auto Counter;
DelimiterString is written as String;
DirectoryPath is written as String;
FileName is written as String;
Machine_name is written as String;
Operation_id is written as Auto Counter;
ParameterName is written as String;
TermReading is written as String;
Term_id is written as Auto Counter;
XMLData is written as String;

/*
 * Entity Types
 */
Column is identified by its _id;
Column is of one ColumnType;

ColumnOrderPosition is identified by its _nr;

Machine is identified by its _name;

Operation is identified by its _id;

Term is identified by its _id;

TermHasTermReading is where
	Term has at least one TermReading;

DataTransform is a kind of Operation;
DataTransform resulted in at most one XMLData;

File is identified by Machine and DirectoryPath and FileName where
	File is on one Machine,
	File is in one DirectoryPath,
	File has one FileName;

InputFile is a kind of File;
InputFile has columns separated by at most one DelimiterString;
Term came from one InputFile;

InputFileHasColumnInColumnOrderPosition is where
	InputFile has Column in one ColumnOrderPosition;

LexicalGroup is a kind of Operation;

LexicalMatch is a kind of Operation;

ManualMatch is a kind of Operation;

XMLDocument is a kind of File;
XMLDocument contains at most one XMLData;

XSLTransform is a kind of File;
DataTransform applied one XSLTransform,
	XSLTransform was used in DataTransform;

XSLParameter is identified by ParameterName and XSLTransform where
	XSLParameter has one ParameterName,
	XSLParameter is for one XSLTransform,
	XSLTransform takes XSLParameter;

DataTransformUsedXMLDataForXSLParameter is where
	DataTransform used XMLData for XSLParameter;

DataTransformUsedXMLDocumentForXSLParameter is where
	DataTransform used XMLDocument for XSLParameter;

/*
 * Constraints:
 */
for each DataTransform, XSLParameter at most one of these holds:
	DataTransform used XMLData for XSLParameter,
	DataTransform used XMLDocument for XSLParameter;
for each File at most one of these holds:
	File is a XSLTransform,
	File is a XMLDocument,
	File is an InputFile;
for each Operation at most one of these holds:
	Operation is a LexicalMatch,
	Operation is a LexicalGroup,
	Operation is a DataTransform,
	Operation is a ManualMatch;
each combination ColumnOrderPosition, InputFile occurs one time in
	InputFile has Column in ColumnOrderPosition;
each combination XSLParameter, DataTransform occurs one time in
	DataTransform used XMLData for XSLParameter;
each combination XSLParameter, DataTransform occurs one time in
	DataTransform used XMLDocument for XSLParameter;
