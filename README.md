# Participatory Voting

## ConfTool Notes

To get the download for this, navigate to **Data Import and Export** on the **Overview** screen. Click on **Export Data** and select the following:

* Under **Export Submission and Review Information, Reviewers and Session Details**
  * **Export Contributions**
    * Select **Include abstracts of submissions**
* Click **Create Export File**

This will download an Excel spreadsheet that you need to open in LibreOffice (there is a bug in the Mac version of Excel with UTF-8 characters and CSV files). In LibreOffice, click **File -> Save As** and select **Text (CSV)** and tick the **Edit filter settings** box. Set the output to `lib/assets` for the project and click **Save**. On the next screen, make sure the **Character set** field is set to **Unicode (UTF-8)**.

No need to delete any old files; the `rake` task uses the most recently modified file.

## Seeding the data

Run the `import:conftool` task in the terminal. If you want to clear out the data first, run `rake reset`, but the `import:conftool` task *should* be idempotent and update any changes detected in the spreadsheet.
