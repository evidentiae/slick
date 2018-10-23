let

  pkgs = import <nixpkgs> {};

  sbtixDir = pkgs.fetchFromGitHub {
    owner = "teozkr";
    repo = "Sbtix";
    rev = "5277d96745afcc04a0873102f4a5f80cfc68fa23";
    sha256 = "17h2ijb50q76al72hpggv35bbqiayyzvybmfwyx1cr5xzlpvzcqh";
  };

  sbtix-tool = pkgs.callPackage "${sbtixDir}/sbtix-tool.nix" {};

in

pkgs.runCommand "generate-repos" {
  buildInputs = [ sbtix-tool ];
} ""
