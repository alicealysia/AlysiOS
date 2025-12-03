{ pkgs, ... } : {
  environment.systemPackages = with pkgs; [
    hyprpicker
    nemo
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
