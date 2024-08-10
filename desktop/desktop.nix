{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  security.sudo.wheelNeedsPassword = false;


  # services.flatpak.enable = true;


  # Enable CUPS to print documents.
  services.printing.enable = true;



  # Disable The firewall
  networking.firewall.enable = false;

  programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
  #   fuse
  # ];

  nixpkgs.config.allowUnfree = true;


  environment.systemPackages = with pkgs; [
    # fuse
    # appimage-run
    # rustdesk

    netcat-gnu
    onlyoffice-bin


    arp-scan

    libfido2


    # Minecraft
    unstable.prismlauncher
    glfw
    zulu
  ];

  # services.teamviewer.enable = true;

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;


  # Yubikey
  services.pcscd.enable = true;

  # Newer Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;


  # Appimage
  # programs.appimage.binfmt = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
