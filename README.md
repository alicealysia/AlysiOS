# Alysios

#### nixos made simple

## OwO What's this?

Alysios is a project with the goal of taking nix from something only freaks like myself would use to something simple.

Rather than making GUI elements for the entire nixos ecosystem like SnowflakeOS does, Alysios has a simple(ish) set of Nix flakes which are bound to .desktop files such that they are opened when desired. These may wind up with GUIs at a later point in time but these would still be extremely specialised to modify a specific file in a specific way, rather than attempting to grant full control over the nix ecosystem (after all, more complex configuration is the entire point of the nix language.)

Prior to installation you will want to adjust the setup-settings.nix file. It should be pretty easy to understand that one at least.

This is still not done yet! eventually it will be installable just like any other distro, hopefully via a nice little gui installer, and will come with at least the option to use all the software I personally run day to day (likely there will be an "opt.nix" file where true or false can be put next to each file)

Like many .dotfiles, I plan for this to become my day to day OS, so it's gonna need to be easy to use before I switch over to it lmao.
