{ lib,config, pkgs, inputs, system, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    clang
    cargo 
    rustc
    mono
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
    unzip
    gzip
    jdk20
    intelephense-1.10.2

    (nerdfonts.override { fonts = [ "RobotoMono" ]; })
  ];
  services.flatpak.enable = true;
}
