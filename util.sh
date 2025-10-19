#!/bin/bash

# Initialize stage variable
stage=0 

#TODO: Fix Extension removal (always does option 2 regardless of input)

#Made by cros_mstr on GitHub

#IMPORTANT: Make sure you pull (yoink) the wallpapers before doing anything! If your device came with a separate OEM wallpaper, this utility will NOT restore it if you delete it.

#In Cros, Each time you run the file in bash, close the text editor first, then open a new one once back. If youu don't, none of your changes will actually save even if they say they do.

# copytosafedir because chronos removes/hides its contents when not logged in and switches them out when you switch users.
copytosafedir(){
echo "Copying to a safe directory. This may persist a powerwash."
sudo cp -r -f -v /home/chronos/user/MyFiles/cros_mstr /media/archive
echo "Finished! The file should be in /media/archive. To run it, perform bash /media/archive/cros_mstr/util.sh. This should work across user accounts."
}

#Channel Management
channel_switcher() {
    stage=2
    clear
    echo "CROS-MSTR Channel Setter: 
    1) Stable Channel
    2) Beta Channel
    3) Dev Channel
    4) Canary Channel
    5) LTC Channel
    6) LTS Channel
    7) Return to Stable w/o powerwash (May cause issues)"
    
    # Prompt for user input again within the function
    read -p "Please select an option (1, 2, 3, 4, 5, 6, or 7): " user_input

    if [[ $user_input == "1" ]]; then
    clear # MAKE WAY!
update_engine_client --channel=stable-channel

    elif [[ $user_input == "2" ]]; then
    clear # MAKE WAY!
        # Execute the command for option 2
update_engine_client --channel=beta-channel

        elif [[ $user_input == "3" ]]; then
        clear # MAKE WAY!
        # Execute the command for option 2
update_engine_client --channel=dev-channel
   elif [[ $user_input == "4" ]]; then
   clear
        # Execute the command for option 2
update_engine_client --channel=canary-channel
   elif [[ $user_input == "5" ]]; then
   clear
   update_engine_client --channel=ltc-channel
        # Execute the command for option 2
   elif [[ $user_input == "6" ]]; then
   clear
        # Execute the command for option 2
update_engine_client --channel=lts-channel
   elif [[ $user_input == "7" ]]; then
   clear
        # Execute the command for option 2
update_engine_client --channel=stable-channel --nopowerwash
    else
        echo "Invalid option selected. Exiting."
    fi
}

#Update Management
update_mgmnt() {
    stage=2
    clear
    echo "CROS-MSTR Update Manager: 
    1) Ask before applying Updates
    2) Rollback (With Powerwash) <WARNING: BUGS MAY OCCUR>
    3) Rollback (Without Powerwash)
    4) Enable Rollback (Possibly required for options 2 and 3
    5) Report Previous Version
    6) Reboot System
    7) Upgrade/Downgrade to Version 100
    8) Switch Channels"
    
    # Prompt for user input again within the function
    read -p "Please select an option (1, 2, 3, 4, 5, 6, or 7): " user_input

    if [[ $user_input == "1" ]]; then
    clear # MAKE WAY!
update_engine_client --skip_applying=true
echo "Automatic Updates have been Disabled and you will now be prompted for future updates."

    elif [[ $user_input == "2" ]]; then
    clear # MAKE WAY!
        # Execute the command for option 2
        cd /usr/sbin
        sudo ./chromeos-firmwareupdate --force --wp=1
update_engine_client --rollback

        elif [[ $user_input == "3" ]]; then
        clear # MAKE WAY!
         cd /usr/sbin
        sudo ./chromeos-firmwareupdate --force --wp=1
        # Execute the command for option 2
update_engine_client --rollback --nopowerwash
   elif [[ $user_input == "4" ]]; then
   clear
        # Execute the command for option 2
update_engine_client --can_rollback=true
   elif [[ $user_input == "5" ]]; then
   clear
        # Execute the command for option 2
update_engine_client --prev_version
   elif [[ $user_input == "6" ]]; then
   clear
        # Execute the command for option 2
update_engine_client --reboot
   elif [[ $user_input == "7" ]]; then
   clear
        # Execute the command for option 2
update_engine_client --app_version=100
update_engine_client --reboot
   elif [[ $user_input == "8" ]]; then
   clear
        # Execute the command for option 2
