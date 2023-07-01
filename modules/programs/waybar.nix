{ config, lib, pkgs, host, user, ...}: 

{

  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "sway-session.target";
    };
    settings = [{
      modules-left = ["sway/workspaces"];
      modules-right = ["cpu" "memory" "pulseaudio" "clock"];
      pulseaudio = {
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-icons = {
          car = "";
          default = [ "" "" "" ];
          handsfree = "";
          headphones = "";
          headset = "";
          phone = "";
          portable = "";
        };
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        on-click = "pavucontrol";
      };

       "sway/workspaces" = {
          format = "<span font='12'>{icon}</span>";
        };

        clock = {
          format = "{:%b %d %H:%M}  ";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          #format-alt = "{:%A, %B %d, %Y} ";
        };
        cpu = {
          format = " {usage}% <span font='11'></span> ";
          interval = 1;
        };

        memory = {
          format = "{}% <span font='11'></span>";
          interval = 1;
        };
    }];


  };
}
