# MySchoolSask Integrations
This git repository represents work and research done for the purpose of creating export definitions for MySchoolSask (an implementation of Follett Aspen).

# Using this repository

- The __AspenNotes__ directory contains some general notes on how Aspen handles things like special variables for filters.

- The __ExportToolXMLs__ directory contains XML files to be used when creating an export definition in Aspen/MySchoolSask. They are organized into folders by vendor or product.

- The __Howto__ directory contains instructions for end-users on how to install an export XML file

- The __ReplicatedDatabaseSQLExports__ directory contains SQL queries to be used to generate reports from the Replicated/Reporting SQL database. Access to this database is an extra cost over-and-above MSS licensing, but Aspen's XML based export tool has limitations and some exports are not possible without direct SQL access.

- The __VendorDocumentation__ directory contains documents and/or links to vendor integration file specifications

# Documentation
  - [How to install an XML file from this repository](HowTo/HowToInstallAnExportXML.md)
  - [How to set an export to run automatically on a schedule](HowTo/HowToRunAnExportAutomatically.md)
  - [How to run an export manually](HowTo/HowToRunAnExportManually.md)

# Integrations in this repository
## Export Tool XML Files
- Active Directory
  - __Note__: Everyone's Active Directory implementation will be different, so this file may not be suitable for the way your organization handles AD integration now. You may need to change/add/remove fields, or reconfigure your existing identity system or scripts for these exports to work. 
  - [AD Active Students](ExportToolXMLs/ActiveDirectory/AD-ActiveStudents.xml)
  - [AD Withdrawn Students](ExportToolXMLs/ActiveDirectory/AD-WithdrawnStudents.xml)
- Clever
  - [Clever - Enrollments](ExportToolXMLs/Clever/Clever-Enrollments.xml)
  - [Clever - Schools](ExportToolXMLs/Clever/Clever-Schools.xml)
  - [Clever - Sections](ExportToolXMLs/Clever/Clever-Sections.xml)
  - [Clever - Staff](ExportToolXMLs/Clever/Clever-Staff.xml)
  - [Clever - Students](ExportToolXMLs/Clever/Clever-Students.xml)
  - [Clever - Teachers](ExportToolXMLs/Clever/Clever-Teachers.xml)
- Clevr - With hard-coded Tenant IDs (that you must set in the XML file)
  - [Classes](ExportToolXMLs/Clevr/HardCodedClevrTenantID/ClevrClasses.xml)
  - [Locations](ExportToolXMLs/Clevr/HardCodedClevrTenantID/ClevrLocations.xml)
  - [School Demographics](ExportToolXMLs/Clevr/HardCodedClevrTenantID/ClevrSchoolDemographics.xml)
  - [Staff](ExportToolXMLs/Clevr/HardCodedClevrTenantID/ClevrStaff.xml)
  - [Staff Classes](ExportToolXMLs/Clevr/HardCodedClevrTenantID/ClevrStaffClasses.xml)
  - [Staff Demographics](ExportToolXMLs/Clevr/HardCodedClevrTenantID/ClevrStaffDemographics.xml)
  - [Student Classes](ExportToolXMLs/Clevr/HardCodedClevrTenantID/ClevrStudentClasses.xml)
  - [Student Demographics](ExportToolXMLs/Clevr/HardCodedClevrTenantID/ClevrStudentDemographics.xml)
  - [Students](ExportToolXMLs/Clevr/HardCodedClevrTenantID/ClevrStudents.xml)
- Clevr - Pull the tenant ID from the MSS database (must exist or school is ignored)
  - [Classes](ExportToolXMLs/Clevr/PullClevrTenantIDFromDatabase/ClevrClasses.xml)
  - [Locations](ExportToolXMLs/Clevr/PullClevrTenantIDFromDatabase/ClevrLocations.xml)
  - [School Demographics](ExportToolXMLs/Clevr/PullClevrTenantIDFromDatabase/ClevrSchoolDemographics.xml)
  - [Staff](ExportToolXMLs/Clevr/PullClevrTenantIDFromDatabase/ClevrStaff.xml)
  - [Staff Classes](ExportToolXMLs/Clevr/PullClevrTenantIDFromDatabase/ClevrStaffClasses.xml)
  - [Staff Demographics](ExportToolXMLs/Clevr/PullClevrTenantIDFromDatabase/ClevrStaffDemographics.xml)
  - [Student Classes](ExportToolXMLs/Clevr/PullClevrTenantIDFromDatabase/ClevrStudentClasses.xml)
  - [Student Demographics](ExportToolXMLs/Clevr/PullClevrTenantIDFromDatabase/ClevrStudentDemographics.xml)
  - [Students](ExportToolXMLs/Clevr/PullClevrTenantIDFromDatabase/ClevrStudents.xml)
