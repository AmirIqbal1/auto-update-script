#!/bin/bash

# Start of the script
echo "Starting system update..."

#monitors last login attempts
echo "Monitoring failed login attempts..."
touch /var/log/btmp
chmod 600 /var/log/btmp
echo "=================================================="
#lets excute command to check
lastb
echo "=================================================="


# Reconfigure dpkg
echo "Reconfiguring dpkg..."
dpkg --configure -a
if [ $? -ne 0 ]; then
  echo "dpkg reconfiguration failed."
  exit 1
fi

# Update package lists
echo "Updating package lists..."
apt update
if [ $? -ne 0 ]; then
  echo "apt update failed."
  exit 1
fi

# Upgrade packages
echo "Upgrading packages..."
apt upgrade -y
if [ $? -ne 0 ]; then
  echo "apt upgrade failed."
  exit 1
fi

# Uncomment the following lines to stop update of Flatpak packages
 echo "Updating Flatpak packages..."
 flatpak update -y
 if [ $? -ne 0 ]; then
   echo "Flatpak update failed."
   exit 1
 fi

# Fix broken dependencies
echo "Fixing broken dependencies..."
apt install -f
if [ $? -ne 0 ]; then
  echo "Fixing broken dependencies failed."
  exit 1
fi

# Clean up
echo "Cleaning up unnecessary packages and files..."
apt clean
apt autoclean
apt autoremove -y
if [ $? -ne 0 ]; then
  echo "Clean up failed."
  exit 1
fi

# Auto reboot if needed
if [ -f /var/run/reboot-required ]; then
  echo " - Reboot required. "
#  reboot
else
  echo "System update completed successfully. No reboot required."
fi

echo""
# End of the script
echo "Script finished."
echo""
