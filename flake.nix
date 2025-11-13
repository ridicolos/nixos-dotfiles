{
  description = "Dennis NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations = {
      nixos-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64_linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./hosts/nixos-vm/hardware-configuration.nix
          ./hosts/nixos-vm/user.nix
          home-manager.nixosModules.home-manager
          { networking.hostName = "nixos-vm"; }
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.dennis = import ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
  };
}
