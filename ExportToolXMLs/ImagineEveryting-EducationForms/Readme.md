# Use SQL exports for this vendor

These exports require fields that the XML based export system in Aspen/MSS is not capable of exporting - notably the start and end dates for sections.

# Where can I find the exports?

# Does my school division need to pay for the Reporting/Replicated database to use these?
Yes, you require access to the MSS SQL database for this vendor's exports, which unfortunately costs an extra fee.

## Why can't we export the start and end dates for sections?
These dates are stored as "1-to-N" (you might also call this "1-to-many") relationships among their data tables in the database. The XML export system can only access table relationships that are "N-to-1" or "1-to-1" relationships - It can't handle "1-to-N" relationships and will crash if you attempt to access one.

I was not able to find a way to export these dates in a way where they could be linked back to sections, so we need to use SQL for that export. It makes sense to keep all the exports in the same place, so _all_ exports for this vendor are SQL-based rather than XML-based.
