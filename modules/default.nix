{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./niri.nix
    ./nvim.nix
    ./plasma.nix
    ./sway.nix
    ./thunderbird.nix
    ./virtualisation.nix
    ./xfce4.nix
    ./gpg-smartcard.nix
  ];

  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  console.keyMap = "en";
  services.xserver.xkb = {
    layout = "de";
    variant = "us";
    options = "ctrl:nocaps";
  };

  hardware = {
    wooting.enable = true;
    openrazer.enable = true;
    flipperzero.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ ];
    firewall.allowedUDPPorts = [ ];
  };

  time.timeZone = "Europe/Berlin";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
  };

  programs = {
    git.enable = true;
    zsh.enable = true;
    tmux.enable = true;
    wireshark.enable = true;
    localsend = {
      enable = true;
      openFirewall = true;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.dennis = {
      isNormalUser = true;
      shell = pkgs.zsh;
      description = "dennis";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  home-manager.users.dennis = {
    programs = {
      okular = {
        enable = true;
        general.openFileInTabs = true;
      };
    };
  };

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 8192;
      cores = 4;
    };
    users.users.dennis.initialPassword = "test";
    services = {
      qemuGuest.enable = true;
      spice-vdagentd.enable = true;
      spice-autorandr.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    git
    starship
    tmux
    fzf
    killall
    htop
    curl
    wget
    jq
    inetutils
    zip
    rar
    unzip
    unp
    fastfetch
    openssl
    speedtest-cli
    tealdeer
    tesseract
    cmake
    php
    gcc
    virtualenv
    python3Minimal
    direnv
    texliveFull
    texlivePackages.german
    biber
    tesseract
    htop
    tree
    alacritty
    fwupd
    ffmpeg
    rustup

    kdePackages.kleopatra
    kdePackages.kdenlive
    kdePackages.okular
    pwvucontrol
    zathura
    calibre
    # jellyfin-media-player qt5 security concern
    rustdesk-flutter
    spotify
    zotero
    mumble
    dbeaver-bin
    gimp3-with-plugins
    feather
    cryptomator
    libreoffice-qt6-fresh
    onlyoffice-desktopeditors
    bruno
    signal-desktop
    threema-desktop
    audacity
    qbittorrent
    handbrake
    razergenie
    logseq
    nextcloud-client
    keepassxc

    papirus-icon-theme
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.hack
  ];

  system.stateVersion = "25.05";
}
