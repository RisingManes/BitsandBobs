param (
    [String]$sourcepath,
    [String]$outputfolder,
    [String]$foldername,
    [String]$contents,
    [string]$modid,
    [string]$composite
)

# Will be replaced by an input field. # Read-Host -Prompt 'Input source name' #
$sourcepath = "C:\Program Files (x86)\Steam\steamapps\workshop\content\211820"
# Output folder creation and assignation. Code by Randych
if (-not (Test-Path -Path $sourcepath)) {
    New-Item -path $sourcepath -ItemType directory -Name Output
    }
    $ExcludeFolders = "output|pictures|photos|Screenshot"
$outputfolder = "$sourcepath\Output"
# Getting the folder names, with any luck. Should assign them as "foldername" $foldername = 
Get-ChildItem $sourcepath -directory | Where-Object Fullname -notmatch $ExcludeFolders # !!!why does this line still show me the output folder, anyway?!!!
#I should also get the actual contents. "contents"
Get-ChildItem $sourcepath -recurse -exclude $outputfolder
#Now to extract the numbers from this list. Will be "modid"
Get-ChildItem $sourcepath -Exclude Output | Tee-Object -variable modid
$composite = write-output $outputfolder\$modid+'.pak'
#maybe this last part will work.
Write-Host Copy-Item $ProcessTheseFiles -Destination $outputfolder -force
