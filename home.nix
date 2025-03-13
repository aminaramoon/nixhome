{ config, pkgs, lib, ... }:

let 
  dotfilesDir = "/home/amin/workspace/github/nixhome/dotfiles";
in
{
  imports = [
    ./modules/zsh.nix
    ./modules/i3.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "amin";
  home.homeDirectory = "/home/amin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  xdg.enable = true;
  fonts.fontconfig.enable = true;

  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    # # compilers
    gcc13
    lua
    llvmPackages_19.clang-tools

    # # programs
    valgrind
    kdePackages.kcachegrind
    openssh
    fusePackages.fuse_2

    # # tools
    unixtools.nettools
    ethtool
    ripgrep
    htop
    neofetch
    btop
    tree
    tmux
    xclip
    fd
    stow

    # # git
    git
    delta
    jujutsu
    lazygit

    # # fonts
    nerd-fonts.comic-shanns-mono
    nerd-fonts.jetbrains-mono

    # # apps
    enpass

  ];
  
  nixpkgs.config.allowUnfreePredicate = 
	pkg: builtins.elem (pkgs.lib.getName pkg) [
		"enpass"
		"vscode"
		"slack"
	];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/i3" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/i3";
    };
    ".config/git" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/git";
    };
    ".config/alacritty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/alacritty";
    };
    ".config/tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/tmux";
    };
    ".config/gdb" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/gdb";
    };
    ".config/rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/rofi";
    };
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/nvim";
    };
    ".zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/zshrc";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
