let

  nixpkgs = builtins.fetchTarball {
    url = https://github.com/NixOS/nixpkgs/archive/b7c795d5887178314a61e582f58c3b4857d9ab6c.tar.gz;
    sha256 = "1gfnyshgs31kqp7scdyjmczysiip68y9sn072gffhznfpxk2shdy";
  };

  pkgs = import nixpkgs {};

  sbtixDir = pkgs.fetchFromGitLab {
    owner = "teozkr";
    repo = "Sbtix";
    rev = "e160e92d8e2bf0ac36730913527a1b4a6353a7c0";
    sha256 = "0mgafpvmf13d1jckmqs9vi268cmny7z93qhc8ishcwwyqqgr6ds9";
  };

  sbtix-tool = pkgs.callPackage "${sbtixDir}/sbtix-tool.nix" {};

in

pkgs.runCommand "generate-repos" {
  buildInputs = [ sbtix-tool ];
} ""
