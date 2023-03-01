 #!/bin/sh
 #

power_off=''
reboot=''
lock=''
suspend='鈴'
log_out=''

chosen=$(printf '%s - shutdown\n%s - reboot\n%s - lock\n%s - suspend\n%s - hibernate\n' "$power_off" "$reboot" "$lock" "$suspend" "$suspend"\
    | rofi -dmenu -p "Power Options")

case "$chosen" in
    "$power_off - shutdown")
        # rofi-prompt --query 'Shutdown?' && poweroff
        poweroff
        ;;

    "$reboot - reboot")
        #rofi-prompt --query 'Reboot?' && reboot
        reboot
        ;;

    "$lock - lock")
        # TODO Add your lockscreen command.
        sh ~/.dotfiles/scripts/lock.sh
        ;;

    "$suspend - suspend")
        sh ~/.dotfiles/scripts/lock.sh && systemctl suspend
        ;;

    "$suspend - hibernate")
        sh ~/.dotfiles/scripts/lock.sh  && systemctl hibernate
        ;;

    *) exit 1 ;;
esac

