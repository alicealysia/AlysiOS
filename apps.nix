{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        # add any apps from https://search.nixos.org/packages?channel=unstable to a new line below

      # e.g.
        emacs-pgtk
        cachix
        nautilus
        hyprpicker
        wl-clipboard
        wayland-utils
        libsecret
        cage
        gamescope
        lunarvim
        wget
        nixd
        git
        nodejs
        nerd-fonts.noto
        nerd-fonts.lilex
        nerd-fonts.ubuntu
        firefox
        fishPlugins.tide
        kdePackages.konsole
        vscodium
        catppuccin-cursors
        kanshi
        kubectl
        opam
        xdg-desktop-portal-gtk
    ];
}
