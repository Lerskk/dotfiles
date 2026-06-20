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
      };
    }).wrapper;
  };
}
