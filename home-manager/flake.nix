{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        stylix = {
            url = "github:nix-community/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        niri = {
            url = "github:sodiboo/niri-flake";
        };
        dgop = {
            url = "github:AvengeMedia/dgop";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        dms-cli = {
            url = "github:AvengeMedia/danklinux";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        dankMaterialShell = {
            url = "github:AvengeMedia/DankMaterialShell";
            inputs.dgop.follows = "dgop";
            inputs.dms-cli.follows = "dms-cli";
        };
    };
    outputs = { self, home-manager, stylix, niri, dgop, dms-cli, dankMaterialShell, ... } : let
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
                systemd.user.startServices = true;
            }
            ./keyboard-shortcuts.nix
            ./variables.nix
        ];
    in {
        nixosModules = {
            home-manager = home-manager.nixosModules.default;
            greeter = dankMaterialShell.nixosModules.greeter;
            default = {pkgs, lib, ...} : let 
                usersDir = builtins.readDir ./users;
                homelist = builtins.mapAttrs (name: value: import ./users/${name}/home.nix) usersDir;
                accountlist = builtins.mapAttrs (name: value: import ./users/${name}/account.nix) usersDir;
            in {
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
                users.users = accountlist;
                home-manager.users = homelist;
            };
        };
    };
}
