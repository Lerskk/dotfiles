{ self, inputs, ... }: {
	flake.nixosModules.ghostty = { pkgs, ... }: {
    environment.systemPackages =  [
			self.packages.${pkgs.stdenv.hostPlatform.system}.myGhostty
    ];
  };
  perSystem = {pkgs, ...}: {
    packages.myGhostty = (inputs.wrappers.wrapperModules.ghostty.apply {
      inherit pkgs;

      settings = {
        font-family = "JetBrainsMono Nerd Font Mono";
        font-size = 12;

        term = "xterm-ghostty";

        confirm-close-surface = false;
        clipboard-paste-protection = false;

        background = "#111418";
        foreground = "#c7d0d8";

        cursor-color = "#c7d0d8";

        selection-background = "#3a434d";
        selection-foreground = "#edf2f6";

        palette = [
          "0=#111418"
          "1=#e78a4e"
          "2=#a9b665"
          "3=#7daea3"
          "4=#7c9ea5"
          "5=#8d6a4f"
          "6=#8f8199"
          "7=#c7d0d8"

          "8=#5b636b"
          "9=#b68d80"
          "10=#9eb18d"
          "11=#d3be93"
          "12=#ea6962"
          "13=#b7a5c6"
          "14=#a9cfd5"
          "15=#edf2f6"
        ];
      };
    }).wrapper;
  };
}
