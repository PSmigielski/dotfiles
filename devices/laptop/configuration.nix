{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ../../configs/nixos/default.nix
      ../../configs/nixos/laptop.nix
      ../../dms/hyprland.nix
      ./amdpowersave.nix
    ];
  networking.hostName = "laptop-yoga"; # Define your hostname.
  programs.light.enable = true;
  hardware.ledger.enable = true;
  services.tlp.enable = false;
  environment.systemPackages = with pkgs; [
  ];
  programs.steam.enable = true;
}
