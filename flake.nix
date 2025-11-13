{
  description = "Dennis NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
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
          ./hosts/nixos-vm/configuration.nix
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
      gengar = nixpkgs.lib.nixosSystem {
        system = "x86_64_linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./hosts/gengar/configuration.nix
          ./hosts/gengar/hardware-configuration.nix
          ./hosts/gengar/user.nix
          home-manager.nixosModules.home-manager
          { networking.hostName = "gengar"; }
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
