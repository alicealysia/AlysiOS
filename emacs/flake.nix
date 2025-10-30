{
    inputs = {
        emacs-overlay.url = "github:nix-community/emacs-overlay";
    };
    outputs = { self, emacs-overlay, ... }: {
    nixosModules.default = { inputs, pkgs, ... }: {
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
