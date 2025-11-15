{ pkgs, ... }:
{
  hardware = {
    nitrokey.enable = true;
  };

  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      gnupg
      yubikey-personalization
      nitrokey-app2
      pinentry-qt
    ];
    shellInit = ''
      gpg-connect-agent /bye
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    '';
  };

  services = {
    pcscd.enable = true;
    udev.packages = with pkgs; [ yubikey-personalization ];
  };
}
