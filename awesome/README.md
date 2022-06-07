## To enable acpi?
Open a terminal and run the following commands:

sudo gedit /etc/default/grub
Go to the line GRUB_CMDLINE_LINUX_DEFAULT=""
Replace it with GRUB_CMDLINE_LINUX_DEFAULT="acpi=force"
Save your changes.
Run sudo update-grub and reboot.
(If there is something already within the "" at Step 2 just add a space after it and add acpi=force)
