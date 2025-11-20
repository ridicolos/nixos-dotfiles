{ pkgs, ... }:
{
  programs.virt-manager.enable = true;
  users.groups = {
    libvirtd.members = [ "dennis" ];
    docker.members = [ "dennis" ];
  };
  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-webdavd.enable = true;
}