channel_switcher
    else
        echo "Invalid option selected. Exiting."
    fi
}

# Function to display wallpaper options and handle user input
my_function() {
    stage=2
    clear
    sleep 1
    echo "CROS-MSTR Croissant Wallpapers: 
    1) Change Lock/Login Screen Preview Wallpapers 
    2) Change Default Wallpapers 
    3) Yoink Current Wallpapers 
    4) Restore Default ChromeOS Wallpapers
    5) Remove All Wallpapers"
    
    
    # Prompt for user input again within the function
    read -p "Please select an option (1, 2, 3, 4, or 5): " user_input

    if [[ $user_input == "1" ]]; then
    clear # MAKE WAY!
        my_function1
        # Execute the command for option 1
        sudo cp -r -f -v /home/chronos/user/MyFiles/wallpapers /home/chronos
        echo "Lock/Login screen preview wallpaper has been changed."

    elif [[ $user_input == "2" ]]; then
    clear # MAKE WAY!
        # Execute the command for option 2
        sudo cp -r -f -v /home/chronos/user/MyFiles/custom_wallpapers /home/chronos
        echo "Default wallpaper has been changed."

        elif [[ $user_input == "3" ]]; then
        clear # MAKE WAY!
        # Execute the command for option 2
        mkdir /home/chronos/user/MyFiles/YoinkedWallpapers
        sudo cp -r -f -v /home/chronos/custom_wallpapers /home/chronos/user/MyFiles/YoinkedWallpapers
                echo "custom_wallpapers saved to yoinkery"
        sudo cp -r -f -v /home/chronos/wallpapers /home/chronos/user/MyFiles/YoinkedWallpapers
                echo "wallpapers saved to yoinkery"
                 echo "wallpapers file needs fixing! Fixing up now..."
                sudo chmod o+wrx /home/chronos/wallpapers
                sleep 2
                echo "Unlocked Wallpapers"
                echo "custom_wallpapers file needs fixing! Fixing up now..."
                sleep 2
                sudo chmod o+wrx /home/chronos/custom_wallpapers
                echo "custom_wallpapers unlocked! Yoinking has concluded."
        echo "Wallpapers Yoinked Successfully. They have been saved in the YoinkedWallpapers folder in My Files."
   elif [[ $user_input == "4" ]]; then
   clear
        # Execute the command for option 2
        mkdir /home/chronos/user/MyFiles/TemporaryTransportal
        mkdir /home/chronos/user/MyFiles/TemporaryTransportal/custom_wallpapers
         sudo cp -r -f -v /usr/share/chromeos-assets/wallpaper/child_small.jpg /home/chronos/user/MyFiles/TemporaryTransportal/custom_wallpapers
         sudo cp -r -f -v /usr/share/chromeos-assets/wallpaper/child_large.jpg /home/chronos/user/MyFiles/TemporaryTransportal/custom_wallpapers
         sudo cp -r -f -v /usr/share/chromeos-assets/wallpaper/guest_small.jpg /home/chronos/user/MyFiles/TemporaryTransportal/custom_wallpapers
         sudo cp -r -f -v /usr/share/chromeos-assets/wallpaper/guest_large.jpg /home/chronos/user/MyFiles/TemporaryTransportal/custom_wallpapers
         sudo cp -r -f -v /usr/share/chromeos-assets/wallpaper/default_small.jpg /home/chronos/user/MyFiles/TemporaryTransportal/custom_wallpapers
         sudo cp -r -f -v /usr/share/chromeos-assets/wallpaper/default_large.jpg /home/chronos/user/MyFiles/TemporaryTransportal/custom_wallpapers
        sudo cp -r -f -v /home/chronos/user/MyFiles/TemporaryTransportal/custom_wallpapers /home/chronos
        sudo rm -r /home/chronos/user/MyFiles/TemporaryTransportal
        echo "Google's Default Wallpapers Restored! (NOT OEM WALLPAPERS)"
