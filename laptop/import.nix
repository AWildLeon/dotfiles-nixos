{
  imports =
    [
      "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/lenovo/legion/15arh05h" # Compatible with Lenovo Ideapad Gaming 3, 16ARH07
    ];
}