# helium_flake

A nix flake for [Helium](https://github.com/imputnet/helium-linux), a lightweight, privacy by default browser that aims to stay out of your way.

This flake repackages the upstream binary tarball from [Helium's release page](https://github.com/imputnet/helium-linux/releases/) into a package rather than building it from source.

## Usage
---
### Test without installing
`nix run github:brandonboo2024/helium_flake`

### With Flakes
You can add this flake to your existing system:
```
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    helium_flake = {
      url = "github:brandonboo2024/helium_flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, helium_flake, ...}@inputs:{
      nixosConfigurations.my-host = nixpkgs.lib.nixosSystem{
          system = "x86_64-linux";
          specialArgs = {
              inherit inputs;
          };
          ...
      }
  }
}
```
Then install into your configuration with:
```
environment.systemPackages = [
    inputs.helium_flake.packages.${pkgs.system}.default
];
```
Currently this flake only supports x86_64-linux, if you are interested in more compatibility with other systems, feel free to drop an issue or PR to do so!

## Development
---

Clone the repo first:
```
git clone https://github.com/brandonboo2024/helium_flake.git
```

### Building Locally
```
# Build package
nix build

# Run without installation
nix run
```

## Roadmap
- [ ] Add automated maintenance for updates
- [ ] Additional support for other platforms
