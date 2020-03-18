##!/usr/bin/env bash

set -e

# Delete any existing iTerm configs
defaults delete com.googlecode.iterm2

# Restore defaults
open -g "/Applications/iTerm.app" && sleep 2
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
sleep 2 && osascript -e 'quit app "iTerm"'

# Set theme to Thayer
/usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Thayer' dict" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Merge 'iTerm2/Thayer.itermcolors' :'Custom Color Presets':'Thayer'" ~/Library/Preferences/com.googlecode.iterm2.plist

for color in \
    "Ansi 0 Color" "Ansi 1 Color" "Ansi 2 Color" "Ansi 3 Color" "Ansi 4 Color" \
    "Ansi 5 Color" "Ansi 6 Color" "Ansi 7 Color" "Ansi 8 Color" "Ansi 9 Color" \
    "Ansi 10 Color" "Ansi 11 Color" "Ansi 12 Color" "Ansi 13 Color" "Ansi 14 Color" \
    "Ansi 15 Color" "Background Color" "Bold Color" "Cursor Color" "Cursor Text Color" \
    "Foreground Color" "Selected Text Color" "Selection Color"; do

    /usr/libexec/PlistBuddy -c "Delete :'New Bookmarks':0:'$color'" ~/Library/Preferences/com.googlecode.iterm2.plist
done

/usr/libexec/PlistBuddy -c "Merge 'iTerm2/Thayer.itermcolors' 'New Bookmarks':0" ~/Library/Preferences/com.googlecode.iterm2.plist

# Disable buffer truncation
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Unlimited Scrollback' true" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Silence bell
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Silence Bell' true" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Disable auto update
/usr/libexec/PlistBuddy -c "Add 'SUEnableAutomaticChecks' bool false" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Scroll moves cursor
/usr/libexec/PlistBuddy -c "Add 'AlternateMouseScroll' bool true" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Quit iTerm when no terminals are open
/usr/libexec/PlistBuddy -c "Add 'QuitWhenAllWindowsClosed' bool true" ~/Library/Preferences/com.googlecode.iTerm2.plist
