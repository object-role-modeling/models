vocabulary MIAME schema from Chris Stoeckert;

/*
 * Value Types
 */
Agent_id is written as Auto Counter;
AlternateIdentifier_id is written as Auto Counter;
Anatomy_id is written as Auto Counter;
Clone_id is written as Auto Counter;
Cluster_id is written as Auto Counter;
Description is written as Text;
DevelopmentalStage_id is written as Auto Counter;
Dimension_nr is written as Signed Integer(32);
ElementType is written as String(10) restricted to {'cDNA', 'clone', 'genomic', 'oligo'};
Element_id is written as Auto Counter;
ExperimentGroup_id is written as Auto Counter;
Experiment_id is written as Auto Counter;
GeneSet_id is written as Auto Counter;
Genotype_id is written as Auto Counter;
Identifier_id is written as Auto Counter;
Manufacturer_name is written as String;
MatchSet_id is written as Auto Counter;
MismatchSet_id is written as Auto Counter;
Organism_id is written as Auto Counter;
Pathology_id is written as Auto Counter;
Position is written as Unsigned Integer(32);
Protocol_id is written as Auto Counter;
Sample_id is written as Auto Counter;
Sequence is written as Text;
SequenceCoverage_id is written as Auto Counter;
Spot_id is written as Auto Counter;
Study_id is written as Auto Counter;
Treatment_id is written as Auto Counter;
TypeNr is written as Unsigned Integer(32);
URL is written as Text;
Version is written as Decimal;

/*
 * Entity Types
 */
Agent is identified by its _id;
Agent is static;
Agent is variable;

AlternateIdentifier is identified by its _id;
AlternateIdentifier is sequence-verified;

Anatomy is identified by its _id;

Array is identified by TypeNr where
	Array has one TypeNr,
	TypeNr is of at most one Array;
Array has at most one Version;

BiologicalAgent is a kind of Agent;
BiologicalAgent has at most one Description;

ChemicalAgent is a kind of Agent;

Clone is identified by its _id;
AlternateIdentifier has at most one Clone;

Cluster is identified by its _id;
AlternateIdentifier has at most one Cluster;

DevelopmentalStage is identified by its _id;

Dimension is identified by its _nr;

Element is identified by its _id;
Element has at most one Description;
Element has at most one ElementType;
Element is good;

Experiment is identified by its _id;
Experiment (1) references at most one Experiment (2),
	Experiment (2) is reference for Experiment (1);

ExperimentGroup is identified by its _id;
ExperimentGroup (1) repeats sample of at most one ExperimentGroup (2);
ExperimentGroup is age-ordered;
ExperimentGroup is factor-ordered;
ExperimentGroup is response-ordered;

GeneSet is identified by its _id;
GeneSet has at most one Description;

GeneSetHasElement is where
	GeneSet has Element;

Genotype is identified by its _id;

Identifier is identified by its _id;
GeneSet has at most one Identifier;

LithographicArray is a kind of Array;

Manufacturer is identified by its _name;
Array was made by at most one Manufacturer;

MatchSet is identified by its _id;

MeSH Term is identified by URL where
	MeSH Term has one URL,
	URL is of at most one MeSH Term;
BiologicalAgent has at most one MeSH Term;

MedlineReference is identified by URL where
	MedlineReference has one URL,
	URL is of at most one MedlineReference;

MerckIndex is identified by URL where
	MerckIndex has one URL,
	URL is of at most one MerckIndex;
ChemicalAgent is in one MerckIndex;

MismatchSet is identified by its _id;

Organism is identified by its _id;

Pathology is identified by its _id;

PhysicalAgent is a kind of Agent;
PhysicalAgent has one Description;

ProbeElement is a kind of Element;
MismatchSet has at most one ProbeElement;
ProbeElement has one Sequence;

ProbeSet is a kind of GeneSet;
ProbeSet has at most one MatchSet;
ProbeSet has at most one MismatchSet;

Protocol is identified by its _id;
Manufacturer has Protocol;
Protocol is a at most one MedlineReference;

Sample is identified by its _id;

SequenceCoverage is identified by its _id;
GeneSet has at most one SequenceCoverage;
SequenceCoverage is of at most one Identifier;
SequenceCoverage ends at at most one Position;
SequenceCoverage starts at at most one Position;
SequenceCoverage is complete;

Spot is a kind of Element;
Spot has at most one SequenceCoverage;

SpotSet is a kind of GeneSet;
SpotSet has at most one AlternateIdentifier;

SpotSetHasSpot is where
	SpotSet has Spot;

SpottedArray is a kind of Array;
SpottedArray has at most one first-Dimension;
SpottedArray has at most one second-Dimension;

SpottedArrayHasSpotSet is where
	SpottedArray has SpotSet;

Study is identified by its _id;
Study conducted ExperimentGroup;

Treatment is identified by its _id;
Sample underwent at most one Treatment;
Treatment has at most one MedlineReference;

TreatmentHasAgent is where
	Treatment has Agent;

ExperimentBelongsToExperimentGroup is where
	Experiment belongs to ExperimentGroup;

ExperimentHasSample is where
	Experiment has Sample;

LithographicArrayHasProbeSet is where
	LithographicArray has ProbeSet;

MatchSetHasProbeElement is where
	MatchSet has ProbeElement;

/*
 * Constraints:
 */
for each Agent at most one of these holds:
	Agent is variable,
	Agent is static;
for each Agent at most one of these holds:
	Agent is a ChemicalAgent,
	Agent is a PhysicalAgent,
	Agent is a BiologicalAgent;
for each AlternateIdentifier at most one of these holds:
	AlternateIdentifier has Clone,
	AlternateIdentifier has Cluster;
for each BiologicalAgent at most one of these holds:
	BiologicalAgent has Description,
	BiologicalAgent has MeSH Term;
for each ExperimentGroup at most one of these holds:
	ExperimentGroup is factor-ordered,
	ExperimentGroup is response-ordered,
	ExperimentGroup is age-ordered;
for each SequenceCoverage at most one of these holds:
	SequenceCoverage is complete,
	SequenceCoverage starts at Position;
SequenceCoverage starts at Position(2)
	only if SequenceCoverage ends at Position(1);
either Agent is variable or Agent is static;
each Agent occurs at least one time in
	ChemicalAgent is a kind of Agent,
	PhysicalAgent is a kind of Agent,
	BiologicalAgent is a kind of Agent;
either BiologicalAgent has Description or BiologicalAgent has MeSH Term;
each ExperimentGroup occurs at most one time in
	Study conducted ExperimentGroup;
each combination Version, Manufacturer occurs at most one time in
	Array has Version,
	Array was made by Manufacturer;
