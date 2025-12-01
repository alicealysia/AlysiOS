{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
    nix-xl.url = "github:passivelemon/nix-xl";
  };

  outputs = {nixpkgs, niri, dgop, home-manager, dankMaterialShell, stylix, ...} :
    let
      flakeInputs = {
        inherit nixpkgs;
        inherit niri;
        inherit dgop;
        inherit home-manager;
        inherit dankMaterialShell;
        inherit stylix;
      };
      modules = [	
        {
          _module.args = {
            inherit flakeInputs;
          };
        }
        ({pkgs, flakeInputs, ...}:{
        	nixpkgs.overlays = [ flakeInputs.niri.overlays.niri ];
        	programs.niri.package = pkgs.niri-unstable;
        	programs.niri.enable = true;
        	programs.bash.loginShellInit = builtins.toString ./init-home.sh;
        })
        home-manager.nixosModules.default
        stylix.nixosModules.stylix
        niri.nixosModules.niri
        dankMaterialShell.nixosModules.greeter
        dankMaterialShell.nixosModules.dankMaterialShell
        ./necessary-apps/apps.nix
        ./necessary-apps/system-tools.nix
        ./dms.nix
      ];
      primaryModule = {
        imports = modules;
      };
    in {
    nixosModules = {
        creative = ./optional-apps/creative-software.nix;
        gaming = ./optional-apps/gaming-apps.nix;
        admin = ./optional-apps/life-admin.nix;
        programming = ./optional-apps/programmer-tools.nix;
        compat = ./optional-apps/software-compat-tools.nix;
        default = primaryModule;
    };
    homeModules = {
      default = {...}: {
        imports = [
          ./dankMaterialShell.homeModules.default
          ./dankMaterialShell.homeModules.niri
          ./niri.nix
          ./keyboard-shortcuts.nix
          {
            programs.dankMaterialShell.defaultSettings = ./dms-defaults.json;
            xdg.desktopEntries = {
              updateYourSystem = {
                name = "Update your system";
                genericName = "Update your system";
                exec = "/bin/bash ${./scripts/update.sh}";
                terminal = false;
              };
              adjustDisplaySettings = {
                name = "adjustDisplaySettings";
                genericName = "Update your system";
                exec = "/bin/bash ${./scripts/displays.sh}";
                terminal = false;
              };
            };
          }
        ];
      };
    };
  };
}

