{
  description = "Dennis NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      plasma-manager,
      ...
    }@inputs:
    let
      hosts = [
        { name = "gengar"; }
        { name = "nixos-vm"; }
      ];
    in
    {

      nixosConfigurations = builtins.listToAttrs (
        map (host: {
          name = host.name;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            system = "x86_64-linux";
            modules = [
              ./hosts/${host.name}/hardware-configuration.nix
              ./hosts/${host.name}/configuration.nix
              ./hosts/${host.name}/user.nix
              home-manager.nixosModules.home-manager
              { networking.hostName = host.name; }
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.dennis = import ./home.nix;
                  backupFileExtension = "backup";
                  sharedModules = [ plasma-manager.homeModules.plasma-manager ];
                };
              }
            ];
          };
        }) hosts
      );
    };
}
