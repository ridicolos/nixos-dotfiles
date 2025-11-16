{
  config,
  ...
}:
{
  imports = [ ../../modules/default.nix ];

  # will be enabled by default (not a specialisation)
  config.modules = {
    xfce.enable = config.specialisation != { };
  };

  config.specialisation = {
    plasma.configuration = {
      config.modules = {
        plasma.enable = true;
      };
    };
    wm.configuration = {
      config.modules = {
        sway.enable = true;
        niri.enable = true;
      };
    };
  };
}
