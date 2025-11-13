{ config, pkgs, lib, ... }:

{
  options.modules.plasma.enable = lib.mkEnableOption "enables plasma-module";

  config = lib.mkIf config.modules.plasma.enable {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
    };
  };
}
