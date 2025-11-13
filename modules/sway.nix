{ config, pkgs, lib, ... }:

{
  options.modules.sway.enable = lib.mkEnableOption "enables sway-module";

  config = lib.mkIf config.modules.sway.enable {
    services = {
      gnome.gnome-keyring.enable = true;
      xserver.displayManager.lightdm.enable = true;
    };
    programs.uwsm = {
      enable = true;
      waylandCompositors = {
        sway = {
          prettyName = "Sway";
          comment = "Sway by UWSM";
          binPath = "/run/current-system/sw/bin/sway";
        };
      };
    };
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      waybar
      dunst
      uwsm
      swaylock
      swayidle
      swaybg
      rofi
      rofi-emoji
      rofi-calc
      cliphist
      grim
      slurp
      swappy
      wl-mirror # raus
      nwg-look
      nwg-displays
      imv # raus
      mpv # raus
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      brightnessctl # raus
      seahorse
      wlsunset
      hyprpicker
      networkmanagerapplet
    ];
  };
}
