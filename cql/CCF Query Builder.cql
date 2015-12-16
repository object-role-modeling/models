vocabulary CCF Query Builder;

/*
 * Value Types
 */
ColumnName is written as String;
Column_id is written as Auto Counter;
DataType is written as String(20);
Description is written as Text;
Folder_name is written as String;
Literal is written as String;
Operator_name is written as String;
OrderNr is written as Unsigned Integer(32);
QueryComponentCondition_id is written as Auto Counter;
QueryComponent_id is written as Auto Counter;
ReportColumn_id is written as Auto Counter;
ReportName is written as String(200);
Report_id is written as Auto Counter;
Table_id is written as Auto Counter;
User_id is written as Auto Counter;

/*
 * Entity Types
 */
Column is identified by its _id;
Column has one ColumnName,
	ColumnName is of Column;
Column has one DataType;

Folder is identified by its _name;
Folder is in at most one OrderNr;

MetaColumn is a kind of Column;

Operator is identified by its _name;

PhysicalColumn is a kind of Column;

QueryComponent is identified by its _id;

QueryComponentCondition is identified by its _id;
QueryComponent has QueryComponentCondition;
QueryComponentCondition uses at most one Operator;
QueryComponentCondition has at most one left-Column;
QueryComponentCondition has at most one right-Column;
QueryComponentCondition has at most one right-Literal;

QueryComponentHasColumn is where
	QueryComponent has Column;

Report is identified by its _id;
Folder contains Report,
	Report is in at most one Folder;
Report has at most one Description;
Report is in at most one OrderNr;
Report has one ReportName;

ReportColumn is identified by its _id;
ReportColumn is in at most one OrderNr;
ReportColumn is in one Report;

ReportColumnHasQueryComponent is where
	ReportColumn has QueryComponent,
	QueryComponent is used in ReportColumn;

Table is identified by its _id;
Column is in one Table,
	Table has Column;

User is identified by its _id;
Folder belongs to at most one User,
	Folder owns User;
User owns Report,
	Report belongs to at most one User;

MetaTable is a kind of Table;

PhysicalTable is a kind of Table;

QueryComponentReferencesTable is where
	QueryComponent references Table;

/*
 * Constraints:
 */
for each Column at most one of these holds:
	Column is a PhysicalColumn,
	Column is a MetaColumn;
for each QueryComponentCondition at most one of these holds:
	QueryComponentCondition has right-Column,
	QueryComponentCondition has right-Literal;
for each Table at most one of these holds:
	Table is a PhysicalTable,
	Table is a MetaTable;
each combination ColumnName, Table occurs at most one time in
	Column has ColumnName,
	Column is in Table;
each QueryComponentCondition occurs at most one time in
	QueryComponent has QueryComponentCondition;
