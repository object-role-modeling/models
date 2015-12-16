vocabulary ContentManagement;

/*
 * Value Types
 */
ContentBlock_id is written as Auto Counter;
Page_id is written as Auto Counter;
Path is written as String(255);
PermissionLevel_nr is written as Signed Integer(32);
TextBlock is written as Text;

/*
 * Entity Types
 */
ContentBlock is identified by its _id;
ContentBlock has at most one TextBlock;

Page is identified by its _id;
Page is at one Path;

PageContainsContentBlock is where
	Page contains ContentBlock;

PermissionLevel is identified by its _nr;
ContentBlock has at most one edit-PermissionLevel;
ContentBlock has at most one read-PermissionLevel;
ContentBlock has at most one write-PermissionLevel;

/*
 * Constraints:
 */
each Path occurs at most one time in
	Page is at Path;
