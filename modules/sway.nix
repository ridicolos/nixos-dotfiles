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
          extraArgs = [ "--env-file /home/dennis/.config/uwsm/env-sway" ];
        };
      };
    };
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      xwayland.enable = true;
      extraPackages = with pkgs; [
        waybar
        dunst
        swaylock
        swayidle
        swaybg
        cliphist
        grim
        slurp
        swappy
        wl-mirror # raus
        nwg-look
        nwg-displays
        imv # raus
        mpv # raus
        brightnessctl # raus
        seahorse
        wlsunset
        hyprpicker
        networkmanagerapplet
        rofi
      ];
    };
  };
}
