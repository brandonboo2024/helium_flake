{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let 
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in
  {
    packages.x86_64-linux.hello = pkgs.callPackage ./hello.nix { };
    packages.x86_64-linux.icat = pkgs.callPackage ./icat.nix { };
    packages.x86_64-linux.helium = pkgs.callPackage ./helium.nix { };

  };
}
