{ config, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "plasmax11";
  services.displayManager.sddm.autoNumlock = true;
  services.displayManager.autoLogin.user = "leon";

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa
    kdePackages.okular
    kdePackages.kate
    kdePackages.gwenview
    kdePackages.plasma-browser-integration
  ];

  services.xserver.enable = true;


  #GTK Theming
  programs.dconf.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    #    Variant = "";
  };

    xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  xdg.portal.config.common.default = "kde";

}