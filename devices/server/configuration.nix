{ config, pkgs, ... }:

{
  imports =
    [
      ../../configs/default.nix
    ];
  networking.hostName = "stinkver";
  environment.systemPackages = with pkgs; [
  ];
}
