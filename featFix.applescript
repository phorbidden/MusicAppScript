﻿-- settings
set targetStr to " feat"
set replaceStr to ""

tell application "Music"
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	
	--繰り返し
	repeat with i from 1 to count of theTracksRef
		set theTrack to item i of my theTracksRef
		set theTrackName to name of theTrack
		set theArtist to artist of theTrack
		
		-- " feat"以降を抜き出し
		set num to the offset of targetStr in theArtist
		
		-- 以下 "feat" が見つかれば実行
		if num > 0 then
			
			set len to the length of theArtist
			set featArtistName to characters num thru len of theArtist as text
			
			-- 文字列を置き換え
			set dels to AppleScript's text item delimiters
			set AppleScript's text item delimiters to featArtistName
			set nameList to text items of theArtist
			set AppleScript's text item delimiters to replaceStr
			set nameText to nameList as string
			set AppleScript's text item delimiters to dels
			set artist of theTrack to nameText
						
			-- "feat."を"ft.に"置換, 前後に()を追加, トラック名の末尾に追加
			set featArtistNameFt to text 6 thru -1 of featArtistName as text
			set name of theTrack to theTrackName & " (ft" & featArtistNameFt & ") "
			
		end if
	end repeat
	display dialog "Complete!"
end tell
