{ nixpkgs ? import ./nix/nixpkgs.nix {}
}:

with nixpkgs;

{
  introduction  = callPackage ./introduction {};
}
