{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
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
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
  };
  outputs = { self, quickshell, home-manager, stylix, niri, dgop, dms-cli, dankMaterialShell, ... } : let
  homeModules = [
    #stylix.homeModules.stylix
    #niri.homeModules.niri
    dankMaterialShell.homeModules.dankMaterialShell.default
    dankMaterialShell.homeModules.dankMaterialShell.niri
    ({config, ...}: {
      home.packages = [
        quickshell.packages."x86_64-linux".default
      ];
      home.stateVersion = "25.05";
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
        quickshell.package = quickshell.packages."x86_64-linux".default;
        
        default.settings = {
          theme = "dark";
          dynamicTheming = true;
          currentThemeName = "dynamic";
          matugenScheme = "scheme-rainbow";
          runUserMatugenTemplates = true;
          showWorkspaceIndex = false;
          showWorkspaceApps = true;
          maxWorkspaceIcons = 9;
          dankBarLeftWidgets = [
            {
              id = "launcherButton";
              enabled = true;
            }
            {
              id = "clipboard";
              enabled = true;
            }
            {
              id = "notificationButton";
              enabled = true;
            }
            {
              id = "systemUpdate";
              enabled = true;
            }
            {
              id = "vpn";
              enabled = true;
            }
          ];
          dankBarCenterWidgets = [
            {
              id = "workspaceSwitcher";
              enabled = true;
            }
          ];
          dankBarRightWidgets = [
            {
              id = "systemTray";
              enabled = true;
            }
            {
              id = "controlCenterButton";
              enabled = true;
            }
            {
              id = "clock";
              enabled = true;
            }
          ];
          dockPosition = 1;
          # Add any other settings here
        };
      };
      systemd.user.startServices = true;
      home.file.".emacs.d" = {
        source = config.lib.file.mkOutOfStoreSymlink ./emacs;
      };
    })
    ./keyboard-shortcuts.nix
    ./variables.nix
  ];
  in {
    nixosModules = {
      niri = niri.nixosModules.niri;
      home-manager = home-manager.nixosModules.default;
      greeter = dankMaterialShell.nixosModules.greeter;
      default = {pkgs, lib, ...} : let 
        usersDir = builtins.readDir ./users;
        homelist = builtins.mapAttrs (name: value: import ./users/${name}/home.nix) usersDir;
        accountlist = builtins.mapAttrs (name: value: import ./users/${name}/account.nix) usersDir;
      in {
        # nix.settings = {
        #   substituters = [
        #     "https://cache.nixos.org"
        #     "https://nix-community.cachix.org"
        #     "https://niri.cachix.org"
        #   ];
        #   trusted-public-keys = [
        #     "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        #     "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        #   ];
        # };
        nixpkgs.overlays = [
          niri.overlays.niri
        ];
        #niri-flake.cache.enable = true;
        programs.niri = {
         enable = true;
         package = pkgs.niri.overrideAttrs (o: {
           doCheck = false;
         });
        };
        home-manager.sharedModules = homeModules;
        users.users = accountlist;
        home-manager.users = homelist;
      };
    };
  };
}
