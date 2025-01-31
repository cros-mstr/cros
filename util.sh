#!/bin/bash

# Define a function to be called when the user presses '1'
my_function() {
    echo "CROS-MSTR Wallpapers: 1) Change Lock/Login Screen Preview Wallpapers 2) Change Default Wallpapers"
    # You can add your commands here
    # Define a function to be called when the user presses '1'
}
my_function1() {
    echo "If it doesn't work, Please put the wallpaper folder in MyFiles and do not rename them."
    # You can add your commands here
}





# Prompt the user
read -p "CROS-BRKR 1: Wallpaper Tools: " user_input

# Check if the user pressed 'y'
if [[ $user_input == "1"; then
    my_function
else
    echo "You did not press '1'. Exiting."
fi
if [[ $user_input == "2"]]; then
sudo cp -r -v MyFiles/custom_wallpapers /home/chronos
else if [[ $user_input == "1"]]
sudo cp -r -v MyFiles/wallpapers /home/chronos
    echo "Pushed."
fi
