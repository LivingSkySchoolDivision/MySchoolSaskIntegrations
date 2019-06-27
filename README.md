# MySchoolSask Integrations
This git repository represents work and research done for the purpose of creating export definitions for MySchoolSask (an implementation of Follett Aspen).

# Using this repository

* The __AspenNotes__ directory contains some general notes on how Aspen handles things like special variables for filters.

* The __ExportToolXMLs__ directory contains XML files to be used when creating an export definition in Aspen/MySchoolSask. They are organized into folders by vendor or product.

* The __Howto__ directory contains instructions for end-users on how to install an export XML file

* The __VendorDocumentation__ directory contains documents and/or links to vendor integration file specifications

# Documentation
  * [How to install an XML file from this repository](HowTo/HowToInstallAnExportXML.md)
  * [How to set an export to run automatically on a schedule](HowTo/HowToRunAnExportAutomatically.md)
  * [How to run an export manually](HowTo/HowToRunAnExportManually.md)

# Integrations in this repository
## Export Tool XML Files
* Active Directory
  * __Note__: Everyone's Active Directory implementation will be different, so this file may not be suitable for the way your organization handles AD integration now. You may need to change/add/remove fields, or reconfigure your existing identity system or scripts for these exports to work. 
  * [AD Active Students](ExportToolXMLs/ActiveDirectory/AD-ActiveStudents.xml)
  * [AD Withdrawn Students](ExportToolXMLs/ActiveDirectory/AD-WithdrawnStudents.xml)
* Clevr
  * [Classes](ExportToolXMLs/Clevr/ClevrClasses.xml)
  * [Locations](ExportToolXMLs/Clevr/ClevrLocations.xml)
  * [School Demographics](ExportToolXMLs/Clevr/ClevrSchoolDemographics.xml)
  * [Staff](ExportToolXMLs/Clevr/ClevrStaff.xml)
  * [Staff Classes](ExportToolXMLs/Clevr/ClevrStaffClasses.xml)
  * [Staff Demographics](ExportToolXMLs/Clevr/ClevrStaffDemographics.xml)
  * [Student Classes](ExportToolXMLs/Clevr/ClevrStudentClasses.xml)
  * [Student Demographics](ExportToolXMLs/Clevr/ClevrStudentDemographics.xml)
  * [Students](ExportToolXMLs/Clevr/ClevrStudents.xml)
* L4U
  * [L4U Current student list](ExportToolXMLs/L4U/L4U.xml)
* Lifetouch (School Photos)
  * [Lifetouch student list](ExportToolXMLs/Lifetouch/LifetouchStudents.xml)
* Sangha / Scholantis (Sangha and Scholantis use identical files)
  * [Sangha/Scholantis Classes](ExportToolXMLs/Scholantis-Sangha/Scholantis-Class.xml)
  * Sangha/Scholantis Enrolment
    * __Note__: You will need to combine the output of the following two exports into the same file before submitting them to Sangha/Scholantis. [See this readme for details](ExportToolXMLs/Scholantis-Sangha/README-EnrolmentFiles.md)
    * [Sangha/Scholantis Enrolment - Staff](ExportToolXMLs/Scholantis-Sangha/Scholantis-Enrolment-Staff.xml)
    * [Sangha/Scholantis Enrolment - Students](ExportToolXMLs/Scholantis-Sangha/Scholantis-Enrolment-Students.xml)
  * [Sangha/Scholantis Parent/Guardian](ExportToolXMLs/Scholantis-Sangha/Scholantis-ParentGuardian.xml)
  * [Sangha/Scholantis Sections](ExportToolXMLs/Scholantis-Sangha/Scholantis-Sections.xml)
  * [Sangha/Scholantis Staff](ExportToolXMLs/Scholantis-Sangha/Scholantis-Staff.xml)
  * [Sangha/Scholantis Students](ExportToolXMLs/Scholantis-Sangha/Scholantis-Students.xml)
* Xello
  * [Xello Students](ExportToolXMLs/Xello/XelloStudents.xml)
  
  
## Downloading this repository to your computer
Click the link below to download this entire Git repository in a zip file.

https://github.com/LivingSkySchoolDivision/MySchoolSaskIntegrations/archive/master.zip


# Contacting me

If you have questions, concerns, or issues, please feel free to contact me at mark.strendin@lskysd.ca.

If you would like to report an issue with any of the files or documents in this repository, you can use the __Issues__ tab along the top of this repository to create an issue that can be tracked (and won't get lost or forgotten about in an email inbox somewhere).
