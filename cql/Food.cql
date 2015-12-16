vocabulary Food;

/*
 * Value Types
 */
Description is written as String(512);
Ingredient_id is written as Auto Counter;
Instruction is written as String(512);
MeasuringUnit_name is written as String;
Name is written as String(255);
Notes is written as Text;
Quantity is written as Decimal(8,2);
Recipe_id is written as Auto Counter;
SequenceNr is written as Unsigned Integer(16);
Step_id is written as Auto Counter;

/*
 * Entity Types
 */
Ingredient is identified by its _id;
Ingredient has one Name;

MeasuringUnit is identified by its _name;
MeasuringUnit is si;
MeasuringUnit is unitless;
MeasuringUnit measures area;
MeasuringUnit measures length;
MeasuringUnit measures mass;
MeasuringUnit measures temperature;
MeasuringUnit measures time;
MeasuringUnit measures volume;

Recipe is identified by its _id;
Recipe has at most one Description;
Recipe has one Name;
Recipe has at most one Notes;

Step is identified by its _id;
Step has at most one Instruction;

Amount is identified by Quantity and MeasuringUnit where
	Amount has one Quantity,
	Amount is measured in one MeasuringUnit;

RecipeSteps is where
	Recipe has Step in SequenceNr;

StepIngredients is where
	Step uses Ingredient in one Amount;

/*
 * Constraints:
 */
for each MeasuringUnit exactly one of these holds:
	MeasuringUnit measures mass,
	MeasuringUnit measures length,
	MeasuringUnit measures area,
	MeasuringUnit measures volume,
	MeasuringUnit measures temperature,
	MeasuringUnit measures time,
	MeasuringUnit is unitless;
each combination Recipe, SequenceNr occurs one time in
	Recipe has Step in SequenceNr;
