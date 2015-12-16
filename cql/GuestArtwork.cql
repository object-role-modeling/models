vocabulary GuestArtwork;

/*
 * Value Types
 */
Art_id is written as Auto Counter;
Date is written as Unspecified;
Party_id is written as Auto Counter;
Person_name is written as String;

/*
 * Entity Types
 */
Art is identified by its _id;

Party is identified by its _id;

Person is identified by its _name;

PersonMadeArt is where
	Person made Art,
	Art was made by Person;

Souvenir Art is a kind of Art;

Guest is a kind of Person;

Host is a kind of Person;

HostDislikesSouvenirArt is where
	Host dislikes Souvenir Art;

HostLikesSouvenirArt is where
	Host likes Souvenir Art;

PartyContainsGuest is where
	Party contains Guest,
	Guest is a member of at least one and at most 2 Party;

SouvenirArtWasMadeByGuest is where
	Souvenir Art was made by one Guest,
	Guest made Souvenir Art;

Visit is where
	Party stays with Host,
	Host hosts Party;
Souvenir Art was made during one Visit;
Visit ends on one end-Date;
Visit begins on one start-Date;

/*
 * Constraints:
 */
for each Host at most one of these holds:
	Host dislikes Souvenir Art (1),
	Host likes Souvenir Art (2);
Person is a Guest that made Souvenir Art that is a kind of Art(2)
	only if Person made Art(1);
each combination Host, Date(1), Date(2) occurs at most one time in
	Host hosts Party,
	Visit begins on start Date(1),
	Visit ends on end Date(2);
