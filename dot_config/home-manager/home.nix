{ config, pkgs, ... }:

{
  home.username = "reoring";
  home.homeDirectory = "/Users/reoring";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    # shell 
    pkgs.fish
    pkgs.starship
    pkgs.zellij
    pkgs.neovim
    
    pkgs.ripgrep
    pkgs.fd
    pkgs.eza
    pkgs.bat
    pkgs.fzf

    pkgs.chezmoi
    pkgs.atuin

    pkgs.tree
    pkgs.gnugrep
    pkgs.gnused
    pkgs.gnumake
    
    # git
    pkgs.git
    pkgs.tig
    pkgs.gh
    pkgs.hub
    pkgs.delta
    pkgs.git-extras
    
    # Kubernetes
    pkgs.kubectl
    pkgs.kubectx
    pkgs.kubie
    pkgs.minikube
    pkgs.kind
    pkgs.k9s
    pkgs.stern
    pkgs.tilt
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
