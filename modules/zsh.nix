{ config, pkgs, lib, ... }:
{

  programs.zsh = {
    enable = true;
    autosuggestion = { enable = true; };
    syntaxHighlighting = { enable = true; };
    enableCompletion = true;
    dotDir = ".config/zsh";
    history = { path = "${config.xdg.dataHome}/zsh/zsh_history"; };
    plugins = [
          {
              name = "zsh-autosuggestions";
              src = pkgs.fetchFromGitHub {
                owner = "zsh-users";
                repo = "zsh-autosuggestions";
                tag = "v0.7.1";
                sha256 = "vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
              };
          }
          {
              name = "zsh-syntax-highlighting";
              src = pkgs.fetchFromGitHub {
                owner = "zsh-users";
                repo = "zsh-syntax-highlighting";
                tag = "0.8.0";
                sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
              };
          }
    ];
    oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "sudo"
          "fzf"
          "history"
          "ssh-agent"
          "command-not-found"
        ];
    };
  };
  
  programs.fzf = {
      enable = true;
      enableZshIntegration = true;
  };

}
