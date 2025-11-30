{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        broot
        cmake-language-server
        doxygen
        gitui
        godot-mono
        jedi-language-server
        git
        nodejs
    ];
}

