{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "./home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
  let
  setupInfo = import ./setup-settings.nix;
  cfg = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs;
      inherit setupInfo;
    };
    modules = [
      ./configuration.nix
      ./apps.nix
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.niri
      inputs.home-manager.nixosModules.home-manager
      inputs.home-manager.nixosModules.default
      inputs.home-manager.nixosModules.greeter
    ];
    system = "x86_64-linux";
  };
  in {
    nixosConfigurations = {
      "${setupInfo.hostname}" = cfg;
      "nixos" = cfg;
    };
  };
}
