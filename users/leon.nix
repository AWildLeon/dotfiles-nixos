{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  imports = [ <home-manager/nixos> ];

  home-manager.users.leon = { config, pkgs, ... }: {
    imports = [
      ../shell/config.nix
    ];

    #Packages
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      brave
      discord
      anydesk
      # winbox

      yubikey-manager-qt
      yubikey-personalization-gui
      yubioath-flutter

      direnv
      nixpkgs-fmt

      unstable.spotify

      virt-viewer
      remmina

    ];

    programs.vscode = {
      enable = true;
      #enableUpdateCheck = false;
      package = unstable.vscode;
      extensions = with unstable.vscode-extensions; [
        # jnoortheen.nix-ide
        ms-vscode-remote.remote-ssh
        ms-azuretools.vscode-docker
      ];
    };


    # SSH Config
    programs.ssh = {
      enable = true;

      matchBlocks = {
        "*" = {
          user = "root";
          identityFile = [
            "~/.ssh/blue"
            "~/.ssh/yellow"
            "~/.ssh/red"
          ];
        };
      };

      includes = [
        "localnetwork.conf"
      ];

    };

    home.stateVersion = "24.05";
  };

  programs.zsh.enable = true;

  users.users.leon = {
    isNormalUser = true;
    description = "Leon Hubrich";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };


}
