# Start-Hypr

## Dependencies

```
hyprland dbus elogind polkit-elogind pipewire wireplumber SwayNotificationCenter brightnessctl Waybar swaybg foot wmenu playerctl swaylock pavucontrol NetworkManager blueman xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
```

## Install the dots

```
git clone https://github.com/zulubit/start-hypr.git ~/.config/start-hypr
# Backup existing Hypr config
[ -d ~/.config/hypr ] && mv ~/.config/hypr ~/.config/hypr-old
# Move the new config into place
mv ~/.config/start-hypr ~/.config/hypr
```
