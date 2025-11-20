{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.modules.xfce.enable = lib.mkEnableOption "enables xfce-module";

  config = lib.mkIf config.modules.xfce.enable {

    environment.systemPackages = with pkgs; [
      kitty
      xfce.xfce4-whiskermenu-plugin
      xfce.xfce4-fsguard-plugin
      xfce.xfce4-clipman-plugin
      seahorse
      font-manager
      xclip
    ];
    programs = {
      xfconf.enable = true;
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-media-tags-plugin
          thunar-volman
        ];
      };
    };

    services = {
      gnome.gnome-keyring.enable = true;
      blueman.enable = true;
    };

    services.xserver = {
      enable = true;
      displayManager = {
        lightdm = {
          enable = true;
        };
      };
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          enableXfwm = true;
          noDesktop = false;
        };
      };
    };
    home-manager.users.dennis = {
      xfconf.settings = {
        keyboard-layout = {
          "Default/XkbLayout" = "de";
          "Default/XkbVariant" = "us";
        };
        keyboards = {
          "Default/KeyRepeat/Delay" = 300;
          "Default/KeyRepeat/Rate" = 30;
        };
        xfwm4 = {
          "general/activation_action" = "bring";
          "general/borderless_maximize" = true;
          "general/box_move" = false;
          "general/box_resize" = true;
          "general/click_to_focus" = true;
          "general/cycle_apps_only" = false;
          "general/cycle_draw_frame" = true;
          "general/cycle_hidden" = true;
          "general/cycle_minimized" = false;
          "general/cycle_minimum" = true;
          "general/cycle_preview" = true;
          "general/cycle_raise" = false;
          "general/cycle_tabwin_mode" = 0;
          "general/cycle_workspaces" = false;
          "general/double_click_action" = "maximize";
          "general/easy_click" = "Super";
          "general/focus_hint" = true;
          "general/focus_new" = true;
          "general/mousewheel_rollup" = false;
          "general/placement_mode" = "center";
          "general/placement_ratio" = 20;
          "general/prevent_focus_stealing" = false;
          "general/raise_on_click" = true;
          "general/raise_on_focus" = false;
          "general/raise_with_any_button" = false;
          "general/repeat_urgent_blink" = true;
          "general/resize_opacity" = 80;
          "general/scroll_workspaces" = false;
          "general/snap_resist" = false;
          "general/snap_width" = 9;
          "general/snap_to_border" = true;
          "general/snap_to_windows" = true;
          "general/tile_on_move" = true;
          "general/urgent_blink" = true;
          "general/use_compositing" = true;
          "general/workspace_count" = 3;
          "general/workspace_names" = [
            "1"
            "2"
            "3"
            "4"
            "5"
            "6"
            "7"
            "8"
            "9"
            "10"
          ];
        };
        xfce4-keyboard-shortcuts = {
          "commands/custom/override" = true;
          "commands/custom/Print" = "xfce4-screenshooter --region --clipboard --mouse";
          "commands/custom/<Shift><Super>p" = "sh .config/xfce4/custom_scripts/ocr.sh";
          "commands/custom/<Shift><Super>Print" = "sh .config/xfce4/custom_scripts/save_screenshot.sh";
          "commands/custom/<Shift><Super>v" = "xfce4-clipman-history";
          "commands/custom/<Super>d" = "xfce4-appfinder";
          "commands/custom/<Super>e" = "thunar";
          "commands/custom/<Super>p" = "xfce4-display-settings --minimal";
          "commands/custom/<Super>Print" = "sh .config/xfce4/custom_scripts/swappy-screenshot.sh";
          "commands/custom/<Super>Return" = "exo-open --launch TerminalEmulator";
          "commands/custom/XF86Display" = "xfce4-display-settings --minimal";

          "xfwm4/custom/override" = true;
          "xfwm4/custom/<Alt>Delete" = "del_workspace_key";
          "xfwm4/custom/<Alt>space" = "popup_menu_key";
          "xfwm4/custom/<Alt>Tab" = "cycle_windows_key";
          "xfwm4/custom/Down" = "down_key";
          "xfwm4/custom/Escape" = "cancel_key";
          "xfwm4/custom/Left" = "left_key";
          "xfwm4/custom/Right" = "right_key";
          "xfwm4/custom/<Shift><Alt>ISO_Left_Tab" = "cycle_reverse_windows_key";
          "xfwm4/custom/<Shift><Super>ampersand" = "move_window_workspace_7_key";
          "xfwm4/custom/<Shift><Super>asciicircum" = "move_window_workspace_6_key";
          "xfwm4/custom/<Shift><Super>asterisk" = "move_window_workspace_8_key";
          "xfwm4/custom/<Shift><Super>at" = "move_window_workspace_2_key";
          "xfwm4/custom/<Shift><Super>dollar" = "move_window_workspace_4_key";
          "xfwm4/custom/<Shift><Super>Down" = "tile_down_key";
          "xfwm4/custom/<Shift><Super>exclam" = "move_window_workspace_1_key";
          "xfwm4/custom/<Shift><Super>Left" = "tile_left_key";
          "xfwm4/custom/<Shift><Super>m" = "move_window_to_monitor_right_key";
          "xfwm4/custom/<Shift><Super>n" = "move_window_to_monitor_left_key";
          "xfwm4/custom/<Shift><Super>numbersign" = "move_window_workspace_3_key";
          "xfwm4/custom/<Shift><Super>parenleft" = "move_window_workspace_9_key";
          "xfwm4/custom/<Shift><Super>parenright" = "move_window_workspace_10_key";
          "xfwm4/custom/<Shift><Super>percent" = "move_window_workspace_5_key";
          "xfwm4/custom/<Shift><Super>q" = "close_window_key";
          "xfwm4/custom/<Shift><Super>Return" = "maximize_window_key";
          "xfwm4/custom/<Shift><Super>Right" = "tile_right_key";
          "xfwm4/custom/<Shift><Super>underscore" = "hide_window_key";
          "xfwm4/custom/<Shift><Super>Up" = "tile_up_key";
          "xfwm4/custom/<Shift><Super>z" = "stick_window_key";
          "xfwm4/custom/<Super>0" = "workspace_10_key";
          "xfwm4/custom/<Super>1" = "workspace_1_key";
          "xfwm4/custom/<Super>2" = "workspace_2_key";
          "xfwm4/custom/<Super>3" = "workspace_3_key";
          "xfwm4/custom/<Super>4" = "workspace_4_key";
          "xfwm4/custom/<Super>5" = "workspace_5_key";
          "xfwm4/custom/<Super>6" = "workspace_6_key";
          "xfwm4/custom/<Super>7" = "workspace_7_key";
          "xfwm4/custom/<Super>8" = "workspace_8_key";
          "xfwm4/custom/<Super>9" = "workspace_9_key";
          "xfwm4/custom/<Super>a" = "move_window_key";
          "xfwm4/custom/<Super>f" = "fullscreen_key";
          "xfwm4/custom/<Super>r" = "resize_window_key";
          "xfwm4/custom/<Super>Tab" = "switch_window_key";
          "xfwm4/custom/<Super>z" = "above_key";
          "xfwm4/custom/Up" = "up_key";
        };

        "xfce4-appfinder" = {
          "close-on-focus-lost" = true;
          "hide-category-pane" = true;
          "hide-window-decorations" = false;
          "icon-view" = false;
          "remember-category" = false;
          "single-window" = true;
          "sort-by-frecency" = true;
        };

        "xfce4-volumed-pulse" = {
          "volumne-step-size" = 5;
        };
      };
    };
  };
}
