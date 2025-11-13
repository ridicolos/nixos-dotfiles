{ config, pkgs, lib, ... }:

{
  options.modules.xfce.enable = lib.mkEnableOption "enables xfce-module";

  config = lib.mkIf config.modules.xfce.enable {
    services.xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
      displayManager.lightdm.enable = true;
    };
  };
}
