# Will be replaced by an input field. # Read-Host -Prompt 'Input source name' #
$sourcepath = "C:\Program Files (x86)\Steam\steamapps\workshop\content\211820"
# Output folder creation and assignation.
$outputfolder = "$sourcepath\Output"
# directory: has folders, which contain mod ids.
Get-ChildItem -path $sourcepath | Tee-Object  -Variable directory 
# contents: what's inside the actual mod folders.
Get-ChildItem -path $directory | Tee-Object -variable contents
# Now to extract the numbers from this list. Will be "modid"
#maybe this last part will work.
Copy-Item -path $contents -Destination $outputfolder/$directory.pak
