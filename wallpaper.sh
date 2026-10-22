sleep 1
killall hyprpaper; hyprpaper &
sleep 0.5

hyprctl hyprpaper preload "~/Downloads/grey.jpg"
hyprctl hyprpaper wallpaper ",~/Downloads/grey.jpg" # works just pick the path to any image you want. have to reboot

