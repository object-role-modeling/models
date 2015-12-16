vocabulary CateringItems;

/*
 * Value Types
 */
Cost is written as Money;
Description is written as String(1000);
Filename is written as String(100);
Food_id is written as Auto Counter;
Item_id is written as Auto Counter;
Name is written as String;
Servings is written as Unsigned Integer(16);
Time is written as Time;

/*
 * Entity Types
 */
Food is identified by its _id;
Food has at most one Description;
Food has at most one Name;
Food has at most one Servings;
Food takes at most one batch-Time;
Food takes at most one individual-Time;
Food has at most one ingredient-Cost;
Food takes at most one passive-Time;
Food has at most one servingprep-Time;
Food has at most one special-Cost;
Food has max at most one storage-Time;

Item is identified by its _id;
Item has at most one Cost;
Item has at most one Description;
Item has at most one Name;

Photo is identified by Filename where
	Photo has one Filename,
	Filename is of at most one Photo;
Food has Photo,
	Photo is of at most one Food;

FoodItems is where
	Food requires Item,
	Item is used for Food;

