{
  description = "Luis' flake";

  inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

		home-manager = {                                                      # User Package Management
			url = "github:nix-community/home-manager/release-23.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};		

  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: 
		let
			user = "luis";
			location = "$HOME/.setup";
		in
		{
			nixosConfigurations = (
				import ./hosts {
				inherit (nixpkgs) lib;
				inherit nixpkgs inputs user location home-manager;
				}
			);
	};
}
