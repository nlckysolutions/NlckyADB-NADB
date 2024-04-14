@echo off
setlocal

goto cmds

:EZFFR

cls
echo Welcome to EZFFR (EZ Fast Factory Reset) Utility!
echo This tool is designed to ERASE all user data on the device.
echo Instead of a normal reset, it erases manually so that you have debug info, and it is much quicker than a normal reset.
echo WARNING! THIS WILL ERASE ALL USER DATA ON THE DEVICE! PRESS ANY KEY TO CONTINUE!

pause

set /p old_password=Enter device password/passcode:
echo When prompted on the next screen on your device, remove ALL google accounts. Then press any key.
adb shell am start -a android.settings.SYNC_SETTINGS

pause

echo [101;93m LAST CHANCE! [0m
echo BY CLICKING ANY KEY, YOUR DEVICE WILL BE EZFFR RESET!
echo [101;93m THERE IS NO GOING BACK!! [0m
echo [100;101m THIS IS THE LAST CONFIRMATION! CLOSE THIS WINDOW NOW TO SAVE YOUR DATA. [0m
echo IF YOU ARE REALLY SURE YOU WANT TO DO THIS, PRESS ANY KEY NOW.

pause

echo EZFFR is resetting your device now...
echo DO NOT CLOSE THIS WINDOW UNTIL FINISHED!
echo Before you press any key to continue, remember that for fun, you can watch as your device is erased on the home screen.

pause

echo Clearing google setup from device...
adb shell pm clear com.google.android.gms
rem adb shell "dumpsys account | grep -E 'Account \[.*\] u0a\d+ \[com.google\]' | sed -E 's/.* \[([^]]+)\].*/\1/' | xargs -I {} adb shell am remove-account --user 0 {}"

echo Clearing screen lock...
adb shell locksettings clear --old %old_password%

echo Erasing user settings...
rem adb shell settings put global airplane_mode_on 1 && adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true && adb shell settings put global airplane_mode_on 0 && adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false
rem adb shell pm reset-preferences

echo Clearing user data and files from the device...
adb shell rm -rR /sdcard/Alarms
adb shell rm -rR /sdcard/Android
adb shell rm -rR /sdcard/DCIM
adb shell rm -rR /sdcard/Download
adb shell rm -rR /sdcard/Movies
adb shell rm -rR /sdcard/Music
adb shell rm -rR /sdcard/Notifications
adb shell rm -rR /sdcard/Pictures
adb shell rm -rR /sdcard/Podcasts
adb shell rm -rR /sdcard/Ringtones
adb shell rm -rR /sdcard/*

echo Recreating empty deleted folders...
adb shell mkdir /sdcard/Alarms
adb shell mkdir /sdcard/Android
adb shell mkdir /sdcard/DCIM
adb shell mkdir /sdcard/Download
adb shell mkdir /sdcard/Movies
adb shell mkdir /sdcard/Music
adb shell mkdir /sdcard/Notifications
adb shell mkdir /sdcard/Pictures
adb shell mkdir /sdcard/Podcasts
adb shell mkdir /sdcard/Ringtones

echo Uninstalling all user-installed apps...
adb shell "pm list packages -3 | cut -d':' -f2 | tr '\r' ' ' | xargs -r -n1 -t pm uninstall -k"

echo Clearing all remaining APP data...
adb shell "pm list packages | cut -d':' -f2 | tr '\r' ' ' | grep -v 'com.samsung.android.kgclient' | xargs -r -n1 -t pm clear"

echo DONE!

goto end

:ytrevanced
setlocal

REM Download APK files
powershell -Command "& { Invoke-WebRequest -Uri 'https://github.com/revanced-apks/build-apps/releases/download/v2024.04.02-1745/youtube-revanced-v19.09.37-all.apk' -OutFile 'youtube-revanced-v19.09.37-all.apk' }"
powershell -Command "& { Invoke-WebRequest -Uri 'https://github.com/revancedapps/revanced.net/releases/download/2024-14/revanced.net_revanced_gms_microg_v0.3.1.4.240913.apk' -OutFile 'revanced.net_revanced_gms_microg_v0.3.1.4.240913.apk' }"

REM Move downloaded files to current directory
move /Y "youtube-revanced-v19.09.37-all.apk" "%cd%\youtube-revanced-v19.09.37-all.apk"
move /Y "revanced.net_revanced_gms_microg_v0.3.1.4.240913.apk" "%cd%\revanced.net_revanced_gms_microg_v0.3.1.4.240913.apk"
:reinstallyt
echo Make sure the device is listed below before continuing...
adb devices
pause
REM Install APK files using adb

adb shell pm uninstall -k --user 0 com.google.android.youtube
adb install -r "youtube-revanced-v19.09.37-all.apk"
adb install -r "revanced.net_revanced_gms_microg_v0.3.1.4.240913.apk"

REM Echo success message
echo YT Revanced and MicroG core installed successfully.
echo Would you like to install on another device? 1: Yes, 2: No, and delete the files, 3: No, and keep the files.
CHOICE /C 123 /M "Enter your choice:"
if ERRORLEVEL 3 goto noandkeep
if ERRORLEVEL 2 goto noanddelete
if ERRORLEVEL 1 goto reinstallyt
:noanddelete
REM Delete downloaded files
del "youtube-revanced-v19.09.37-all.apk" "revanced.net_revanced_gms_microg_v0.3.1.4.240913.apk"
:noandkeep

echo Finished!




REM Install APK files using adb
adb install -r "youtube-revanced-v19.09.37-all.apk"
adb install -r "revanced.net_revanced_gms_microg_v0.3.1.4.240913.apk"

REM Echo success message
echo YT Revanced & MicroG core installed successfully.

REM Delete downloaded files
del "youtube-revanced-v19.09.37-all.apk" "revanced.net_revanced_gms_microg_v0.3.1.4.240913.apk"

goto end


:cmds
REM Check if no arguments are provided
if "%~1"=="" (
    echo Usage: nadb [command] [argument]
    exit /b
)

REM Check the provided command
if /I "%~1"=="set" (
    if "%~2"=="battery" (
        if "%~3"=="" (
			echo Usage: nadb set battery [level]
		) else (
			adb shell dumpsys battery set level %3
			echo Battery level set successfully.
		)
	) else if "%~2"=="density" (
		if "%~3"=="" (
			echo Usage: nadb set density [level]
		) else (
			adb shell wm density %3
			echo Density set successfully.
		)
	)
) else if /I "%~1"=="reset" (
	if "%~2"=="battery" (
		adb shell dumpsys battery reset
		echo Battery level reset successfully.
	) else if "%~2"=="density" (
		adb shell wm density reset
		echo Density reset successfully.
	)
) else if /I "%~1"=="setup" (
	echo SETUP
	echo IN ORDER TO DO THIS, YOU'LL NEED TO OPEN A NEW CMD AS ADMIN, THEN RUN "nadb setup".
	echo IF THIS CMD IS ALREADY ADMIN, PRESS ANY KEY NOW.
	echo This will allow you to use nadb anywhere in the os rather then just in one folder.
	
	pause
	
	xcopy "%~dp0\%~nx0" /y "C:\Windows\nadb.bat"

	echo Finished! Try using nadb now in another folder!
	exit /b
) else if /I "%~1"=="version" (
	echo NADB VERSION ALPHA
) else if /I "%~1"=="util" (
	if "%~2"=="ezffr" (
		goto ezffr
	) else if "%~2"=="ytrevanced" (
		goto ytrevanced
	)
) else (
    echo Unknown command: %~1
    exit /b
)

:end