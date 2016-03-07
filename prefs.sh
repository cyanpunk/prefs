
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# http://ss64.com/osx/syntax-defaults.html


# invert colors keyboard shortcut
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 21 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>120</integer>
        <integer>7</integer>
        <integer>1310720</integer>
      </array>
    </dict>
  </dict>
"



#####
#com.apple.CoreGraphics
#com.apple.Dictionary
#com.apple.QuickLookDaemon
#com.apple.Terminal
#com.apple.TextEdit
#com.apple.VoiceOver4.local
#com.apple.VoiceOverTraining
#com.apple.VoiceOverUtility
#com.apple.VoiceOverUtilityCacheBuilder
#com.apple.calculator
#com.apple.dt.Xcode
#com.apple.dt.Xcode.LSSharedFileList
#com.apple.dt.Xcode.Playground
#com.apple.finder
#com.apple.loginitems
#com.apple.symbolichotkeys
#com.apple.systemuiserver
#com.apple.universalaccess
#com.apple.universalaccessAuthWarning
#####

set -v



/usr/bin/env osascript -l JavaScript << EOF
	terminal = Application('Terminal');
	terminal.defaultSettings.fontSize = 36;
	terminal.defaultSettings.numberOfRows = 26;
	terminal.defaultSettings.numberOfColumns = 80;
EOF


function CFPreferencesAppSynchronize() {
    python - <<END
from Foundation import CFPreferencesAppSynchronize
CFPreferencesAppSynchronize('$1')
END
}



# ==============================================
# NSGlobalDomain settings
# ==============================================
echo "Setting NSGlobalDomain preferences"

# Turn off text smoothing for font sizes
defaults write NSGlobalDomain AppleAntiAliasingThreshold -int 4

# Use smooth scrolling
defaults write NSGlobalDomain AppleScrollAnimationEnabled -bool true

# Enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Don't restore windows when quitting or re-opening apps
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# No translucent menu bar
defaults write NSGlobalDomain "AppleEnableMenuBarTransparency" -bool false


# ==============================================
# Finder
# ==============================================
echo "Setting Finder preferences"


# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# New window points to home
defaults write com.apple.finder NewWindowTarget -string "PfHm"


# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true


# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true




# ==============================================
# Safari & WebKit
# ==============================================
echo "Setting Safari & WebKit preferences"

# Appearance

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# General settings

# Safari opens with: A new window
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false

# New windows open with: Empty Page
defaults write com.apple.Safari NewWindowBehavior -int 1

# New tabs open with: Empty Page
defaults write com.apple.Safari NewTabBehavior -int 1

# Homepage
defaults write com.apple.Safari HomePage -string "https://www.google.com"

# Don't open "safe" files after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false


# Don't even ask about the push notifications
defaults write com.apple.Safari CanPromptForPushNotifications -bool false


# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true


# ==============================================
# Universal Access
# ==============================================

defaults write com.apple.UniversalAccess closeViewHotkeysEnabled -bool true
defaults write com.apple.UniversalAccess closeViewPanningMode -int 0
defaults write com.apple.UniversalAccess closeViewScrollWheelModifiersInt -int 1048576
defaults write com.apple.UniversalAccess closeViewScrollWheelToggle -bool true
defaults write com.apple.UniversalAccess closeViewSmoothImages -bool false
defaults write com.apple.UniversalAccess closeViewZoomFactor -string "2.00"
defaults write com.apple.UniversalAccess closeViewZoomFollowsFocus -bool false
defaults write com.apple.UniversalAccess increaseContrast -bool true
defaults write com.apple.UniversalAccess login -bool false

defaults write com.apple.universalaccess mouseDriverCursorSize -float 2.5
defaults write com.apple.UniversalAccess reduceTransparency -bool true
defaults write com.apple.UniversalAccess whiteOnBlack -int 1
defaults write com.apple.UniversalAccess reduceTransparency -bool true
defaults write com.apple.CoreGraphics DisplayUseInvertedPolarity -int 1


# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2


# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true


# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Restore the the 'Save As' menu item (Equivalent to adding a Keyboard shortcut in the System Preferences.app )
defaults write -g NSUserKeyEquivalents -dict-add 'Save As...' '@$S'

# Save to disk (not to iCloud) by default 
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Expand 'Save As…' dialog boxes by default
defaults write -g NSNavPanelExpandedStateForSaveMode -boolean true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel dialog boxes by default
defaults write -g PMPrintingExpandedStateForPrint -boolean true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Speech - read aloud, fast with Ctrl-S
defaults write com.apple.speech.synthesis.general SpokenUIUseSpeakingHotKeyCombo -int 4097
defaults write com.apple.speech.synthesis.general SpokenUIUseSpeakingHotKeyFlag -int 1
#defaults write com.apple.speech.voice.prefs SelectedVoiceCreator -int 1835364215
#defaults write com.apple.speech.voice.prefs SelectedVoiceID -int 201
#defaults write com.apple.speech.voice.prefs SelectedVoiceName -int Alex
defaults delete com.apple.speech.voice.prefs VoiceRateDataArray
defaults write com.apple.speech.voice.prefs VoiceRateDataArray -array-add '(1835364215, 201, 320)'


# Auto-hide the Dock
defaults write com.apple.Dock autohide -bool true


mkdir ~/Applications
cd ~/Applications
curl -OL https://api.textmate.org/downloads/release
mv release TextMate.tbz
tar -xjf TextMate.tbz
rm TextMate.tbz

read -d '' stuff <<- EOF
fontSize         = 36
theme            = DDC0CBE1-442B-4CB5-80E4-26E4CFB3A277
EOF

echo "$stuff" > ~/Library/Application\ Support/TextMate/Global.tmProperties

mkdir ~/bin
cp ~/Applications/TextMate.app/Contents/Resources/mate ~/bin/


read -d '' stuff <<- EOF
alias ls='ls -Gleah'
export PATH="~/bin:$PATH"
test
EOF

echo "$stuff" > ~/.bash_profile


#for app in "SystemUIServer" "cfprefsd" "Dock" "Finder"; do
#	killall "${app}" &> /dev/null
#done

sleep 3
set +v

#launchctl stop com.apple.syncdefaultsd && launchctl start com.apple.syncdefaultsd
#killall cfprefsd

osascript -e 'tell application "loginwindow" to  «event aevtrlgo»'
