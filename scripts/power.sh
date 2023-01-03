 #!/bin/sh
 #

power_off=''
reboot=''
lock=''
suspend='鈴'
log_out=''

chosen=$(printf '%s - shutdown\n%s - reboot\n%s - lock\n' "$power_off" "$reboot" "$lock" \
    | rofi -dmenu -p "Power Options")

case "$chosen" in
    "$power_off - shutdown")
        rofi-prompt --query 'Shutdown?' && poweroff
        ;;

    "$reboot - reboot")
        rofi-prompt --query 'Reboot?' && reboot
        ;;

    "$lock - lock")
        # TODO Add your lockscreen command.
        i3lock --color=000000
        ;;

    *) exit 1 ;;
esac

