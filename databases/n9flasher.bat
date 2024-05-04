@echo off
echo N960U, N960U1, N960W Rooting Tool
echo Before we begin, we will need to download a few files...
echo The total file size is about ~4.1GB.
echo The download time mostly varies from 16 seconds - 16 minutes.
echo For the average user, it will most likely take ~1min 49seconds.
echo Press any key now to begin downloading...

pause


echo Downloading... (PLEASE BE PAITENT)

rem URL to a small file for testing internet connection
set "rootzipurl=https://raw.githubusercontent.com/nlckysolutions/NlckyADB-NADB/main/databases/n9root.zip"

rem Check if internet connection is available
certutil -urlcache -split -f "%rootzipurl%" > nul 2>&1
if %errorlevel% neq 0 (
    echo Error: You need an internet connection.
    exit /b 1
)

echo Unzipping the ZIP file... (This can also take a while on slower computers!)
powershell -command "Expand-Archive -Force '%~dp0n9root.zip' '%~dp0\n9root'"

echo ZIP file unzipped successfully...
echo Now you will need to enable ADB on your device and connect the USB cable to your PC.
echo Once you finished that, please press any key.

pause

echo If your device is connected, it should be listed below...
cd n9root
adb devices

echo If your device is listed, press any key now.
echo If it is not listed, click allow on your device and then press any key now.

pause

echo Wonderful!
echo Now we will need to flash special COMBO firmware onto the device.
echo Your device should show "Downloading..."
echo If it doesn't, follow the steps below. If it does, press any key to begin flashing.
echo 1. Power off device.
echo 2. Press and hold BIXBY+VOL_DOWN+POWER until you see the a blue screen.
echo 3. Press VOL_UP once.
echo Press any key now to begin flashing...

pause

echo Beginning to flash the COMBO firmware...
odin4 -a combo_3asj1.tar --reboot
echo Once you see the FACTORY BINARY logo, you can rest assured that nothing went wrong (HOPEFULLY).
echo Once it boots into factory binary, press any key now.

pause

echo Great! If your device is listed below, we are ready!
adb devices
echo If it isn't, then either your device isn't connected to the PC, or something went horribly wrong...
echo If something went horribly wrong, you will need to fix your device using NLCKYADB RESTORE (nadb util emergencyrestore).
echo So anyway, if your device is listed, press any key now to continue and inject safestrap.

pause

echo INJECTING SAFESTRAP...
adb shell rm /data/lab/run_lab_app.sh
adb push run_lab_app.sh /data/lab
adb shell chmod 0777 /data/lab/run_lab_app.sh
adb shell setprop sec.lab.abc.start 1
adb push sampwnd /persist/coresight
adb push qdss.agent.sh /persist/coresight/qdss.agent.sh
adb shell chmod -R 0777 /persist/coresight/sampwnd
adb install -g ff.apk
adb install -g ll.apk
adb install -g re.apk
adb reboot bootloader
echo Now you need to flash the BOOTRECOVERYSWAP firmware.
echo Press any key to flash it!
echo IMPORTANT! ONCE THE FLASHING PROCESS FINISHES, YOU NEED TO QUICKLY HOLD DOWN BIXBY+VOL_UP. YOU WILL NEED TO DO THIS ON EVERY BOOT.

pause

echo Flashing BOOTRECOVERYSWAP file...
odin4 -a BOOT_IMAGE_SWAP.tar --reboot

echo FLASHING SUCCESS!
echo QUICK!!! HOLD DOWN BIXBY+VOL_UP NO MATTER WHAT UNTIL YOU SEE SAFESTRAP LOGO NOW!!!
echo If you don't do that, it will boot into recovery. If it did go into recovery, click the power button and then hold down BIXBY+VOL_UP until you see safestrap.
echo It may take a while to hold down the buttons. Don't press down too hard or it will hurt your fingers (BASED ON MY PAST EXPERIENCE :/)
echo Once the phone turns on, put it into airplane mode and open FlashFire.
echo If the phone is on, and you are inside flashfire, press any key now.

pause

adb push Install_Files /sdcard/installers/

echo Wonderful, now in flashfire, open Internal Storage(or /sdcard) and open Installers and Install Files and flash system image, vendor image, and then ODM zip. 
echo Once you finish that, press any key now.

pause

echo Your phone will be rebooting, but DO NOT hold down the vol_up and bixby key, just this one time.
echo Your phone should now be in recovery. Use vol buttons to scroll to Wipe Data/ Factory Reset and power to select it.
echo Confirm the factory reset, then click Reboot System now
echo NOW you must hold VOL_UP and BIXBY EVERY TIME you restart the phone.
echo Press any key when you are on the Welcome or Setup screen.

pause

echo Wonderful!
echo Your phone is rooted successfully!
echo If you do not see the setup / welcome screen, something has gone VERY wrong.
echo Now you can setup your phone as normal and you're done.
echo the end. have fun with rooted phone.
echo press any key now for summary.

pause 

cls
echo SUMMARY
echo Installed COMBO firmware
echo Installed SAFESTRAP
echo Installed BOOTRECOVERYSWAP
echo Installed STOCKSYSTEMANDVENDOR
echo Rooted Phone Successfully!
echo
echo Press any key to exit!
pause
