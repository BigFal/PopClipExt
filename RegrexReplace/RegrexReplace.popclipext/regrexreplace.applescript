set selectedText to "{popclip text}"
tell application "System Events" to keystroke "a" & "c" using {command down}
delay 0.2
set allText to the clipboard
set oldLines to paragraphs of allText
tell application "System Events" to set activeApp to name of first application process whose frontmost is true

display dialog "Input Regrex" default answer selectedText
set theRegrex to (text returned of result)

display dialog "Replace with" default answer ""
set theReplace to (text returned of result)

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
