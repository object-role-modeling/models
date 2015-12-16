vocabulary Commissions;

/*
 * Value Types
 */
Amount is written as Decimal(10,2);
City_name is written as String(50);
CommissionType_id is written as Auto Counter;
Consultant_id is written as Auto Counter;
Deposit_id is written as Auto Counter;
Description is written as Text;
Name is written as String(50);
OrganizationLevel is written as Signed Integer(32);
Party_id is written as Auto Counter;
Sale_id is written as Auto Counter;
SignupCount is written as Signed Integer(32);
StateName is written as String(50);
State_code is written as Char(5);
TaxRate is written as Decimal(5,5);

/*
 * Entity Types
 */
City is identified by its _name;

CommissionType is identified by its _id;
CommissionType has at most one Description;
CommissionType has one Name;

CommissionTypeRequiresSalesAmountInOrganizationLevel is where
	CommissionType requires sales-Amount in OrganizationLevel;

CommissionTypeRequiresSignupCountInOrganizationLevel is where
	CommissionType requires SignupCount in OrganizationLevel;

Consultant is identified by its _id;
Consultant has at most one first-Name;
Consultant has at most one last-Name;

Coordinator is a kind of Consultant;

Deposit is identified by its _id;

Party is identified by its _id;
Party was held in at most one City;
Party was held by at most one Consultant;
Party used inventory from at most one Coordinator;
Party had at most one TaxRate;

Sale is identified by its _id;
Sale was made at at most one Party;

State is independent identified by its _code;
Party was held in at most one State;
State has at most one StateName;
State has at most one current-TaxRate;

CardTransaction is a kind of Deposit;
CardTransaction was for at most one Party;

CashDeposit is a kind of Deposit;
CashDeposit was for at most one Party;

Check is a kind of Deposit;
Check was for at most one Party;

/*
 * Constraints:
 */
Party was held in State
	only if Party was held in City;
each combination CommissionType, OrganizationLevel occurs one time in
	CommissionType requires SignupCount in OrganizationLevel;
each combination CommissionType, OrganizationLevel occurs one time in
	CommissionType requires sales Amount in OrganizationLevel;
