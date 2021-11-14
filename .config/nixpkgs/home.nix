{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
   pkgs.libstdcxx5
   pkgs.bat
   pkgs.exa
   pkgs.stow
   pkgs.fzf
   pkgs.lazygit
   pkgs.polybar
   pkgs.xclip
   pkgs.brave
   pkgs.pavucontrol
   pkgs.flameshot
   pkgs.tmux
   pkgs.lua
   pkgs.stylua
   pkgs.jetbrains-mono
   pkgs.elinks
   pkgs.kitty
   pkgs.mpd
   pkgs.mpv
   pkgs.mpc_cli
   pkgs.ncmpcpp
   pkgs.rbenv
   pkgs.fish
   pkgs.gitAndTools.gh
   pkgs.i3
   pkgs.i3status
   pkgs.i3lock
   pkgs.sxhkd
  ];

  nixpkgs.config.allowBroken = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cherry";
  home.homeDirectory = "/home/cherry";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}
