{ pkgs, ... } : {
  environment.systemPackages = with pkgs; [
    #necessary software
    quickshell
    wl-clipboard
    wayland-utils
    libsecret
    wget
    nixd
    nerd-fonts.space-mono
    nerd-fonts.ubuntu
    kdePackages.konsole
    firefox
    catppuccin-cursors.mochaLight
    xdg-desktop-portal-gtk
    decibels
    snapshot
    # TODO: design a better alternative than the gnome disk utility or smth

    firefox
    firewalld
    loupe
    kcalc
    kdeconnect
    vesktop
    # TODO: make lite-xl into a flake
    lite-xl
    transmission
  ];
}
