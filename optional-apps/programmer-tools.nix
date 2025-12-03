{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        cmake-language-server
        doxygen
        gitui
        godot-mono
#        jedi-language-server
        git
        nodejs
        pipx
        nodejs_24
        cargo
        python315
        rust-analyzer
        bacon
        typescript-language-server
    ];
}

