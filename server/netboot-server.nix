{ config, pkgs, ... }:
{
  services.tftpd.enable = true;
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
    make
  ];
}
