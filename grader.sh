# To-Do: ADd to cros_mstr and enable asking for version number to grade to.
# This basically does the major version number, like 73. It may work for downgrading/upgrading.
# MY note: Removed dev_image from stateful_partition via VT2, will note later if it did anything
sudo mkdir -p /mnt/stateful_partition/etc
sudo bash -c 'echo "CHROMEOS_RELEASE_CHROME_MILESTONE=103.9.9" > /mnt/stateful_partition/etc/lsb-release'

echo "Done! Check for updates in the Chrome OS About page, you should be receiving an 'Administrator Rollback'. You may bootloop for a few minutes if your firmware needs to be downgraded. Do not interrupt the device. If it has continued to bootloop for more than 10 minutes, restore your device."
