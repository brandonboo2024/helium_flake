{
  description = "Flake for Helium Browser";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let 
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in
  {
    packages.x86_64-linux.helium = pkgs.callPackage ./helium.nix { };
    packages.x86_64-linux.default = self.packages.x86_64-linux.helium;
  };
}
