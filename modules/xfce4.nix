{ config, pkgs, lib, ... }:

{
  options.modules.xfce.enable = lib.mkEnableOption "enables xfce-module";

  config = lib.mkIf config.modules.xfce.enable {
    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
  };
}
