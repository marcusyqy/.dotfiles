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
        i3lock --color=000000
        ;;

    "$suspend - suspend")
        i3lock --color=000000 && systemctl suspend
        ;;

    "$suspend - hibernate")
        i3lock --color=000000 && systemctl hibernate
        ;;

    *) exit 1 ;;
esac

