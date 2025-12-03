{ pkgs, flakeInputs, ... } : {
  environment.shells = with pkgs; [ zsh ];
  environment.sessionVariables = rec {
  	
  };
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
    nixd
    nautilus
    nerd-fonts.space-mono
    nerd-fonts.ubuntu
    firefox
    catppuccin-cursors.mochaLight
    xdg-desktop-portal-gtk
    decibels
    snapshot
    eza
    # TODO: design a better alternative than the gnome disk utility or smth
    firefox
    firewalld
    loupe
    fzf
    kdePackages.kcalc
    kdePackages.kdeconnect-kde
    ghostty
    zellij
    bun
#    extraterm
    nixfmt
    appimage-run
#    oh-my-zsh
#    fzf-zsh
#    zsh-nix-shell
    zplug
    vesktop
    material-design-icons
    sweet
    sweet-nova
    gh
    # TODO: make lite-xl into a flake
    lite-xl
    micro-full
    broot
    nil
    r2modman
    xwayland-satellite
  ];
}
