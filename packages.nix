{lib,config, pkgs, ...}:

{  environment.systemPackages = with pkgs; [
    vim 
    wget
    firefox
    pavucontrol
    discord
    postman
    spotify
    git
    vscode
    neofetch
    gnome3.gnome-tweaks
    php80
    php80Extensions.bz2
    php80Extensions.curl
    php80Extensions.dba
    php80Extensions.mysqli
    php80Extensions.pdo
    php80Extensions.pdo_mysql
    php80Extensions.pdo_pgsql
    php80Extensions.pgsql
    php80Extensions.redis
    php80Extensions.xdebug
    php80Extensions.yaml
    php80Packages.composer
    docker
    docker-compose
    nodejs-16_x
    appimage-run 
  ];
  programs.steam.enable = true;
  services.flatpak.enable = true;
}
