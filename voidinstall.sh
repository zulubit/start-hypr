#!/bin/bash

# Function to handle errors and exit the script
error_exit() {
    echo "Error: $1"
    exit 1
}

# Update the system
sudo xbps-install -Syu || error_exit "Void failed to update before starting the install"

# Add the Hyprland repository
echo "repository=https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc" | sudo tee /etc/xbps.d/hyprland-void.conf || error_exit "Failed to add Hyprland repository"

# Install Hyprland and dependencies
sudo xbps-install -S hyprland noto-fonts-ttf noto-fonts-emoji sof-firmware sof-tools wl-clipboard unzip dbus xz curl wget elogind polkit-elogind pipewire wireplumber SwayNotificationCenter brightnessctl Waybar swaybg foot wmenu playerctl swaylock pavucontrol NetworkManager blueman xdg-desktop-portal-hyprland xdg-desktop-portal-gtk flatpak || error_exit "Package installation failed"

# Add Flathub for Flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo || error_exit "Failed to add Flathub repository"

# Remove the wpa_supplicant symlink
sudo rm -f /var/service/wpa_supplicant || error_exit "Failed to remove wpa_supplicant symlink"

# Create correct symlinks in /var/service
sudo ln -s /etc/sv/NetworkManager /var/service || error_exit "Failed to create NetworkManager symlink"
sudo ln -s /etc/sv/dbus /var/service || error_exit "Failed to create dbus symlink"
sudo ln -s /etc/sv/elogind /var/service || error_exit "Failed to create elogind symlink"
sudo ln -s /etc/sv/bluetoothd /var/service || error_exit "Failed to create bluetoothd symlink"
sudo ln -s /etc/sv/polkitd /var/service || error_exit "Failed to create polkitd symlink"

# Completion message
echo "Installation complete. You should 'sudo reboot' your system."

