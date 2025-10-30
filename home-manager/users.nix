{
    # you can create a new user by copy pasting the below, and replacing the values as desired
    # wheel is the group that grants a user sudo (aka. admin) access.
    # Network Managers lets a user control the network settings.
    alice = {
        isNormalUser = true;
        name = "alice";
        extraGroups = ["wheel" "networkmanagers"];
        home = "/home/alice";
    };
}
