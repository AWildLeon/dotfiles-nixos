{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};
in
{
  services.tailscale.enable = true;
  services.tailscale.package = unstable.tailscale;
  services.tailscale.openFirewall = true;
}