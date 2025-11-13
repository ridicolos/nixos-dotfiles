{ config, pkgs, ... }:

{

  #TODO: This is shit
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
  boot.growPartition = true;
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
  };

  console.keyMap = "de";

  services.printing.enable = true;

  security.polkit.enable = true;

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

  # Enable touchpad support (enabled default in most desktopManager).

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.dennis = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "dennis";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Install firefox.
  programs = {
    zsh.enable = true;
    firefox.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    spice-autorandr.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    curl
    wget
    git
    jq
    inetutils
    zip
    unzip
    unp
    tmux
    fastfetch
    openssl
    speedtest-cli
    tealdeer
    #tesseract
    cmake
    php
    gcc
    virtualenv
    python3Full
    direnv
    #texliveFull
    #texlivePackages.german
    tesseract
    htop
    tree
    alacritty
    fwupd
    ffmpeg
    rustup

    kdePackages.kleopatra
    kdePackages.kdenlive
    thunderbird
    wireshark
    calibre
    jellyfin-media-player
    # rustdesk
    spotify
    zotero
    mumble
    dbeaver-bin
    gimp3-with-plugins
    feather
    cryptomator
    libreoffice-qt6
    onlyoffice-desktopeditors
    localsend
    bruno
    signal-desktop
    threema-desktop
    audacity
    qbittorrent
    handbrake
    gparted
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.hack
  ];

  virtualisation = { docker.enable = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
