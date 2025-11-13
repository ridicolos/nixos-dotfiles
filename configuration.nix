{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  services.xserver.xkb = {
    layout = "de";
    variant = "us";
    options = "ctrl:nocaps";
  };

  security.polkit.enable = true;

  console.keyMap = "de";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.dennis = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "dennis";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs = {
    git.enable = true;
    zsh.enable = true;
    firefox = {
      enable = true;
      languagePacks = [ "de" "en-US" ];

    };
    neovim = {
      enable = true;
      defaultEditor = true;
      withPython3 = true;
      withNodeJs = true;
      vimAlias = true;
      viAlias = true;
    };
    tmux.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    chromium = {
      enable = true;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      ];
      extraOpts = {
        "BrowserSignin" = 0;
        "SyncDisabled" = true;
        "PasswordManagerEnabled" = false;
        "SpellcheckEnabled" = true;
        "SpellcheckLanguage" = [ "de" "en-US" ];
      };
    };
    wireshark.enable = true;
    localsend = {
      enable = true;
      openFirewall = true;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    spice-autorandr.enable = true;
  };

  programs.thunderbird = { enable = true; };

  environment.systemPackages = with pkgs; [
    pwvucontrol
    qemu_kvm
    curl
    wget
    jq
    inetutils
    zip
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
    libreoffice-qt6
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

  hardware = {
    nitrokey.enable = true;
    wooting.enable = true;
    openrazer.enable = true;
    flipperzero.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.hack
  ];

  # virtualisation
  programs.virt-manager.enable = true;
  users.groups = {
    libvirtd.members = [ "dennis" ];
    docker.members = [ "dennis" ];
  };
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  # services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  system.stateVersion = "25.05"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
