{ config, pkgs, ... }:

{
  imports =
    [ ./sway.nix ./xfce4.nix ./plasma.nix ./yubikey-gpg.nix ./niri.nix ];
}
