{ config, pkgs, ... }:

{

  programs.zsh.enable = true;

  users.users.root = {
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;

  home-manager.users.root = { config, pkgs, ... }: {
    imports = [
      ../shell/config.nix
    ];

    home.stateVersion = "24.05";
  };

  users.users."root".openssh.authorizedKeys.keys = [
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIDLuvvXFgk213dP4niP/4dgL/EWMoaHVqIGm8Uv0kFLKAAAABHNzaDo= Blue"
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICzHxoxNLsYgvpeAgIrfgEN3/w7gA+YKte9fBHUq7+V1AAAABHNzaDo= Red"
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIM3UbMlUzsNdwtdxhfujAp8j4lrDbufUDEVx2zFNhq2tAAAABHNzaDo= yellow"
  ];
}
