{ config, pkgs, lib, ... }:

{
  options.modules.niri.enable = lib.mkEnableOption "enables niri-module";

  config = lib.mkIf config.modules.niri.enable {
    programs.niri.enable = true;
    security.polkit.enable = true;

    services = {
      gnome.gnome-keyring.enable = true;

      # programs.waybar.enable = true;
      xserver.displayManager.lightdm.enable = true;
    };
  };
}
