{ config, pkgs, ... }: {
  # Basic Day to Day utilitys i need.
  environment.systemPackages = with pkgs; [
    nixpkgs-fmt

    nano
    curl
    wget

    screen
    git
    lsof

    # Task Manager Like
    htop
    btop
    powertop

    # Network Utilitys
    arp-scan
    nmap
    iperf
    netcat-gnu
    dig
    openssh
    rsync
  ];
}