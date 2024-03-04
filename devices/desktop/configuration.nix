{ config, pkgs, ... }:

{
  imports =
    [
      ../../configs/nixos/default.nix
      ../../dms/gnome.nix
    ];
  networking.hostName = "pc";
  
  environment.systemPackages = with pkgs; [
  ];
  programs.steam.enable = true;
}
