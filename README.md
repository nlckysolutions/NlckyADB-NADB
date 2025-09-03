# NlckyADB (NO LONGER BEING MAINTAINED: Please use nPhoneKIT instead!)

$${\color{orange} \textbf{ NLCKYADB IS NO LONGER BEING MAINTAINED, PLEASE USE nPhoneKIT INSTEAD!!} }$$

# [Click me to visit nPhoneKIT](https://github.com/nlckysolutions/nPhoneKIT)

The ultimate ADB tools, utilities, and functions, all in one sleek command: "nadb"

### HUGE UPDATE: NADB 2.0! See Exploits utility [here](#nadb-exploits)!

**Please click the sponsor button at the top of the page to donate to NlckyADB if you found it useful! This will keep me motivated to keep working on NlckyADB!**

# Installation
Simply download the latest release of NlckyADB and open a command prompt as administrator in the same folder the nadb.bat file is in.
Then, simply execute the below command in command prompt and follow the instructions:
```
nadb setup
```

**NADB MUST BE USED IN A FOLDER THAT CONTAINS ADB AND FASTBOOT, UNLESS THEY ARE GLOBALLY ACCESSIBLE ON YOUR SYSTEM.**

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

### Image Flasher
Simply flash an image to your device! (USES FASTBOOT)
To use, simply enter ```nadb util flash {BOOT or RECOVERY (unless you know what you're doing)} {IMAGE FILE PATH/NAME}```
It will issue an ADB command to reboot your device into fastboot. Once your device is in fastboot, press any key and it will show you a list of devices. If you see a device listed, press any key. Otherwise, restart the whole process.
Anyway, if your bootloader is unlocked, and everything is perfect, the image you provided will start flashing onto your device. DO NOT UNPLUG THE CABLE WHILE IT IS FLASHING OR YOU COULD PERMANENTLY BRICK YOUR DEVICE. Once it is finished, and it EXPLICITLY TELLS YOU: "Image flashing complete. You may unplug your device now.", you may then unplug your device, and on most devices, press and hold VOL_DOWN + POWER for about 10 seconds to reboot it.

### NADB Exploits
- DIRECT access to all exploits for your device, all in one command: ```nadb util exploits find```
- Searches your device's model number in a list of TONS of available exploits
- If your device's model number matches any exploits, NlckyADB will explain EXACTLY how to do it, or in some cases, give you the option to do it for you!!
- All exploits are 100% FREE, no more PAID services for something that EVERYONE should have access to.
- Some of the exploits are:
- ROOT certain Samsung devices WITHOUT tripping knox, EVEN SOME BOOTLOADER LOCKED US MODELS.
- On some older Samsung devices, gain access to a full-fledged SYSTEM SHELL without rooting, bootloader unlocking, or tripping knox, EVEN ON SOME US MODELS.
- AND many more exploits, and with new exploits being discovered almost every month, AS MANY AS POSSIBLE will be added straight to NlckyADB's ever-growing exploit database.
- You don't even need to UPDATE your entire NADB.BAT in order to update the database, it's all automatic!

## The "plugins" command
The plugins command installs custom made plugins on your device!
Here are the plugins:
### SecretADB
SecretADB is a plugin designed to hide ADB on a device, by disabling dev tools whilst keeping ADB enabled. 
The syntax to use SECRETADB is ```nadb plugins install 1```! and to uninstall: ```nadb plugins uninstall 1```

