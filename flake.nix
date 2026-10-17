{
  description = "Abapinho.com with Hugo and netlify-cli";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.pinentry_mac # Why is gpg failing? Is this really needed?
            pkgs.libyaml      # Why is pre-commit failing now?
          ];
          buildInputs = [
          ];
        };
      });
}
