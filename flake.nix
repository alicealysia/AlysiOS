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

  outputs = inputs:{
    nixosModules = let
      modules = [
        {
          _module.args.inputs = inputs;
        }
        ./apps.nix
        inputs.home-manager.nixosModules.default
        inputs.niri.nixosModules.niri
        inputs.dankMaterialShell.nixosModules.greeter
        inputs.dankMaterialShell.nixosModules.dankMaterialShell
        ./niri.nix
        ./keyboard-shortcuts.nix
        ./dms.nix
      ];
      primaryModule = {
        imports = modules;
        systemd.user.startServices = true;
      };
    in {
      default = {...}: primaryModule;
      gaming = ./optional-gaming-apps.nix;
    };
  };
}
