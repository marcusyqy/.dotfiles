 #!/bin/sh
 #

power_off=''
reboot=''
lock=''
suspend='鈴'
log_out=''

chosen=$(printf '%s - lock\n%s - shutdown\n%s - reboot\n%s - suspend\n%s - hibernate\n' "$lock" "$power_off" "$reboot" "$suspend" "$suspend"\
    | rofi -dmenu -p "Power Options")

case "$chosen" in
    "$lock - lock")
        # TODO Add your lockscreen command.
        sh ~/.dotfiles/scripts/lock.sh
        ;;

    "$power_off - shutdown")
        # rofi-prompt --query 'Shutdown?' && poweroff
        poweroff
        ;;

    "$reboot - reboot")
        #rofi-prompt --query 'Reboot?' && reboot
        reboot
        ;;

    "$suspend - suspend")
        sh ~/.dotfiles/scripts/lock.sh && systemctl suspend
        ;;

    "$suspend - hibernate")
        sh ~/.dotfiles/scripts/lock.sh  && systemctl hibernate
        ;;

    *) exit 1 ;;
esac

