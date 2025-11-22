{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    myLib = (import ./myLib/default.nix) {inherit inputs;};

    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # Path to your directory with dev shells
    devEnvDir = ./devEnv;

    # Load all *.nix files in the directory and turn them into dev shells
    devEnvs =
      let
        files = builtins.attrNames (builtins.readDir devEnvDir);
        nixFiles = builtins.filter (f: builtins.match ".*\\.nix$" f != null) files;
      in
        builtins.listToAttrs (map (file: {
          name = builtins.replaceStrings [".nix"] [""] file;  # remove .nix
          value = import (devEnvDir + "/${file}") { inherit pkgs; };
        }) nixFiles);
  in
    with myLib; {
    devShells.${system} = devEnvs;

    nixosConfigurations = {
      desktop = mkSystem ./hosts/desktop/configuration.nix;
    };

    homeConfigurations = {
      "lerskk" = mkHome "x86_64-linux" ./hosts/desktop/home.nix;
    };

    homeManagerModules.default = ./homeManagerModules;
    nixosModules.default = ./nixosModules;
  };
}
