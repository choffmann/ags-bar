{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    astal,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    extraPackages = [
      astal.packages.${system}.battery
    ];
  in {
    packages.${system}.default = astal.lib.mkLuaPackage {
      inherit pkgs;
      name = "ags-bar";
      src = ./.;

      extraPackages =
        [
          pkgs.dart-sass
        ]
        // extraPackages;
    };

    devShells.${system}.default = astal.devShells.${system}.astal;
  };
}
