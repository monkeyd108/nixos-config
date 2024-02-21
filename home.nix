{ config, pkgs, ... }:

{
  # Let home-manager install and manage itself	
  programs.home-manager.enable = true;

  home = {
    stateVersion = "23.11";
    username = "naveen";
    homeDirectory = "/home/naveen";

    packages = with pkgs;
      [

      ];
  };

}