- Insignia Library System
  - [Insignia - Student List](ExportToolXMLs/Insignia/Insignia-Students.xml)
- L4U Library System
  - [L4U Current student list](ExportToolXMLs/L4U/L4U.xml)
- Lifetouch (School Photos)
  - [Lifetouch student list](ExportToolXMLs/Lifetouch/LifetouchStudents.xml)
- LSSD Lunch (In-house school lunch tracker)
  - [LSSD Lunch - student list](ExportToolXMLs/LSSDLunchProgram/LSSDLunch-Students.xml)
- SchoolMessenger
  - [SchoolMessenger Contacts - MSS top 2](ExportToolXMLs/SchoolMessenger/SchoolMessenger-Contacts-top2.xml) - Exports the top 2 contacts for students. No control of which contacts it exports, aside from priority.
  - [SchoolMessenger Contacts - MSS top 3](ExportToolXMLs/SchoolMessenger/SchoolMessenger-Contacts-top3.xml) - Exports the top 3 contacts for students. No control of which contacts it exports, aside from priority.
  - __SchoolMessenger Multipart Demographic Export__
    - These two "multipart" exports allow finer grained control of which contacts are exported. They are configured to export the first 3 with "Has Family Portal Access" permission, and most importantly, nobody that _doesn't_ have this permission (unlike the other SchoolMessenger exports)
    - [SchoolMessenger Contacts - Multipart - Students](ExportToolXMLs/SchoolMessenger/SchoolMessenger-Multipart-Part1.xml)
    - [SchoolMessenger Contacts - Multipart - Contacts](ExportToolXMLs/SchoolMessenger/SchoolMessenger-Multipart-Part2.xml)    
    - Script to combine these: [SchoolMessenger demographics multipart combiner script](ExportToolXMLs/SchoolMessenger/SchoolMessenger-Combine-Multipart.ps1)
- Xello
  - [Xello Students](ExportToolXMLs/Xello/XelloStudents.xml)
  
## Replicated/Reporting Database SQL Queries
- Imagine Everything Education Forms (and possibly other "Forms" products from Imagine Everything)
  - [IE-EduForms - Contacts](ReplicatedDatabaseSQLExports/ImagineEverythingEducationForms/ieef-contacts.sql)
  - [IE-EduForms - Enrolments](ReplicatedDatabaseSQLExports/ImagineEverythingEducationForms/ieef-enrolments.sql)
  - [IE-EduForms - Schools](ReplicatedDatabaseSQLExports/ImagineEverythingEducationForms/ieef-schools.sql)
  - [IE-EduForms - Sections](ReplicatedDatabaseSQLExports/ImagineEverythingEducationForms/ieef-sections.sql)
  - [IE-EduForms - SpecEd](ReplicatedDatabaseSQLExports/ImagineEverythingEducationForms/ieef-speced.sql)
  - [IE-EduForms - Staff](ReplicatedDatabaseSQLExports/ImagineEverythingEducationForms/ieef-staff.sql)
  - [IE-EduForms - Student Custody](ReplicatedDatabaseSQLExports/ImagineEverythingEducationForms/ieef-studencustody.sql)
  - [IE-EduForms - Students](ReplicatedDatabaseSQLExports/ImagineEverythingEducationForms/ieef-students.sql)
  - [IE-EduForms - Teachers](ReplicatedDatabaseSQLExports/ImagineEverythingEducationForms/ieef-teachers.sql)
  
## Downloading this repository to your computer
Click the link below to download this entire Git repository in a zip file.

https://github.com/LivingSkySchoolDivision/MySchoolSaskIntegrations/archive/master.zip

# See Also
Living Sky School Division maintains another list of SQL queries designed to be run against the MSS Replicated Database here: https://github.com/LivingSkySchoolDivision/MySchoolSaskRDSQLQueries

These are more specific to Living Sky School Division's needs, and the repository contains SQL for our internal HR system as well, so we store these separately from this MSS-specific repository.