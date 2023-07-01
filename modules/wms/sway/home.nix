{ config, lib, pkgs, host, ... }:

{
	wayland.windowManager.sway = {

		enable = true;
		systemdIntegration = true;
		config = rec {
			input = {                                         # Input modules: $ man sway-input
        "type:keyboard" = {
          xkb_layout = "de";
          xkb_numlock = "enabled";
          xkb_options = "caps:escape";
        };
      };

      output = {
        HDMI-A-1 = {
          transform = "270";
          position = "0 0";
        };

        DP-2 = {
          position = "1080 0";
        };
      };

      menu = "rofi -show drun";

      gaps = {
        inner = 5;
        outer = 5;
      };
      bars = [];

      window.titlebar = false;
		};
	};
}
