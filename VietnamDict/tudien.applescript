-- Process seletected string
set oldWord to "{popclip text}"
set theCmd to ("echo " & quoted form of oldWord & " | perl -pe " & quoted form of "s/-\\r\\n|-\\n|-\\r| +//g" as string)
set newWord to do shell script theCmd
set the clipboard to newWord
tell application "Vietnam Dictionaries" to activate
repeat
	if application "Vietnam Dictionaries" is running then exit repeat
	delay 0.5
end repeat
delay 0.5
tell application "System Events"
	tell process "Vietnam Dictionaries"
		perform action "AXRaise" of window 1
		set value of attribute "AXFocused" of UI element 4 of front window to true
	end tell
	delay 0.5
	keystroke "v" using command down
	keystroke return
end tell
