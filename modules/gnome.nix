{ pkgs, ... }:

{
  config = {
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    programs.dconf.enable = true;
    environment.gnome.excludePackages = (with pkgs;
      [

      ]) ++ (with pkgs.gnome; [ epiphany gnome-software ]);
  };
}
