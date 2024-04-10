{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

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
      default = mkSystem ./hosts/default/configuration.nix;
    };

    homeConfigurations = {
      "lerskk" = mkHome "x86_64-linux" ./hosts/default/home.nix;
    };

    devShells.x86_64-linux = {
      default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
        ];
      };

      python = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          python3
        ];
      };
    };

    homeManagerModules.default = ./homeManagerModules;
    nixosModules.default = ./nixosModules;
  };
}
