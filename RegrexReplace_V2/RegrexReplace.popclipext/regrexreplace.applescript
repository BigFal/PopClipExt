set selectedText to "{popclip text}"

tell application "System Events" to set activeApp to name of first application process whose frontmost is true

display dialog "Regular Expression Pattern" with title "Regrex Replace" default answer ""
set theRegrex to (text returned of result)

set the_results to (display dialog "All occurrences of [" & theRegrex & "] will be replaced by" with title "Regrex Replace" default answer "" buttons {"Cancel", "Within Entire Document", "Within Selected Range"} default button 2)

set BUTTON_Returned to button returned of the_results
set theReplace to text returned of the_results

if BUTTON_Returned = "Within Entire Document" then
	tell application activeApp to activate
	delay 1
	tell application "System Events" to keystroke "a" & "c" using {command down}
	delay 0.2
	set allText to the clipboard
	set oldLines to paragraphs of allText
else if BUTTON_Returned = "Within Selected Range" then
	set oldLines to paragraphs of selectedText
end if

set newList to {}
set sedPattern to "s/" & theRegrex & "/" & theReplace & "/g" as string
repeat with eachLine in oldLines
	set theCommand to "echo " & quoted form of eachLine & " | perl -pe " & quoted form of sedPattern as string
	set newLine to do shell script theCommand
	set end of newList to newLine
end repeat
set {TID, text item delimiters} to {text item delimiters, "
"}
set newString to (newList as string)
set text item delimiters to TID
set the clipboard to newString
tell application activeApp to activate
delay 1
tell application "System Events" to keystroke "v" using {command down}