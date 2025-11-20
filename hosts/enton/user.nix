{
  config,
  ...
}:
{
  imports = [ ../../modules/default.nix ];

  config.modules = {
    xfce.enable = true;
  };
}
