{
  description = "Nix Flake for Feishu";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      packages.x86_64-linux.hello = (pkgs.callPackage ./default.nix { });
      defaultPackage.x86_64-linux = (pkgs.callPackage ./default.nix { });
    };
}
