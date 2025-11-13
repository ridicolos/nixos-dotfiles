{ config, lib, inputs, ... }:

{
  imports = [ ../../modules/default.nix ];

  config.modules = {
    plasma.enable = true;
    sway.enable = true;
    xfce.enable = false;
    niri.enable = true;
  };
}
