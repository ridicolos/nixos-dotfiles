{ config, pkgs, inputs, ... }:

{
  imports =
    [ ./sway.nix ./xfce4.nix ./plasma.nix ./yubikey-gpg.nix ./niri.nix ];

  home-manager.users.dennis = {
    programs = {
      okular = {
        enable = true;
        general.openFileInTabs = true;
      };
    };
  };
}
