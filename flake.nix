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
  };

  outputs = {nixpkgs, ...} @ inputs: let
    myLib = (import ./myLib/default.nix) {inherit inputs;};

    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
    with myLib; {

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
