{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    home-manager = {
      url = "./home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{nixpkgs, home-manager, ...} :
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
      home-manager.nixosModules.niri
      home-manager.nixosModules.home-manager
      home-manager.nixosModules.greeter
      home-manager.nixosModules.default
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
