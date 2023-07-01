{ config, lib, pkgs, user, ... }:

{
  imports =
  (import ../modules/programs);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
		stateVersion = "23.05";
	};
}
