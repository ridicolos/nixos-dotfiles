{
  config,
  ...
}:
{
  imports = [ ../../modules/default.nix ];

  config.modules = {
    plasma.enable = true;
  };
}
