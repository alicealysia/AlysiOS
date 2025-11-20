{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        # add any apps from https://search.nixos.org/packages?channel=unstable to a new line below

      # e.g.
        quickshell
        emacs-pgtk
        nemo
        hyprpicker
        wl-clipboard
        wayland-utils
        libsecret
        wget
        nixd
        git
        nodejs
        nerd-fonts.jetbrains
        firefox
        fishPlugins.tide
        extraterm
        catppuccin-cursors
        kanshi
        xdg-desktop-portal-gtk
    ];
}
