{ config, lib, pkgs, ... }: 

{
  programs = {
    rofi = {
      enable = true;
      terminal = "foot";
      location = "center";
    };
  };
}
