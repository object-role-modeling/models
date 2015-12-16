vocabulary calendar;

/*
 * Value Types
 */
AdministrativeOverlay_id is written as Auto Counter;
Appointment_id is written as Auto Counter;
ArrivalStatus is written as String(20);
Description is written as String;
Location_id is written as Auto Counter;
Month_nr is written as Unsigned Integer(32);
Note is written as Text;
RecurranceInterval is written as Unsigned Integer(32) restricted to {1..14};
RecurranceSchedule_id is written as Auto Counter;
RecurranceType is written as String(10) restricted to {'daily', 'monthly', 'weekly', 'yearly'};
Resource_id is written as Auto Counter;
Weekday_nr is written as Unsigned Integer(32);
date is written as DateTemporal;
fk is written as Auto Counter;
utc is written as Date Time;

/*
 * Entity Types
 */
AdministrativeOverlay is identified by its _id;
AdministrativeOverlay has at most one Description;
AdministrativeOverlay forbids appointments;
AdministrativeOverlay is all day;

Appointment is identified by its _id;
Appointment (as replacement) replaces at most one Appointment (as rescheduledAppointment) [acyclic, intransitive];
Appointment has at most one ArrivalStatus;
Appointment has at most one Description;
Appointment has at most one Note;
Appointment is all day;

Date is identified by date where
	Date has one date,
	date is of at most one Date;
Appointment instantiates recurrance on at most one Date;

DateTime is identified by utc where
	DateTime has one utc,
	utc is of at most one DateTime;
AdministrativeOverlay ends at at most one DateTime (as endTime);
AdministrativeOverlay starts at at most one DateTime (as startTime);
Appointment ends at at most one DateTime (as endTime);
Appointment starts at at most one DateTime (as startTime);

Location is independent identified by its _id;
Appointment is at at most one Location;

Month is identified by its _nr;

RecurranceSchedule is identified by its _id;
AdministrativeOverlay has RecurranceSchedule,
	RecurranceSchedule is based on at most one AdministrativeOverlay;
Appointment is instance of at most one RecurranceSchedule;
RecurranceSchedule is at at most one Location;
RecurranceSchedule has at most one Note;
RecurranceSchedule has at most one RecurranceInterval;
RecurranceSchedule (as replacement) replaces at most one RecurranceSchedule (as replacedSchedule) [acyclic, intransitive];
RecurranceSchedule has one RecurranceType;
RecurranceSchedule has at most one end-Date (as endDate);
RecurranceSchedule has one start-Date (as startDate);

Resource is independent identified by its _id;

User is independent identified by fk where
	User has one fk,
	fk is of at most one User;

Weekday is identified by its _nr;

WeeklyRecurrance is a kind of RecurranceSchedule;

WeeklyRecurranceIsOnWeekday is where
	WeeklyRecurrance is on Weekday;

YearlyRecurrance is a kind of RecurranceSchedule;
YearlyRecurrance is in at most one Month;

AppointmentIsWithResource is where
	Appointment is with at least one Resource;

AppointmentIsWithUser is where
	Appointment is with User;

DailyRecurrance is a kind of RecurranceSchedule;

MonthlyRecurrance is a kind of RecurranceSchedule;
MonthlyRecurrance is on at most one Weekday;
MonthlyRecurrance is by _date;
MonthlyRecurrance is by day in month;

RecurranceScheduleIsWithResource is where
	RecurranceSchedule is with at least one Resource;

RecurranceScheduleIsWithUser is where
	RecurranceSchedule is with User;

/*
 * Constraints:
 */
either AdministrativeOverlay is all day or AdministrativeOverlay starts at DateTime but not both;
either Appointment is all day or Appointment starts at DateTime but not both;
either MonthlyRecurrance is by _date or MonthlyRecurrance is by day in month but not both;
either RecurranceSchedule is based on AdministrativeOverlay or Appointment is instance of RecurranceSchedule but not both;
for each RecurranceSchedule exactly one of these holds:
	RecurranceSchedule is a YearlyRecurrance,
	RecurranceSchedule is a MonthlyRecurrance,
	RecurranceSchedule is a WeeklyRecurrance,
	RecurranceSchedule is a DailyRecurrance;
for each MonthlyRecurrance at most one of these holds:
	MonthlyRecurrance is by _date,
	MonthlyRecurrance is on Weekday;
AdministrativeOverlay starts at DateTime(2)
	if and only if
	AdministrativeOverlay ends at DateTime(1);
Appointment is instance of RecurranceSchedule
	if and only if
	Appointment instantiates recurrance on Date;
Appointment starts at DateTime(2)
	if and only if
	Appointment ends at DateTime(1);
MonthlyRecurrance is on Weekday
	if and only if
	MonthlyRecurrance is by day in month;
each Appointment(1) occurs at most one time in
	Appointment(2) replaces Appointment(1);
each RecurranceSchedule(1) occurs at most one time in
	RecurranceSchedule(2) replaces RecurranceSchedule(1);
