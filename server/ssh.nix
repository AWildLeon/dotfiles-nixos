{ config, pkgs, ... }:
{
  services.openssh = {
    enable = true;
    sftpServerExecutable = "internal-sftp";
    # require public key authentication for better security
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "yes";
    };
  };
}