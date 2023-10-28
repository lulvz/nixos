{ config, pkgs, lib, ... }:


{
  


  environment.shells = with pkgs; [ zsh bash dash ];
  environment.binsh = "${pkgs.dash}/bin/dash";
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.ohMyZsh.enable = true;
  #programs.zsh.ohMyZsh.theme = "trapd00r";
  
  system.activationScripts.linkBash = {
    text = ''
      ln -sf ${pkgs.bash}/bin/bash /bin/bash
    '';
  };

 
  
  

  environment.sessionVariables = rec {

    #POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    #GTK_USE_PORTAL = "1";
    #NIXOS_XDG_OPEN_USE_PORTAL = "1";
    #XDG_CURRENT_DESKTOP = "Hyprland";
    #XDG_SESSION_DESKTOP = "Hyprland";


    NIXOS_OZONE_WL = "1";
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];
  };
}
