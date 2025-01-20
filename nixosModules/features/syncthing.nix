{
  ...
}: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "lerskk";
    dataDir = "/home/lerskk";
    configDir = "/home/lerskk/.config/syncthing";

    settings = {
      devices = {
        "phone" = { id = "YAAZTIU-JUDAO24-UFPK5KG-P4Z2LAL-PJM42PU-7YJQCMF-7D5GRPC-JB6WGAP"; };
      };
      folders = {
        "notes" = {
          id = "uiotm-jvmdj";
          path = "/home/lerskk/notes";
          devices = [ "phone" ];
          ignorePerms = true;
        };
      };
    };
  };
}
