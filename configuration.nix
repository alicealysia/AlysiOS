({setupInfo, inputs, pkgs, ...}:{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = setupInfo.hostname;
    networking.networkmanager.enable = true;
    time.timeZone = setupInfo.timeZone;
    i18n.defaultLocale = setupInfo.locale;
    i18n.extraLocaleSettings = {
        LC_ADDRESS = setupInfo.locale;
        LC_IDENTIFICATION = setupInfo.locale;
        LC_MEASUREMENT = setupInfo.locale;
        LC_MONETARY = setupInfo.locale;
        LC_NAME = setupInfo.locale;
        LC_NUMERIC = setupInfo.locale;
        LC_PAPER = setupInfo.locale;
        LC_TELEPHONE = setupInfo.locale;
        LC_TIME = setupInfo.locale;
    };
    services.xserver.xkb = {
        layout = setupInfo.keyboardLayout;
        variant = setupInfo.keyboardVariant;
    };
    services.printing.enable = false;
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
    nixpkgs.config.allowUnfree = true;
#     services.displayManager.sddm = {
#         enable = true;
#         wayland.enable = true;
#     };
    hardware.graphics.enable = true;
    programs.fish.enable = true;
    programs.bash.promptInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
    '';
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.nixPath = [
        "nixpkgs=${inputs.nixpkgs}"
    ];
})
