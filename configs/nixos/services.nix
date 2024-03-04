{ config, pkgs, ... }:
{
  services = {
    printing.enable = true;
    openssh.enable = true;
    blueman.enable = true;
  };
} 

