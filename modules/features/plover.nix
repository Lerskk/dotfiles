{ ... }: {
	flake.nixosModules.plover = { pkgs, ... }: let
    # Plover discovers plugins through Python entry points on its PYTHONPATH,
    # so adding plover-lapwing-aio to its dependencies registers the Lapwing
    # system (dictionaries bundled) and its dependent plugins.
    plover-with-lapwing = pkgs.python3Packages.plover.overridePythonAttrs (prev: {
      dependencies = prev.dependencies ++ [ pkgs.python3Packages.plover-lapwing-aio ];
      # The plugin depends on the unmodified plover: same version twice in
      # the closure, with our own site-packages taking precedence.
      catchConflicts = false;
    });
  in {
    # Plover 5 works natively on Wayland: it captures the keyboard through
    # evdev (/dev/input/event*, requires the `input` group) and emulates
    # output through uinput (/dev/uinput, requires the `uinput` group).
    hardware.uinput.enable = true;

    users.users.lerskk.extraGroups = [
      "input"
      "uinput"
    ];

    environment.systemPackages = [
      plover-with-lapwing
    ];
	};
}
