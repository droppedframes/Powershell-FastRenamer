# Powershell-FastRenamer

##Overview
This PowerShell script is designed to rename files in a specified folder based on a CSV mapping file. The CSV file should contain two columns: oldFilename (original filename with extension) and newFileName (new filename with extension). Loading the csv file into a hashtable as key value pairs and then looking up each file in the specified folder as they key produces the fastest results. 