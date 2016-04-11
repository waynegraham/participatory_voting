# Participatory Voting

## ConfTool Notes

To get the download for this, navigate to **Data Import and Export** on the **Overview** screen. Click on **Export Data** and select the following:

* Under **Export Submission and Review Information, Reviewers and Session Details**
  * **Export Contribution**
    * Select **Include abstracts of submissions**
* Scroll down to **General Settings for Data Export**
  * Change **Export format** to **CSV (delimiter ",")**
* Click **Create Export File**

This will download a file with a crazy name. Place it in `lib/assets`.

There is an error in the CSV header of the file. Open it up and change the first field from `ï»¿"paperID"` to `paperID` and resave.

No need to delete any old files; the `rake` task uses the most recently modified file.

## Seeding the data

Run the `import:conftool` task in the terminal. If you want to clear out the data first, run `rake reset`, but the `import:conftool` task *should* be idempotent and update any changes detected in the spreadsheet.
