#This is a PS scrit to print the pdf files in a specif folder then move them to an output
#2023-02-10 - MJA

$queue = "C:\Testing\Queue"      #file location of input
$printed = "C:\Testing\Printed"  #file location of output

#creates a list of .pdf files to be printed
$items = Get-ChildItem -Path $queue -Filter *.pdf

#outputs items to prompt for show what will print
write-output $items 

#this is the print function
foreach ($item in $items) { Start-Process –FilePath $queue\$item –Verb Print -PassThru | %{sleep 10;$_} | kill     }

#this is the move files to que function
foreach ($item in $items) { Move-Item -Path $queue\$item $printed }
