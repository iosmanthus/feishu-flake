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
        config.allowUnfree = true;
      };
    in
    {
      overlay = final: prev: {
        feishu = self.packages.${system}.feishu;
      };
      packages.${system}.feishu = (pkgs.callPackage ./default.nix { });
      legacyPackages.${system}.feishu = (pkgs.callPackage ./default.nix { });
    };
}
