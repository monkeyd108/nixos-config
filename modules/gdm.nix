{
  config,
  options,
  pkgs,
  ...
}: {
  # Enable GDM
  services.xserver.displayManager.gdm.enable = true;
  # Some GDM settings are stored in a dconf database
  # We care about fractional-scaling and tap-to-click
  programs.dconf = {
    enable = true;
    profiles.gdm.databases = [
      {
        settings = with pkgs.lib.gvariant; {
          "org/gnome/desktop/peripherals/touchpad" = {tap-to-click = true;};
          "org/gnome/mutter" = {
            experimental-features = ["scale-monitor-framebuffer"];
          };
          "org/gnome/settings-daemon/plugins/power".ambient-enabled = false;
        };
      }
    ];
  };
}
