vocabulary LabModel;

/*
 * Value Types
 */
ActivityRole_name is written as String;
BiologicalEntity_id is written as Auto Counter;
BiologicalStructure_id is written as Auto Counter;
BiologicalSubstance_id is written as Auto Counter;
ChemicalFormula_id is written as Auto Counter;
ChemicalSubstance_id is written as Auto Counter;
DateTime is written as Date Time;
Doctor_id is written as Auto Counter;
Element_nr is written as Signed Integer(32);
LabTech_id is written as Auto Counter;
Location_id is written as Auto Counter;
Patient_id is written as Auto Counter;
Person_id is written as Unsigned Integer(32);
Quantity_nr is written as Signed Integer(32);
SIUnitType is written as String restricted to {'Amount', 'Current', 'Length', 'Luminosity', 'Mass', 'Temperature', 'Time'};
SIUnit_name is written as String;
SpecimenType_name is written as String;
Specimen_id is written as Auto Counter;
Terminology_id is written as Auto Counter;
TestBattery_id is written as Auto Counter;
TestName is written as String;
TestResult_id is written as Auto Counter;
TestType_id is written as Auto Counter;
TimeOrPeriod_id is written as Auto Counter;
UnitFormulation_id is written as Auto Counter;
type is written as String;

/*
 * Entity Types
 */
ActivityRole is identified by its _name restricted to {'doctor', 'lab tech', 'patient'};

BiologicalEntity is identified by its _id;

BiologicalStructure is identified by its _id;

BiologicalSubstance is identified by its _id;

ChemicalFormula is identified by its _id;

ChemicalSubstance is identified by its _id;

Element is identified by its _nr;

Location is identified by its _id;

Person is identified by its _id;

Quantity is identified by its _nr;

SIUnit is independent identified by its _name;
SIUnit is of at most one SIUnitType;

Shape is identified by type where
	Shape has one type restricted to {'left', 'right'},
	type is of at most one Shape;

Specimen is identified by its _id;
Specimen was drawn from at most one BiologicalEntity;
Specimen was taken at at most one Location;

SpecimenType is identified by its _name restricted to {'blood', 'pate', 'urine'};
Specimen is of one SpecimenType;

Terminology is identified by its _id;

TestBattery is identified by its _id;

TestBatteryIsCalledByTestNameInTerminology is where
	TestBattery is called by TestName in Terminology;

TestResult is identified by its _id;
Specimen was used in TestResult;

TestType is identified by its _id;
TestResult is of one TestType;
TestType observes at most one BiologicalStructure;
TestType measures at most one BiologicalSubstance;
TestType measures at most one ChemicalSubstance;

TimeOrPeriod is identified by its _id;
Specimen was taken at one TimeOrPeriod;
TimeOrPeriod has at most one end-DateTime (as endTime);
TimeOrPeriod has one start-DateTime (as startTime);

UnitFormulation is identified by its _id;
TestType is measured in at most one UnitFormulation;
UnitFormulation is in one SIUnit;

ActorInstance is where
	Person acted in ActivityRole during one TimeOrPeriod;

ChemicalFormulaContainsElementInQuantity is where
	ChemicalFormula contains Element in one Quantity;

ChemicalSubstanceHasChemicalFormulaWithShape is where
	ChemicalSubstance has ChemicalFormula with Shape;

Doctor is a kind of ActorInstance identified by its _id;

LabTech is a kind of ActorInstance identified by its _id;
Specimen was drawn by at most one LabTech;

Measurement is identified by UnitFormulation and Quantity where
	Measurement is in one UnitFormulation,
	Measurement has one Quantity;
TestResult recorded at most one Measurement;

Patient is a kind of ActorInstance identified by its _id;
Patient was extract source for BiologicalEntity;
Specimen was drawn from at most one Patient;
TestResult is for at most one Patient;

TestBatteryContainsTestType is where
	TestBattery contains at least one TestType,
	TestType is in TestBattery;

/*
 * Constraints:
 */
either Specimen was drawn from BiologicalEntity or Specimen was drawn from Patient but not both;
for each TestType exactly one of these holds:
	TestType measures ChemicalSubstance,
	TestType measures BiologicalSubstance,
	TestType observes BiologicalStructure;
each BiologicalEntity occurs one time in
	Patient was extract source for BiologicalEntity;
each combination DateTime(1), DateTime(2) occurs at most one time in
	TimeOrPeriod has start DateTime(1),
	TimeOrPeriod has end DateTime(2);
each combination Shape, ChemicalFormula occurs one time in
	ChemicalSubstance has ChemicalFormula with Shape;
each combination Terminology, TestBattery occurs one time in
	TestBattery is called by TestName in Terminology;
each combination Terminology, TestName occurs one time in
	TestBattery is called by TestName in Terminology;
each TestBattery occurs at least one time in
	TestBattery is called by TestName in Terminology;
each TestResult occurs at most one time in
	Specimen was used in TestResult;
each combination TimeOrPeriod, Person occurs one time in
	Person acted in ActivityRole during TimeOrPeriod;
