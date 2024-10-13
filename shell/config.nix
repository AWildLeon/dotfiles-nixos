{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  # Shell
  programs.fastfetch.enable = true;

  programs.zoxide = {
    enable = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.zsh = {
    initExtra = ''
      fastfetch
    '';
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "docker"
        "docker-compose"
      ];
    };
  };

  # Bash Config
  programs.bash.enable = true;

  # Prompt
  programs.oh-my-posh = {
    enable = true;
    package = unstable.oh-my-posh;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (
    ''
      {
        "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
        "blocks": [
          {
            "alignment": "left",
            "segments": [
              {
                "foreground":	"#CCCCCC",
                "style": "plain",
                "template": "{{ .UserName }}",
                "type": "session"
              },
              {
                "foreground": "#6A6A6A",
                "style": "plain",
                "template": "@{{ .HostName }} ",
                "type": "session"
              },
              {
                "foreground": "#004e8e",
                "properties": {
                  "style": "full"
                },
                "style": "plain",
                "template": "{{ .Path }} ",
                "type": "path"
              }
            ],
            "type": "prompt"
          },
          {
            "alignment": "right",
            "segments": [
              {
                "foreground": "#6A6A6A",
                "properties": {
                  "time_format": "15:04:05"
                },
                "style": "plain",
                "template": " {{ .CurrentDate | date .Format }} ",
                "type": "time"
              }
            ],
            "type": "prompt"
          },
          {
            "alignment": "left",
            "segments": [
              {
                "foreground": "#CC00CC",
                "style": "plain",
                "template": "\u276f ",
                "type": "text"
              }
            ],
            "type": "prompt",
            "newline": true
          }
        ],
        "version": 2,
        "console_title_template": "{{.PWD}}"
      }
    ''
    ));
  };
}
