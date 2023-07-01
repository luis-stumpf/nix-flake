{ lib, inputs, nixpkgs, home-manager, user, location, ... }:

let 
	system = "x86_64-linux";

	pkgs = import nixpkgs {
		inherit system;
		config.allowUnfree = true;
	};

	lib = nixpkgs.lib;

in
{
	desktop = lib.nixosSystem {
		inherit system;
		specialArgs = {
			inherit inputs system user location;
			host = {
				hostName = "desktop";
				mainMonitor = "DP-2";
				secondMonitor = "HDMI-1";
			};
		};
		modules = [
			./desktop
			./configuration.nix

			home-manager.nixosModules.home-manager {              # Home-Manager module that is used.
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user ;
          host = {
            hostName = "desktop";     #For Xorg iGPU  | Videocard     | Hyprland iGPU
            mainMonitor = "HDMI-A-2"; #HDMIA3         | HDMI-A-1      | HDMI-A-3
            secondMonitor = "DP-3";   #DP1            | DisplayPort-1 | DP-1
          };
        };                                                  # Pass flake variable
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            ./desktop/home.nix
          ];
        };
      }
		];
	};
}

