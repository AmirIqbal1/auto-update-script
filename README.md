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
