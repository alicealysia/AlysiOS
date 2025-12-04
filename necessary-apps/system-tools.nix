{ pkgs, ... } : {
  environment.systemPackages = with pkgs; [
    hyprpicker
    systemdgenie
    kdePackages.kmenuedit
    grsync
    btop
    pavucontrol
    winetricks
    kdePackages.ark
    wdisplays
    stow
  ];
}
