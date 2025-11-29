{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
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
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
  };

  outputs = {nixpkgs, niri, dgop, home-manager, dankMaterialShell} :
    let
      modules = [
        {
          _module.args.flakeInputs = {
            inherit nixpkgs;
            inherit niri;
            inherit dgop;
            inherit home-manager;
            inherit dankMaterialShell;
          };
        }
        ./apps.nix
        home-manager.nixosModules.default
        niri.nixosModules.niri
        dankMaterialShell.nixosModules.greeter
        dankMaterialShell.nixosModules.dankMaterialShell
        ./niri.nix
        ./keyboard-shortcuts.nix
        ./dms.nix
      ];
      primaryModule = {
        imports = modules;
        systemd.user.startServices = true;
      };
    in {
    nixosModules = {
      default = {...}: primaryModule;
      gaming = ./optional-gaming-apps.nix;
    };
  };
}
