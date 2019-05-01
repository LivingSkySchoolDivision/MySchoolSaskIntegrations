How To Install An Export XML File From This Repository
======================================================

You need __Division__ level access to create an export.

Once you create an export, you can then run that export manually or as an automatic job.

Some vendors require multiple integration files - each file will require it's own separate export, it's own XML file, and it's own _job_ (if you intend to automate the export).

## Check to see if you need to customize the XML file for your organization
Some XML files in this repository require you to customize them with your own customer ID, vendor ID, or tenant ID, so that third party vendors can identify that the resulting file came from your school or school division.

You will find comments in the XML files wherever these customizations are required. For example, the Clevr files require a "tenandID" field unique to each customer:

```xml
<!-- Clevr Tenant ID -->   
<!-- 
    EXPORT CUSTOMIZATION REQUIRED
    =============================
    Clevr uses this field to identify which customer an integration file belongs to.
    You will need to edit this value to match your Clevr tenant ID, or it will cause errors 
    when the export file is imported into Clevr.
-->    
<constant value="YOURTENANTIDHERE" header-source="constant" header-value="tenantId" />
```
For example, if your Clevr tenant ID is "1234", you should edit this line in the XML file to read:
```xml
<constant value="1234" header-source="constant" header-value="tenantId" />
```

## Creating the export in MySchoolSask

1. Go to the __Division__ view
2. Go to the __Tools__ top-tab
3. Go to the __Exports__ side-tab
4. Click __Options__
5. Click __Add__
6. Enter a meaningful name for your export (example: LSSD Clevr Student File)
7. Enter a meaningful _Definition ID_ for your export (example: LSSD-CLEVR-STUDENT)
8. If you plan to run this export automatically, check the __Schedulable__ checkbox
9. Click the ![up-arrow](IMG/upload-icon.gif) __upload__ icon
10. Click __Choose File__ and select the XML file you wish to use for this export
11. Click __Import__
12. Click __Save__

Your export is now created. 

You can run it manually by clicking __Options__ and selecting __Run__, or you can create a job to run it automatically. See HowToRunAnExportAutomatically.md for instructions on creating an automated job.