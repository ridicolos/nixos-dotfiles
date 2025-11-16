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
  };
}
