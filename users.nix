{ config, pkgs, ... }:
{
    users.users.pawel = {
        isNormalUser = true;
        description = "Paweł  Śmigielski";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
        firefox
        ];
    };

    # Enable automatic login for the user.
    services.xserver.displayManager.autoLogin = {
        enable = true;
        user = "pawel";
    };
}