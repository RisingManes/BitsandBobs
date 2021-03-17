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
# Output folder creation and assignation
New-Item -path $sourcepath -ItemType directory -Name Output
$outputfolder = "$sourcepath\Output"
# Getting the folder names, with any luck. Should assign them as "foldername"
$foldername = Get-ChildItem $sourcepath -Recurse
#I should also get the actual contents. "contents"
$contents = Get-ChildItem $foldername -Recurse
#Now to extract the numbers from this list. Will be "modid"
$modid = Get-ChildItem $sourcepath -recurse -Exclude Output
#okay, so I guess I can't just do what I did in that lasy part.
$composite = $outputfolder+'\'+$modid+'.pak'
#maybe this last part will work.
#write-host Copy-Item -path $contents -destination "$composite" -recurse
