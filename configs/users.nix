{ config, pkgs, inputs,  ... }:
{
    imports = [
        inputs.home-manager.nixosModules.default
    ];

    users = {
        defaultUserShell = pkgs.zsh;
        users.psmigielski = {
            isNormalUser = true;
            description = "Paweł Śmigielski";
            extraGroups = [ "networkmanager" "wheel" "storage" "video" "plugdev" "docker"];
        };
    };
    home-manager = {
        extraSpecialArgs = {inherit inputs;};
        users = {
            "psmigielski" = import ./home.nix;
        };
    };
    # Enable automatic login for the user.
    services.xserver.displayManager.autoLogin = {
        enable = true;
        user = "psmigielski";
    };
}