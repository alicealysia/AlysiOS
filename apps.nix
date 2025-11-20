{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        # add any apps from https://search.nixos.org/packages?channel=unstable to a new line below

      # e.g.
        quickshell
        emacs-pgtk
        nautilus
        hyprpicker
        xwayland-satellite-unstable
        wl-clipboard
        wayland-utils
        libsecret
        cage
        gamescope
        wget
        nixd
        git
        nodejs
        nerd-fonts.noto
        nerd-fonts.lilex
        nerd-fonts.ubuntu
        kdePackages.konsole
        nerd-fonts.jetbrains-mono
        firefox
        fishPlugins.tide
        catppuccin-cursors
        kanshi
        xdg-desktop-portal-gtk
        spice-vdagent
    ];
}
