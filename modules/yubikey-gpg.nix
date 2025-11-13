{ config, lib, pkgs, ... }: {

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  programs.ssh.startAgent = false;
  services.pcscd.enable = true;
  environment.systemPackages = with pkgs; [
    gnupg
    yubikey-personalization
    nitrokey-app2
    pinentry-qt
  ];
  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  services.udev.packages = with pkgs; [ yubikey-personalization ];
}
