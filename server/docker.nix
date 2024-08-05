{ config, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    liveRestore = false;
    autoPrune.enable = true;
    package = pkgs.docker_27;
  };

  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;

  # Dont Intevene with Docker's networking
  networking.firewall.enable = false;
}