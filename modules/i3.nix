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
    rofi
    networkmanagerapplet
    blueman
  ];
  
  services.blueman-applet.enable = true;

}
