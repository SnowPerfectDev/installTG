#!/bin/bash

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root"
  exit
fi

# Function to clear the screen
clear_screen() {
    clear
}

# Function to download Telegram
download_telegram() {
    echo "Downloading Telegram..."
    wget https://telegram.org/dl/desktop/linux -O telegram.tar.xz
}

# Function to extract the file
extract_telegram() {
    clear_screen
    echo "Extracting Telegram..."
    tar -xf telegram.tar.xz
}

# Function to move the executable to the /bin/ folder
move_telegram() {
    echo "Moving the executable to the /bin/ folder..."
    mv Telegram/Telegram /bin/Telegram
}

# Function to remove extracted and compressed files
cleanup_files() {
    echo "Cleaning up extracted and compressed files..."
    rm -rf Telegram telegram.tar.xz
}

# Function to grant execute permissions
grant_permissions() {
    echo "Granting execute permissions..."
    chmod +x /bin/Telegram
}

# Download Telegram
download_telegram

# Extract the file
extract_telegram

# Move the executable to the /bin/ folder
move_telegram

# Remove extracted and compressed files
cleanup_files

# Grant execute permissions
grant_permissions

echo "Telegram installed successfully!"
