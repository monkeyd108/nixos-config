{
  description = "Naveen's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
  in {
    formatter."${system}" = nixpkgs.legacyPackages."${system}".alejandra;
    nixosConfigurations.fw13-amd = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        nixos-hardware.nixosModules.framework-13-7040-amd
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.naveen = import ./home.nix;
          };
        }
        ./configuration.nix
        ./modules/gnome.nix
        ./modules/gdm.nix
      ];
    };
  };
}
