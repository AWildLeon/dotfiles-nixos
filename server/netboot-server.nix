{ config, pkgs, ... }:
{
  
services.atftpd.enable = true;
  
services.atftpd.root = "/srv/netboot";

  services.nginx.enable = true;

  services.nginx.virtualHosts."netboot.int.onlh.de" = {
    root = "/srv/netboot";
  };


  # Dependencys of IPXE
  environment.systemPackages = with pkgs; [
    gnu-efi
    mtools
    openssl
    perl
    xorriso
    xz
    gnumake
    gcc
    lzma
  ];
}
