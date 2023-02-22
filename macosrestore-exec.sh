#!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

# =========================
# System Preferences
# =========================

printf "\n===== Updating System Preferences... =====\n\n"

# Before editing:
killall Finder /System/Library/CoreServices/Finder.app

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show hidden files by default
#defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder AppleShowAllFiles YES

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable "natural" (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Tracking speed: maximum 5.0
defaults write -g com.apple.mouse.scaling 1.5
 
# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Mission Control
 
 # Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0

printf "\n===== System Preferences Update Complete! =====\n\n"

sleep 5

# =========================
# HOMEBREW & APPS
# =========================

printf "\n===== Installing brew... =====\n\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

printf "\n===== Waiting 5 seconds to run the post brew install thingy... ======\n\n"
sleep 5

printf "\n===== Running Brew Command Thingy - Assumes a home directory called michael (1 of 2) =====\n\n"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/michael/.zprofile

sleep 5

printf "\n===== Running Brew Command Thingy - Assumes a home directory of michael (2 of 2) =====\n\n"
eval "$(/opt/homebrew/bin/brew shellenv)"

printf "\n===== Installing brew cask... ======\n\n"
brew tap homebrew/cask

printf "\n===== Installing brew bundle... ======\n\n"
brew tap homebrew/bundle

printf "\n===== Installing pythong... ======\n\n"
brew install python

printf "\n===== Installing App Store MAS... ======\n\n"
brew install mas

printf "\n===== Installing & Configuring Mac Prefs... ======\n\n"
brew install clintmod/formulas/macprefs

export MACPREFS_BACKUP_DIR="/Users/michael/Library/Mobile Documents/com~apple~CloudDocs/Backup/macprefs"

printf "\n===== Firing up the Brew Bundle! ======\n\n"
sleep 5
brew bundle --file=/Users/michael/Library/Mobile\ Documents/com\~apple\~CloudDocs/Backup/macosrestore

printf "\n===== Brew Bundle Setup Complete! Last step... App Preferences... ======\n\n"


# =========================
# APP Preferences
# =========================

# =========== SAFARI ===========

# Enable "Do Not Track"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# =========== TextEdit ===========

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# =========== App Store ===========

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

printf "Done. Note that some of these changes require a logout/restart to take effect.\n\n"
printf "Now run open x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles and enable full disk access before you run install Python 2.7. Once you install all of the manual apps, run macprefs restore \n\n"