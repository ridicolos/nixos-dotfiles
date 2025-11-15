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
    ];
    programs = {
      xfconf.enable = true;
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
        ];
      };
    };
    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          enableXfwm = true;
          noDesktop = false;
        };
      };
    };
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
  };
}
