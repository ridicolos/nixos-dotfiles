{ config, lib, inputs, ... }:

{
  imports = [ ../../modules/default.nix ];

  config.modules = {
    plasma.enable = false;
    sway.enable = true;
    xfce.enable = true;
    niri.enable = true;
  };
}
