{ config, pkgs, lib, ... }:

{
  options.modules.plasma.enable = lib.mkEnableOption "enables plasma-module";

  config = lib.mkIf config.modules.plasma.enable {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
    };
    home-manager.users.dennis = {
      programs.plasma = {
        enable = true;
        configFile = {
          baloofilerc."Basic Settings"."Indexing-Enabled" = false;
          gwenviewrc.ThumbnailView.AutoplayVideos = true;
        };

        fonts = {
          fixedWidth = {
            family = "JetBrainsMono Nerd Font Mono";
            pointSize = 11;
          };
          general = {
            family = "Roboto";
            pointSize = 11;
          };
          menu = {
            family = "Roboto";
            pointSize = 11;
          };
          small = {
            family = "Roboto";
            pointSize = 8;
          };
          toolbar = {
            family = "Roboto";
            pointSize = 11;
          };
          windowTitle = {
            family = "Roboto";
            pointSize = 11;
          };
        };
      };
    };
  };
}
