{ config, pkgs, ... }:

let
  home = "${config.home.homeDirectory}/dev/nixos-dotfiles/config/dotfiles";
  dotfiles =
    "${config.home.homeDirectory}/dev/nixos-dotfiles/config/dotfiles/.config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  xdg-configs = {
    sway = "sway";
    waybar = "waybar";
    dunst = "dunst";
    rofi = "rofi";
    uwsm = "uwsm";

    xfce4 = "xfce4";

    swappy = "swappy";
    zathura = "zathura";
    nvim = "nvim";
    alacritty = "alacritty";
    mpv = "mpv";
    keepassxc = "keepassxc";
    "starship.toml" = "starship.toml";
    snippets = "snippets";
  };
  home-configs = {
    ".zshrc" = ".zshrc";
    ".tmux.conf" = ".tmux.conf";
    ".gitconfig" = ".gitconfig";
    ".gitignore" = ".gitignore";
    ".gitconfig_westnetz" = ".gitconfig_westnetz";
    ".gitconfig_uni" = ".gitconfig_uni";
    ".local/bin" = ".local/bin";
  };

in {
  home.username = "dennis";
  home.homeDirectory = "/home/dennis";
  programs.git.enable = true;
  home.stateVersion = "25.05";
  programs.zsh = {
    enable = true;
    shellAliases = { btw = "echo I use nixos, btw"; };
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) xdg-configs;

  home.file = builtins.mapAttrs
    (name: subpath: { source = create_symlink "${home}/${subpath}"; })
    home-configs;

  home.packages = with pkgs; [
    git
    neovim
    ripgrep
    nodejs
    starship
    tmux
    gnumake
    yarn
    fzf
    killall
    htop
    unp
    unzip
    rar
  ];
}
