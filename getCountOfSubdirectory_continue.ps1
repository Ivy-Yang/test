# Platform      : Windows/Powershell
# Description   : Get the count number of the subdirectories.
# Created       : 2012-08-08
# History       : Version 1.0
# Author        : Edde Yang
# ---------------------------------------------------------------------------------------------------------------
# Date          ID(Name)        Revision        Destription
# 2012-08-08   Edde Yang                   1.0             Create the script

#global variables########
$Path="\\active.tan\data\OrgFileStore"
$Output_File="C:\Users\iyang\count_continue.txt"

dir $Path\* | where {$_.psiscontainer -and ($_.fullname.split("\")[-1] -notmatch '(?i)^aa|ab|ac|af|ad|aj|ak|ag|al|ah|am|ai|andov')} | %{
    write-host ($_.fullname)
    $c = (dir ($_.fullname) -rec |where {$_.psiscontainer} | measure-object).count
    "$($_.fullname)`t$c" | out-file $Output_File -append
}


