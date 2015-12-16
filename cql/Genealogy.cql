vocabulary Genealogy;

/*
 * Value Types
 */
BranchNr is written as Unsigned Integer(32);
Chromosome_nr is written as Signed Integer(32);
Gender_code is written as Char;
Gene_name is written as String;
Genetic Heritage Group_id is written as Auto Counter;
HierarchyTree_name is written as String;
InferredRelationship_id is written as Auto Counter;
LifeStage_id is written as Auto Counter;
Order is written as Unsigned Integer(32);
OrganismType_id is written as Auto Counter;
Organism_id is written as Auto Counter;
Person_id is written as Auto Counter;
QueryText is written as Text;
RelationshipType_id is written as Auto Counter;
RoleTraversal_name is written as String;
Role_id is written as Auto Counter;
StoredRelationship_id is written as Auto Counter;

/*
 * Entity Types
 */
Gender is identified by its _code restricted to {'asexual', 'female', 'hermaphrodite', 'male'};

Genetic Heritage Group is identified by its _id;
Genetic Heritage Group is clone;

HierarchyTree is identified by its _name;

InferredRelationship is identified by its _id;

LifeStage is identified by its _id;

Organism is identified by its _id;
Genetic Heritage Group produced Organism,
	Organism shares at most one Genetic Heritage Group;
Genetic Heritage Group has at most one maternal-Organism;
Genetic Heritage Group has at most one paternal-Organism;
Organism has at most one Gender;
Organism is known;

OrganismType is identified by its _id;
Organism is of one OrganismType;

Person is a kind of Organism;

PersonMarriedPerson is where
	Person (1) married Person (2) [symmetric, irreflexive];

PersonPassesThroughLifeStageInOrder is where
	Person passes through LifeStage in Order;

RelationshipType is identified by its _id;

Role is identified by its _id;

RoleTraversal is identified by its _name;

StoredRelationship is identified by its _id;
StoredRelationship is of one RelationshipType;

TreeNode is identified by left-BranchNr and right-BranchNr and HierarchyTree where
	TreeNode has one left-BranchNr,
	TreeNode has one right-BranchNr,
	TreeNode is in one HierarchyTree;
OrganismType is in one TreeNode;

OrganismPlaysRoleInStoredRelationship is where
	Organism plays Role in StoredRelationship;

RoleIsEquivalentToRoleInRoleTraversal is where
	Role (1) is equivalent to Role (2) in RoleTraversal;

/*
 * Constraints:
 */
each combination Organism, StoredRelationship occurs one time in
	Organism plays Role in StoredRelationship;
each combination Person, Order occurs one time in
	Person passes through LifeStage in Order;
