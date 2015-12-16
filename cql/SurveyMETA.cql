vocabulary NewModel;

/*
 * Value Types
 */
AnswerValue is written as String;
InstructionText is written as String;
OperationCode is written as Char;
OriginName is written as String;
OwnerName is written as String;
QuestionID is written as Auto Counter;
QuestionNr is written as Auto Counter;
QuestionText is written as Auto Counter;
ResponseOptionID is written as Auto Counter;
ResponseQuanity is written as Unsigned Integer(32);
SSN is written as Unsigned Integer(32);
Scale is written as Unsigned Integer(32);
SectionName is written as String;
StyleCode is written as Char;
SurveyName is written as String;
SurveyResponseID is written as Auto Counter;
TopicName is written as String;
Type is written as Auto Counter;
YMD is written as DateTemporal;
typeCode is written as Char;

/*
 * Entity Types
 */
DataType is identified by typeCode where
	DataType has one typeCode,
	typeCode is of at most one DataType;

Date is identified by YMD where
	Date has one YMD,
	YMD is of at most one Date;

Origin is identified by its Name;

Owner is identified by its Name;

Person is identified by SSN where
	Person has one SSN,
	SSN is of at most one Person;

Question is identified by its ID;
Question has at most one InstructionText;
Question has one QuestionNr;
Question has one QuestionText;
Question has one max-ResponseQuanity;
Question has at most one min-ResponseQuanity;

QuestionEquivalence is where
	Question (1) is equivalent to Question (2);

ResponseOption is identified by its ID;
Question has ResponseOption,
	ResponseOption belongs to one Question;
Question is followup to at most one ResponseOption,
	ResponseOption has followup-Question;
ResponseOption has end at most one AnswerValue;
ResponseOption is of at most one DataType;
ResponseOption has at most one Scale;
ResponseOption has at most one text-AnswerValue;

Section is identified by its Name;
Section has at most one InstructionText;
Section contains Question,
	Question is located in at most one Section;

Style is independent identified by its Code;

Survey is identified by its Name;
Survey has one Origin;
Survey has Question,
	Question is on one Survey;
Survey has one Style;
Survey has at most one expiration-Date;
Survey has one start-Date;

SurveyAuthorship is where
	Owner was author of Survey,
	Survey has at least one Owner;

SurveyHasSection is where
	Survey has Section;

SurveyResponse is identified by its ID;
Survey has at most one SurveyResponse,
	SurveyResponse was to Survey;
SurveyResponse was given on one Date;
SurveyResponse was given by at most one Person;

TargetPopulation is identified by Type where
	TargetPopulation has one Type,
	Type is of at most one TargetPopulation;
Survey isintended for at most one TargetPopulation,
	TargetPopulation can take Survey;

Topic is identified by its Name;
Question has at most one Topic;
Survey hasan overall at most one Topic;

TransformOperation is identified by OperationCode where
	TransformOperation has one OperationCode,
	OperationCode is of at most one TransformOperation;

QuestionResponse is where
	SurveyResponse gave ResponseOption;
QuestionResponse has freeform at most one AnswerValue;

ResponseEquivalenceTransform is where
	ResponseOption (1) goes through TransformOperation to get to ResponseOption (2);

/*
 * Constraints:
 */
ResponseOption has Scale
	if and only if
	ResponseOption has end AnswerValue;
ResponseOption has end AnswerValue
	only if ResponseOption has text AnswerValue;
each combination QuestionNr, Survey occurs at most one time in
	Question has QuestionNr,
	Question is on Survey;
each combination QuestionText, Survey occurs at most one time in
	Question has QuestionText,
	Question is on Survey;
each ResponseOption occurs one time in
	ResponseOption goes through TransformOperation to get to ResponseOption;
