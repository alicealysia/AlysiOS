{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        emacs-overlay = {
            url = "github:nix-community/emacs-overlay";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
    };
    outputs = { self, emacs-overlay, nixpkgs, ... }: {
    nixosModules.default = { pkgs, ... }: {
            nixpkgs.overlays = [
                emacs-overlay.overlays.default
            ];
            environment.systemPackages = [
                (pkgs.emacsWithPackagesFromUsePackage {
                    package = pkgs.emacs-unstable-pgtk;
                    config = ./emacs.el;
                })
            ];
        };
    };
}
