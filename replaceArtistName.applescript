-- setting

display dialog "Find" default button 2 default answer ""
set tmpText1 to result
set before_str to text returned of tmpText1

display dialog "Replace" default button 2 default answer ""
set tmpText2 to result
set after_str to text returned of tmpText2

tell application "Music"
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	-- loop
	repeat with i from 1 to count of theTracksRef
		set theTrack to item i of my theTracksRef
		set theArtist to artist of theTrack
		-- replace
		set oldDel to AppleScript's text item delimiters
		set AppleScript's text item delimiters to before_str
		set myList to text items of theArtist
		set AppleScript's text item delimiters to after_str
		set myText to myList as string
		set AppleScript's text item delimiters to oldDel
		set artist of theTrack to myText
	end repeat
end tell