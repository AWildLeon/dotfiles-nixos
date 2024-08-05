# Leon's NIXOS Config
This is my modular config for my desktop and server systems.
Define the parts you want in ./configuration.nix

Here is an example configuration:
```nix
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./common/locale.nix


      ./shell/util.nix
      ./shell/zsh.nix

      # Users
      ./users/leon.nix
      ./users/root.nix

      # Environment
      ./desktop/import.nix
      # ./server/import.nix
      # ./laptop/import.nix
    ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "lh-pc";

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Config Version
  system.stateVersion = "24.05";
}

```