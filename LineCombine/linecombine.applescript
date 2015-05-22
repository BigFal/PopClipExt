set theText to "{popclip text}"

set myList to paragraphs of theText

set {TID, text item delimiters} to {text item delimiters, " "}
set newString to (myList as string)
set text item delimiters to TID

tell application "System Events"
   keystroke "x" using command down
end tell

delay 0.2

set the clipboard to newString

tell application "System Events"
   keystroke "v" using command down
end tell