set -v

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

defaults write com.apple.universalaccess mouseDriverCursorSize -float 2.0
defaults write com.apple.UniversalAccess reduceTransparency -bool true
defaults write com.apple.UniversalAccess whiteOnBlack -int 1
defaults write com.apple.UniversalAccess reduceTransparency -bool true
defaults write com.apple.CoreGraphics DisplayUseInvertedPolarity -int 1

#for app in "SystemUIServer" "cfprefsd" "Dock" "Finder"; do
#	killall "${app}" &> /dev/null
#done

sleep 3
#launchctl stop com.apple.syncdefaultsd && launchctl start com.apple.syncdefaultsd
#killall cfprefsd

osascript -e 'tell application "loginwindow" to  «event aevtrlgo»'
