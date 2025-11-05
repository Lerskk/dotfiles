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
    vista-fonts
    (google-fonts.override { fonts = [ "Nunito" "Arial"]; })
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
