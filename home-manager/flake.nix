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
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
  };
  outputs = { home-manager, niri, dankMaterialShell, ... } : let
    homeModules = [
    ({config, ...}: {
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
        default.settings = ./settings.json;
      };
      systemd.user.startServices = true;
      home.file.".emacs.d" = {
        source = config.lib.file.mkOutOfStoreSymlink ./emacs;
      };
    })
    dankMaterialShell.homeModules.dankMaterialShell.default
    dankMaterialShell.homeModules.dankMaterialShell.niri
    ./keyboard-shortcuts.nix
    ./variables.nix
  ];
  in {
    nixosModules = {
      niri = niri.nixosModules.niri;
      home-manager = home-manager.nixosModules.default;
      greeter = dankMaterialShell.nixosModules.greeter;
      default = {pkgs, ...} : let 
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
        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;
        };
        #programs.dankMaterialShell.greeter = {
        #  enable = true;
        #  compositor.name = "niri";  # Or "hyprland" or "sway"
        #  
        #};
        #niri-flake.cache.enable = true;
        # programs.niri = {
        #  enable = true;
        #  package = pkgs.niri.overrideAttrs (o: {
        #    doCheck = false;
        #  });
        # };
        home-manager.sharedModules = homeModules;
        users.users = accountlist;
        home-manager.users = homelist;
      };
    };
  };
}
