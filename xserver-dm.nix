{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    # touchpad support VVVV 
    #libinput.enable = true;
    layout = "pl";
    xkbVariant = "";
    displayManager.gdm = {
      enable = true;
      wayland = false;
    };
    desktopManager.gnome.enable = true;
  };
}