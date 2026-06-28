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
          "1=#8b6d61"
          "2=#7d8a6d"
          "3=#b39b73"
          "4=#7d95ad"
          "5=#8f8199"
          "6=#7c9ea5"
          "7=#c7d0d8"

          "8=#5b636b"
          "9=#b68d80"
          "10=#9eb18d"
          "11=#d3be93"
          "12=#a4bdd6"
          "13=#b7a5c6"
          "14=#a9cfd5"
          "15=#edf2f6"
        ];
      };
    }).wrapper;
  };
}
