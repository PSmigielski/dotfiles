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
    postman
    git
    vscode
    neofetch
    appimage-run
    roboto
    gcc
    (nerdfonts.override { fonts = [ "RobotoMono" ]; })
  ];
  services.flatpak.enable = true;
}
