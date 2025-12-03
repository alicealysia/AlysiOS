{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        bottles
        distrobox
        cage
        labwc
    ];
}
