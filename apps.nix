{ pkgs, ... } : {
  environment.systemPackages = with pkgs; [
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
    catppuccin-cursors.mochaLight
    kanshi
    xdg-desktop-portal-gtk
    spice-vdagent
  ];
  programs.fish.enable = true;
  programs.bash.promptInit = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
    exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
  '';
}
