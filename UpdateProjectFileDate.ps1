#Configuration Parameters
$pathFile = "C:\Users\jgmar\OneDrive\Desktop\ExamplePowerShell"
$pathCopyFile = "C:\Users\jgmar\OneDrive\Desktop\ExamplePowerShell\Copy"
$desireFileName = "Jose"
$DateStamp  = get-date -f yyyy-MM-dd

# Get the information of the file
$fileName = Get-ChildItem -Path $pathFile | Where-Object { $_ -match $desireFileName }
$countFilesName = (Get-ChildItem -Path $pathFile | Where-Object { $_ -match $desireFileName } | Measure-Object).Count

# Check if the file exists and if there is just one
if (-not(Test-Path $pathFile) -or ($countFilesName -gt 1)) { 
   "Folder Name path: $pathFile"
   "Number of files with the Name is over 1: $countFilesName"
   break 
}

# Move the file to the security copy
Copy-Item -Path $fileName.PSPath -Destination $pathCopyFile
"Copy file path: " + ($fileName.PSPath)

# Rename the file with the current date
rename-item -Path $fileName.PSPath -NewName "$desireFileName $DateStamp"
"File Rename: $filename"