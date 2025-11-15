{ pkgs, ... }:
{
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
  environment.systemPackages = with pkgs; [
    qemu_kvm
  ];
}
