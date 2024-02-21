{
	description = "Naveen's NixOS Configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
	};

	outputs = { self, nixpkgs, ... }: {
		nixosConfigurations.fw13-amd = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
			];
		};
	};
}
