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
    localInputs = inputs;
    in {
      default = {...}: let inputs = localInputs; in {
        imports = [
          ./apps.nix
          inputs.home-manager.nixosModules.default
       	 inputs.niri.nixosModules.niri
          inputs.dankMaterialShell.nixosModules.greeter
          inputs.dankMaterialShell.nixosModules.dankMaterialShell
          ./niri.nix ({ inherit inputs;})
          ./keyboard-shortcuts.nix
          ./dms.nix
        ];
        systemd.user.startServices = true;
      };
      gaming = ./optional-gaming-apps.nix;
    };
  };
}
