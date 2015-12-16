vocabulary Microarray;

/*
 * Value Types
 */
Amino Acid_name is written as String(15);
Amount_Number is written as Real(64);
Batch_id is written as Auto Counter;
Biomaterial Type_id is written as Auto Counter;
Biomatter Sample_id is written as Auto Counter;
Biomatter_id is written as Auto Counter;
Datetime is written as Date Time;
Gene_name is written as String(128);
Grant_id is written as Auto Counter;
Institution_name is written as String;
Manufacturer_name is written as String;
MetaColumn is written as Unsigned Integer(32);
MetaRow is written as Unsigned Integer(32);
Metabolite_name is written as String;
Microarray Type_id is written as Auto Counter;
Microarray_id is written as Auto Counter;
ModelNr is written as String(100);
OrganismName is written as String(120);
Organism Type_id is written as Auto Counter;
PhysicalColumn is written as Unsigned Integer(32);
PhysicalRow is written as Unsigned Integer(32);
Polypeptide_name is written as String;
Probe_name is written as String(128);
Protein_name is written as String;
ResearchGroup_id is written as Auto Counter;
Researcher_id is written as Auto Counter;
SIName is written as String(50);
Study_id is written as Auto Counter;
Subject_id is written as Auto Counter;
Taxonomy_name is written as String(50);
Test_name is written as String(128);
Testing Lab_name is written as String;
Testing Substrate_id is written as Auto Counter;
TrackingID is written as Auto Counter;
URL is written as Text;
type is written as String(10);

/*
 * Entity Types
 */
Batch is identified by its _id;

Biomaterial Type is identified by its _id;

Biomatter is identified by its _id;
Biomatter is of one Biomaterial Type;
Biomatter was taken on one Datetime;

Biomatter Sample is a kind of Biomatter identified by its _id;
Biomatter (as ParentSample) is source of Biomatter Sample,
	Biomatter Sample came from at most one ParentSample;
Biomatter Sample is assigned at most one TrackingID;

Gene is identified by its _name;

Grant is identified by its _id;

Institution is identified by its _name;
Grant was given by at most one Institution,
	Institution sponsored Grant;

Manufacturer is identified by its _name;

Metabolite is identified by its _name;

Microarray is identified by its _id;
Batch has Microarray,
	Microarray is part of at most one Batch;
Microarray is assigned at most one TrackingID;

Microarray Type is identified by its _id;
Manufacturer makes Microarray Type;
Microarray is of at most one Microarray Type;
Microarray Type has at most one ModelNr;

Organism Type is identified by its _id;

Protein is identified by its _name;

ResearchGroup is identified by its _id;

Researcher is identified by its _id;
Biomatter was taken by at most one Researcher;

Study is identified by its _id;
Study is conducted by at most one ResearchGroup;

Subject is independent identified by its _id;
Subject is source of Biomatter,
	Biomatter came from one Subject;
Subject is of at most one Organism Type;

Taxonomy is identified by its _name;
OrganismName is in one Taxonomy;
Taxonomy has at most one home-URL;

Test is identified by its _name;
Test is for at most one Gene;
Test is for at most one Metabolite;
Test is for at most one Protein;

Testing Lab is identified by its _name;
Batch was sent to at most one Testing Lab for analysis,
	Testing Lab analyzed Batch;

Testing Substrate is identified by its _id;
Test has at most one Testing Substrate;

Unit is identified by SIName where
	Unit has one SIName,
	SIName is of at most one Unit;

Amount is identified by Amount_Number and Unit where
	Amount is measured in one Amount_Number,
	Amount is of one Unit;
Biomatter has at most one original-Amount;

Feature is identified by PhysicalRow and PhysicalColumn and Microarray Type where
	Feature is at one PhysicalRow,
	Feature is at one PhysicalColumn,
	Microarray Type has Feature;
Feature is at at most one MetaColumn;
Feature is at at most one MetaRow;
Feature conducts at most one Test;

GrantAward is where
	Study is funded by Grant;
GrantAward began on at most one Datetime;
GrantAward ended on at most one Datetime;

InstitutionIsInResearchGroup is where
	Institution is in ResearchGroup;

OrganismTypeHasOrganismNameInTaxonomy is where
	Organism Type has OrganismName in Taxonomy;

/*
 * Constraints:
 */
for each Test at most one of these holds:
	Test is for Gene,
	Test is for Protein,
	Test is for Metabolite;
for each TrackingID at most one of these holds:
	Microarray is assigned TrackingID,
	Biomatter Sample is assigned TrackingID;
Organism Type has OrganismName in Taxonomy
	only if OrganismName is in Taxonomy;
each Feature occurs one time in
	Microarray Type has Feature;
each combination Manufacturer, ModelNr occurs at most one time in
	Manufacturer makes Microarray Type,
	Microarray Type has ModelNr;
each combination MetaRow, MetaColumn occurs at most one time in
	Feature is at MetaRow,
	Feature is at MetaColumn;
each Microarray Type occurs at most one time in
	Manufacturer makes Microarray Type;
each combination Organism Type, Taxonomy occurs one time in
	Organism Type has OrganismName in Taxonomy;
each Test occurs at least one time in
	Test is for Gene,
	Test is for Protein,
	Test is for Metabolite;
each TrackingID occurs at most one time in
	Biomatter Sample is assigned TrackingID;
each TrackingID occurs at most one time in
	Microarray is assigned TrackingID;
