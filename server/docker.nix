{ config, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    liveRestore = false;
    autoPrune.enable = true;
    package = pkgs.docker_27;
    daemon.settings = {
      ipv6 = true;
      experimental = true;
      fixed-cidr-v6 = "fd00::/80";
      ip6tables = true;
    };
  };

  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;

  # Dont Intevene with Docker's networking
  networking.firewall.enable = false;
}
