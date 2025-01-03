{
  pkgs,
  ...
}: {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  fonts.packages = with pkgs; [
    corefonts
    (google-fonts.override { fonts = [ "Nunito" ]; })
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
