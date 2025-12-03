#/bin/bash

nix --extra-experimental-features nix-command --extra-experimental-features flakes flake update --flake /etc/nixos
nixos-rebuild switch --extra-experimental-features nix-command --extra-experimental-features flakes

