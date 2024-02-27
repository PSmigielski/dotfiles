{ config, pkgs, ... }:
{
  services.printing.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
} 