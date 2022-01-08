#!/bin/bash

################################################################################
# This script extracts the data required to create the Menu Planner database   #
# from the zip files provided by the USDA Food Data Central.                   #
################################################################################

# Variables
SR_LEGACY_FOOD_FILE="FoodData_Central_sr_legacy_food_csv_ 2019-04-02.zip"
SUPPORTING_DATA_FILE="FoodData_Central_Supporting_Data_csv_2021-10-28.zip"
TMP_DATA_DIR="tmp"
ZIP_DATA_DIR="data"

# Check if we are in the usda-database-generator project
if [[ ${PWD##*/} == "usda-database-generator" ]]
then

    # Removing and creating temporal folder
    rm "$TMP_DATA_DIR" -rf
    mkdir "$TMP_DATA_DIR"

    # Extract desired files from sr_legacy_foods zip file
    if [[ -f "$ZIP_DATA_DIR/$SR_LEGACY_FOOD_FILE" ]]
    then
        unzip "$ZIP_DATA_DIR/$SR_LEGACY_FOOD_FILE" -d "$TMP_DATA_DIR/sr_legacy_food"
        rm "$TMP_DATA_DIR/sr_legacy_food/all_downloaded_table_record_counts.csv"
        rm "$TMP_DATA_DIR/sr_legacy_food/Download & API Field Descriptions-2019-10-11-16-22.xlsx"
        mv "$TMP_DATA_DIR/sr_legacy_food/"* "$TMP_DATA_DIR"
        rm "$TMP_DATA_DIR/sr_legacy_food" -rf

    # Exiting if zip file does not exists
    else
        echo "ERROR: $ZIP_DATA_DIR/$SR_LEGACY_FOOD_FILE does not exist."
    fi

    # Extract desired files from sr_legacy_foods zip file
    if [[ -f "$ZIP_DATA_DIR/$SUPPORTING_DATA_FILE" ]]
    then
        unzip "$ZIP_DATA_DIR/$SUPPORTING_DATA_FILE" -d "$TMP_DATA_DIR/supporting_data"
        rm "$TMP_DATA_DIR/supporting_data/all_downloaded_table_record_counts.csv"
        rm "$TMP_DATA_DIR/supporting_data/Download & API Field Descriptions October 2021.pdf"
        rm "$TMP_DATA_DIR/supporting_data/fndds_derivation.csv"
        rm "$TMP_DATA_DIR/supporting_data/fndds_ingredient_nutrient_value.csv"
        mv "$TMP_DATA_DIR/supporting_data/"* "$TMP_DATA_DIR"
        rm "$TMP_DATA_DIR/supporting_data" -rf

    # Exiting if zip file does not exists
    else
        echo "ERROR: $ZIP_DATA_DIR/$SUPPORTING_DATA_FILE does not exist."
    fi

# Exiting if the current directory is not the project of the project
else
    echo "ERROR: Current directory is not usda-database-generator. Exiting."
fi