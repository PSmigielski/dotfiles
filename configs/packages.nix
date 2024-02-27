{ lib,config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    clang
    cargo 
    rustc
    gnumake
    figma-linux
    htop
    macchanger
    brave
    vim
    neovim 
    wget
    firefox
    pavucontrol
    discord
    spotify
    git
    vscode
    neofetch
    appimage-run
  ];
  services.flatpak.enable = true;
}
