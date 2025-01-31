#!/bin/bash

# Define a function to be called when the user presses '1'
my_function() {
    echo "Wallpapers"
    # You can add your commands here
    # Define a function to be called when the user presses '1'
}
my_function1() {
    echo "Please put the wallpaper folder in MyFiles. (it's what contains Downloads in the file manager), then press a number. 1. Push Default wallpapers 2. Push LS Wallpapers"
    # You can add your commands here
}

if [[ $user_input == "1"]]; then
    my_function1
else if [[ $user_input == "2"]]
sudo cp -r -v MyFiles/wallpapers /home/chronos
    echo "Pushed."
fi



# Prompt the user
read -p "CROS-BRKR 1: Wallpaper Tools: " user_input

# Check if the user pressed 'y'
if [[ $user_input == "1"; then
    my_function
else
    echo "You did not press '1'. Exiting."
fi
