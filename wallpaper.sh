sleep 1
killall hyprpaper; hyprpaper &
sleep 0.5

# 1. Load the image into your system memory
hyprctl hyprpaper preload "~/Downloads/grey.jpg"

# 2. Tell hyprpaper to render it on all available monitors
hyprctl hyprpaper wallpaper ",~/Downloads/grey.jpg"

