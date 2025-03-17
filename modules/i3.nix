{ config, pkgs, lib, ... }:
{

 home.packages = with pkgs; [
    i3lock
    polybar
    nitrogen
    feh
    numlockx
    xorg.xsetroot
    networkmanager
    flameshot
    pulseaudio
    pulseaudio-ctl
    pavucontrol
    rofi
    networkmanagerapplet
    playerctl
    blueman
  ];
  
  services.blueman-applet.enable = true;

}
