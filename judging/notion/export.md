# How to Export a Notebook

## Organizing Entries

Before exporting, it is best to create multiple views of the database with Filters and Sorting. Views can be renamed by <mark style="color:yellow;">`Right Clicking`</mark>. New views can be created by selecting the <mark style="color:yellow;">`+`</mark>.

5 recommended views with <mark style="color:green;">`Filters`</mark> and <mark style="color:orange;">`Sorting`</mark>:

Not In Notebook: <mark style="color:green;">`Exported - Unchecked`</mark>, <mark style="color:green;">`Archive - Unchecked`</mark>, <mark style="color:orange;">`Ready - Descending`</mark>, <mark style="color:orange;">`Date - Ascending`</mark>&#x20;

Export Order: <mark style="color:green;">`Exported - Unchecked`</mark>, <mark style="color:green;">`Ready - Checked`</mark>, <mark style="color:orange;">`Date - Ascending`</mark>

Notebook Entries: <mark style="color:green;">`Exported - Checked`</mark>, <mark style="color:green;">`Archive - Unchecked`</mark>, <mark style="color:orange;">`Date - Ascending`</mark>

Archive: <mark style="color:green;">`Archive - Checked`</mark>

All Entries:&#x20;

{% hint style="info" %}
This tutorial will use PDFgear which is available on windows and mac for free. This can be done in Adobe Acrobat as well
{% endhint %}

{% embed url="https://www.youtube.com/watch?v=txKhyzwkAus" %}
This is the best process to export the PDFs.
{% endembed %}

## How to Export Pages

When in the Export Order view of the Notebook Database, select the <mark style="color:yellow;">`elipses`</mark> in the top right of the screen, and select <mark style="color:yellow;">`Export`</mark>. Use the following settings for the export:

<figure><img src="../../.gitbook/assets/Notion Export.png" alt="" width="318"><figcaption></figcaption></figure>

Export entries by following the tutorial linked above or using the program in the video linked here:

{% embed url="https://app.gn3.sh/notion-pdf-export/" %}

## How to Compile the Notebook

Move all exported files from Notion into the folder that contains the "Notion PDF Export" program, and run the program. The program will create a folder called PDFs that will contain all entries. From testing, it appears that the folder contains 2 of each entry, where the second is a blank version of the template which should be deleted.&#x20;

Open PDFgear and select <mark style="color:yellow;">`Merge PDF`</mark>. Select <mark style="color:yellow;">`Add Files`</mark> in the top left, then select all entry PDFs and sort them into their desired order.&#x20;

Under the <mark style="color:yellow;">`Pages`</mark> tab, select <mark style="color:yellow;">`New Blank Page`</mark> and add a page to the beginning of the notebook. This will act as a page holder for the Table of Contents before page numbers are added.&#x20;

Under the <mark style="color:yellow;">`Fill & Sign`</mark> tab, select Page Number and the Add option. Choose a prefered style and placement.&#x20;

{% hint style="info" %}
PDFgear is a strong program, but sometimes because of the free nature of the program, it won't complete tasks. It is best to save the pdf, and restart the program if this occurs.&#x20;
{% endhint %}

When page numbers are added, it is time to create a Table of Contents that match these numbers.&#x20;

## How to Create a Table of Contents

Using Microsoft Word, or a similar word processor, create a new document, and add a heading for the table of Contents. Microsoft Word allows for the easy creation of Tables of Contents. In the <mark style="color:yellow;">`References`</mark> tab, select the <mark style="color:yellow;">`Table of Contents`</mark> drop down, and choose one of the manual formats. Create an entry in the table for each notebook entry and its corresponding page number.

Export this Table of Contents as a pdf. Back in PDFgear, use the <mark style="color:yellow;">`Pages`</mark> tab, delete the blank page that was created as a place holder, and select <mark style="color:yellow;">`Append File`</mark>. Choose the Table of Contents pdf and add it to the beginning of the notebook. After this, the notebook is complete, but bookmarks and page links can be added to the pdf if desired.&#x20;
