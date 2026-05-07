{
  description = "SICS Inventory Classification System";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # AsciiDoc toolchain (bundles asciidoctor-pdf, rouge, diagram, etc.)
            asciidoctor-with-extensions
            # Build runner
            just
            # File watcher (for `just watch`)
            entr
          ];
        };
      }
    );
}
