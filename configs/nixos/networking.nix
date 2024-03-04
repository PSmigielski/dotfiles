{ config, pkgs, ... }:
{
    networking = {
        hostName = "nixos"; # Define your hostname.
        #wireless.enable = true;  # Enables wireless support via wpa_supplicant.
        networkmanager.enable = true;
        # firewall.allowedTCPPorts = [ ... ];
        # firewall.allowedUDPPorts = [ ... ];
        # firewall.enable = false;
    };
}