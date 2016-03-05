set theText to "{popclip text}"
set command to "echo \"" & theText & "\" >> \"$HOME/VirtualBox VMs/Windows7/shared/share_memo.txt\""
do shell script (command)