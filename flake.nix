{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    zig.url = "github:arqv/zig-overlay/flake";
  };

  outputs = { self, nixpkgs, utils, zig }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in {
       devShell = pkgs.mkShell {
          nativeBuildInputs = [
            zig.packages."${system}".master."2021-02-13"
          ];
        };
      });
}
