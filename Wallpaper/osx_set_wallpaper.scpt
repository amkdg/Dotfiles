set pathToMe to path to me

set thisScriptsFolder to ""
tell application "Finder"
    try
        set thisScriptsFolder to (get container of pathToMe) as text
    end try
end tell

set wallpaperPath to thisScriptsFolder & "wallpaper.heic"

tell application "System Events"
    tell every desktop
        set picture to wallpaperPath
    end tell
end tell
