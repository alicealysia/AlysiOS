{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        bitwarden-desktop
        bitwarden-cli
        obsidian
        protommail-desktop
        element-desktop
    ];
}
