{...}: {
  programs.niri.settings = {
    prefer-no-csd = true;
    input.focus-follows-mouse.enable = true;
    input.focus-follows-mouse.max-scroll-amount = "10%";
    input.keyboard.numlock = true;
    input.mod-key = "super";
    input.warp-mouse-to-focus.enable = true;
    cursor.theme = "catppuccin-mocha-light-cursors";
    layout = {
      background-color = "transparent";
      gaps = 4;
      focus-ring = {
        width = 2;
        active-gradient = {
          from="#1C92F6";
          to = "#FF75A2";
          angle = 45;
        };
      };
      preset-column-widths = [
        { proportion = 1. / 4.; }
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
        { proportion = 3. / 4.; }
      ];
      default-column-width = {};
    };
    window-rules = [
      {
        geometry-corner-radius = 24;
        clip-to-geometry = true;
      }
      {
        matches = [
          { app-id = "RDC"; }
          { app-id = "labwc"; }
          { app-id = "mage-client-MageFrame"; }
          { app-id = "kcalc"; }
        ];
        open-floating = true;
      }
      {
        matches = [
          { app-id = "steam"; title="^notificationtoasts_\d+_desktop$"; }
        ];
        default-floating-position = {
          x = 10;
          y = 10;
          relative-to = "bottom-right";
        };
      }
    ];
    spawn-at-startup = [
      { argv = [ "xdg-autostart" ]; }
    ];
  };
}