elif [[ $user_input == "5" ]]; then
clear
sudo rm -rf -v /home/chronos/custom_wallpapers/*
sudo rm -rf -v /home/chronos/wallpapers/*
    else
        echo "Invalid option selected. Exiting."
    fi
}

# Function to provide additional instructions
my_function1() {
    echo "If it doesn't work, please put the wallpaper folder in MyFiles and do not rename them."
}

#intro Sequence
echo "XXXX-XXXX"
sleep 0.1
clear
echo "CXXX-XXXX"
sleep 0.1
clear
echo "CRXX-XXXX"
sleep 0.1
clear
echo "CROX-XXXX"
sleep 0.1
clear
echo "CROS-XXXX"
sleep 0.2
clear
echo "CROS-BXXX"
sleep 0.1
clear
echo "CROS-BRXX"
sleep 0.1
clear
echo "CROS-BRKX"
sleep 0.1
clear
echo "CROS-BRKR"
sleep 0.2
clear
echo "CROS-BRKR"
echo "$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "B$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY $"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY C$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY CR$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY CRO$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY CROS$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY CROS_$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY CROS_M$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY CROS_MS$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY CROS_MST$"
sleep 0.1
clear
echo "CROS-BRKR"
echo "BY CROS_MSTR"
# Clear Terminal (For realz)
sleep 1
printf "\033c"
# Prompt the user for initial input
read -p "CROS-BRKR Select Option 
1: Wallpaper Tools: 
2: Remove/Patch
3: JB
4: Copy to Safe Directory
5: Disable Dev Mode On requirement to boot older versions (5 minute countdown to turn back on)
6: Enable Dev Mode On requirement to boot older versions (Removes Countdown)
7: Remove Dev Mode Countdown for ALL versions (experimental, use at own risk and do not disable dev mode again without first running option 6! This will also temporarily disable updates and temporarily make CrOS think your device is out of updates, as well as break other components temporarily.)
8: Update Management
9: Download and Install ADB and Chrome Canary APK
" user_input

animateWlPrstools() {
clear
echo "|"
sleep 0.1
clear
echo "|_"
sleep 0.1
clear
echo "|__"
sleep 0.1
clear
echo "|___"
sleep 0.1
clear
echo "|____"
sleep 0.1
clear
echo "|_____"
sleep 0.1
clear
echo "|______"
sleep 0.1
clear
echo "|_______"
sleep 0.1
clear
echo "|________"
sleep 0.1
clear
echo "|_________"
sleep 0.1
clear
echo "|__________"
sleep 0.1
clear
echo "|__________"
sleep 0.1
clear
echo "|___________"
sleep 0.1
clear
echo "|____________
|          |"
sleep 0.05
clear
echo "|____________
|          |
|          |"
sleep 0.05
clear
echo "|____________
|          |
|          |
|          |"
sleep 0.05
clear
echo "|____________
|          |
|          |
|          |
|          |"
sleep 0.05
clear
echo "|____________
|          |
|          |
|          |
|          |
|__________|"
sleep 0.05
clear
echo "|____________
|          |
|          |
|Loading...|
|          |
|__________|"
sleep 1.2
clear
}

Jailbreak() {
clear
echo "Jailbreaking and stashing..."
sleep 0.15
echo "Checking RAM"
echo "Loading Graphical User Interface"
echo "+[]=====================Chromebook/Chrome OS Jailbreak Utility======================X-+
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
|                                                                                        |
------------------------------------------------------------------------------------------"
}

InstallADBandCanary(){
clear
echo "Downloading ADB Tools (Needed for installing the APK)"
echo "If an error is returned, run sudo apt-get install android-tools-adb in crosh."
curl --output ~/MyFiles.CrosMSTRChromeCanary.apk https://archive.org/download/GChrome132/base.apk
echo "Finishing up, Check your apps in Launcher if it didnt pin itself to the shelf."

}
RemovalExt(){
clear
echo "This will expire all of your extensions for this session! They should restore when you relaunch the desktop environment, however, this is not guaranteed! To cancel, press CTRL + C. Proceeding in 5s"
sleep 1
clear
echo "This will expire all of your extensions for this session! They should restore when you relaunch the desktop environment, however, this is not guaranteed! To cancel, press CTRL + C.  Proceeding in 4s"
sleep 1
clear
echo "This will expire all of your extensions for this session! They should restore when you relaunch the desktop environment, however, this is not guaranteed! To cancel, press CTRL + C.  Proceeding in 3s"
sleep 1
clear
echo "This will expire all of your extensions for this session! They should restore when you relaunch the desktop environment, however, this is not guaranteed! To cancel, press CTRL + C.  Proceeding in 2s"
sleep 1
clear
echo "This will expire all of your extensions for this session! They should restore when you relaunch the desktop environment, however, this is not guaranteed! To cancel, press CTRL + C.  Proceeding in 1s"
sleep 1
clear
echo "This will expire all of your extensions for this session! They should restore when you relaunch the desktop environment, however, this is not guaranteed! To cancel, press CTRL + C.  Proceeding in 0s"
sleep 1
clear
echo "Removing Extensions..."
sudo rm -rf -v Extension\ Rules Extension\ State Extension\ Scripts Extensions
}

RemovalPrefs(){
echo "This will temporarily reset some of your Chrome OS Preferences."
echo "Resetting Setting..."
sudo rm -rf -v Preferences
}

RemoveSelected(){
clear
read -p "Which would you like to remove? Options marked with (rs) should be restored using sync when you add the user back and are not permanent.
A: Extensions(rs)
B: Preferences(rs)
"
if [[ $user_input == "A" ]]; then
    RemovalExt
    
elif [[ $user_input == "B" ]]; then
    RemovalPrefs

else
    echo "You did not choose an option. Please choose an option."
    
fi
}

# Check if the user pressed '1' to proceed
if [[ $user_input == "1" ]]; then
animateWlPrstools
sleep 5
    my_function
elif [[ $user_input == "2" ]]; then
    RemoveSelected

elif [[ $user_input == "3" ]]; then
    Jailbreak
elif [[ $user_input == "4" ]]; then
    copytosafedir
elif [[ $user_input == "5" ]]; then
echo "Getting Verified Status"
sleep 5
sudo bash /usr/sbin/activate_date
sleep 0.2
echo "Removing the Verified requirement..."
sleep 0.5
   sudo bash /usr/sbin/activate_date --clean
   echo "Boot patched, you may now disable dev mode if you'd like. Be forewarned that you may have to continue the 5 minute countdown until you choose to restore the verified status."
elif [[ $user_input == "6" ]]; then
echo "Removing current activation status as a precaution..."
sleep 0.5
   sudo bash /usr/sbin/activate_date --clean
echo "Setting Verified Date"
sleep 5
sudo bash /usr/sbin/activate_date
sleep 0.2
   echo "Boot patched! You will now need dev mode ON to boot older versions." 
elif [[ $user_input == "5" ]]; then
echo "Getting Verified Status"
sleep 5
sudo bash /usr/sbin/activate_date
sleep 0.2
echo "Removing the Verified requirement..."
sleep 0.5
   sudo bash /usr/sbin/activate_date --clean
   echo "Boot patched, you may now disable dev mode if you'd like. Be forewarned that you may have to continue the 5 minute countdown until you choose to restore the verified status."
elif [[ $user_input == "7" ]]; then
echo "Removing current activation status as a precaution..."
sleep 0.5
   sudo bash /usr/sbin/activate_date --clean
   echo "Setting Configs..."
   sudo date --set="20441014"
    sudo bash /usr/sbin/activate_date
   echo "Config set!"
   echo "If the date does not correct itself after a day, you can try powerwashing. This can also bypass some of the automatic updates."
   echo "Keep in mind this may not work."
echo "The date will reset in 10 seconds. If you would like to keep the unverified date instead, press CTRL C. Keep in mind that the unverified date can prevent unwanted updates among other things, however can also hinder the chromebook's abilities."
sleep 5
echo "Resetting date in 5"
sleep 1
echo "Resetting date in 4"
sleep 1 
echo "Resetting date in 3"
sleep 1 
echo "Resetting date in 2"
sleep 1
echo "Resetting date in 1"
sleep 1
echo "Resetting date in 0"
sudo date --set="20261010"
echo "Date Reset Triggered"
   echo "Boot patched! If all went well, you should no longer require the countdown to enable dev mode. Keep in mind that you may run into issues if you choose disable dev mode WITHOUT first running option 6. Your date has been reset to an ESTIMATE. Please head to a browser and type in chrome://restart to change to the correct date!" 
elif [[ $user_input == "8" ]]; then
update_mgmnt
elif [[ $user_input == "9" ]]; then
InstallADBandCanary
else
    echo "You did not select option 1. Exiting."
fi
