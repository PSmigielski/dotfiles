{ ... }:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./wofi.nix 
    ./foot.nix
  ];
  # _module.args = { inherit inputs custom; };

}