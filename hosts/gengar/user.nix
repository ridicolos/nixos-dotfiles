{
  config,
  lib,
  inputs,
  ...
}:

{
  imports = [ ../../modules/default.nix ];

  config.modules = {
    plasma.enable = true;
    sway.enable = false;
    xfce.enable = false;
    niri.enable = false;
  };
}
