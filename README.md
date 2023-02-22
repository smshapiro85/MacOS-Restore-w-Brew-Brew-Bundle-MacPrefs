# MacOS Restore Using Brew, Brew Bundle & MacPrefs

Background: This is a script that I compiled from various sources to restores a variety of preferences, app preferences, apps and app store apps, primarily using Brew and Brew Bundle. This is my personal script so you'll want to download it and modify it to your liking.

What this script does:

1. Updates system preferences
2. Installs Homebrew, Brew Bundle, Python, App Store MAS (for installing app store apps), and MacPrefs for restoring additional app preferences
3. Runs a brew bundle to restore brew apps and app store apps
4. Updates some one-off app preferences for Safari, Text Edit and the App Store
5. Last manual step to install Python 2.7 specifically in order to allow usage of [macprefs](https://github.com/clintmod/macprefs)

Upate the Brew Bundle file [macosrestore](https://github.com/smshapiro85/MacOS-Restore-w-Brew-Brew-Bundle-MacPrefs/blob/main/macosrestore) with the Brew Apps and App Store apps that you would like to use. Then use the [macosrestore-exec.sh](https://github.com/smshapiro85/MacOS-Restore-w-Brew-Brew-Bundle-MacPrefs/blob/main/macosrestore-exec.sh) to kick things off.

The script does not automatically run MacPrefs since it requires Python 2.7 and I install it manually, so if you want to take advantage of this, please visit the [macprefs](https://github.com/clintmod/macprefs) page to learn more about the functionality. Everything else is covered in the script.
