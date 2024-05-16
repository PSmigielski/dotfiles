{ lib,config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    clang
    cargo 
    rustc
    gnumake
    figma-linux
    htop
    macchanger
    brave
    wget
    firefox
    pavucontrol
    discord
    spotify
    postman
    caprine-bin
    mattermost-desktop
    git
    vscode
    neofetch
    appimage-run
    roboto
    ranger
    obsidian
    gcc
    gimp
    dbeaver
    imagemagick
    grim
    slurp
    (nerdfonts.override { fonts = [ "RobotoMono" ]; })
  ];
  services.flatpak.enable = true;
}
