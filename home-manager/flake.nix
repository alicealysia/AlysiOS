{
    inputs = {
        home-manager.url = "github:nix-community/home-manager";
        stylix.url = "github:nix-community/stylix";
        niri.url = "github:sodiboo/niri-flake";
        dankMaterialShell.url = "github:AvengeMedia/DankMaterialShell";
        quickshell.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
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
                    enableSystemd = true;
                    enableSystemMonitoring = true;
                    enableClipboard = true;
                    enableVPN = true;
                    enableBrightnessControl = true;
                    enableDynamicTheming = true;
                    enableAudioWavelength = true;
                    enableCalendarEvents = true;
                };
            }
            ./keyboard-shortcuts.nix
            ./variables.nix
        ];
    in {
        inherit homeModules;
        nixosModules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.dankMaterialShell.nixosModules.greeter
            ({pkgs, ...}: {
                nixpkgs.overlays = [
                    inputs.niri.overlays.niri
                    inputs.quickshell.overlays.default
                ];
                programs.niri.package = pkgs.niri-unstable;
                programs.niri.enable = true;
                programs.dankMaterialShell.greeter = {
                    enable = true;
                    compositor.name = "niri";
                };
                home-manager.sharedModules = homeModules;
                users.users = userList;
                home-manager.users = builtins.mapAttrs (name: value: import ./${name}-cfg/home.nix ) userList;
            })
        ];
    };
}
