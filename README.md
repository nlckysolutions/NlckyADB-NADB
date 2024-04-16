# NlckyADB
The ultimate ADB tools, utils, and commands, all in one sleek command: "nadb"

# Installation
Simply download the latest release of NlckyADB and open a command prompt as administrator in the same folder the nadb.bat file is in.
Then, simply execute the below command in command prompt and follow the instructions:
```
nadb setup
```

# Basic Usage
Before we start using some of the more advanced features, let's go over some basic features first.
If you would like to go over the advanced features now, click [here](#advanced-usage) to jump to the Advanced Usage section.
## The "set" and "reset" commands.
When used properly, the set and reset commands can be very useful!
The set command features many settings to set.
To set a setting, use the syntax ```nadb set {SETTING} {VALUE}```.
To reset a setting to its default value, use the syntax ```nadb reset {SETTING}```

There are currently **2** different settings that you can modify.

1. Battery percentage (does not affect real battery, just visually shows new percentage) - Syntax: ```nadb set battery {VALUE}``` & ```nadb reset battery```
2. Screen density (size of items on the screen, minimum 72) - Syntax: ```nadb set density {VALUE}``` & ```nadb reset density```

Using these commands, it makes it easier to set different values on a device.
Now, to the advanced features.
# Advanced Usage
Welcome to advanced usage! Don't worry, I'll be sure to go over each command and what they do in-depth.
## The "util" command, the most powerful one.
The util command, as you most likely guessed, is short for Utilities.
These utilities are a combination of adb commands, and can be thought of as seperate, mini projects, all while being within NlckyADB.
To use a utility, simply use the syntax ```nadb util {UTILITY}```

There are currently **3** different utilities available.

### EZ Fast Factory Reset (EZFFR)
```Introduced to NlckyADB in pre-release v1.0 alpha```
Ever wondered why factory resets take so long?
Well here's why, according to Google's AI Overview (which can be more accurate then other AIs):
```A factory reset on an Android phone can take up to an hour, depending on the phone's hard drive size and processing speed. This is because the factory reset copies a different filesystem image, then boots into this new system and configures it for the user. This process uses the CPU's full capacity and is similar to installing a new desktop OS.```
Well what if the phone doesn't need to use an entire filesystem image?
After expirementing with this, I realized that by clearing all the apps' data, clearing all accounts, and resetting all settings to default, it's like having a normal factory reset, just without the setup wizard! (now I know you can restart the setup wizard with root, but I didn't include this into EZFFR because it requires root, and I would like for it to work on every device.)
Now are you ready to EZFFR your device?
WARNING! This utility will permanentaly erase all your data, and ~~cannot~~ can be recovered, but it is not something the average user could do. PROCEED AT YOUR OWN RISK.
The syntax to start EZFFR is ```nadb util ezffr```.
Happy EZFFRing! (yes i said EZFFRing)

### YT ReVanced installer (I DO NOT OWN YT REVANCED OR CONTRIBUTE TO IT!! I SIMPLY WROTE A SCRIPT TO INSTALL IT AUTOMATICALLY ONTO A DEVICE!!)
```Introduced to NlckyADB in pre-release v1.0 alpha```
Before you do this on your device, let me explain what YT ReVanced is (to those who never heard of it), and **MAKE SURE TO READ THROUGH THIS ENTIRE DESCRIPTION TELLING YOU EXACTLY WHAT THE SCRIPT DOES.**
YT ReVanced is a modified version of youtube with no ads. That's pretty much it. (there are also a ton of other features that i wont be going over because this isnt a description of revanced, just about a script to install it. look up yt revanced if you must)
ALL the script does is: 
1. Uninstalls the original youtube app (so they dont get mixed up. also works even if you cant uninstall youtube manually)
2. Downloads the ReVanced APK file to your computer and installs it onto the device.
3. Downloads the MicroG APK file to your computer and installs it onto the device. (microG is a mod of google play services and yt revanced wont work without it.)
4. THAT'S IT!!!
The syntax to start the installer is ```nadb util ytrevanced```
Happy YTREVANCEDing! (yes i know this is getting too ridiculous now)

### SecretADB
(i will write a description soon, for now you can expirement with it if you want with the syntax: ```nadb util secretadb```)
```Introduced to NlckyADB in pre-release v1.1 alpha```
