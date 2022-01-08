#!/bin/bash

################################################################################
# This script downloads the zip file with the data from the USDA FoodData      #
# Central Database.                                                            #
################################################################################

# Variables
ZIP_DATA_DIR="data"

# Check if we are in the usda-database-generator project
if [[ ${PWD##*/} == "usda-database-generator" ]]
then

    # Create data folder
    if [[ ! -d "$ZIP_DATA_DIR" ]]
    then
        mkdir "$ZIP_DATA_DIR"
    fi

    # Download zip files
    wget -O "$ZIP_DATA_DIR/FoodData_Central_sr_legacy_food_csv_ 2019-04-02.zip" "https://fdc.nal.usda.gov/fdc-datasets/FoodData_Central_sr_legacy_food_csv_%202019-04-02.zip"
    wget -O "$ZIP_DATA_DIR/FoodData_Central_Supporting_Data_csv_2021-10-28.zip" "https://fdc.nal.usda.gov/fdc-datasets/FoodData_Central_Supporting_Data_csv_2021-10-28.zip"

# Exiting if the current directory is not the project of the project
else
    echo "ERROR: Current directory is not usda-database-generator. Exiting."
fi