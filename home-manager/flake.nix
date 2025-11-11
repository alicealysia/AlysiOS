{
    inputs = {
        home-manager.url = "github:nix-community/home-manager";
        stylix.url = "github:nix-community/stylix";
        niri.url = "github:sodiboo/niri-flake";
        dgop = {
            url = "github:AvengeMedia/dgop";
        };

        dms-cli = {
            url = "github:AvengeMedia/danklinux";
        };

        dankMaterialShell = {
            url = "github:AvengeMedia/DankMaterialShell";
            inputs.dgop.follows = "dgop";
            inputs.dms-cli.follows = "dms-cli";
        };
    };
    outputs = { self, home-manager, stylix, niri, dgop, dms-cli, dankMaterialShell, ... } : let
        userList = import ./users.nix;
        homeModules = [
            stylix.homeModules.stylix
            niri.homeModules.niri
            dankMaterialShell.homeModules.dankMaterialShell.default
            dankMaterialShell.homeModules.dankMaterialShell.niri
            {
                home.stateVersion = "25.11";
                programs.dankMaterialShell = {
                    enable = true;
                    systemd.enable = true;             # Systemd service for auto-start
                    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
                    enableClipboard = true;            # Clipboard history manager
                    enableVPN = true;                  # VPN management widget
                    enableBrightnessControl = true;    # Backlight/brightness controls
                    enableColorPicker = true;          # Color picker tool
                    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
                    enableAudioWavelength = true;      # Audio visualizer (cava)
                    enableCalendarEvents = true;       # Calendar integration (khal)
                    enableSystemSound = true;          # System sound effects
                };
            }
            ./keyboard-shortcuts.nix
            ./variables.nix
        ];
    in {
        inherit homeModules;
        nixosModules = {
            home-manager = home-manager.nixosModules.default;
            greeter = dankMaterialShell.nixosModules.greeter;
            default = {pkgs, ...} : {
                nixpkgs.overlays = [
                    niri.overlays.niri
                ];
                programs.niri.package = pkgs.niri-unstable;
                programs.niri.enable = true;
                programs.dankMaterialShell.greeter = {
                    enable = true;
                    compositor.name = "niri";
                };
                home-manager.sharedModules = homeModules;
                users.users = userList;
                #home-manager.users = builtins.mapAttrs (name: value: import ./${name}-cfg/home.nix ) userList;
                home-manager.users.alice = {};
            };
        };
    };
}
