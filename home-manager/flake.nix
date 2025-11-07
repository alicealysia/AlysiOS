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
    outputs = inputs : let
        userList = import ./users.nix;
        homeModules = [
            inputs.stylix.homeModules.stylix
            inputs.niri.homeModules.niri
            inputs.dankMaterialShell.homeModules.dankMaterialShell.default
            inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
            {
                home.stateVersion = "25.11";
                programs.dankMaterialShell = {
                    enable = true;
                    enableSystemd = true;              # Systemd service for auto-start
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
        nixosModules.default = {inputs, pkgs, ...} : {
            imports = [
                inputs.home-manager.nixosModules.home-manager
                inputs.dankMaterialShell.nixosModules.greeter
            ];
            nixpkgs.overlays = [
                inputs.niri.overlays.niri
            ];
            programs.niri.package = pkgs.niri-unstable;
            programs.niri.enable = true;
            programs.dankMaterialShell.greeter = {
                enable = true;
                compositor.name = "niri";
            };
            services.greetd.enable = true;
            home-manager.sharedModules = homeModules;
            users.users = userList;
            home-manager.users = builtins.mapAttrs (name: value: import ./${name}-cfg/home.nix ) userList;
        };
    };
}
