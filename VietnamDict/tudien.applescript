set newWord to "{popclip text}"
set the clipboard to newWord
tell application "Vietnam Dictionaries" to activate
delay 0.5
tell application "System Events"
	tell process "Vietnam Dictionaries"
		perform action "AXRaise" of window 1
		set value of attribute "AXFocused" of UI element 4 of front window to true
	end tell
	keystroke "v" using command down
	keystroke return
end tell