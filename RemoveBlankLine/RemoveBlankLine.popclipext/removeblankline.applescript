set theText to "{popclip text}"
set origText to theText

-- remove the double return characters
repeat while theText contains (return & return)
   set AppleScript's text item delimiters to return & return
   set theTextList to text items of theText
   set AppleScript's text item delimiters to return
   set theText to theTextList as text
end repeat

-- remove the double unix new line characters
set LF to ASCII character 10
repeat while theText contains (LF & LF)
   set AppleScript's text item delimiters to LF & LF
   set theTextList to text items of theText
   set AppleScript's text item delimiters to LF
   set theText to theTextList as text
end repeat
set AppleScript's text item delimiters to ""

if theText is not equal to origText then
   -- write the fixed text to disk
   	tell application "System Events"
   	keystroke "x" using command down
	end tell

	delay 0.2

	set the clipboard to theText

	tell application "System Events"
   	keystroke "v" using command down
	end tell
end if