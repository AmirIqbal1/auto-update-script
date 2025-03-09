# auto-update-script

This script automatically updates Debian-based distros.

## Instructions

To execute this script, run the following commands as root:

```bash
chmod +x update.sh
./update.sh
```

## Features

- Automatically reconfigures `dpkg` if anything is wrong.
- Updates and upgrades the system.
- Performs `apt install -f` to fix broken dependencies.
- Runs `apt autoclean` and `apt autoremove` to clean up unnecessary packages and downloaded files.
- Cleans bash history.
- Updates Flatpak packages (comment the relevant line to disable this).

Great script for debian based distros + servers. It includes auto-reboot features, which you can enable by editing out the comments.

# Automation:
## 1. Create a .desktop File for the Shortcut:

```bash
nano /home/$NAME/Desktop/UpdateSystem.desktop
```
## 2. Add the following content:

```bash
[Desktop Entry]
Name=Update System
Comment=Update and Upgrade System
Exec=sh -c 'pkexec bash ~/update.sh'
Icon=system-software-update
Terminal=true
Type=Application
Categories=Utility;
```
- pkexec prompts for an admin password.
- Terminal=true keeps the terminal open to view progress.

## 3. Make the Shortcut Executable

```bash
chmod +x /home/$NAME/Desktop/UpdateSystem.desktop
```
