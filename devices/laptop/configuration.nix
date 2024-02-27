{ config, pkgs, ... }:

{
  imports =
    [
      ../../configs/default.nix
      ../../configs/laptop.nix
      ../../dms/gnome.nix
    ];
  networking.hostName = "laptop-yoga"; # Define your hostname.
  programs.light.enable = true;
  hardware.ledger.enable = true;
  services.tlp.enable = false;
  environment.systemPackages = with pkgs; [
  ];
  programs.steam.enable = true;
}
