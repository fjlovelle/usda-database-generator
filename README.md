# USDA Database Generator

## WARNING!

This project is still in development and is not ready to be used yet.

## Project

This project contains scripts to create a sqlite3 database from the USDA FoodData Central SR Legacy files. The data can be download manually from the following link https://fdc.nal.usda.gov/download-datasets.html, or with the script scripts/download.sh.

If the files are downloaded manually, put the files in a folder called data inside root of the project.

## Database

The database generated gets the CSV files and fields to create the tables. However all the fields in the table are being represented as TEXT.

Not all the files in the zip file have been used, the files listed bellow are removed once extracted.

    1) From the zip file: FoodData_Central_sr_legacy_food_csv_ 2019-04-02.zip:
        all_downloaded_table_record_counts.csv
        Download & API Field Descriptions-2019-10-11-16-22.xlsx

    2) From the zip file FoodData_Central_Supporting_Data_csv_2021-10-28.zip:
        all_downloaded_table_record_counts.csv
        Download & API Field Descriptions October 2021.pdf
        fndds_derivation.csv
        fndds_ingredient_nutrient_value.csv

Also a table called "version" has been created in order to update the database from that version.

This table can be seen in the file scripts/create.py and is defined as follows:

    CREATE TABLE "version" (
        "id" INTEGER,
        "tag" TEXT,
        "date" TEXT,
        "description" TEXT,
        PRIMARY KEY ("id")
    );

It also includes the following entry:

    INSERT INTO "version"
            ("id", "tag", "date", "description")
        VALUES
            (1, "1.0.0", "%s", "First database");

Where "%s" is the date the database has been created.

## Dependencies
To create the database it is necessary to have installed the following programs.

- bash
- python3
- unzip

