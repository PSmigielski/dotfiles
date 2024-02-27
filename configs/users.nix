{ config, pkgs, ... }:
{
    users = {
        defaultUserShell = pkgs.zsh;
        users.psmigielski = {
            isNormalUser = true;
            description = "Paweł Śmigielski";
            extraGroups = [ "networkmanager" "wheel" "storage" "video" "plugdev" "docker"];
        };
    };
    # Enable automatic login for the user.
    services.xserver.displayManager.autoLogin = {
        enable = true;
        user = "psmigielski";
    };
}