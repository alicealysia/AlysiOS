{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
    # Gaming Frontends
        steam
        heroic
    # Steam Helpers
        steamcmd
        steam-tui
        steam-run
        steamtinkerlaunch
        gamescope
        protonplus
    # Peripheral Managers
        razer-cli
        razergenie
        solaar
        polychromatic
    ];
}
