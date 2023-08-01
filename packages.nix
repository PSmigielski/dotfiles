{ lib,config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    uclibc
    arduino
    bottles
    nodejs_18
    clang
    cargo 
    rustc
    gnumake
    winetricks
    notion-app-enhanced
    figma-linux
    htop
    macchanger
    gnome.gnome-tweaks
    brave
    vim
    neovim 
    wget
    firefox
    pavucontrol
    discord
    postman
    spotify
    git
    vscode
    neofetch
    docker
    docker-compose
    appimage-run
    jetbrains-toolbox 
  ];
  programs.steam.enable = true;
  services.flatpak.enable = true;
}
