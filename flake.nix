{
  description = "Ruby on Rails API Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          rubyEnv = pkgs.ruby_3_4; 
        in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              # Ruby core
              rubyEnv
              bundler

              gnumake
              gcc
              pkg-config
              libyaml
              zlib
              openssl
              libxml2
              libxslt
              libiconv

              # postgresql_15
              sqlite
            ];

            shellHook = ''
              export BUNDLE_PATH="$(pwd)/vendor/bundle"
              export PATH="$(pwd)/bin:$(pwd)/vendor/bundle/ruby/${rubyEnv.version}/bin:$PATH"

              export BUNDLE_BUILD__NOKOGIRI="--use-system-libraries"
              export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

              echo "🚀 Rails (API mode) development environment loaded!"
              ruby -v
            '';
          };
        }
      );
    };
}
