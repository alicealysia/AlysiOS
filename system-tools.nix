{ pkgs, ... } : {
  environment.systemPackages = with pkgs; [
    hyprpicker
    nautilus
    systemdgenie
    kmenuedit
    grsync
    btop
    pavucontrol
    winetricks
    nm-connection-editor
    ark
    kanshi
  ];
}
