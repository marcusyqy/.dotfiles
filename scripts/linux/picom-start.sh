
exist_picom=`pgrep picom`
if ! [ -z $exist_picom ]
then
    kill $(pgrep picom)
fi

picom
