{
  custom ? {
  fontsize = "12";
  primary_accent = "cba6f7";
  secondary_accent = "89b4fa";
  tertiary_accent = "f5f5f5";
  background = "11111B";
  opacity = ".85";
  cursor = "Numix-Cursor";
},inputs, pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
      "$mainMod" = "SUPER";
            monitor = [
        ",preferred,auto,auto"
        "eDP-1,1920x1080cc@60,0x0,1"
      ];
      
      exec-once = [
        "blueman-manager"
        "nm-applet"
        "waybar"
        "swaybg -i ~/photos/wallpapers/wallpaper.png"
        ''swayidle -w timeout 1800 'swaylock -f -i ~/photos/wallpapers/wallpaper.png' timeout 1805 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' before-sleep "swaylock -f -i ~/photos/wallpapers/wallpaper.png"''
        "hyprctl setcursor ${custom.cursor} ${custom.fontsize}"
        "swaync"
      ];
      general = {
        gaps_in = 4;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(${custom.primary_accent})";
        "col.inactive_border" = "rgba(${custom.background}00)";
        allow_tearing = true;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        shadow_ignore_window = true;
        drop_shadow = true;
        shadow_range = 50;
        shadow_render_power = 3;
        "col.shadow" = "rgba(${custom.primary_accent}00)";
        "col.shadow_inactive" = "rgba(${custom.background}00)";
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0.0117;
          contrast = 1.2;
          xray = false;
          brightness = 1;
        };
      };
      animations = {
        enabled = true;
        bezier = [ "easeinoutsine, 0.37, 0, 0.63, 1" ];
        animation = [ 
          "windows,1,2,easeinoutsine,slide" 
          "border,1,10,default"
          "fade,1,1,default"
          "workspaces,1,2,easeinoutsine,slide"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };
      master = {
        new_is_master = true;
      };
      gestures = {
        workspace_swipe = false;
      };
      misc = {
        vrr = 1;
        disable_hyprland_logo  = true;
        disable_splash_rendering = true;
      };
      bind = [
        # Exit to tty
        "$mainMod SHIFT, X, exit "
        # Launch
        "$mainMod, RETURN, exec, foot"
        "$mainMod, D, exec, wofi"
        ''$mainMod SHIFT,S,exec,mkdir -p ~/photos/screenshots; grim -t png -g "$(slurp)" ~/photos/screenshots/$(date +%Y-%m-%d_%H-%m-%s).png''
        "$mainMod SHIFT,N,exec, swaync-client -t -sw"
        "$mainMod SHIFT,L,exec, swaylock -f -i ~/photos/wallpapers/wallpaper.png"
        # Window Options
        "$mainMod, V, pseudo"
        "$mainMod, W, togglesplit"
        "$mainMod, F, fullscreen"
        "$mainMod, E, togglefloating "
        "$mainMod SHIFT, Q, killactive"
        # Focus Windows
        "$mainMod ALT, left, movefocus, l"
        "$mainMod ALT, right, movefocus, r"
        "$mainMod ALT, up, movefocus, u"
        "$mainMod ALT, down, movefocus, d"
        # Resize windows
        "$mainMod SHIFT, right, resizeactive, 10 0"
        "$mainMod SHIFT, left, resizeactive, -10 0"
        "$mainMod SHIFT, up, resizeactive, 0 -10"
        "$mainMod SHIFT, down, resizeactive, 0 10"
        # Move Windows
        "$mainMod,left,movewindow,l"
        "$mainMod,right,movewindow,r"
        "$mainMod,up,movewindow,u"
        "$mainMod,down,movewindow,d"
        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # Switch active window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # Scroll workspace with mouse scrollwheel
        "$mainMod TAB, right, workspace, e+1"
        "$mainMod TAB, left, workspace, e-1"
      ];
    };
  };
}
