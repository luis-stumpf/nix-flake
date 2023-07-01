{ pkgs, lib, user, ... }: 

{
	imports = 
		[(import ./hardware-configuration.nix)] ++
		[(import ../../modules/wms/sway/default.nix)];
}
