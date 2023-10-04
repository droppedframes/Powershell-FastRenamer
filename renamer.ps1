######################## Config ########################

# Configuration variables
$csvFilePath = "D:\filerename.csv"    # Path to the CSV mapping file
$folderPath = "D:\Assets"           # Path to the folder containing files to be renamed

######################## Config ########################

# Create an empty hashtable to store file name mappings
$fileNameMap = @{}

# Import the CSV mapping file
$csvContent = Import-Csv -Path $csvFilePath

# Loop through each row in the CSV and add key-value pairs to the hashtable
foreach ($row in $csvContent) {
    $key = $row.oldFilename      # Extract the original filename from the CSV
    $value = $row.newFileName # Extract the new filename from the CSV

    # Check if the key (original filename) already exists in the hashtable (optional)
    if (-not $fileNameMap.ContainsKey($key)) {
        $fileNameMap[$key] = $value  # Add the original-new filename pair to the hashtable
    }
}

# Get a list of all files in the specified folder (excluding directories)
$fileList = Get-ChildItem -Path $folderPath | Where-Object { $_.PSIsContainer -eq $false }

# Loop through each file in the folder
foreach ($file in $fileList) {
    $fullName = $file.Name  # Get the full name of the file (including extension)

    # Check if the full name exists as a key in the hashtable
    if ($fileNameMap.ContainsKey($fullName)) {
        $newFullName = $fileNameMap[$fullName]  # Get the corresponding new filename

        # Build the new file path
        $newFilePath = Join-Path -Path $folderPath -ChildPath $newFullName

        # Display a message indicating the renaming operation
        Write-Host "Trying: $($file.Name) to $newFullName"
        
        # Rename the file using the new filename and force the operation
        Rename-Item -Path $file.FullName -NewName $newFullName -Force
        
        # Display a message indicating that the file has been renamed
        Write-Host "Renamed: $($file.Name) to $newFullName"
    }
}