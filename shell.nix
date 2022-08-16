{ nixpkgs ? import ./nix/nixpkgs.nix {} }:

with nixpkgs;

mkShell {
  name = "intro-shell";
  buildInputs = [
    # This nix shell provides access to niv to ease adding nix dependencies
    niv
  ];
}
