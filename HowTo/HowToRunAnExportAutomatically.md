How To Run An Export Automatically
==================================

Once you create an _Export_, you can run that export automatically using a _Job_.
You need __Division__ level access to create jobs.

1. Go to the __Division view__
2. Go to the __Tools__ top-tab
3. Go to the __Jobs__ side-tab
4. Click __Options__
5. Click __Add__
6. Give your job a meaningful name (Example: LSSD Clevr Student File)
7. Click the ![magnifying-glass](IMG/picklist-black-small.png) magnifying glass icon next to __Select a tool__
8. For __Tool type__ select __Import/Export__
9. Select your export from the list
10. Check __Enabled__
11. Check __Input defaults__
12. Select a __Delivery Type__
    * __None__ will not automatically deliver the file. To retrieve the file, use the __Results__ leaf for a job.
    * __Email__ will email the exported file (in CSV format) to the address(es) you specify in the _Delivery Address_ text box.
        * Separate multiple email addresses with a __comma__.
    * __File__ will save the exported filed (in CSV format) to the MySchoolSask server, where you can retrieve it later using SFTP. See the section on Retrieving Files below for more details


A note regarding sending export data via email
==============================================
If your export contains potentially personally identifiable information belonging to students or staff members, you should _not_ use email to deliver your export results. __Use "File" exports instead, and retrieve them with SFTP, so that your data is encrypted while "in flight".__

Export data sent via email is sent in __plain text__, using standard _unencrypted_ email protocols. 

Any malicious actor or potentially compromised server that your email message travels on will be able to read the contents of the email, and will be able to see the entire contents of your export file result. You have no control of what servers your email message touches while it's "in flight".

Your email message and it's attachments may end up in plain-text in a server's log file at any point along it's journey from MySchoolSask to your inbox.


Retrieving files via SFTP
=========================
_Documentation to be added at a future date._

At this point in time, this functionality is not set up in the development environment, so we are unable to test this or write documentation for it.

We will update this section of this document when we know more about how this works.

Troubleshooting
===============

## My export isn't listed in the tools menu
This means that your export probably isn't set to be __Schedulable__. Edit your export, and make sure the __Schedulable__ checkbox is checked.
