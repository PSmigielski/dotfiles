{ config, pkgs, ... }:

{
  imports =
    [
      ../../configs/default.nix
      ../../dms/gnome.nix
    ];
  networking.hostName = "pc";
  
  environment.systemPackages = with pkgs; [
  ];
  programs.steam.enable = true;
}
