# Powershell-FastRenamer

## Overview
This PowerShell script is designed to rename files in a specified folder based on a CSV mapping file. Each file in the specified folder will be checked and if there is a matching map will be renamed. By loading the csv file into a hashtable as key value pairs and then looking up each file in the specified folder as they key produces the fastest results. 

### CSV File
The CSV file should contain two columns: oldFilename (original filename with extension) and newFileName (new filename with extension). 

```
oldFilename,newFileName
oldname1.jpg,newName1.jpg
oldname2.jpg,NameNew2.jpg
```

