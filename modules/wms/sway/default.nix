{ config, lib, pkgs, ... }:

{
	hardware.opengl.enable = true;

  programs = {
    sway = {
      enable = true;
    };
  };
}
