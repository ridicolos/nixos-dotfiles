{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    withNodeJs = true;
    withRuby = true;
    vimAlias = true;
    viAlias = true;
  };

  home-manager.users.dennis = {
    home.packages = with pkgs; [
      neovim
      ripgrep
      nodejs
      gnumake

      # lsp
      nil
      terraform-ls
      lua-language-server
      texlab
      python313Packages.python-lsp-server

      # lint
      tflint
      tfsec
      pyright

      # formatter
      ruff
      sqlfluff
      nixfmt
    ];
  };
}
