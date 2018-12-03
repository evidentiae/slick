let

  nixpkgs = builtins.fetchTarball {
    url = https://github.com/NixOS/nixpkgs/archive/b7c795d5887178314a61e582f58c3b4857d9ab6c.tar.gz;
    sha256 = "1gfnyshgs31kqp7scdyjmczysiip68y9sn072gffhznfpxk2shdy";
  };

  pkgs = import nixpkgs {};

  sbtixDir = pkgs.fetchFromGitLab {
    owner = "teozkr";
    repo = "Sbtix";
    rev = "4ab0d2d24b27eb4f1a293e4328a0cd1975a483ac";
    sha256 = "178z2g8ayxv9vrar1vrwcdbxbdqlyjwhakjkfsc5nrk38v7nn9cz";
  };

  sbtix-tool = pkgs.callPackage sbtixDir {
    inherit pkgs;
  };

in

pkgs.runCommand "generate-repos" {
  buildInputs = [ sbtix-tool ];
} ""
