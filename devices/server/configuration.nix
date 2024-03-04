{ config, pkgs, ... }:

{
  imports =
    [
      ../../configs/nixos/default.nix
    ];
  networking.hostName = "stinkver";
  environment.systemPackages = with pkgs; [
  ];
}
