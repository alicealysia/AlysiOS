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
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
    flakey-profile.url = "github:lf-/flakey-profile";
  };

  outputs = {nixpkgs, niri, dgop, dankMaterialShell, stylix, ...} :
    let
      flakeInputs = {
        inherit nixpkgs;
        inherit niri;
        inherit dgop;
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
        	programs.nix-ld.enable = true;
        	hardware.graphics = {
        		enable = true;
        		#enable32bit = true;
        	};
   		})
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
  };
}

