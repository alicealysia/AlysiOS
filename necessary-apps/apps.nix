{ pkgs, ... }:
{
  programs.niri.useNautilus = true;
  programs.gnome-disks = true;
  fonts.packages = with pkgs; [
    nerd-fonts.space-mono
    nerd-fonts.ubuntu
    nerd-fonts
  ];
  programs.starship = {
    enable = true;
    settings.shell.disabled = false;
    presets = [
      "pastel-powerline"
    ];
  };
  environment.systemPackages = with pkgs; [
    #necessary software
    quickshell
    wl-clipboard
    wayland-utils
    libsecret
    wget
    starship
    lite-xl
    pylint
    nautilus
    firefox
    catppuccin-cursors.mochaLight
    xdg-desktop-portal-gtk
    decibels
    snapshot
    eza
    firefox
    firewalld
    nix-template
    loupe
    kdePackages.kcalc
    kdePackages.kdeconnect-kde
    ghostty
    bun
    nixfmt
    vesktop
    gh
    micro-full
    nil
    r2modman
    xwayland-satellite
  ];
}
