{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.laptop-lights;

in {
  options.services.laptop-lights = {
    enable = mkEnableOption "laptop-lights: als backlight daemon for laptops";
  };

  config = mkIf cfg.enable {

    systemd.services.laptop-lights = {
      description = "ALS keyboard/display backlight daemon";
      wantedBy = [ "graphical.target" ];
      after = [ "graphical.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.laptop-lights}/bin/laptop-lights";
        Restart = "always";
        User = "root";
      };
      path = [ pkgs.bash ];
    };
  };
}
