{ pkgs, ... }:

{
  config = {
    # Enable GNOME and GDM
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Add and exclude packages 
    environment.systemPackages = with pkgs; [
      blackbox-terminal
      adw-gtk3
      gnome.gnome-tweaks
      gnomeExtensions.legacy-gtk3-theme-scheme-auto-switcher
    ];
    environment.gnome.excludePackages = (with pkgs; [ gnome-tour gnome-console ])
      ++ (with pkgs.gnome; [ epiphany gnome-software geary yelp ]);

    programs.dconf = {
      enable = true;
      # Adjust default values of GNOME Desktop, Extensions and apps.
      # Users can override these with their own settings.
      profiles.user.databases = [{
        settings = with pkgs.lib.gvariant; {
          "org/gnome/desktop/interface" = {
            gtk-theme = "adw-gtk3"; # Theme for legacy apps.
          };
          "org/gnome/desktop/peripherals/touchpad" = { tap-to-click = true; };
          "org/gnome/mutter" = {
            experimental-features = [ "scale-monitor-framebuffer" ];
          };
          "org/gnome/shell" = {
            enabled-extensions =
              [ "legacyschemeautoswitcher@joshimukul29.gmail.com" ];
          };
        };
      }];
    };
  };
}
