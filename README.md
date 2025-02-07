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

## Void

You'll need to setup **pipewire, wireplumber and pipewire-pulse** https://docs.voidlinux.org/config/media/pipewire.html

```
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
```

You should probably also install **sof-firmware** and **sof-tools** and reboot to make your device in/outpusts discoverable

If you're on a laptop you should probably setup **tlp** too
