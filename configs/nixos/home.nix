{ config, pkgs, inputs, ... }:
let custom = {
  fontsize = "12";
  primary_accent = "cba6f7";
  secondary_accent = "89b4fa";
  tertiary_accent = "f5f5f5";
  background = "11111B";
  opacity = ".85";
  cursor = "Numix-Cursor";
  };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
    ../home-manager/hyprland/default.nix
  ];

  home.username = "psmigielski";
  home.homeDirectory = "/home/psmigielski";

  home.packages = with pkgs; [
    foot 
    wofi
    grim
    slurp
    swaybg
    swayidle
    swaylock-effects
    swaynotificationcenter
  ];


  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file."~/.config/hypr/hyprland.conf".text = ''
    decoration {
      shadow_offset = 0 5
      col.shadow = rgba(00000099)
    }

    $mod = SUPER

    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
    bindm = $mod ALT, mouse:272, resizewindow
  '';

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/psmigielski/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
