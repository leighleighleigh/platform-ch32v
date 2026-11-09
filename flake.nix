{
  description = "platformio-ch32-nix";

  inputs = {
    nixpkgs = {
      type = "indirect";
      id = "nixpkgs";
    };
  };

  outputs = inputs: {
    # Instantiate the default dev shell with `nix develop`
    devShells = builtins.mapAttrs (system: pkgs: {
      default = pkgs.mkShell rec {
          name = "ch32-pio";

          packages = with pkgs; [
            wlink
            clang-tools
          ];

          shellHook = ''
            export PS1="(${name})$PS1"
          '';
        };
    }) inputs.nixpkgs.legacyPackages;
  };
}
