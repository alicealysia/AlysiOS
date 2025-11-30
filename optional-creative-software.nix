{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        blender
        flowblade
        ardour
        obs-studio
        opentoonz
        krita
    ];
}
