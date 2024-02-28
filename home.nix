{
  config,
  pkgs,
  ...
}: {
  # Let home-manager install and manage itself
  programs.home-manager.enable = true;

  systemd.user.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  home = {
    stateVersion = "23.11";
    username = "naveen";
    homeDirectory = "/home/naveen";
    packages = with pkgs; [obsidian thunderbird spotify];
  };
}
