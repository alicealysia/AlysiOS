{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "./home-manager";
    emacs.url = "./emacs";
  };

  outputs = inputs :
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
      inputs.emacs.nixosModules.default
      inputs.home-manager.nixosModules.default
    ];
    system = "x86_64-linux";
  };
  in {
    nixosConfigurations = {
      vm = cfg;
      "${setupInfo.hostname}" = cfg;
    };
  };
}
