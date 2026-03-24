# helium_flake

A nix flake for [Helium](https://github.com/imputnet/helium-linux), a lightweight, privacy by default browser that aims to stay out of your way.

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
}
```
Then install into your configuration with:
```
environment.systemPackages = [
    inputs.helium.packages.${system}.default
];
```
Currently this flake only supports x86_64, if you are interested in more compatibility with other systems, feel free to drop an issue or PR to do so!

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
- []
