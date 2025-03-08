#!/bin/bash

echo "Starting system update..."

# Reconfigure dpkg
echo "Reconfiguring dpkg..."
sudo dpkg --configure -a
if [ $? -ne 0 ]; then
  echo "dpkg reconfiguration failed."
  exit 1
fi

# Update package lists
echo "Updating package lists..."
sudo apt update
if [ $? -ne 0 ]; then
  echo "apt update failed."
  exit 1
fi

# Upgrade packages
echo "Upgrading packages..."
sudo apt upgrade -y
if [ $? -ne 0 ]; then
  echo "apt upgrade failed."
  exit 1
fi

# Update Flatpak packages (comment to disable)
echo "Updating Flatpak packages..."
sudo flatpak update -y
if [ $? -ne 0 ]; then
  echo "Flatpak update failed."
  exit 1
fi

# Fix broken dependencies
echo "Fixing broken dependencies..."
sudo apt install -f
if [ $? -ne 0 ]; then
  echo "Fixing broken dependencies failed."
  exit 1
fi

# Clean up
echo "Cleaning up unnecessary packages and files..."
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y
if [ $? -ne 0 ]; then
  echo "Clean up failed."
  exit 1
fi

# Auto reboot check
echo "=================================================="
if [ -f /var/run/reboot-required ]; then
  echo " - Reboot required."
#  sudo reboot
else
  echo "System update completed successfully. No reboot required."
fi
echo "=================================================="

# Monitor failed login attempts
echo "Monitoring failed login attempts..."
sudo touch /var/log/btmp
sudo chmod 600 /var/log/btmp
echo "=================================================="
lastb
echo "=================================================="

# End of the script
echo "Script finished."
echo ""
