exist_compton=`pgrep compton`
if ! [ -z $exist_compton ]
then
    kill $(pgrep compton)
fi
compton
